//
//  BaseEffectCoreImpl.m
//  base_effect_core
//
//  Created by eagle on 2022/2/22.
//

#import "BaseEffectCoreImpl.h"

@interface BaseEffectCoreImpl ()

@property (nonatomic, strong) BaseEffectCoreEventHandler *eventHandler;

@end

@implementation BaseEffectCoreImpl

- (BaseEffectCoreEventHandler *)getEventHandler {
    return _eventHandler;
}

- (BaseEffectCoreImpl *)init {
    if (self = [super init]) {
        _eventHandler = [[BaseEffectCoreEventHandler alloc] init];
    }
    
    return self;
}

- (void)getPlatformVersion:(FlutterMethodCall *)call result:(FlutterResult)result {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
}

- (void)createEffectCore:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (self.bbEffectCore) {
        [self.bbEffectCore releaseElement];

        self.bbEffectCore.delegate = nil;
        self.bbEffectCore = nil;
    }
    
    self.bbEffectCore = [[RtcAudioEffectKit alloc] init];
    [RtcAudioEffectKit nativeInit:101];
    self.bbEffectCore.delegate = _eventHandler;
    
    result(@(0));
}

- (void)initialize:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    AudioEffectCoreElement element = (AudioEffectCoreElement)[args[@"element"] intValue];
    [self.bbEffectCore initialize:element];
    
    result(@(0));
}

- (void)setAudioKMarkFilePath:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    NSString *path = (NSString *)args[@"path"];
    int pos = [args[@"pos"] intValue];
    [self.bbEffectCore setAudioKMarkFilePath:path pos:pos];
    
    result(@(0));
}

- (void)setMidiFilePath:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    NSString *path = (NSString *)args[@"path"];
    int pos = [args[@"pos"] intValue];
    [self.bbEffectCore setMidiFilePath:path pos:pos];
    
    result(@(0));
}

- (void)setAudioMixingFilePath:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    NSString *path = (NSString *)args[@"path"];
    int pos = [args[@"pos"] intValue];
    [self.bbEffectCore setAudioMixingFilePath:path pos:pos];
    
    result(@(0));
}

- (void)setAudioOutputFilePath:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    NSString *path = (NSString *)args[@"path"];
    [self.bbEffectCore setAudioOutputFilePath:path];
    
    result(@(0));
}

- (void)setAudioRecordFilePath:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    NSString *path = (NSString *)args[@"path"];
    BOOL append = [args[@"append"] boolValue];
    [self.bbEffectCore setAudioRecordFilePath:path append:append];
    
    result(@(0));
}

- (void)setLyricsInfo:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    NSArray *muteArray = args[@"lyricsInfos"];;
    
    BBLyricsInfo *infos = new BBLyricsInfo[muteArray.count];
    for (int i = 0; i < muteArray.count; i++) {
        NSDictionary *dic = muteArray[i];
        
        infos[i].index = i;
        infos[i].beginTimeMs = [dic[@"beginTimeMs"] intValue];
        infos[i].endTimeMs = [dic[@"endTimeMs"] intValue];
    }
    
    [self.bbEffectCore setLyricsInfo:infos size:(int)muteArray.count];
    delete [] infos;
    
    result(@(0));
}

- (void)pushAudioDataMark:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    int sampleRate = [args[@"sampleRate"] intValue];
    int samples = [args[@"samples"] intValue];
    int channels = [args[@"channels"] intValue];
    
    FlutterStandardTypedData *data = args[@"data"];
    
    if (sampleRate + samples + channels > 0) {
        [self.bbEffectCore pushAudioDataMark:(int16_t *
                                                        )[data.data bytes] sampleRate:sampleRate samples:samples channels:channels];
        result(@(0));
    } else {
        result(@(-1));
    }
}

- (void)getKMarkResult:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    result(@([self.bbEffectCore getKMarkResult]));
}

- (void)enableInEarMonitoring:(FlutterMethodCall *)call result:(FlutterResult)result {
    if(!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    BOOL enabled = [args[@"enabled"] boolValue];
    [self.bbEffectCore enableInEarMonitoring:enabled];
    
    result(@(0));
}

- (void)setAudioEffectPreset:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    AudioEffectPreset preset = (AudioEffectPreset)[args[@"preset"] intValue];
    if (preset >= 0) {
        [self.bbEffectCore setAudioEffectPreset:preset];
        result(@(0));
    }else{
        result(@(-1));
    }
}

- (void)setAudioProfile:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    AudioProfile profile = (AudioProfile)[args[@"profile"] intValue];
    if (profile >= 0) {
        [self.bbEffectCore setAudioProfile:profile];
        result(@(0));
    }else{
        result(@(-1));
    }
}

- (void)start:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    [self.bbEffectCore start];
    
    result(@(0));
}

- (void)stop:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    [self.bbEffectCore stop];
    
    result(@(0));
}

- (void)resume:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    [self.bbEffectCore resume];
    
    result(@(0));
}

- (void)pause:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    [self.bbEffectCore pause];
    
    result(@(0));
}

- (void)release:(FlutterMethodCall *)call result:(FlutterResult)result {
    [self.bbEffectCore releaseElement];
    
    self.bbEffectCore.delegate = nil;
    self.bbEffectCore = nil;
    
    result(@(0));
}

- (void)adjustAudioMixingVolume:(FlutterMethodCall *)call result:(FlutterResult)result { 
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    int volume = [args[@"volume"] intValue];
    if (volume >= 0) {
        [self.bbEffectCore adjustAudioMixingVolume:volume];
        result(@(0));
    }else{
        result(@(-1));
    }
}

- (void)adjustRecordingSignalVolume:(FlutterMethodCall *)call result:(FlutterResult)result { 
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    int volume = [args[@"volume"] intValue];
    if (volume >= 0) {
        [self.bbEffectCore adjustRecordingSignalVolume:volume];
        result(@(0));
    }else{
        result(@(-1));
    }
}

- (void)setLocalVoicePitch:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    double pitch = [args[@"pitch"] doubleValue];
    [self.bbEffectCore setLocalVoicePitch:pitch];
    
    result(@(0));
}

- (void)setAudioMixingPitch:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    int pitch = [args[@"pitch"] intValue];
    [self.bbEffectCore setAudioMixingPitch:pitch];
    
    result(@(0));
}

- (void)setAudioMixingPosition:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    int pos = [args[@"pos"] intValue];
    [self.bbEffectCore setAudioMixingPosition:pos];
    
    result(@(0));
}

- (void)getAudioMixingDuration:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    int res = [self.bbEffectCore getAudioMixingDuration];
    
    result(@(res));
}

- (void)getAudioMixingCurrentPosition:(FlutterMethodCall *)call result:(FlutterResult)result { 
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    int res = [self.bbEffectCore getAudioMixingCurrentPosition];

    result(@(res));
}

- (void)getAudioRouteType:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    int res = [self.bbEffectCore getAudioRouteType];
    
    result(@(res));
}

- (void)setOriginalFilePath:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    NSString *path = (NSString *)args[@"path"];
    int pos = [args[@"pos"] intValue];
    [self.bbEffectCore setOriginalFilePath:path pos:pos];
    
    result(@(0));
}

- (void)switchAccompany:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    SoundId soundId = (SoundId)[args[@"soundId"] intValue];
    [self.bbEffectCore switchAccompany:soundId];
    
    result(@(0));
}

- (void)setTolerance:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    float tolerance = [args[@"tolerance"] floatValue];
    [self.bbEffectCore setTolerance:tolerance];
    
    result(@(0));
}

- (void)setNoiseLevel:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    AudioEffectNoiseLevel level = (AudioEffectNoiseLevel)[args[@"level"] intValue];
    [self.bbEffectCore setNoiseLevel:level];
    
    result(@(0));
}

- (void)setInEarMonitoringVolume:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    int volume = [args[@"volume"] intValue];
    [self.bbEffectCore setInEarMonitoringVolume:volume];
    
    result(@(0));
}

- (void)adjustPlaybackSignalVolume:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    int volume = [args[@"volume"] intValue];
    [self.bbEffectCore adjustPlaybackSignalVolume:volume];
    
    result(@(0));
}

- (void)set3AType:(FlutterMethodCall *)call result:(FlutterResult)result {
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    Voice3AType type = (Voice3AType)[args[@"type"] intValue];
    [self.bbEffectCore set3AType:type];
    
    result(@(0));
}
-(void)getAudioDelay:(FlutterMethodCall*)call result:(FlutterResult)result{
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }

    int delay = [self.bbEffectCore getAudioDelay];
    
    result(@(delay));
}
-(void)setIndicationInterval:(FlutterMethodCall*)call result:(FlutterResult)result{
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    int interval = [args[@"interval"] intValue];
    [self.bbEffectCore setIndicationInterval:interval];
    
    result(@(0));
}
-(void)getRecordDuration:(FlutterMethodCall*)call result:(FlutterResult)result{
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    int duration = [self.bbEffectCore getRecordDuration];
    result(@(duration));
}
-(void)setParameters:(FlutterMethodCall*)call result:(FlutterResult)result{
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    NSString* parameters = args[@"parameters"];
    [self.bbEffectCore setParameters:parameters];
    
    result(@(0));
}
-(void)getParameters:(FlutterMethodCall*)call result:(FlutterResult)result{
   if (!self.bbEffectCore) {
        result(@"");
        return;
    }
    
    NSDictionary *args = call.arguments;
    NSString* key = args[@"key"];
    NSString* ret = [self.bbEffectCore getParameters:key];
    
    result(ret);
}

- (void)setAudioFileDecode:(FlutterMethodCall*)call result:(FlutterResult)result{
    if (!self.bbEffectCore) {
        result(@(0));
        return;
    }
    
    NSDictionary *args = call.arguments;
    NSString* inFile = args[@"inFile"];
    NSString* outFile = args[@"outFile"];
    int sampleRate = [args[@"sampleRate"] intValue];
    int channels = [args[@"channels"] intValue];
    int ret = [self.bbEffectCore setAudioFileDecode:inFile outFile:outFile outSampleRate:sampleRate outChannels:channels];
    
    result(@(ret));
}

- (void)setTunerMode:(FlutterMethodCall*)call result:(FlutterResult)result{
   if (!self.bbEffectCore) {
        result(@(0));
        return;
    }

    NSDictionary *args = call.arguments;
    int mode = [args[@"mode"] intValue];
    [self.bbEffectCore setTunerMode:(AudioEffectTunerMode)mode];

    result(@(0));
}
@end
