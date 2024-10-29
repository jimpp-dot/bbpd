//
//  ZimGatewayForPop.h
//  DTFIdentityManager
//
//  Created by sanyuan.he on 2020/3/31.
//  Copyright © 2020 DTF. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN
/**
 *  rpc结果回调
 *
 *  @param success 网络交互是否成功(不代表服务端返回的结果)
 *  @param result  服务端返回的结果
 */
typedef void (^rpcCompletionBlock)(BOOL success, NSObject *result);



@interface ZimGatewayForPop : NSObject

/**
 初始化函数
 */
- (void)doInitRequest:(ZimInitRequest *)request withcompletionBlock:(rpcCompletionBlock)blk;

/**
 认证请求
 */
- (void)doValidateRequest:(ZimValidateRequest * )request metaInfo:(NSDictionary *)metaInfo withcompletionBlock:(rpcCompletionBlock)block;

/**
 认证请求
 */
- (void)doUploadLog:(NSDictionary *)content metaInfo:(NSDictionary *)metaInfo withcompletionBlock:(void(^)(BOOL))block;

/**
OCR请求
*/
- (void)startSendOCRContent:(NSString*)certifyId certifyData:(NSString*)side withImage:(NSData*)imageData withcompletionBlock:(rpcCompletionBlock)blk;

@end

NS_ASSUME_NONNULL_END

