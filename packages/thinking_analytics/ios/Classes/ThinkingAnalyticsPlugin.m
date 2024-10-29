#import "ThinkingAnalyticsPlugin.h"
#import <ThinkingSDK/ThinkingSDK.h>

static NSInteger const TYPE_BIZ = 0;
static NSInteger const TYPE_MONITOR = 1;
static NSString *const TYPE_KEY = @"trackerType";

@interface ThinkingAnalyticsPlugin ()

@property(nonatomic, strong) ThinkingAnalyticsSDK *bizSDK;
@property(nonatomic, strong) ThinkingAnalyticsSDK *monitorSDK;
@property(nonatomic, strong) ThinkingAnalyticsSDK *currentSDK;

- (void)choseSDK:(NSInteger)type;

@end

@implementation ThinkingAnalyticsPlugin
- (void)choseSDK:(NSInteger)type {
    _currentSDK = type == TYPE_MONITOR ? _monitorSDK : _bizSDK;
}

+ (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [[FlutterMethodChannel alloc]
            initWithName:@"ly.plugins.thinking_analytics"
         binaryMessenger:[registrar messenger]
                   codec:[FlutterStandardMethodCodec sharedInstance]
               taskQueue:[[registrar messenger] makeBackgroundTaskQueue]];
    ThinkingAnalyticsPlugin *instance = [[ThinkingAnalyticsPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"version" isEqualToString:call.method]) {
        result(ThinkingAnalyticsSDK.getSDKVersion);
    } else if ([@"init" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        NSString *appId = args[@"appId"];
        NSString *serverUrl = args[@"serverUrl"];
        NSString *monitorAppId = args[@"monitorAppId"];
        NSString *monitorServerUrl = args[@"monitorServerUrl"];
        NSNumber *debug = args[@"debug"];
        if (debug.integerValue == 1) {
            [ThinkingAnalyticsSDK setLogLevel:TDLoggingLevelInfo];
        }
        if (appId == nil || appId == (NSString * )[NSNull null] || serverUrl == nil || serverUrl == (NSString * )
        [NSNull null]) {
            result(@NO);
        } else {
            NSString *groupKey = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"group_key"];
            if (groupKey != nil && [groupKey isKindOfClass:[NSString class]]) {
                NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:groupKey];
                [defaults setObject:appId forKey:@"tracker_id"];
                [defaults setObject:serverUrl forKey:@"tracker_server_url"];
                [defaults synchronize];
            }
            _bizSDK = [ThinkingAnalyticsSDK startWithAppId:appId withUrl:serverUrl];
            [self choseSDK:TYPE_BIZ];
            if (monitorAppId != nil && monitorAppId != (NSString * )[NSNull null]) {
                if (monitorServerUrl == nil || monitorServerUrl == (NSString * )[NSNull null]) {
                    monitorServerUrl = serverUrl;
                }
                _monitorSDK = [ThinkingAnalyticsSDK startWithAppId:monitorAppId withUrl:monitorServerUrl];
            }
            result(@YES);
        }
    } else if ([@"initMonitor" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        NSString *monitorAppId = args[@"monitorAppId"];
        NSString *monitorServerUrl = args[@"monitorServerUrl"];
        NSNumber *debug = args[@"debug"];
        if (debug.integerValue == 1) {
            [ThinkingAnalyticsSDK setLogLevel:TDLoggingLevelInfo];
        }
        if (monitorAppId == nil || monitorAppId == (NSString * )
            [NSNull null] || monitorServerUrl == nil || monitorServerUrl == (NSString * )
        [NSNull null]) {
            result(@NO);
        } else {
            _monitorSDK = [ThinkingAnalyticsSDK startWithAppId:monitorAppId withUrl:monitorServerUrl];
            result(@YES);
        }
    } else if ([@"track" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        NSString *eventName = args[@"eventName"];
        NSDictionary *properties = args[@"properties"];
        NSString *time = args[@"time"];
        NSString *zone = args[@"timeZone"];
        NSNumber *type = args[TYPE_KEY];
        [self choseSDK:type.integerValue];

        if (time == nil || [time isKindOfClass:[NSNull class]]) {
            [_currentSDK track:eventName properties:properties];
        } else {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSS";
            dateFormatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDate *timeDate = [dateFormatter dateFromString:time];
            NSTimeZone *timeZone;
            if (zone != nil && ![zone isKindOfClass:[NSNull class]]) {
                timeZone = [NSTimeZone timeZoneWithAbbreviation:zone];
            } else {
                timeZone = [NSTimeZone systemTimeZone];
            }

            [_currentSDK track:eventName properties:properties time:timeDate timeZone:timeZone];
        }
        result(@YES);
    } else if ([@"timeEvent" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        NSString *eventName = args[@"name"];
        NSNumber *type = args[TYPE_KEY];
        [self choseSDK:type.integerValue];
        if (eventName != nil) {
            [_currentSDK timeEvent:eventName];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([@"setSuperProperties" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        NSDictionary *properties = args[@"properties"];
        NSNumber *type = args[TYPE_KEY];
        [self choseSDK:type.integerValue];

        if (args != nil) {
            [_currentSDK setSuperProperties:properties];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([@"getSuperProperties" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        NSNumber *type = args[TYPE_KEY];
        [self choseSDK:type.integerValue];

        result([_currentSDK currentSuperProperties]);
    } else if ([@"unsetSuperProperty" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        NSString *propertyName = args[@"propertyName"];
        NSNumber *type = args[TYPE_KEY];
        [self choseSDK:type.integerValue];
        if ([propertyName isKindOfClass:NSString.class]) {
            [_currentSDK unsetSuperProperty:call.arguments];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([@"clearSuperProperties" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        NSNumber *type = args[TYPE_KEY];
        [self choseSDK:type.integerValue];
        [_currentSDK clearSuperProperties];
        result(nil);
    } else if ([@"setDynamicSuperPropertiesTracker" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        NSDictionary *properties = args[@"properties"];
        NSNumber *type = args[TYPE_KEY];
        [self choseSDK:type.integerValue];
        if (properties != nil) {
            [_currentSDK registerDynamicSuperProperties:^
            NSDictionary < NSString * , id > *_Nonnull
            {
                return call.arguments;
            }];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([@"identify" isEqualToString:call.method]) {
        if ([[call arguments] isKindOfClass:NSString.class]) {
            [_bizSDK identify:call.arguments];
            [_monitorSDK identify:call.arguments];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([@"getDistinctId" isEqualToString:call.method]) {
        result([[ThinkingAnalyticsSDK sharedInstance] getDistinctId]);
    } else if ([@"login" isEqualToString:call.method]) {
        if ([[call arguments] isKindOfClass:NSString.class]) {
            NSString* uid = call.arguments;
            [_bizSDK login:uid];
            [_monitorSDK login:uid];
            NSString *groupKey = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"group_key"];
            if (groupKey != nil && [groupKey isKindOfClass:[NSString class]]) {
                NSUserDefaults* defaults = [[NSUserDefaults alloc] initWithSuiteName:groupKey];
                [defaults setObject:uid forKey:@"tracker_uid"];
                [defaults synchronize];
            }
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([@"logout" isEqualToString:call.method]) {
        [_bizSDK logout];
        [_monitorSDK logout];

        NSString *groupKey = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"group_key"];
        if (groupKey != nil && [groupKey isKindOfClass:[NSString class]]) {
            NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:groupKey];
            [defaults removeObjectForKey:@"tracker_uid"];
            [defaults synchronize];
        }
        result(nil);
    } else if ([@"user_set" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        if (args != nil) {
            [_bizSDK user_set:args];
            [_monitorSDK user_set:args];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([@"user_setOnce" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        if (args != nil) {
            [_bizSDK user_setOnce:args];
            [_monitorSDK user_setOnce:args];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([@"user_add" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        if (args != nil) {
            [_bizSDK user_add:args];
            [_monitorSDK user_add:args];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([@"user_unset" isEqualToString:call.method]) {
        NSString *key = call.arguments;
        if (key != nil) {
            [_bizSDK user_unset:key];
            [_monitorSDK user_unset:key];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([@"enableTrackLog" isEqualToString:call.method]) {
        BOOL enable = [call.arguments boolValue];
        [ThinkingAnalyticsSDK setLogLevel:enable ? TDLoggingLevelDebug : TDLoggingLevelNone];
        result(@YES);
    } else if ([@"enableTracking" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        bool enable = [args[@"enable"] boolValue];
        NSNumber *type = args[TYPE_KEY];
        [self choseSDK:type.integerValue];

        [_currentSDK enableTracking:enable];
        result(@YES);

    } else if ([@"enableAutoTrack" isEqualToString:call.method]) {
        [_bizSDK enableAutoTrack:ThinkingAnalyticsEventTypeAppInstall | ThinkingAnalyticsEventTypeAppStart |
                                 ThinkingAnalyticsEventTypeAppEnd];
        result(nil);
    } else if ([@"flush" isEqualToString:call.method]) {
        NSNumber *type = call.arguments;
        [self choseSDK:type.integerValue];
        [_currentSDK flush];
        result(@YES);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
