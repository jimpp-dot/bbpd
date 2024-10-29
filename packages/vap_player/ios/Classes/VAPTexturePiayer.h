// UIView+VAP.h
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
#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>
#import "CommonVAPMacros.h"
#import "CommonQGVAPLogger.h"

// 退后台时的行为
typedef NS_ENUM(NSUInteger, CommonHWDMP4EBOperationType) {
    CommonHWDMP4EBOperationTypeStop,              // 退后台时结束VAP播放
    CommonHWDMP4EBOperationTypePauseAndResume,    // 退后台时暂停、回到前台时自动恢复 （需要从关键帧解码到当前帧以解决VTSession失效问题，建议低端机型不要设置此选项，暂停时间较长、CPU占用较大）
    CommonHWDMP4EBOperationTypeDoNothing,         // VAP自身不进行控制，当外部进行控制时可以使用这个，仅用于防止覆盖外界的pause调用的问题
};

@class VapPlayer;
@class CommonQGMP4AnimatedImageFrame,CommonQGVAPConfigModel, CommonQGVAPSourceInfo;
/** 注意：回调方法会在子线程被执行。*/
@protocol CommonHWDMP4PlayDelegate <NSObject>

@optional
//即将开始播放时询问，true马上开始播放，false放弃播放
- (BOOL)shouldStartPlayMP4:(VapPlayer *)container config:(CommonQGVAPConfigModel *)config;

- (void)viewDidStartPlayMP4:(VapPlayer *)container;
- (void)viewDidPlayMP4AtFrame:(CommonQGMP4AnimatedImageFrame*)frame view:(VapPlayer *)container;
- (void)viewDidStopPlayMP4:(NSInteger)lastFrameIndex view:(VapPlayer *)container;
- (void)viewDidFinishPlayMP4:(NSInteger)totalFrameCount view:(VapPlayer *)container;
- (void)viewDidFailPlayMP4:(NSError *)error;

//vap APIs
- (NSString *)contentForVapTag:(NSString *)tag resource:(CommonQGVAPSourceInfo *)info;        //替换配置中的资源占位符（不处理直接返回tag）
- (void)loadVapImageWithURL:(NSString *)urlStr context:(NSDictionary *)context completion:(VAPImageCompletionBlock)completionBlock; //由于组件内不包含网络图片加载的模块，因此需要外部支持图片加载。

@end

typedef void(^FrameUpdateCallback)(void);

@interface VapPlayer : NSObject

@property (nonatomic, weak) id<CommonHWDMP4PlayDelegate>      hwd_Delegate;
@property (nonatomic, readonly) CommonQGMP4AnimatedImageFrame *hwd_currentFrame;
@property (nonatomic, strong) NSString                  *hwd_MP4FilePath;
@property (nonatomic, assign) NSInteger                 hwd_fps;         //fps for dipslay, each frame's duration would be set by fps value before display.
@property (nonatomic, assign) BOOL                      hwd_renderByOpenGL;      //是否使用opengl渲染，默认使用metal
@property (nonatomic, assign) CommonHWDMP4EBOperationType     hwd_enterBackgroundOP;   // 在退后台时的行为，默认为结束
@property (nonatomic, assign) NSInteger                 textureId;

- (instancetype)initWithSize: (CGSize)size;
- (void)commonPlayHWDMp4:(NSString *)filePath;
- (void)commonPlayHWDMp4:(NSString *)filePath delegate:(id<CommonHWDMP4PlayDelegate>)delegate;
- (void)commonPlayHWDMp4:(NSString *)filePath repeatCount:(NSInteger)repeatCount delegate:(id<CommonHWDMP4PlayDelegate>)delegate;

- (void)commonStopHWDMP4;

- (void)commonPauseHWDMP4;
- (void)commonResumeHWDMP4;

+ (void)registerHWDLog:(CommonQGVAPLoggerFunc)logger;

//当素材不包含vapc box时，只有在播放素材前调用此接口设置enable才可播放素材，否则素材无法播放
- (void)enableOldVersion:(BOOL)enable;

//设置是否静音播放素材，注：在播放开始时进行设置，播放过程中设置无效，循环播放则设置后的下一次播放开始生效
- (void)setMute:(BOOL)isMute;

@end

@interface VapPlayer (VAPGesture)

//增加点击的手势识别
- (void)addVapTapGesture:(VAPGestureEventBlock)handler;

//手势识别通用接口
- (void)addVapGesture:(UIGestureRecognizer *)gestureRecognizer callback:(VAPGestureEventBlock)handler;

@end

@interface VapPlayer (VAPMask)

@property (nonatomic, strong) CommonQGVAPMaskInfo *vap_maskInfo;

@end

@interface VapPlayer (MP4HWDDeprecated)

- (void)playHWDMP4:(NSString *)filePath blendMode:(CommonQGHWDTextureBlendMode)mode delegate:(id<CommonHWDMP4PlayDelegate>)delegate  __attribute__((deprecated("QGHWDTextureBlendMode is no longer work in vap, use playHWDMP4:delegate: instead")));
- (void)playHWDMP4:(NSString *)filePath blendMode:(CommonQGHWDTextureBlendMode)mode repeatCount:(NSInteger)repeatCount delegate:(id<CommonHWDMP4PlayDelegate>)delegate  __attribute__((deprecated("QGHWDTextureBlendMode is no longer work in vap, use playHWDMP4:repeatCount:delegate: instead")));
- (void)playHWDMP4:(NSString *)filePath fps:(NSInteger)fps delegate:(id<CommonHWDMP4PlayDelegate>)delegate  __attribute__((deprecated("customized fps is not recommended, use playHWDMP4:delegate: instead")));
- (void)playHWDMP4:(NSString *)filePath fps:(NSInteger)fps repeatCount:(NSInteger)repeatCount delegate:(id<CommonHWDMP4PlayDelegate>)delegate __attribute__((deprecated("customized fps is not recommended, use playHWDMP4:repeatCount:delegate: instead")));
- (void)playHWDMP4:(NSString *)filePath fps:(NSInteger)fps blendMode:(CommonQGHWDTextureBlendMode)mode delegate:(id<CommonHWDMP4PlayDelegate>)delegate __attribute__((deprecated("customized fps is not recommended, use playHWDMP4:delegate: instead")));
- (void)playHWDMP4:(NSString *)filePath fps:(NSInteger)fps blendMode:(CommonQGHWDTextureBlendMode)mode repeatCount:(NSInteger)repeatCount delegate:(id<CommonHWDMP4PlayDelegate>)delegate __attribute__((deprecated("customized fps is not recommended, use playHWDMP4:repeatCount:delegate: instead")));

@end
