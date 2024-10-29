//
//  ZIMRpcManager.h
//  DTFIdentityManager
//
//  Created by richard on 26/02/2018.
//  Copyright © 2018 com. DTF.iphoneclient.DTF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DTFUtility/DTFUtility.h>

/**
 *  rpc结果回调
 *
 *  @param success 网络交互是否成功(不代表服务端返回的结果)
 *  @param result  服务端返回的结果
 */
typedef void (^rpcCompletionBlock)(BOOL success, NSObject *result);
typedef void (^DTFRpcCompletionBlock)(NSError *error, NSDictionary *data);


@protocol DTFRPCProxyProtocol <NSObject>

@required
/**
* ZimID初始化协议
* key: data
* value: jsonString
*/
- (void)zimInit:(NSDictionary *)params completionBlock:(DTFRpcCompletionBlock)blk;

/**
* 结果认证
* key: data
* value: jsonString
*/
- (void)zimValidate:(NSDictionary *)params completionBlock:(DTFRpcCompletionBlock)blk;

@optional

/**
* 请求发送验证码
*/
- (void)requestSMSVerifyCode:(NSDictionary *)params completionBlock:(DTFRpcCompletionBlock)blk;

/**
* 验证码结果验证
*/
- (void)checkSMSCode:(NSDictionary *)params completionBlock:(DTFRpcCompletionBlock)blk;

/**
* OCR识别认证
*/
- (void)zimOCRIdentify:(NSDictionary *)params completionBlock:(DTFRpcCompletionBlock)blk;


@end

@interface ZimRpcManager : NSObject

@property(nonatomic, weak) id<DTFRPCProxyProtocol> rpcDelegate;

//代理模式
- (void)doValidateRequetViaDelegate:(ZimValidateRequest * )request withcompletionBlock:(rpcCompletionBlock)blk;

/**
 *  zim init request
 *
 *  @param request 初始化请求
 *  @param blk     网络请求结果回调处理，result为ZimInitResponse
 */
- (void)doFastUploadInitRequest:(ZimInitRequest * )request withcompletionBlock:(rpcCompletionBlock)blk;
/**
 *  zim validate request
 *
 *  @param request validate请求
 *  @param blk     网络请求结果回调处理，result为ZimValidateResponse
 */
- (void)doFastUploadValidateRequest:(ZimValidateRequest * )request withcompletionBlock:(rpcCompletionBlock)blk;


//OCR接口
- (void) doSendOCRContent:(NSString*)certifyId idSide:(NSString*)side withImage:(NSData*)imageData withcompletionBlock:(rpcCompletionBlock)blk;

// SMS 请求接口
- (void)getSMSCode:(NSDictionary*)serviceParameters completionBlock:(DTFRpcCompletionBlock)blk;

// SMS 验证接口
- (void)verifySMSCode:(NSDictionary*)serviceParameters completionBlock:(DTFRpcCompletionBlock)blk;

@end
