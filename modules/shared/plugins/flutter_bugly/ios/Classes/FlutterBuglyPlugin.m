#import "FlutterBuglyPlugin.h"
#import <Bugly/Bugly.h>

@implementation FlutterBuglyPlugin

+(void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    NSString* appKey = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"BuglyAppKey"];
    if(appKey && [appKey isKindOfClass:[NSString class]] && appKey.length){
        BuglyConfig* config = [[BuglyConfig alloc] init];
        config.reportLogLevel = BuglyLogLevelInfo;
        config.consolelogEnable = NO;
        [Bugly startWithAppId:appKey config:config];
    }
    
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_bugly"
            binaryMessenger:[registrar messenger]];
  FlutterBuglyPlugin* instance = [[FlutterBuglyPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}


- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"reportError" isEqualToString:call.method]) {
      NSDictionary *args = (NSDictionary *)call.arguments;
      [self recordError:[args objectForKey:@"exception"] stackTrace:[args objectForKey:@"stackTrace"]];
      result(nil);
  } else if ([@"setUserId" isEqualToString:call.method]) {
      NSDictionary *args = (NSDictionary *)call.arguments;
      [self setUserId:[args objectForKey:@"userId"]];
      result(nil);
  } else if ([@"infoLog" isEqualToString:call.method]) {
      NSDictionary *args = (NSDictionary *)call.arguments;
      NSString *info = args[@"info"];
      if ([info isKindOfClass:[NSString class]] && info.length > 0) {
          BLYLogInfo(@"%@", info);
      }
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)recordError:(NSString *)exception stackTrace:(NSString *)stackTrace {
    NSString* trace = stackTrace ? stackTrace: @"";
    
    NSArray* stack = [trace componentsSeparatedByString:@"\n"];
    
    NSString *ex = exception ? exception : @"";
    
    [Bugly reportExceptionWithCategory:3
                                  name:@"FlutterException"
                                reason:ex
                             callStack:stack
                             extraInfo:@{}
                          terminateApp:NO];
    [Bugly reportException:[NSException exceptionWithName:ex reason:trace userInfo:nil]];
}

- (void)setUserId:(NSString *)userId {
    NSString* uid = userId ? userId: @"";
    
    [Bugly setUserIdentifier: uid];
}

@end
