//
//  FlutterVapView.m
//  agora
//
//  Created by liqf on 2020/9/9.
//
#import <stdatomic.h>
#import <Foundation/Foundation.h>
#import "FlutterVapTexture.h"
#import "VAPTexturePiayer.h"
#import "Models/CommonQGVAPConfigModel.h"
#import "Models/CommonQGMP4AnimatedImageFrame.h"
#import "NSNotificationCenter+VAPThreadSafeTexture.h"

@interface FlutterVapTexture()

@property (nonatomic, strong) NSArray  *imgArr;//视频自定义图片
@property (nonatomic, strong) NSArray  *textArr;//视频自定义文字
@property (atomic, assign) NSInteger  frameTotal;//视频总帧数
@property (nonatomic, strong) NSObject<FlutterPluginRegistrar> *registrar;
@end


@implementation FlutterVapTexture {
    int64_t _viewId;
    FlutterMethodChannel *_sendChannel;
    VapPlayer *_vapPlayer;
    
    CVPixelBufferRef _cachePixelBufer;
    CVPixelBufferRef _Atomic _pixelBuffer;
}


- (void)displayPixelbuffer:(NSNotification*) obj {
    NSDictionary *dic = [obj object];
    CVPixelBufferRef pixdelbuffer = (__bridge CVPixelBufferRef)dic[@"pixelBuffer"];
    NSInteger textureId = [dic[@"textureId"] intValue];
    if (textureId != self.textureId) {
        return;
    }
    if (_cachePixelBufer != nil) {
        CVPixelBufferRelease(_cachePixelBufer);
    }
    if (pixdelbuffer != nil) {
        CVPixelBufferRetain(pixdelbuffer);
        _cachePixelBufer = pixdelbuffer;
    }
    atomic_exchange(&_pixelBuffer, _cachePixelBufer);
    [self.registrar.textures textureFrameAvailable:self.textureId];
}

- (CVPixelBufferRef _Nullable)copyPixelBuffer {

    CVPixelBufferRef pixelBuffer = atomic_exchange(&_pixelBuffer, nil);
    if (pixelBuffer) {
        CVPixelBufferRetain(pixelBuffer);
    }
    return pixelBuffer;
}

- (void)dealloc {
//    [self dispose];
}

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    
    if (self = [super init]) {
        _registrar = registrar;
        [[NSNotificationCenter defaultCenter] hwd_addSafeObserver:self selector:@selector(displayPixelbuffer:) name:@"pixelBuffer" object:nil];
    }
    
    return self;
}

- (void)onComplete {
    [_sendChannel invokeMethod:@"onVideoComplete" arguments:nil];
}

- (void)onRenderFrame:(int)frameIndex total:(int)frameTotal {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[NSNumber numberWithInt:frameIndex] forKey:@"frameIndex"];
    [params setValue:[NSNumber numberWithInt:frameTotal] forKey:@"frameTotal"];
    [_sendChannel invokeMethod:@"onRenderFrame" arguments:params];
}

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSLog(@"onMethodCall:%@",call.method);
    NSDictionary *arguments = call.arguments;
    if ([call.method isEqualToString:@"create"]) {
        int channleId = 0;
        if (arguments[@"channelId"]) {
            channleId = [arguments[@"channelId"] intValue];
        }
        NSString* filePath = arguments[@"filePath"];
//        NSString *resPath = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], filePath];
        int repeatCount = 0;
        if (arguments[@"repeatCount"] && ![arguments[@"repeatCount"] isKindOfClass:[NSNull class]]) {
            repeatCount = [arguments[@"repeatCount"] intValue];
        }
        id imgArr = arguments[@"imgList"];
        if (imgArr && [imgArr isKindOfClass:[NSArray class]]) {
            self.imgArr = imgArr;
        }
        id textArr = arguments[@"textList"];
        if (textArr && [textArr isKindOfClass:[NSArray class]]) {
            self.textArr = textArr;
        }
        
        float width;
        float height;
        if ([((NSDictionary *)call.arguments).allKeys containsObject:@"width"]
            && ![call.arguments[@"width"] isKindOfClass:[NSNull class]]
            && [((NSDictionary *)call.arguments).allKeys containsObject:@"height"]
            && ![call.arguments[@"height"] isKindOfClass:[NSNull class]]
            ) {
            width = [call.arguments[@"width"] floatValue];
            height = [call.arguments[@"height"] floatValue];
        } else {
            width = 0.0;
            height = 0.0;
        }
        NSString* channelName = [NSString stringWithFormat:@"plugins/vap_view_%d", channleId];
        _sendChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:self.registrar.messenger];
        _vapPlayer = [[VapPlayer alloc] initWithSize:CGSizeMake(width, height)];
        _vapPlayer.hwd_enterBackgroundOP = CommonHWDMP4EBOperationTypePauseAndResume;
        [_vapPlayer enableOldVersion:YES];
        [_vapPlayer setTextureId:self.textureId];
        [_vapPlayer commonPlayHWDMp4:filePath repeatCount:repeatCount delegate:self];
        result(@(self.textureId));
        
    } else if ([[call method] isEqualToString:@"dispose"]) {
        [self dispose];
        result(nil);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)dispose {
    NSLog(@"vap_texture_dispose :%@", @(self.textureId));
    [_vapPlayer commonStopHWDMP4];
    _vapPlayer = nil;
    [_sendChannel setMethodCallHandler:nil];
    _sendChannel = nil;
    if (self.registrar) {
        [_registrar.textures unregisterTexture:self.textureId];
        _registrar = nil;
    }
    if (_cachePixelBufer) {
        CVPixelBufferRelease(_cachePixelBufer);
        _cachePixelBufer = NULL;
    }
}

#pragma mark -  mp4 hwd delegate

#pragma mark -- 播放流程
- (void)viewDidStartPlayMP4:(VapPlayer *)container {
    NSLog(@"FlutterVapView viewDidStartPlayMP4");
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->_sendChannel invokeMethod:@"onVideoStart" arguments:nil];
    });
}

- (void)viewDidFinishPlayMP4:(NSInteger)totalFrameCount view:(VapPlayer *)container {
    NSLog(@"FlutterVapView viewDidFinishPlayMP4 totalFrameCount = %d", (int)totalFrameCount);
    //note:在子线程被调用
    dispatch_async(dispatch_get_main_queue(), ^{
        [self onComplete];
    });
}

- (void)viewDidPlayMP4AtFrame:(CommonQGMP4AnimatedImageFrame *)frame view:(VapPlayer *)container {
    //note:在子线程被调用
    int frameIndex = (int)frame.frameIndex;
    int total = (int)self.frameTotal;

    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"FlutterVapView viewDidPlayMP4AtFrame frameIndex = %d", frameIndex);
        [self onRenderFrame:frameIndex total:total];
    });
}

- (void)viewDidStopPlayMP4:(NSInteger)lastFrameIndex view:(VapPlayer *)container {
    NSLog(@"FlutterVapView viewDidStopPlayMP4 lastFrameIndex = %ld", lastFrameIndex);
    //note:在子线程被调用
    dispatch_async(dispatch_get_main_queue(), ^{
//        [self dispose];
        self.imgArr = nil;
        self.textArr = nil;
        self.frameTotal = 0;
        //do something
    });
}

- (BOOL)shouldStartPlayMP4:(VapPlayer *)container config:(CommonQGVAPConfigModel *)config {
    NSLog(@"FlutterVapView shouldStartPlayMP4 frameCount = %ld", config.info.framesCount);
    self.frameTotal = config.info.framesCount;
//    CGSize size = config.info.size;
//    CGRect frame = self.view.frame;
//    float contentScaleFactor = self.view.contentScaleFactor;
//    frame.size.width = size.width / contentScaleFactor;
//    frame.size.height = size.height / contentScaleFactor;
//    self.view.frame = frame;
//    [self.view setNeedsLayout];
//    NSLog(@"cgsize");
    
    return YES;
}

- (void)viewDidFailPlayMP4:(NSError *)error {
    NSLog(@"FlutterVapView viewDidFailPlayMP4 error = %@", error.userInfo);
}

- (NSString *)contentForVapTag:(NSString *)tag resource:(CommonQGVAPSourceInfo *)info{
    if ([tag containsString:@"bbImg"]) {//约定的图片标签
        NSString *indexStr = [tag stringByReplacingOccurrencesOfString:@"bbImg" withString:@""];
        indexStr = [indexStr stringByReplacingOccurrencesOfString:@"[" withString:@""];
        indexStr = [indexStr stringByReplacingOccurrencesOfString:@"]" withString:@""];
        indexStr = [indexStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSInteger index = [indexStr integerValue];
        if (index < self.imgArr.count) {
            return self.imgArr[index];
        }
    }
    if ([tag containsString:@"bbText"]) {//约定的文字标签
        NSString *indexStr = [tag stringByReplacingOccurrencesOfString:@"bbText" withString:@""];
        indexStr = [indexStr stringByReplacingOccurrencesOfString:@"[" withString:@""];
        indexStr = [indexStr stringByReplacingOccurrencesOfString:@"]" withString:@""];
        indexStr = [indexStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSInteger index = [indexStr integerValue];
        if (index < self.textArr.count) {
            return self.textArr[index];
        }
    }
    return @"";
    
}

- (void)loadVapImageWithURL:(NSString *)urlStr context:(NSDictionary *)context completion:(VAPImageCompletionBlock)completionBlock{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImage *image = [UIImage imageWithContentsOfFile:urlStr];
        completionBlock(image, nil, urlStr);
    });
    
}

- (NSArray *)imgArr{
    if (!_imgArr) {
        _imgArr = [NSArray new];
    }
    return _imgArr;
}

- (NSArray *)textArr{
    if (!_textArr) {
        _textArr = [NSArray new];
    }
    return _textArr;
}

@end

