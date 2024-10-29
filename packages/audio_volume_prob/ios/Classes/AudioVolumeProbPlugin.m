#import "AudioVolumeProbPlugin.h"
#if __has_include(<audio_volume_prob/audio_volume_prob-Swift.h>)
#import <audio_volume_prob/audio_volume_prob-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "audio_volume_prob-Swift.h"
#endif
@implementation AudioVolumeProbPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [SwiftAudioVolumeProbPlugin registerWithRegistrar:registrar];
}
@end
