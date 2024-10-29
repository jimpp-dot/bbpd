#import <Foundation/Foundation.h>
#define DU_LABEL_CUSTOM 0
#define DU_LABEL_UNIVERSAL 1
#define DU_LABEL_DEVICE 2
static NSString *SDKVer = @"3.6.7";

@interface DUEntry : NSObject
typedef void (^getSecVerificationBlock)(NSString *cdidStr);
typedef void (^DUSecTokenBlock)(NSString *tokenStr);
typedef void (^DUCABlock)(NSDictionary *caDic);
typedef void (^DUDeviceLabBlock)(NSString *devcieLab);
typedef void (^DUEventBlock)(NSString *sessionID);
typedef void (^DUQueryBlock)(NSString *queryID);
typedef void (^DUIPBlock)(NSString *realIP);
@property (atomic, copy) getSecVerificationBlock getSecVerificationBlock;
- (void)getDUSecTokenBlock:(DUSecTokenBlock)block;
- (void)setMessage:(NSString *)strMsg;
- (void)setChannel:(NSString *)strChannel;
- (void)setCustomerId:(NSString *)strCustomerId;
- (void)setExisting:(BOOL)bExisting;
- (void)setDomainName:(NSString *)strDomainName;
- (void)run;
- (NSString *)getDUSecVerification;
+ (instancetype)sharedInstance;
- (void)onEvent:(DUEventBlock)block eventCode:(NSString *)eventCode optMsg:(NSString *)optMsg;
- (void)getDeviceLabel:(DUDeviceLabBlock)block labelType:(NSInteger)labelType;
- (void)getQueryID:(NSString *)strCustomerId strMsg:(NSString *)strMsg dublock:(DUQueryBlock)block;
- (void)getRealIPToken:(DUIPBlock)block;

@end
