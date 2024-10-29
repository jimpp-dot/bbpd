// UIView+VAP.m
// Tencent is pleased to support the open source community by making vap available.
//
// Copyright (C) 2020 THL A29 Limited, a Tencent company.  All rights reserved.
//
// Licensed under the MIT License (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
//
// http://opensource.org/licenses/MIT
//
// Unless required by applicable law or agreed to in writing, software distributed under the License is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions and
// limitations under the License.

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "VAPTexturePiayer.h"
#import "CommonQGAnimatedImageDecodeManager.h"
#import "CommonQGMP4HWDFileInfo.h"
#import "CommonQGMP4FrameHWDecoder.h"
#import "CommonQGBaseAnimatedImageFrame+DisplayingTexture.h"
#import "CommonQGHWDMP4OpenGLView.h"
#import "CommonQGVAPWeakProxy.h"
#import "NSNotificationCenter+VAPThreadSafeTexture.h"
#import "CommonQGHWDMP4OpenGLView.h"
#import "CommonQGMP4FrameHWDecoder.h"
#import "CommonQGMP4AnimatedImageFrame.h"
#import "CommonQGMP4FrameHWDecoder.h"
#import "CommonQGHWDMetalView.h"
#import "CommonQGVAPMetalView.h"
#import "CommonQGVAPConfigManager.h"
#import "CommonQGHWDMetalRenderer.h"
#import "UIGestureRecognizer+VAPUtilTexture.h"

#import <Flutter/Flutter.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import <CoreVideo/CoreVideo.h>

NSInteger const kCQGHWDMP4DefaultFPS = 20;
NSInteger const kCQGHWDMP4MinFPS = 1;
NSInteger const kCQGHWDMP4MaxFPS = 60;
NSInteger const kCVapMaxCompatibleVersion = 2;

@interface VapPlayer () <CommonQGAnimatedImageDecoderDelegate,CommonQGHWDMP4OpenGLViewDelegate, CommonQGHWDMetelViewDelegate, CommonQGVAPMetalViewDelegate, CommonQGVAPConfigDelegate>

@property (nonatomic, assign) CommonQGHWDTextureBlendMode         hwd_blendMode;              //alpha通道混合模式
@property (nonatomic, strong) CommonQGMP4AnimatedImageFrame       *hwd_currentFrameInstance;  //store the frame value
@property (nonatomic, strong) CommonQGMP4HWDFileInfo              *hwd_fileInfo;              //MP4文件信息
@property (nonatomic, strong) CommonQGAnimatedImageDecodeManager  *hwd_decodeManager;         //解码逻辑
@property (nonatomic, strong) CommonQGAnimatedImageDecodeConfig   *hwd_decodeConfig;          //线程数与buffer数
@property (nonatomic, strong) NSOperationQueue              *hwd_callbackQueue;         //回调执行队列
@property (nonatomic, assign) BOOL                          hwd_onPause;                //标记是否暂停中
@property (nonatomic, assign) BOOL                          hwd_onSeek;                 //正在seek当中，此时继续播放会导致时序混乱
@property (nonatomic, strong) CommonQGHWDMP4OpenGLView            *hwd_openGLView;            //opengl绘制图层
@property (nonatomic, strong) CommonQGHWDMetalView                *hwd_metalView;             //metal绘制图层
@property (nonatomic, strong) CommonQGVAPMetalView                *vap_metalView;             //vap格式mp4渲染图层
@property (nonatomic, assign) BOOL                          hwd_isFinish;               //标记是否结束
@property (nonatomic, assign) NSInteger                     hwd_repeatCount;            //播放次数；-1 表示无限循环
@property (nonatomic, strong) CommonQGVAPConfigManager            *hwd_configManager;         //额外的配置信息
@property (nonatomic, strong) dispatch_queue_t              vap_renderQueue;            //播放队列
@property (nonatomic, assign) BOOL                          vap_enableOldVersion;       //标记是否兼容不含vapc box的素材播放
@property (nonatomic, assign) BOOL                          vap_isMute;                 //标记是否禁止音频播放
@property (nonatomic, assign) CGSize                        vapSise;                    //
@end

@implementation VapPlayer

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super init]) {
        _vapSise = size;
    }
    
    return self;
}


#pragma mark - private methods

- (void)commonHwd_registerNotification {
    
    [[NSNotificationCenter defaultCenter] hwd_addSafeObserver:self selector:@selector(commonHwd_didReceiveEnterBackgroundNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] hwd_addSafeObserver:self selector:@selector(commonHwd_didReceiveWillEnterForegroundNotification:) name:UIApplicationWillEnterForegroundNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] hwd_addSafeObserver:self selector:@selector(commonHwd_didReceiveSeekStartNotification:) name:kCQGVAPDecoderSeekStart object:nil];
    [[NSNotificationCenter defaultCenter] hwd_addSafeObserver:self selector:@selector(commonHwd_didReceiveSeekFinishNotification:) name:kCQGVAPDecoderSeekFinish object:nil];
}

- (void)commonHwd_didReceiveEnterBackgroundNotification:(NSNotification *)notification {
    switch (self.hwd_enterBackgroundOP) {
        case CommonHWDMP4EBOperationTypePauseAndResume:
            [self commonPauseHWDMP4];
            break;
        case CommonHWDMP4EBOperationTypeDoNothing:
            break;
            
        default:
            [self commonStopHWDMP4];
    }
}

- (void)commonHwd_didReceiveWillEnterForegroundNotification:(NSNotification *)notification {
    switch (self.hwd_enterBackgroundOP) {
        case CommonHWDMP4EBOperationTypePauseAndResume:
            [self commonResumeHWDMP4];
            break;
            
        default:
            break;
    }
    
}

- (void)commonHwd_didReceiveSeekStartNotification:(NSNotification *)notification {
    if ([self.hwd_decodeManager containsThisDeocder:notification.object]) {
        self.hwd_onSeek = YES;
    }
}

- (void)commonHwd_didReceiveSeekFinishNotification:(NSNotification *)notification {
    if ([self.hwd_decodeManager containsThisDeocder:notification.object]) {
        self.hwd_onSeek = NO;
    }
}

//结束播放
- (void)commonHwd_stopHWDMP4 {
    
    VAP_Info(kQGVAPModuleCommon, @"hwd stop playing");
    self.hwd_repeatCount = 0;
    if (self.hwd_isFinish) {
        VAP_Info(kQGVAPModuleCommon, @"isFinish already set");
        return ;
    }
    self.hwd_isFinish = YES;
    self.hwd_onPause = YES;
    if (self.hwd_openGLView) {
         self.hwd_openGLView.pause = YES;
        if ([EAGLContext currentContext] != self.hwd_openGLView.glContext) {
            [EAGLContext setCurrentContext:self.hwd_openGLView.glContext];
        }
        [self.hwd_openGLView dispose];
        [self.hwd_openGLView removeFromSuperview];
        self.hwd_openGLView = nil;
        glFinish();
    }
    if (self.hwd_metalView) {
        [self.hwd_metalView dispose];
        [self.hwd_metalView removeFromSuperview];
        self.hwd_metalView = nil;
    }
    if (self.vap_metalView) {
        [self.vap_metalView dispose];
        [self.vap_metalView removeFromSuperview];
        self.vap_metalView = nil;
    }
    [self.hwd_decodeManager tryToStopAudioPlay];
    [self.hwd_callbackQueue addOperationWithBlock:^{
        //此处必须延迟释放，避免野指针
        if ([self.hwd_Delegate respondsToSelector:@selector(viewDidStopPlayMP4:view:)]) {
            [self.hwd_Delegate viewDidStopPlayMP4:self.hwd_currentFrame.frameIndex view:self];
        }
    }];
    self.hwd_decodeManager = nil;
    self.hwd_decodeConfig = nil;
    self.hwd_currentFrameInstance = nil;
    self.hwd_fileInfo = nil;
    [EAGLContext setCurrentContext:nil];
}

//播放完成
- (void)commonHwd_didFinishDisplay {
    
    VAP_Info(kQGVAPModuleCommon, @"hwd didFinishDisplay");
    [self.hwd_callbackQueue addOperationWithBlock:^{
        //此处必须延迟释放，避免野指针
        if ([self.hwd_Delegate respondsToSelector:@selector(viewDidFinishPlayMP4:view:)]) {
            [self.hwd_Delegate viewDidFinishPlayMP4:self.hwd_currentFrame.frameIndex+1 view:self];
        }
    }];
    NSInteger currentCount = self.hwd_repeatCount;
    if (currentCount == -1 || currentCount-- > 0) {
        //continuing
        VAP_Info(kQGVAPModuleCommon, @"continue to display. currentCount:%@", @(currentCount));
        [self common_playHWDMP4:self.hwd_fileInfo.filePath
                       fps:self.hwd_fps
                 blendMode:self.hwd_blendMode
               repeatCount:currentCount
                  delegate:self.hwd_Delegate];
        return ;
    }
    [self commonHwd_stopHWDMP4];
}

- (void)commonHwd_loadMetalViewIfNeed:(CommonQGHWDTextureBlendMode)mode {
    
    if (self.hwd_renderByOpenGL) {
        return ;
    }
    
    //use vap metal
    if (self.useVapMetalView) {
        
        if (self.vap_metalView) {
            self.vap_metalView.commonInfo = self.hwd_configManager.model.info;
            return ;
        }
        CommonQGVAPMetalView *vapMetalView = [[CommonQGVAPMetalView alloc] initWithSize:self.vapSise];
        vapMetalView.commonInfo = self.hwd_configManager.model.info;
        vapMetalView.maskInfo = self.vap_maskInfo;
        vapMetalView.delegate = self;
        vapMetalView.textureId = self.textureId;
//        [self addSubview:vapMetalView];
        vapMetalView.translatesAutoresizingMaskIntoConstraints = false;
//        NSDictionary *views = @{@"vapMetalView": vapMetalView};
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[vapMetalView]|" options:0 metrics:nil views:views]];
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[vapMetalView]|" options:0 metrics:nil views:views]];
        self.vap_metalView = vapMetalView;
        [self commonHwd_registerNotification];
        return ;
    }
    
    //use hwd metal
    if (self.hwd_metalView) {
        self.hwd_metalView.blendMode = mode;
        return ;
    }
    CommonQGHWDMetalView *metalView = [[CommonQGHWDMetalView alloc] init];
    if (!metalView) {
        VAP_Event(kQGVAPModuleCommon, @"metal view is nil!");
        return ;
    }
    metalView.blendMode = mode;
    metalView.delegate = self;
//    [self addSubview:metalView];
    metalView.textureId = self.textureId;
    metalView.translatesAutoresizingMaskIntoConstraints = false;
//    NSDictionary *views = @{@"metalView": metalView};
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[metalView]|" options:0 metrics:nil views:views]];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[metalView]|" options:0 metrics:nil views:views]];
    self.hwd_metalView = metalView;
    [self commonHwd_registerNotification];
}

- (void)commonHwd_loadMetalDataIfNeed {
    
    [self.hwd_configManager loadMTLTextures:kCQGHWDMetalRendererDevice];//加载所需的纹理数据
    [self.hwd_configManager loadMTLBuffers:kCQGHWDMetalRendererDevice];//加载所需的buffer
}

- (void)commonHwd_loadOpenglViewIfNeed:(CommonQGHWDTextureBlendMode)mode {
    
    if (!self.hwd_renderByOpenGL) {
        return ;
    }
    if (self.hwd_openGLView) {
        self.hwd_openGLView.blendMode = mode;
        self.hwd_openGLView.pause = NO;
        VAP_Info(kQGVAPModuleCommon, @"quit loading openglView for already loaded.");
        return ;
    }
    CommonQGHWDMP4OpenGLView *openGLView = [[CommonQGHWDMP4OpenGLView alloc] initWithFrame: CGRectMake(0, 0, self.vapSise.width, self.vapSise.height)];
    openGLView.displayDelegate = self;
    openGLView.blendMode = mode;
//    [self addSubview:openGLView];
    openGLView.userInteractionEnabled = NO;
    [openGLView setupGL];
    self.hwd_openGLView = openGLView;
//    NSDictionary *views = @{@"openGLView": openGLView};
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[openGLView]|" options:0 metrics:nil views:views]];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[openGLView]|" options:0 metrics:nil views:views]];
    [self commonHwd_registerNotification];
}

//fps策略：优先使用调用者指定的fps；若不合法则使用mp4中的数据；若还是不合法则使用默认18
- (NSTimeInterval)hwd_appropriateDurationForFrame:(CommonQGMP4AnimatedImageFrame *)frame {
    NSInteger fps = self.hwd_fps;
    if (fps < kCQGHWDMP4MinFPS || fps > kCQGHWDMP4MaxFPS) {
        if (frame.defaultFps >= kCQGHWDMP4MinFPS && frame.defaultFps <= kCQGHWDMP4MaxFPS) {
            fps = frame.defaultFps;
        }else {
            fps = kCQGHWDMP4DefaultFPS;
        }
    }
    return 1000/(double)fps;
}

#pragma mark - main

/**
 见playHWDMP4:blendMode:repeatCount:delegate:
 
 播放一遍，alpha数据在左边，不需要回调
 */
- (void)commonPlayHWDMp4:(NSString *)filePath {
    [self commonPlayHWDMp4:filePath delegate:nil];
}

/**
 见playHWDMP4:blendMode:repeatCount:delegate:
 
 播放一遍，alpha数据在左边,设置回调
 */
- (void)commonPlayHWDMp4:(NSString *)filePath delegate:(id<CommonHWDMP4PlayDelegate>)delegate {
    [self common_playHWDMP4:filePath fps:0 blendMode:CommonQGHWDTextureBlendMode_AlphaLeft repeatCount:0 delegate:delegate];
}

/**
 见playHWDMP4:blendMode:repeatCount:delegate:
 
 alpha数据在左边
 */
- (void)commonPlayHWDMp4:(NSString *)filePath repeatCount:(NSInteger)repeatCount delegate:(id<CommonHWDMP4PlayDelegate>)delegate {
    [self common_playHWDMP4:filePath fps:0 blendMode:CommonQGHWDTextureBlendMode_AlphaLeft repeatCount:repeatCount delegate:delegate];
}

- (void)common_playHWDMP4:(NSString *)filePath
               fps:(NSInteger)fps
         blendMode:(CommonQGHWDTextureBlendMode)mode
       repeatCount:(NSInteger)repeatCount
          delegate:(id<CommonHWDMP4PlayDelegate>)delegate {
    
    VAP_Info(kQGVAPModuleCommon, @"try to display mp4:%@ blendMode:%@ fps:%@ repeatCount:%@", filePath, @(mode), @(fps), @(repeatCount));
    NSAssert([NSThread isMainThread], @"HWDMP4 needs to be accessed on the main thread.");
    //filePath check
    if (!filePath || filePath.length == 0) {
        VAP_Error(kQGVAPModuleCommon, @"playHWDMP4 error! has no filePath!");
        return ;
    }
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if (![fileMgr fileExistsAtPath:filePath]) {
        VAP_Error(kQGVAPModuleCommon, @"playHWDMP4 error! fileNotExistsAtPath filePath:%#", filePath);
        return ;
    }
    self.hwd_isFinish = NO;
    self.hwd_blendMode = mode;
    self.hwd_fps = fps;
    self.hwd_repeatCount = repeatCount;
    self.hwd_Delegate = delegate;
    if (self.hwd_Delegate && !self.hwd_callbackQueue) {
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        queue.maxConcurrentOperationCount = 1;
        self.hwd_callbackQueue = queue;
    }
    
    //mp4 info
    CommonQGMP4HWDFileInfo *fileInfo = [[CommonQGMP4HWDFileInfo alloc] init];
    fileInfo.filePath = filePath;
    fileInfo.mp4Parser = [[CommonQGMP4ParserProxy alloc] initWithFilePath:fileInfo.filePath];
    [fileInfo.mp4Parser parse];
    self.hwd_fileInfo = fileInfo;
    
    //config manager
    CommonQGVAPConfigManager *configManager = [[CommonQGVAPConfigManager alloc] initWith:fileInfo];
    configManager.delegate = self;
    self.hwd_configManager = configManager;
    
    if (configManager.model.info.version > kCVapMaxCompatibleVersion) {
        VAP_Error(kQGVAPModuleCommon, @"playHWDMP4 error! not compatible vap version:%@!", @(configManager.model.info.version));
        [self commonStopHWDMP4];
        return ;
    }
    
    if (!configManager.hasValidConfig && !self.vap_enableOldVersion) {
        VAP_Error(kQGVAPModuleCommon, @"playHWDMP4 error! don't has vapc box and enableOldVersion is false!");
        [self commonStopHWDMP4];
        return ;
    }
    //reset
    self.hwd_currentFrameInstance = nil;
    self.hwd_decodeManager = nil;
    self.hwd_onPause = NO;
    
    if (!self.hwd_decodeConfig) {
        self.hwd_decodeConfig = [CommonQGAnimatedImageDecodeConfig defaultConfig];
    }
    
    //OpenGLView
    [self commonHwd_loadOpenglViewIfNeed:mode];
    //metalView
    [self commonHwd_loadMetalViewIfNeed:mode];
    
    if ([[UIDevice currentDevice] hwd_isSimulator]) {
        VAP_Error(kQGVAPModuleCommon, @"playHWDMP4 error! not allowed in Simulator!");
        [self commonStopHWDMP4];
        return ;
    }
    if (!self.vap_renderQueue) {
        self.vap_renderQueue = dispatch_queue_create("com.qgame.vap.render", DISPATCH_QUEUE_SERIAL);
    }
    self.hwd_decodeManager = [[CommonQGAnimatedImageDecodeManager alloc] initWith:self.hwd_fileInfo config:self.hwd_decodeConfig delegate:self];
    [self.hwd_configManager loadConfigResources]; //必须按先加载必要资源才能播放 - onVAPConfigResourcesLoaded
}

#pragma mark - play run

- (void)commonHwd_renderVideoRun {
    
    static NSTimeInterval durationForWaitingFrame = 16/1000.0;
    static NSTimeInterval minimumDurationForLoop = 1/1000.0;
    __block NSTimeInterval lastRenderingInterval = 0;
    __block NSTimeInterval lastRenderingDuration = 0;
    
    dispatch_async(self.vap_renderQueue, ^{
        if (self.hwd_onPause || self.hwd_isFinish) {
            return ;
        }
        //不能将self.hwd_onPause判断加到while语句中！会导致releasepool不断上涨
        while (YES) {
            @autoreleasepool {
                if (self.hwd_isFinish) {
                    break ;
                }
                if (self.hwd_onPause || self.hwd_onSeek) {
                    lastRenderingInterval = NSDate.timeIntervalSinceReferenceDate;
                    [NSThread sleepForTimeInterval:durationForWaitingFrame];
                    continue;
                }
                __block CommonQGMP4AnimatedImageFrame *nextFrame = nil;
                dispatch_sync(dispatch_get_main_queue(), ^{
                    nextFrame = [self bbhwd_displayNext];
                });
                NSTimeInterval duration = nextFrame.duration/1000.0;
                if (duration == 0) {
                    duration = durationForWaitingFrame;
                }
                NSTimeInterval currentTimeInterval = NSDate.timeIntervalSinceReferenceDate;
                if (nextFrame && nextFrame.frameIndex != 0) {
                    duration -= ((currentTimeInterval-lastRenderingInterval) - lastRenderingDuration); //追回时间
                }
                duration = MAX(minimumDurationForLoop, duration);
                lastRenderingInterval = currentTimeInterval;
                lastRenderingDuration = duration;
                [NSThread sleepForTimeInterval:duration];
            }
        }
    });
}

- (CommonQGMP4AnimatedImageFrame *)bbhwd_displayNext {
    
    if (self.hwd_onPause || self.hwd_isFinish) {
        return nil;
    }
    NSInteger nextIndex = self.hwd_currentFrame.frameIndex + 1;
    if (!self.hwd_currentFrame) {
        nextIndex = 0;
    }
    
    CommonQGMP4AnimatedImageFrame *nextFrame = (CommonQGMP4AnimatedImageFrame *)[self.hwd_decodeManager consumeDecodedFrame:nextIndex];
    //没取到预期的帧
    if (!nextFrame || nextFrame.frameIndex != nextIndex || ![nextFrame isKindOfClass:[CommonQGMP4AnimatedImageFrame class]]) {
        return nil;
    }
    //音频播放
    if (nextIndex == 0) {
        [self.hwd_decodeManager tryToStartAudioPlay];
    }
    nextFrame.duration = [self hwd_appropriateDurationForFrame:nextFrame];
    //VAP_Debug(kQGVAPModuleCommon, @"display frame:%@, has frameBuffer:%@",@(nextIndex),@(nextFrame.pixelBuffer != nil));
    if (self.hwd_renderByOpenGL) {
        [self.hwd_openGLView displayPixelBuffer:nextFrame.pixelBuffer];
    } else if (self.useVapMetalView) {
        NSArray<CommonQGVAPMergedInfo *> *mergeInfos = self.hwd_configManager.model.mergedConfig[@(nextFrame.frameIndex)];
        [self.vap_metalView display:nextFrame.pixelBuffer mergeInfos:mergeInfos];
    } else {
        [self.hwd_metalView display:nextFrame.pixelBuffer];
    }
    self.hwd_currentFrameInstance = nextFrame;
    
    [self.hwd_callbackQueue addOperationWithBlock:^{
        if (nextIndex == 0 && [self.hwd_Delegate respondsToSelector:@selector(viewDidStartPlayMP4:)]) {
            [self.hwd_Delegate viewDidStartPlayMP4:self];
        }
        //此处必须延迟释放，避免野指针
        if ([self.hwd_Delegate respondsToSelector:@selector(viewDidPlayMP4AtFrame:view:)]) {
            [self.hwd_Delegate viewDidPlayMP4AtFrame:self.hwd_currentFrame view:self];
        }
    }];
    return nextFrame;
}

//结束播放
- (void)commonStopHWDMP4 {
    [self commonHwd_stopHWDMP4];
}

- (void)commonPauseHWDMP4 {
    
    VAP_Info(kQGVAPModuleCommon, @"pauseHWDMP4");
    self.hwd_onPause = YES;
    [self.hwd_decodeManager tryToPauseAudioPlay];
// pause回调stop会导致一般使用场景将view移除，无法resume，因此暂时去掉该回调触发
//    [self.hwd_callbackQueue addOperationWithBlock:^{
//        //此处必须延迟释放，避免野指针
//        if ([self.hwd_Delegate respondsToSelector:@selector(viewDidStopPlayMP4:view:)]) {
//            [self.hwd_Delegate viewDidStopPlayMP4:self.hwd_currentFrame.frameIndex view:self];
//        }
//    }];
}

- (void)commonResumeHWDMP4 {
    
    VAP_Info(kQGVAPModuleCommon, @"resumeHWDMP4");
    self.hwd_onPause = NO;
    self.hwd_openGLView.pause = NO;
    // 目前音频和视频没有同步逻辑，多次暂停恢复会使音视频差距越来越大
    [self.hwd_decodeManager tryToResumeAudioPlay];
}

+ (void)registerHWDLog:(CommonQGVAPLoggerFunc)logger {
    [CommonQGVAPLogger registerExternalLog:logger];
}

- (void)enableOldVersion:(BOOL)enable {
    _vap_enableOldVersion = enable;
}

- (void)setMute:(BOOL)isMute {
    _vap_isMute = isMute;
}

#pragma mark - delegate

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
//decoder
- (Class)decoderClassForManager:(CommonQGAnimatedImageDecodeManager *)manager {
    return [CommonQGMP4FrameHWDecoder class];
}

- (BOOL)shouldSetupAudioPlayer {
    return !self.vap_isMute;
}

- (void)decoderDidFinishDecode:(CommonQGBaseDecoder *)decoder {
    VAP_Info(kQGVAPModuleCommon, @"decoderDidFinishDecode.");
    [self commonHwd_didFinishDisplay];
}

- (void)decoderDidFailDecode:(CommonQGBaseDecoder *)decoder error:(NSError *)error{
    VAP_Error(kQGVAPModuleCommon, @"decoderDidFailDecode:%@", error);
    [self commonHwd_stopHWDMP4];
    [self.hwd_callbackQueue addOperationWithBlock:^{
        //此处必须延迟释放，避免野指针
        if ([self.hwd_Delegate respondsToSelector:@selector(viewDidFailPlayMP4:)]) {
            [self.hwd_Delegate viewDidFailPlayMP4:error];
        }
    }];
}

//opengl
- (void)onViewUnavailableStatus {
    VAP_Error(kQGVAPModuleCommon, @"onViewUnavailableStatus");
    [self commonHwd_stopHWDMP4];
}

//metal
- (void)onMetalViewUnavailable {
    VAP_Error(kQGVAPModuleCommon, @"onMetalViewUnavailable");
    [self commonStopHWDMP4];
}

//config resources loaded
- (void)onVAPConfigResourcesLoaded:(CommonQGVAPConfigModel *)config error:(NSError *)error {
    
    [self commonHwd_loadMetalDataIfNeed];
    if ([self.hwd_Delegate respondsToSelector:@selector(shouldStartPlayMP4:config:)]) {
        BOOL shouldStart = [self.hwd_Delegate shouldStartPlayMP4:self config:self.hwd_configManager.model];
        if (!shouldStart) {
            VAP_Event(kQGVAPModuleCommon, @"shouldStartPlayMP4 return no!");
            [self commonHwd_stopHWDMP4];
            return ;
        }
    }
    [self commonHwd_renderVideoRun];
}

- (NSString *)vap_contentForTag:(NSString *)tag resource:(CommonQGVAPSourceInfo *)info {
    
    if ([self.hwd_Delegate respondsToSelector:@selector(contentForVapTag:resource:)]) {
        return [self.hwd_Delegate contentForVapTag:tag resource:info];
    }
    return nil;
}

- (void)vap_loadImageWithURL:(NSString *)urlStr context:(NSDictionary *)context completion:(VAPImageCompletionBlock)completionBlock {
    if ([self.hwd_Delegate respondsToSelector:@selector(loadVapImageWithURL:context:completion:)]) {
        [self.hwd_Delegate loadVapImageWithURL:urlStr context:context completion:completionBlock];
    } else if (completionBlock) {
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:-1 userInfo:@{@"msg" : @"hwd_Delegate doesn't responds to selector loadVapImageWithURL:context:completion:"}];
        completionBlock(nil, error, nil);
    }
}

#pragma clang diagnostic pop

#pragma mark - setters&getters

- (BOOL)useVapMetalView {
    return self.hwd_configManager.hasValidConfig;
}

- (CommonQGMP4AnimatedImageFrame *)hwd_currentFrame {
    return self.hwd_currentFrameInstance;
}

- (id<CommonHWDMP4PlayDelegate>)hwd_Delegate {
    return objc_getAssociatedObject(self, @"MP4PlayDelegate");
}

- (void)setHwd_Delegate:(id<CommonHWDMP4PlayDelegate>)MP4PlayDelegate {
    //解决循环播放问题，本身已经是一个weakproxy对象，就不再处理
    id weakDelegate = MP4PlayDelegate;
    if (![MP4PlayDelegate isKindOfClass:[CommonQGVAPWeakProxy class]]) {
        weakDelegate = [CommonQGVAPWeakProxy proxyWithTarget:MP4PlayDelegate];
    }
    return objc_setAssociatedObject(self, @"MP4PlayDelegate", weakDelegate, OBJC_ASSOCIATION_RETAIN);
}

//category methods
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(hwd_onPause, setHwd_onPause, BOOL)
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(hwd_onSeek, setHwd_onSeek, BOOL)
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(hwd_enterBackgroundOP, setHwd_enterBackgroundOP, HWDMP4EBOperationType)
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(hwd_renderByOpenGL, setHwd_renderByOpenGL, BOOL)
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(hwd_isFinish, setHwd_isFinish, BOOL)
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(hwd_fps, setHwd_fps, NSInteger)
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(hwd_blendMode, setHwd_blendMode, NSInteger)
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(hwd_repeatCount, setHwd_repeatCount, NSInteger)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(hwd_currentFrameInstance, setHwd_currentFrameInstance, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(hwd_MP4FilePath, setHwd_MP4FilePath, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(hwd_decodeManager, setHwd_decodeManager, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(hwd_fileInfo, setHwd_fileInfo, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(hwd_decodeConfig, setHwd_decodeConfig, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(hwd_callbackQueue, setHwd_callbackQueue, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(hwd_openGLView, setHwd_openGLView, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(hwd_metalView, setHwd_metalView, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(vap_metalView, setVap_metalView, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(hwd_attachmentsModel, setHwd_attachmentsModel, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(hwd_configManager, setHwd_configManager, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_OBJECT(vap_renderQueue, setVap_renderQueue, OBJC_ASSOCIATION_RETAIN)
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(vap_enableOldVersion, setVap_enableOldVersion, BOOL)
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(vap_isMute, setVap_isMute, BOOL)
//HWDSYNTH_DYNAMIC_PROPERTY_CTYPE(textureId, setTextureId, NSInteger)
@end


/// vap 增加手势识别的能力
@implementation  VapPlayer (VAPGesture)

/// 手势识别通用接口
/// @param gestureRecognizer 需要的手势识别器
/// @param handler 手势识别事件回调，按照gestureRecognizer回调时机回调
/// @note 例：[mp4View addVapGesture:[UILongPressGestureRecognizer new] callback:^(UIGestureRecognizer *gestureRecognizer, BOOL insideSource,QGVAPSourceDisplayItem *source) { NSLog(@"long press"); }];
- (void)addVapGesture:(UIGestureRecognizer *)gestureRecognizer callback:(VAPGestureEventBlock)handler {
 
    if (!gestureRecognizer) {
        VAP_Event(kQGVAPModuleCommon, @"addVapTapGesture with empty gestureRecognizer!");
        return ;
    }
    if (!handler) {
        VAP_Event(kQGVAPModuleCommon, @"addVapTapGesture with empty handler!");
        return ;
    }
    __weak __typeof(self) weakSelf = self;
    [gestureRecognizer addVapActionBlock:^(UITapGestureRecognizer *sender) {
        
        CommonQGVAPSourceDisplayItem *diplaySource = [weakSelf displayingSourceAt:[sender locationInView:weakSelf]];
        if (diplaySource) {
            handler(sender, YES, diplaySource);
        } else {
            handler(sender, NO, nil);
        }
    }];
//    [self addGestureRecognizer:gestureRecognizer];
}

/// 增加点击的手势识别
/// @param handler 点击事件回调
- (void)addVapTapGesture:(VAPGestureEventBlock)handler {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
    [self addVapGesture:tapGesture callback:handler];
}

/// 获取当前视图中point位置最近的一个source，没有的话返回nil
/// @param point 当前view坐标系下的某一个位置
- (CommonQGVAPSourceDisplayItem *)displayingSourceAt:(CGPoint)point {
    
    NSArray<CommonQGVAPMergedInfo *> *mergeInfos = self.hwd_configManager.model.mergedConfig[@(self.hwd_currentFrame.frameIndex)];
    mergeInfos = [mergeInfos sortedArrayUsingComparator:^NSComparisonResult(CommonQGVAPMergedInfo *obj1, CommonQGVAPMergedInfo *obj2) {
        return [@(obj2.renderIndex) compare:@(obj1.renderIndex)];
    }];
    CGSize renderingPixelSize = self.hwd_configManager.model.info.size;
    if (renderingPixelSize.width <= 0 || renderingPixelSize.height <= 0) {
        return nil;
    }
    __block CommonQGVAPMergedInfo *targetMergeInfo = nil;
    __block CGRect targetSourceFrame = CGRectZero;
    
    CGSize viewSize = self.vapSise;
    CGFloat xRatio =  viewSize.width / renderingPixelSize.width;
    CGFloat yRatio = viewSize.height / renderingPixelSize.height;
    [mergeInfos enumerateObjectsUsingBlock:^(CommonQGVAPMergedInfo * mergeInfo, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect sourceRenderingRect = mergeInfo.renderRect;
        CGRect sourceRenderingFrame = CGRectMake(CGRectGetMinX(sourceRenderingRect) * xRatio, CGRectGetMinY(sourceRenderingRect) * yRatio, CGRectGetWidth(sourceRenderingRect) * xRatio, CGRectGetHeight(sourceRenderingRect) * yRatio);
        BOOL inside = CGRectContainsPoint(sourceRenderingFrame, point);
        if (inside) {
            targetMergeInfo = mergeInfo;
            targetSourceFrame = sourceRenderingFrame;
            *stop = YES;
        }
    }];
    
    if (!targetMergeInfo) {
        return nil;
    }
    
    CommonQGVAPSourceDisplayItem *diplayItem = [CommonQGVAPSourceDisplayItem new];
    diplayItem.sourceInfo = targetMergeInfo.source;
    diplayItem.frame = targetSourceFrame;
    return diplayItem;
}

@end

@implementation VapPlayer (VAPMask)

- (void)setVap_maskInfo:(CommonQGVAPMaskInfo *)vap_maskInfo {
    objc_setAssociatedObject(self, @"VAPMaskInfo", vap_maskInfo, OBJC_ASSOCIATION_RETAIN);
    [self.vap_metalView setMaskInfo:vap_maskInfo];
}

- (CommonQGVAPMaskInfo *)vap_maskInfo {
    return objc_getAssociatedObject(self, @"VAPMaskInfo");
}

@end

@implementation  VapPlayer (MP4HWDDeprecated)

/**
 见playHWDMP4:blendMode:repeatCount:delegate:
 @param fps 每一帧播放时优先使用这个值确定帧展示时长；若不合法则使用mp4中的数据；若还是不合法则使用默认18

 播放一遍，alpha数据在左边,设置回调
 */
- (void)playHWDMP4:(NSString *)filePath fps:(NSInteger)fps delegate:(id<CommonHWDMP4PlayDelegate>)delegate {
    [self common_playHWDMP4:filePath fps:fps blendMode:CommonQGHWDTextureBlendMode_AlphaLeft repeatCount:0 delegate:delegate];
}

/**
 见playHWDMP4:blendMode:repeatCount:delegate:
 @param fps 每一帧播放时优先使用这个值确定帧展示时长；若不合法则使用mp4中的数据；若还是不合法则使用默认18

 alpha数据在左边
 */
- (void)playHWDMP4:(NSString *)filePath fps:(NSInteger)fps repeatCount:(NSInteger)repeatCount delegate:(id<CommonHWDMP4PlayDelegate>)delegate {
    [self common_playHWDMP4:filePath fps:fps blendMode:CommonQGHWDTextureBlendMode_AlphaLeft repeatCount:repeatCount delegate:delegate];

}

/**
 见playHWDMP4:blendMode:repeatCount:delegate:

 播放一遍
 */
- (void)playHWDMP4:(NSString *)filePath blendMode:(CommonQGHWDTextureBlendMode)mode delegate:(id<CommonHWDMP4PlayDelegate>)delegate {
    [self common_playHWDMP4:filePath fps:0 blendMode:mode repeatCount:0 delegate:delegate];
}

/**
 利用GPU解码并播放mp4-h.264素材，在模拟器中会直接失败无法播放。

 @param filePath mp4s素材本地地址
 @param mode 确定素材中alpha通道数据位置，默认QGHWDTextureBlendMode_AlphaLeft
 @param repeatCount 重复播放次数，若repeatCount==n, 则播放n+1次；若repeatCount==-1，则循环播放.
 @param delegate 播放回调，⚠️注意：不在主线程回调

 @note 素材文件需要按照规范生成
 */
- (void)playHWDMP4:(NSString *)filePath blendMode:(CommonQGHWDTextureBlendMode)mode repeatCount:(NSInteger)repeatCount delegate:(id<CommonHWDMP4PlayDelegate>)delegate {
    [self common_playHWDMP4:filePath fps:0 blendMode:mode repeatCount:repeatCount delegate:delegate];
}

/**
 见playHWDMP4:blendMode:repeatCount:delegate:
 @param fps 每一帧播放时优先使用这个值确定帧展示时长；若不合法则使用mp4中的数据；若还是不合法则使用默认18

 播放一遍
 */
- (void)playHWDMP4:(NSString *)filePath fps:(NSInteger)fps blendMode:(CommonQGHWDTextureBlendMode)mode delegate:(id<CommonHWDMP4PlayDelegate>)delegate {
    [self common_playHWDMP4:filePath fps:fps blendMode:mode repeatCount:0 delegate:delegate];
}

/**
 见playHWDMP4:blendMode:repeatCount:delegate:
 @param fps 每一帧播放时优先使用这个值确定帧展示时长；若不合法则使用mp4中的数据；若还是不合法则使用默认18

 */
- (void)playHWDMP4:(NSString *)filePath fps:(NSInteger)fps blendMode:(CommonQGHWDTextureBlendMode)mode repeatCount:(NSInteger)repeatCount delegate:(id<CommonHWDMP4PlayDelegate>)delegate {
    [self common_playHWDMP4:filePath fps:fps blendMode:mode repeatCount:repeatCount delegate:delegate];
}

@end

