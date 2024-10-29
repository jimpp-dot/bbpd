//
//  AliyunFaaceAuthFacade.h
//  AliyunFaceAuthFacade
//
//  Created by 汪澌哲 on 2022/11/21.
//  Copyright © 2022 Alipay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DTFIdentityManager/DTFSdk.h>
#import <DTFIdentityManager/DTFIdentityManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface AliyunFaceAuthFacade : NSObject

+ (void)init;

+ (NSDictionary *)getMetaInfo;

+ (void)verifyWith:(NSString *)zimId
         extParams:(NSDictionary *)params
      onCompletion:(ZIMCallback)callback;

@end

NS_ASSUME_NONNULL_END
