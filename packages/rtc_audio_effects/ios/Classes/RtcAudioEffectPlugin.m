#import "RtcAudioEffectPlugin.h"
#import <AuthenticationServices/AuthenticationServices.h>

@implementation RtcAudioEffectPlugin

- (instancetype)init {
    if (self = [super init]) {
        _baseEffectCoreImp = [[BaseEffectCoreImpl alloc] init];
    }
    return self;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"ly.plugins.audio_effect_core"
                                     binaryMessenger:[registrar messenger]];
    RtcAudioEffectPlugin* instance = [[RtcAudioEffectPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
        
    FlutterEventChannel *stream = [FlutterEventChannel eventChannelWithName:@"ly.plugins.audio_effect_event_handler" binaryMessenger:registrar.messenger];
    [stream setStreamHandler:instance];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString *method = call.method;
    SEL selector = NSSelectorFromString([NSString stringWithFormat:@"%@:result:", method]);

    if ([_baseEffectCoreImp respondsToSelector:selector]) {
        NSMethodSignature *methodSignature = [_baseEffectCoreImp.class instanceMethodSignatureForSelector:selector];
    
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
        invocation.target = _baseEffectCoreImp;
        
        invocation.selector = selector;
        [invocation setArgument:&call atIndex:2];
        [invocation setArgument:&result atIndex:3];
        [invocation invoke];
        return;
    }
    
    result(FlutterMethodNotImplemented);
}

#pragma mark Credentials revoked FlutterStreamHandler

- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)eventSink {
    [_baseEffectCoreImp getEventHandler].eventSink = eventSink;
    
    if (@available(iOS 13.0, *)) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onCredentialRevokedNotification:)
                                                     name:ASAuthorizationAppleIDProviderCredentialRevokedNotification
                                                   object:nil];
    }
    
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_baseEffectCoreImp getEventHandler].eventSink = nil;
    
    return nil;
}

- (void)onCredentialRevokedNotification:(NSNotification *)notification API_AVAILABLE(ios(13.0)) {
    if ([_baseEffectCoreImp getEventHandler].eventSink != nil) {
        [_baseEffectCoreImp getEventHandler].eventSink(ASAuthorizationAppleIDProviderCredentialRevokedNotification);
    }
}

@end
