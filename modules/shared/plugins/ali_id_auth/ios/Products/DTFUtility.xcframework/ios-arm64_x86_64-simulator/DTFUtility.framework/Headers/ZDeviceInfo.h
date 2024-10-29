//
//  ZDeviceInfo.h
//  DTFOpenPlatformBuild
//
//  Created by richard on 26/02/2018.
//  Copyright © 2018 com. .iphoneclient.DTF. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface ZDeviceInfo : NSObject

@property(nonatomic, strong) NSString *apdidToken;
@property(nonatomic, strong) NSString *wWORKSPACEID;

+(instancetype)getInstance;

- (NSString *)getTokenContent;

- (NSString *)securityVersion;

- (void)ActivityToken;

- (void)ActivityTokenWithParam:(NSDictionary*)param;

- (NSString *)ApperceptRiskwith:(NSInteger)action extParams:(NSDictionary *)args;

@end
