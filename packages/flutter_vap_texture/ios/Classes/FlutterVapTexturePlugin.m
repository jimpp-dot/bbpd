#import "FlutterVapTexturePlugin.h"
#import <FlutterVapViewFactory.h>

@implementation FlutterVapTexturePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterVapViewFactory* vapViewFactory =
        [[FlutterVapViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:vapViewFactory withId:@"plugins.flutter.io/vap_view"];
}
@end
