#import <Flutter/Flutter.h>
#import <RtcAudioEffectCore/RtcAudioEffectKit.h>
#import "BaseEffectCoreImpl.h"

@interface RtcAudioEffectPlugin : NSObject <FlutterPlugin, FlutterStreamHandler>

@property(nonatomic, strong) BaseEffectCoreImpl *baseEffectCoreImp;

@end
