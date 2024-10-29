//
//  DTFIdentityManager.h
//  DTFIdentityManager
//
//  Created by mengbingchuan on 2022/11/23.
//  Copyright © 2022 DTF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZIMResponse.h"
#import "ZimRpcManager.h"

//version 2.2.2

NS_ASSUME_NONNULL_BEGIN

typedef void (^ZIMCallback)(ZIMResponse *response);

@interface DTFIdentityManager : NSObject

+ (DTFIdentityManager *)sharedInstance;

+ (NSDictionary *)getMetaInfo;

- (void)setRpcProxy:(id<DTFRPCProxyProtocol>)proxy;

- (void)verifyWith:(NSString *)zimId extParams:(NSDictionary *)params onCompletion:(ZIMCallback)callback;

@end

NS_ASSUME_NONNULL_END
