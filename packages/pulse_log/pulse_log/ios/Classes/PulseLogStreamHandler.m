//
//  BaseLogStreamHandler.m
//  AFNetworking
//
//  Created by ChenQiang on 2022/7/11.
//

#import "PulseLogStreamHandler.h"

@implementation PulseLogStreamHandler{
    FlutterEventSink _eventSink;
}

+(PulseLogStreamHandler *)share {
    static PulseLogStreamHandler *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[PulseLogStreamHandler alloc] init];
    });
    return shareManager;
}

- (FlutterError * _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    _eventSink = nil;
    return nil;
}

- (FlutterError * _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(nonnull FlutterEventSink)events {
    _eventSink = events;

  [[NSNotificationCenter defaultCenter] postNotificationName:@"haveSink" object:nil];
    return nil;
}

- (void)sendObject:(NSString *)type data:(NSString *)data{
    if(data == nil) return;
    
    NSDictionary *message = @{@"event":type,@"data":data};
    if(!_eventSink || !data || data.length == 0) {
        return;
    }
    _eventSink(message);
}

- (BOOL)canSend{
  return _eventSink != nil;
}

@end

