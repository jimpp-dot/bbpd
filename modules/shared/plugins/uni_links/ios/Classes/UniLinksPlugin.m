#import "UniLinksPlugin.h"

static NSString *const kMessagesChannel = @"uni_links/messages";
static NSString *const kEventsChannel = @"uni_links/events";

@interface UniLinksPlugin () <FlutterStreamHandler>
@property(nonatomic, copy) NSString *initialLink;
@property(nonatomic, copy) NSString *latestLink;
@property(nonatomic, copy) NSString *pushData; // 融云推送
@end

@implementation UniLinksPlugin {
  FlutterEventSink _eventSink;
}

static id _instance;

+ (UniLinksPlugin *)sharedInstance {
  if (_instance == nil) {
    _instance = [[UniLinksPlugin alloc] init];
  }
  return _instance;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
  UniLinksPlugin *instance = [UniLinksPlugin sharedInstance];

  FlutterMethodChannel *channel =
      [FlutterMethodChannel methodChannelWithName:kMessagesChannel
                                  binaryMessenger:[registrar messenger]];
  [registrar addMethodCallDelegate:instance channel:channel];

  FlutterEventChannel *chargingChannel =
      [FlutterEventChannel eventChannelWithName:kEventsChannel
                                binaryMessenger:[registrar messenger]];
  [chargingChannel setStreamHandler:instance];

  [registrar addApplicationDelegate:instance];
}

- (void)setLatestLink:(NSString *)latestLink {
  static NSString *key = @"latestLink";

  [self willChangeValueForKey:key];
  _latestLink = [latestLink copy];
  [self didChangeValueForKey:key];

  if (_eventSink) _eventSink(_latestLink);
}

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSURL *url = (NSURL *)launchOptions[UIApplicationLaunchOptionsURLKey];
  self.initialLink = [url absoluteString];
  self.latestLink = self.initialLink;

  // begin: 支持融云离线PUSH跳转
  NSDictionary *remoteNotificationUserInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
  if (remoteNotificationUserInfo) {
      NSString *appData = [remoteNotificationUserInfo objectForKey:@"appData"];
      if (appData) {
          NSLog(@"UniLinksPlugin appData start：%@",appData);

          self.pushData = [[NSString alloc] initWithString:
          [NSString stringWithFormat:@"rong://%@/conversationlist?isFromPush=true&%@",
          [[NSBundle mainBundle] bundleIdentifier], appData]];

          NSLog(@"UniLinksPlugin pushData：%@",self.pushData);
      }
  }
  NSLog(@"UniLinksPlugin remoteNotificationUserInfo：%@",remoteNotificationUserInfo);
  // end: 支持融云离线PUSH跳转

  return YES;
}


- (BOOL)application:(UIApplication*)application
didReceiveRemoteNotification:(NSDictionary*)userInfo
      fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    NSLog(@"UniLinksPlugin appData alive");
    NSLog(@"UniLinksPlugin appData alive userInfo: %@", userInfo);
    NSString *appData = [userInfo objectForKey:@"appData"];
    if (appData) {
        NSLog(@"UniLinksPlugin appData alive：%@",appData);

        self.pushData = [[NSString alloc] initWithString:
        [NSString stringWithFormat:@"rong://%@/conversationlist?isFromPush=true&%@",
        [[NSBundle mainBundle] bundleIdentifier], appData]];

        NSLog(@"UniLinksPlugin pushData：%@",self.pushData);
    }
    return true;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
  self.latestLink = [url absoluteString];
    self.initialLink = self.latestLink;
  return NO;
}

- (BOOL)application:(UIApplication *)application
    continueUserActivity:(NSUserActivity *)userActivity
      restorationHandler:(void (^)(NSArray *_Nullable))restorationHandler {
  if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
    self.latestLink = [userActivity.webpageURL absoluteString];
    if (!_eventSink) {
      self.initialLink = self.latestLink;
    }
  }
  return NO;
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
  if ([@"getInitialLink" isEqualToString:call.method]) {
    // begin: 支持融云离线PUSH跳转
    if (!self.initialLink && self.pushData) {
      NSLog(@"UniLinksPlugin pushData, no initialLink");
      result(self.pushData);
    } else {
      NSLog(@"UniLinksPlugin initialLink");
      result(self.initialLink);
    }
    // end: 支持融云离线PUSH跳转
    // } else if ([@"getLatestLink" isEqualToString:call.method]) {
    //     result(self.latestLink);
  } else if ([@"resetLink" isEqualToString:call.method]) {
    // 增加link重置接口
    self.pushData = nil;
    self.initialLink = nil;
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (FlutterError *_Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(nonnull FlutterEventSink)eventSink {
  _eventSink = eventSink;
  return nil;
}

- (FlutterError *_Nullable)onCancelWithArguments:(id _Nullable)arguments {
  _eventSink = nil;
  return nil;
}

@end
