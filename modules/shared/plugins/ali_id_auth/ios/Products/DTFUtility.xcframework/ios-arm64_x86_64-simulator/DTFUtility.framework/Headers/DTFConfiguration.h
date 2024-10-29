//
//  DTFConfiguration.h
//  DTFSensorServices
//
//  Created by sanyuan.he on 2020/2/25.
//  Copyright © 2020  DTF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIDevice.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define ZIM_PLATFORM_SETTING_INFO_ALIYUN @"aliyun"
#define ZIM_PLATFORM_SETTING_INFO_ALITECH @"alitech"


@interface DTFConfiguration : NSObject

@property(nonatomic, strong, nullable) NSString *forceDirection;
@property(nonatomic, strong ,nullable) NSData *imageContent;
@property(nonatomic, strong ,nullable) NSString *platformInfo;
@property(nonatomic, strong ,nullable) NSURL *photinusPath;
@property(nonatomic, strong ,nullable) NSURL *photinusInfo;
@property(nonatomic, strong, nullable) UIColor *circleColor;
@property(nonatomic, strong, nullable) UIColor *buttonColor;
@property(nonatomic, strong, nullable) UIColor *clickedColor;
@property(nonatomic, strong, nullable) NSString *ocrInfo;
@property(nonatomic, strong, nullable) NSData *faceData; // add for OCR
@property(nonatomic, strong, nullable) NSData *countryData;  // add for OCR

@property(nonatomic, assign) UIDeviceOrientation orientation;
@property(nonatomic, assign) BOOL returnContent;
@property(nonatomic, assign) BOOL returnContentUpload;
@property(nonatomic, assign) BOOL simpleFlags; //安全SDK的Flags
@property(nonatomic, assign) BOOL tempddsFlags;//是否需要做安全加密
@property(nonatomic, assign) BOOL iPv6Flags;

+ (DTFConfiguration *)sharedInstance;

@end

NS_ASSUME_NONNULL_END
