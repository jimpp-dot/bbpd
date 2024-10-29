#import "PulseImPlugin.h"
#import "AmrConverter.h"
#import "PulseImVoiceManager.h"
#import "VoiceWrapper.h"

@interface PulseImPlugin()<FlutterStreamHandler>

@property (nonatomic, strong) VoiceWrapper *voiceWrapper;
@property (nonatomic, strong) FlutterEventSink eventSink;

@end

@implementation PulseImPlugin


- (instancetype)init
{
    self = [super init];
    if (self) {
        _voiceWrapper = [VoiceWrapper new];
    }
    return self;
}

- (void)setEventSink:(FlutterEventSink)eventSink{
    _eventSink = eventSink;
    self.voiceWrapper.eventSink = eventSink;
}

- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events{
    self.eventSink = events;
    
    return nil;
}


- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments{
    self.eventSink = nil;
    return nil;
}


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"ly.plugins.pulse_im"
                                     binaryMessenger:[registrar messenger]];
    PulseImPlugin* instance = [[PulseImPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    
    FlutterEventChannel *stream = [FlutterEventChannel eventChannelWithName:@"ly.plugins.pulse_im.message" binaryMessenger:registrar.messenger];
    [stream setStreamHandler:instance];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
     NSLog(@"调用的方法：%@",call.method);

    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    }else if ([call.method isEqualToString:@"ConverterWavToAmr"]){
        NSString *str = call.arguments;
        if ([str isKindOfClass:[NSString class]] && str.length > 0) {
            NSData *wavData = [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
            NSData *amrData = [AmrConverter xklim_encodeWAVEToAMR:wavData];
            NSString *amrString = [amrData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            result(amrString);
        }else{
            result([FlutterError errorWithCode:@"1" message:@"String Null" details:nil]);
        }
    }else if ([call.method isEqualToString:@"ConverterAmrToWav"]){
        NSString *str = call.arguments;
        if ([str isKindOfClass:[NSString class]] && str.length > 0) {
            NSData *amrData = [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
            NSData *wavData = [AmrConverter xklim_decodeAMRToWAVE:amrData];
            NSString *wavString = [wavData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            result(wavString);
        }else{
            result([FlutterError errorWithCode:@"1" message:@"String Null" details:nil]);
        }
    } else if ([call.method isEqualToString:@"startPlayVoice"]){
        NSString *str = call.arguments;
        if ([str isKindOfClass:[NSString class]] && str.length > 0) {
            [self.voiceWrapper startPlayVoice:call.arguments completion:result];
        } else {
            result([FlutterError errorWithCode:@"1" message:@"String Null" details:nil]);
        }
    } else if ([@"stopPlayVoice" isEqualToString:call.method]){
        [self.voiceWrapper stopPlayVoice:result];
    } else if ([@"canRecordVoice" isEqualToString:call.method]){
        [self.voiceWrapper canRecordVoice:result];
    } else if ([@"startRecordVoice" isEqualToString:call.method]){
        [self.voiceWrapper startRecordVoice:result];
    } else if ([@"finishRecordVoice" isEqualToString:call.method]){
        [self.voiceWrapper finishRecordVoice:result];
    } else if ([@"cancelRecordVoice" isEqualToString:call.method]){
        [self.voiceWrapper cancelRecordVoice:result];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
