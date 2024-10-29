#import <Flutter/Flutter.h>

@interface SharedAppPlugin : NSObject <FlutterPlugin>

+ (void)setStartFrom:(NSString *)startFrom;

@end
