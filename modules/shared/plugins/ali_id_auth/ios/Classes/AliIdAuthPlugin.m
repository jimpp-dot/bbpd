#import "AliIdAuthPlugin.h"
#import <AliyunFaceAuthFacade/AliyunFaceAuthFacade.h>

@implementation AliIdAuthPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"ly.plugins.ali_id_auth"
            binaryMessenger:[registrar messenger]];
  AliIdAuthPlugin* instance = [[AliIdAuthPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        NSLog(@"enter getPlatformVersion");
        result([@"" stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
        return;
    }
    
    if ([@"init" isEqualToString:call.method]) {
        NSLog(@"enter init");
        [AliyunFaceAuthFacade init];
        result(@"");
        return;
    }
    
    if ([@"getMetaInfos" isEqualToString:call.method]) {
        NSLog(@"enter getMetaInfos");
        NSDictionary *metaInfo = [AliyunFaceAuthFacade getMetaInfo];
        NSString *info = [self convertToJsonData: metaInfo];
        result([@"" stringByAppendingString:info]);
        return;
    }
    
    if ([@"verify" isEqualToString:call.method]) {
        NSLog(@"enter verify");
        
        id arguments = call.arguments;
        NSString *certifyId = [arguments objectForKey:@"certifyId"];
        if (certifyId == nil || [certifyId length] == 0) {
            NSLog(@"certifyId is nil.");
            result(@"-1,certifyId is empty");
            return;
        }
        NSLog(@"certifyId: %@.", certifyId);
        
        NSMutableDictionary *extParams = [NSMutableDictionary new];
        UIViewController *vc = [self viewControllerWithWindow:nil];
        [extParams setValue:vc forKey:@"currentCtr"];   // 必须要的参数
        
        [AliyunFaceAuthFacade verifyWith:certifyId
                               extParams:extParams
                            onCompletion:^(ZIMResponse *response) {
            result([NSString stringWithFormat:@"%lu,%@", response.code, response.reason]);
        }];
        
        return;
    }
    
    result(FlutterMethodNotImplemented);
}

#pragma mark - 辅助方法

- (NSString *)convertToJsonData:(NSDictionary *) dict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                        options:NSJSONWritingSortedKeys
                                        error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"Error: %@", error);
    } else {
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

- (UIViewController *) viewControllerWithWindow:(UIWindow *)window {
    UIWindow *windowToUse = window;
    if(windowToUse == nil) {
        for (UIWindow *windowF in [UIApplication sharedApplication].windows) {
            if (windowF.isKeyWindow) {
                windowToUse = windowF;
                break;
            }
        }
    }
    UIViewController *topViewController = windowToUse.rootViewController;
    while (topViewController.presentingViewController) {
        topViewController = topViewController.presentingViewController;
    }
    return  topViewController;
}

@end
