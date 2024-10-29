#import "FltPushPlugin.h"

@interface FltPushPlugin()<FlutterStreamHandler>
@property(nonatomic, strong) FlutterEventSink eventSink;
@property(nonatomic, strong) NSString *deviceToken;

@end

@implementation FltPushPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"ly.plugins.flt_push"
            binaryMessenger:[registrar messenger]];
  FltPushPlugin* instance = [[FltPushPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    [registrar addApplicationDelegate:instance];
    
    FlutterEventChannel *stream = [FlutterEventChannel eventChannelWithName:@"ly.plugins.flt_push.event_channel" binaryMessenger:registrar.messenger];
    [stream setStreamHandler:instance];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getTokenInfo" isEqualToString:call.method]) {
      NSMutableDictionary *dict = [NSMutableDictionary dictionary];
      [dict setValue:self.deviceToken forKey:@"token"];
      [dict setValue:@"ios" forKey:@"vendor"];
      [dict setValue:@"ios" forKey:@"client_type"];
      result(dict);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

#pragma mark - FlutterStreamHandler

- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events{
    self.eventSink = events;
    if (self.deviceToken) {
        [self sendToken:self.deviceToken];
//        self.deviceToken = nil;
    }
    
    return nil;
}


- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments{
    self.eventSink = nil;
    
    return nil;
}

- (void)sendToken:(NSString *)token {
    if (token == nil) {
        return;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSMutableDictionary *content = [NSMutableDictionary dictionary];
    [content setValue:token forKey:@"token"];
    [content setValue:@"ios" forKey:@"vendor"];
    [content setValue:@"ios" forKey:@"client_type"];
    [dict setValue:@"EVENT_PUSH_REGISTERED" forKey:@"type"];
    [dict setValue:content forKey:@"message"];
    self.eventSink(dict);
}

#pragma mark - Application LifeCyle Delegate

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    //首次注册push在AppDelegate.m里面，非首次注册push在此处触发
    if([[UIApplication sharedApplication] isRegisteredForRemoteNotifications] == YES){
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    return YES;
}

// 注册远程通知成功后，会调用这个方法，把 deviceToken 返回给我
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    if (![deviceToken isKindOfClass:[NSData class]]) return;
    const unsigned *tokenBytes = (const unsigned *)[deviceToken bytes];
    NSString *token = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
                          ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
                          ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
                          ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
    
    if (self.eventSink) {
        [self sendToken:token];
    } else {
        self.deviceToken = token;
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    if(error) NSLog(@"%@", [error localizedDescription]);
}


@end
