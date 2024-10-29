#import "SharedAppPlugin.h"
#import "sbox.h"
#import <AdServices/AdServices.h>
#import <sys/utsname.h>
#import <AdSupport/AdSupport.h>
#import <WebKit/WebKit.h>
#import <UICKeyChainStore/UICKeyChainStore.h>
#include <mach/mach.h>
#import <os/proc.h>


@implementation SharedAppPlugin
{
    WKWebView *webView;
}

static NSString* sStartFrom;

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"ly.plugins.shared_app_plugin"
                                     binaryMessenger:[registrar messenger]];
    SharedAppPlugin* instance = [[SharedAppPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

/// 获取当前app占用内存量
- (NSString *)memoryUsage {
    NSString *usage = @"";
    int multiplyFactor = 0;
    NSArray *tokens = [NSArray arrayWithObjects:@"bytes",@"KB",@"MB",@"GB",@"TB",@"PB", @"EB", @"ZB", @"YB",nil];
    
    int64_t memoryUsageInByte = 0;
    task_vm_info_data_t vmInfo;
    mach_msg_type_number_t count = TASK_VM_INFO_COUNT;
    kern_return_t kernelReturn = task_info(mach_task_self(), TASK_VM_INFO, (task_info_t) &vmInfo, &count);
    if(kernelReturn == KERN_SUCCESS) {
        memoryUsageInByte = (int64_t) vmInfo.phys_footprint;
    
        while (memoryUsageInByte > 1024) {
            memoryUsageInByte /= 1024;
            multiplyFactor++;
        }


        usage = [NSString stringWithFormat:@"%4.2lld %@",memoryUsageInByte, [tokens objectAtIndex:multiplyFactor]];
        
        
        //NSLog(@"Memory in use (in bytes): %lld", memoryUsageInByte);
    } else {
        //NSLog(@"Error with task_info(): %s", mach_error_string(kernelReturn));
    }
    return usage;
}


/// 设备总内存
- (NSInteger)totalMemoryForDevice {
    return (NSInteger)([NSProcessInfo processInfo].physicalMemory/1024/1024);
}


+ (void)setStartFrom:(NSString *)startFrom {
    sStartFrom = startFrom;
}

- (NSString *)_getAppId:(FlutterMethodCall *)call
{
    NSString *appId = nil;
    NSArray *list = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleURLTypes"];
    for (NSDictionary *item in list) {
        NSString *name = item[@"CFBundleURLName"];
        if ([name isEqualToString:@"weixin"]) {
            NSArray *schemes = item[@"CFBundleURLSchemes"];
            if (schemes.count > 0) {
                appId = schemes[0];
                break;
            }
        }
    }
    
    return appId;
}

- (NSString*) deviceId
{
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine
                                    encoding:NSUTF8StringEncoding];
}

- (NSString *)identifierForVendor
{
    NSString* idfv = nil;

    NSString* bundleId = [[NSBundle mainBundle] bundleIdentifier];
    if(bundleId && bundleId.length){

        NSString* service = [NSString stringWithFormat:@"%@.idfv", bundleId];
        UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:service];
        keychain.synchronizable = NO;

        idfv = [keychain stringForKey:@"identifierForVendor"];
        if(!idfv || !idfv.length){
            idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            [keychain setString:idfv forKey:@"identifierForVendor"];
        }
    }else{
        idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }

    return idfv;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if ([@"gotoAppStoreDetailPage" isEqualToString:call.method]) {
        NSString* appId = call.arguments;
        NSString* appStoreUrl;
        appStoreUrl = [@"itms-apps://itunes.apple.com/app/id" stringByAppendingString:appId];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:appStoreUrl]];
    } else if ([@"exitApplication" isEqualToString:call.method]) {
        exit(0);
    } else if ([@"hFunc" isEqualToString:call.method]) {
        SBox * box = [SBox new];
        NSString *text = [self stringFromArguments:call.arguments key:@"text"];
        NSString* strFromOC = [box hFunc: text];
        result(strFromOC);
    } else if ([@"decrypt" isEqualToString:call.method]) {
        SBox * box = [SBox new];
        NSString *text = [self stringFromArguments:call.arguments key:@"text"];
        NSString* strFromOC = [box decrypt: text];
        result(strFromOC);
    } else if ([@"getAppId" isEqualToString:call.method]) {
        result([self _getAppId:call]);
    }  else if ([@"areNotificationEnabled" isEqualToString:call.method]) {
        BOOL isEnable = YES;
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        isEnable = (UIUserNotificationTypeNone == setting.types) ? NO : YES;
        result(@(isEnable));
    } else if ([@"openNotificationSettings" isEqualToString:call.method]) {
        UIApplication *application = [UIApplication sharedApplication];
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [application openURL:url];
        result(nil);
    } else if ([@"getApplicationStartFrom" isEqualToString:call.method]) {
        result(sStartFrom);
    } else if ([@"getIosASAToken" isEqualToString:call.method]) {
        if (TARGET_IPHONE_SIMULATOR) {
            result(@"");
        }else{
            if (@available(iOS 14.3, *)) {
                NSError *error;
                NSString *token = [AAAttribution attributionTokenWithError:&error];
                if (token != nil) {
                    result(token);
                }else{
                    result(@"");
                }
            }else{
                result(@"");
            }
        }
    } else if ([@"getAppState" isEqualToString:call.method]) {
        NSDictionary* map = @{
                              @(UIApplicationStateActive) : @"active",
                              @(UIApplicationStateInactive) : @"inactive",
                              @(UIApplicationStateBackground) : @"background"
                              };
        NSString* res = map[@(UIApplication.sharedApplication.applicationState)];
        result(res ? res : @"unknow");
    } else if ([@"getLocale" isEqualToString:call.method]){
        NSString* countryCode = [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
        countryCode = countryCode ? countryCode : @"";
        NSString* lanCode = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
        lanCode = lanCode ? lanCode : @"";
        NSDictionary* map = @{
                              @"countryCode": countryCode,
                              @"languageCode": lanCode,
                              };
        result(map);
    } else if ([@"getDeviceId" isEqualToString:call.method]) {
        result(self.deviceId);
    } else if ([@"getIdfa" isEqualToString:call.method]) {
        result([ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString);
    }  else if ([@"getMacAddress" isEqualToString:call.method]) {
        result([self identifierForVendor]);
    } else if ([@"getUserAgent" isEqualToString:call.method]) {
        __weak typeof(self) weakSelf = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                __strong typeof(self) strongSelf = weakSelf;
                FlutterResult __result = result;
                if (strongSelf) {
                    // Save WKWebView (it might deallocate before we ask for user Agent)
                    strongSelf->webView = [[WKWebView alloc] init];

                    [strongSelf->webView evaluateJavaScript:@"window.navigator.userAgent;" completionHandler:^(id _Nullable result, NSError * _Nullable error) {

                        NSString* userAgent = @"unknow";
                        if (error) {

                        }else{
                            userAgent = [NSString stringWithFormat:@"%@", result];
                        }

                        // Destroy the WKWebView after task is complete
                        strongSelf->webView = nil;

                        __result(userAgent);
                    }];
                }
            });
    } else if([@"memoryUsage" isEqualToString:call.method]) {
        result(self.memoryUsage);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

#pragma mark - helper
- (NSString *)stringFromArguments:(NSDictionary *)arguments key:(NSString *)key {
    if (![arguments isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSString *value = [arguments valueForKey:key];
    if (![value isKindOfClass:[NSString class]]) {
        return nil;
    } else {
        return value;
    }
}

@end
