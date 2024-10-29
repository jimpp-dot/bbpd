//
//  DTFFaceViewProtocol.h
//  DTFUIModule
//
//  Created by mengbingchuan on 2022/8/29.
//  Copyright © 2022   DTF. All rights reserved.
//

#import <UIKit/UIkit.h>
#import <AVFoundation/AVFoundation.h>
#import <ToygerService/ToygerFaceFrame.h>

@protocol DTFFaceViewProtocol;

@protocol DTFFaceViewDelegate <NSObject>

- (void)viewExit:(id<DTFFaceViewProtocol>)view;

@end

@protocol DTFFaceViewProtocol <NSObject>

@property(nonatomic, weak) id<DTFFaceViewDelegate> delegate;

- (void)setPreviewLayer:(AVCaptureVideoPreviewLayer *)previewLayer;

- (void)handleFaceStateChange:(ToygerMessage)state
                    stateTips:(NSString *)tips
                  actionGuide:(NSString *)guide
                     progress:(CGFloat)progress;

- (UIView *)view;

@optional

/**
 * color 炫彩时，设置View的背景色
 */
- (void)setPhotinusColor:(UIColor *)color;

/**
 * image 模糊化的人脸图，用于做结束时loading
 */
- (void)showBlurImage:(UIImage *)image;

@end

