//
//  FlutterVapView.m
//  agora
//
//  Created by liqf on 2020/9/9.
//

#import <Foundation/Foundation.h>
#import "FlutterVapView.h"
#import "FlutterVapViewFactory.h"
#import "UIView+VAP.h"
#import "Models/QGVAPConfigModel.h"
#import "Models/QGMP4AnimatedImageFrame.h"

@interface FlutterVapView()

@property (nonatomic, strong) NSArray  *imgArr;//视频自定义图片
@property (nonatomic, strong) NSArray  *textArr;//视频自定义文字
@property (atomic, assign) NSInteger  frameTotal;//视频总帧数

@end


@implementation FlutterVapView {
    int64_t _viewId;
    FlutterMethodChannel* _channel;
    
    VAPView *mp4View;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
  return [FlutterStandardMessageCodec sharedInstance];
}

- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger {
    mp4View = [[VAPView alloc] initWithFrame:self.view.bounds];
    
    _viewId = viewId;

    NSString* channelName = [NSString stringWithFormat:@"ly.plugins.vap_view.%lld", viewId];
    _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
    
    __weak __typeof__(self) weakSelf = self;
    [_channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
      [weakSelf onMethodCall:call result:result];
    }];
    
    return self;
}

- (nonnull UIView *)view {
    return mp4View;
}

- (void)onComplete {
    [_channel invokeMethod:@"onComplete" arguments:nil];
}

- (void)onRenderFrame:(int)frameIndex total:(int)frameTotal {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[NSNumber numberWithInt:frameIndex] forKey:@"frameIndex"];
    [params setValue:[NSNumber numberWithInt:frameTotal] forKey:@"frameTotal"];
    [_channel invokeMethod:@"onRenderFrame" arguments:params];
}

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSLog(@"onMethodCall:%@",call.method);
  if ([[call method] isEqualToString:@"startPlay"]) {
    [self startPlay:call result:result];
  } else if ([[call method] isEqualToString:@"dispose"]){
    [mp4View stopHWDMP4];
    [_channel setMethodCallHandler:nil];
    _channel = nil;
    result(nil);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)startPlay:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString* filePath = call.arguments[@"filePath"];
    int repeatCount = [call.arguments[@"repeatCount"] intValue];
    id imgArr = call.arguments[@"imgList"];
    if (imgArr && [imgArr isKindOfClass:[NSArray class]]) {
        self.imgArr = imgArr;
    }
    id textArr = call.arguments[@"textList"];
    if (textArr && [textArr isKindOfClass:[NSArray class]]) {
        self.textArr = textArr;
    }
    [mp4View playHWDMP4:filePath repeatCount:repeatCount delegate:self];
    result(nil);
}

#pragma mark -  mp4 hwd delegate

#pragma mark -- 播放流程
- (void)viewDidStartPlayMP4:(VAPView *)container {
    NSLog(@"FlutterVapView viewDidStartPlayMP4");
}

- (void)viewDidFinishPlayMP4:(NSInteger)totalFrameCount view:(UIView *)container {
    NSLog(@"FlutterVapView viewDidFinishPlayMP4 totalFrameCount = %d", (int)totalFrameCount);
    //note:在子线程被调用
    dispatch_async(dispatch_get_main_queue(), ^{
        [self onComplete];
    });
}

- (void)viewDidPlayMP4AtFrame:(QGMP4AnimatedImageFrame *)frame view:(UIView *)container {
    //note:在子线程被调用
    int frameIndex = (int)frame.frameIndex;
    int total = (int)self.frameTotal;

    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"FlutterVapView viewDidPlayMP4AtFrame frameIndex = %d", frameIndex);
        [self onRenderFrame:frameIndex total:total];
    });
}

- (void)viewDidStopPlayMP4:(NSInteger)lastFrameIndex view:(UIView *)container {
    NSLog(@"FlutterVapView viewDidStopPlayMP4 lastFrameIndex = %ld", lastFrameIndex);
    //note:在子线程被调用
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imgArr = nil;
        self.textArr = nil;
        self.frameTotal = 0;
        //do something
    });
}

- (BOOL)shouldStartPlayMP4:(VAPView *)container config:(QGVAPConfigModel *)config {
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

- (NSString *)contentForVapTag:(NSString *)tag resource:(QGVAPSourceInfo *)info{
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

