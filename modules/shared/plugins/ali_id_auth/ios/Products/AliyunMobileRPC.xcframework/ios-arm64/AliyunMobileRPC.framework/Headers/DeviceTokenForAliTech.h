//
//  DeviceTokenForAliTech.h
//  DTFIdentityManager
//
//  Created by 053508 on 2020/11/12.
//  Copyright © 2020 DTF. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceTokenForAliTech : NSObject
+(instancetype)getInstance;
-(NSString *)mobileSession;
-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
