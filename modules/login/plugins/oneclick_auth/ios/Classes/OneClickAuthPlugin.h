#import <Flutter/Flutter.h>

@interface OneClickAuthPlugin : NSObject <FlutterPlugin>
@property(strong, nonatomic) UIViewController *viewController;
@property(nonatomic, strong) FlutterMethodChannel *channel;
@property(nonatomic, assign) BOOL isChecked;
@end
