#import <libkern/OSAtomic.h>
#import <stdatomic.h>
#import "VapPlayerPlugin.h"
#import <FlutterVapTexture.h>
#import "Models/CommonQGVAPConfigModel.h"
#import "Models/CommonQGMP4AnimatedImageFrame.h"

@interface VapPlayerPlugin ()
@property (nonatomic, strong) NSObject<FlutterPluginRegistrar> *registrar;
@property (nonatomic, strong) FlutterMethodChannel *channel;
@property (readonly, nonatomic) NSMutableDictionary *vapPlayers;
@end

@implementation VapPlayerPlugin

- (instancetype) initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar{
    if (self = [super init]) {
        _registrar = registrar;
        _vapPlayers = [[NSMutableDictionary alloc] init];
    }
    return self;
}


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"ly.plugins.vap_player" binaryMessenger:[registrar messenger]];
    VapPlayerPlugin *instance = [[VapPlayerPlugin alloc] initWithRegistrar:registrar];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result
{
    NSLog(@"onMethodCall:%@ call.arguments:%@",call.method, call.arguments);
    NSInteger textureId = -1;
    NSDictionary *arguments = call.arguments;
    if (arguments[@"textureId"] && ![arguments[@"textureId"] isKindOfClass:[NSNull class]]) {
        textureId = [call.arguments[@"textureId"] intValue];
    }
    NSLog(@"_vapPlayers %@:  %@",_vapPlayers, @(textureId));
    if ([call.method isEqualToString:@"create"]) {
        FlutterVapTexture *vapPlayer = [[FlutterVapTexture alloc] initWithRegistrar:self.registrar];
        vapPlayer.textureId = [self.registrar.textures registerTexture:vapPlayer];
        if ([_vapPlayers.allKeys containsObject:@(vapPlayer.textureId)]) {
            [_vapPlayers removeObjectForKey:@(vapPlayer.textureId)];
        }
        [_vapPlayers setObject:vapPlayer forKey:@(vapPlayer.textureId)];
        [vapPlayer onMethodCall:call result:result];
        return;
    } else if ([call.method isEqualToString:@"dispose"]) {
        FlutterVapTexture *vapPlayer = _vapPlayers[@(textureId)];
        [vapPlayer onMethodCall:call result:result];
        [_vapPlayers removeObjectForKey:@(textureId)];
    } else {
        result(FlutterMethodNotImplemented);
    }
    NSLog(@"_vapPlayers %@",_vapPlayers);
}

@end
