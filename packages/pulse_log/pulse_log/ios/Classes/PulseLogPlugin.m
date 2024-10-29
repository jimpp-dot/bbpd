#import "PulseLogPlugin.h"
#import "PulseLogStreamHandler.h"

@implementation PulseLogPlugin{
  PulseLogStreamHandler *_streamHandler;
  NSString *_crashLog;
}

- (instancetype)initWithMessenger:(nonnull NSObject<FlutterBinaryMessenger> *)messenger {
  self = [super init];
  if (self) {
    _streamHandler = [PulseLogStreamHandler share];
    FlutterEventChannel* _eventChannel = [FlutterEventChannel eventChannelWithName:@"ly.plugins.pulse_log.event" binaryMessenger:messenger];
    [_eventChannel setStreamHandler:_streamHandler];    
  }
  return self;
}


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  id<FlutterBinaryMessenger> messenger = [registrar messenger];
  FlutterMethodChannel* channel = [FlutterMethodChannel
                                   methodChannelWithName:@"ly.plugins.pulse_log"
                                   binaryMessenger:messenger];
  PulseLogPlugin* instance = [[PulseLogPlugin alloc] initWithMessenger:messenger];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
