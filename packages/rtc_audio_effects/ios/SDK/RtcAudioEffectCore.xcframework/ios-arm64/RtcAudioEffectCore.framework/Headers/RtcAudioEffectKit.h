//
//  BBAudioEffectKit.h
//  sources
//
//  Created by lsp on 2022/1/27.
//  Copyright © 2022 banban. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Audio profile. */
typedef NS_ENUM(NSInteger, AudioProfile) {
  /** Default audio profile.  */
  AudioProfileDefault = 0,
  /** A sample rate of 32 KHz, audio encoding, mono, and a bitrate of up to 18 Kbps. */
  AudioProfileSpeechStandard = 1,
  /** A sample rate of 48 KHz, music encoding, mono, and a bitrate of up to 48 Kbps. */
  AudioProfileMusicStandard = 2,
  /** A sample rate of 48 KHz, music encoding, stereo, and a bitrate of up to 56 Kbps. */
  AudioProfileMusicStandardStereo = 3,
  /** A sample rate of 48 KHz, music encoding, mono, and a bitrate of up to 128 Kbps. */
  AudioProfileMusicHighQuality = 4,
  /** A sample rate of 48 KHz, music encoding, stereo, and a bitrate of up to 192 Kbps. */
  AudioProfileMusicHighQualityStereo = 5,
};

/** Audio equalization band frequency. */
typedef NS_ENUM(NSInteger, AudioEqualizationbandFrequency) {
  /** 31 Hz. */
  AudioEqualizationband31 = 0,
  /** 62 Hz. */
  AudioEqualizationband62 = 1,
  /** 125 Hz. */
  AudioEqualizationband125 = 2,
  /** 250 Hz. */
  AudioEqualizationband250 = 3,
  /** 500 Hz */
  AudioEqualizationband500 = 4,
  /** 1 kHz. */
  AudioEqualizationband1K = 5,
  /** 2 kHz. */
  AudioEqualizationband2K = 6,
  /** 4 kHz. */
  AudioEqualizationband4K = 7,
  /** 8 kHz. */
  AudioEqualizationband8K = 8,
  /** 16 kHz. */
  AudioEqualizationband16K = 9,
};

typedef NS_ENUM(NSInteger, VoiceBeautifierPreset) {
  VoiceBeautifierOff = 0x00000000,
  ChatBeautifierMagnetic = 0x01010100,
  ChatBeautifierFresh = 0x01010200,
  ChatBeautifierVitality = 0x01010300,
  SingingBeautifier = 0x01020100,
  TimbreTransformationVigorous = 0x01030100,
  TimbreTransformationDeep = 0x01030200,
  TimbreTransformationMellow = 0x01030300,
  TimbreTransformationFalsetto = 0x01030400,
  TimbreTransformationFull = 0x01030500,
  TimbreTransformationClear = 0x01030600,
  TimbreTransformationResounding = 0x01030700,
  TimbreTransformationRinging = 0x01030800,
};

typedef NS_ENUM(NSInteger, AudioEffectPreset) {
  AudioEffectOff = 0x00000000,
  RoomAcousticsKTV = 0x02010100,
  RoomAcousticsVocalConcert = 0x02010200,
  RoomAcousticsStudio = 0x02010300,
  RoomAcousticsPhonograph = 0x02010400,
  RoomAcousticsVirtualStereo = 0x02010500,
  RoomAcousticsSpacial = 0x02010600,
  RoomAcousticsEthereal = 0x02010700,
  RoomAcoustics3DVoice = 0x02010800,
  RoomAcousticsVigorous = 0x02010900,
  RoomAcousticsVigorous2 = 0x02010A00,
  RoomAcousticsBright = 0x02010B00,
  RoomAcousticsIdeal = 0x02010C00,
  RoomAcousticsIdeal2 = 0x02010D00,
  VoiceChangerEffectUncle = 0x02020100,
  VoiceChangerEffectOldMan = 0x02020200,
  VoiceChangerEffectBoy = 0x02020300,
  VoiceChangerEffectSister = 0x02020400,
  VoiceChangerEffectGirl = 0x02020500,
  VoiceChangerEffectPigKing = 0x02020600,
  VoiceChangerEffectHulk = 0x02020700,
  VoiceChangerEffectOldWoman = 0x02020800,
  VoiceChangerEffectMinions = 0x02020900,
  VoiceChangerEffectRobot = 0x02020A00,
  VoiceChangerEffectRobot2 = 0x02020B00,
  VoiceChangerEffectElectro = 0x02020C00,
  StyleTransformationRnB = 0x02030100,
  StyleTransformationPopular = 0x02030200,
  StyleTransformationHiphop = 0x02030300,
  StyleTransformationMetal = 0x02030400,
  StyleTransformationFolk = 0x02030500,
  StyleTransformationRock = 0x02030600,
  PitchCorrection = 0x02040100
};

/** Audio reverberation type. */
typedef NS_ENUM(NSInteger, AudioReverbType) {
  /** The level of the dry signal (dB). The value ranges between -20 and 10. */
  AudioReverbDryLevel = 0,
  /** The level of the early reflection signal (wet signal) in dB. The value ranges between -20
     and 10. */
  AudioReverbWetLevel = 1,
  /** The room size of the reverberation. A larger room size means a stronger reverberation. The
     value ranges between 0 and 100. */
  AudioReverbRoomSize = 2,
  /** The length of the initial delay of the wet signal (ms). The value ranges between 0 and 200. */
  AudioReverbWetDelay = 3,
  /** The reverberation strength. The value ranges between 0 and 100. */
  AudioReverbStrength = 4,
};

/** The preset audio voice configuration used to change the voice effect. */
typedef NS_ENUM(NSInteger, VoiceChanger) {
  /** The original voice (no local voice change). */
  VoiceChangerOff = 0,
  /** An old man's voice. */
  VoiceChangerOldMan = 1,
  /** A little boy's voice. */
  VoiceChangerBabyBoy = 2,
  /** A little girl's voice. */
  VoiceChangerBabyGirl = 3,
  /** The voice of a growling bear. */
  VoiceChangerZhuBaJie = 4,
  /** Ethereal vocal effects. */
  VoiceChangerEthereal = 5,
  /** Hulk's voice. */
  VoiceChangerHulk = 6
};

typedef NS_ENUM(NSInteger, AudioReverbPreset) {
  AudioReverbPresetOff = 0x00000000,
  AudioReverbPresetFxKTV = 0x00100001,
  AudioReverbPresetFxVocalConcert = 0x00100002,
  AudioReverbPresetFxUncle = 0x00100003,
  AudioReverbPresetFxSister = 0x00100004,
  AudioReverbPresetFxStudio = 0x00100005,
  AudioReverbPresetFxPopular = 0x00100006,
  AudioReverbPresetFxRNB = 0x00100007,
  AudioReverbPresetFxPhonograph = 0x00100008,
  AudioReverbPresetPopular = 0x00000001,
  AudioReverbPresetRnB = 0x00000002,
  AudioReverbPresetRock = 0x00000003,
  AudioReverbPresetHipHop = 0x00000004,
  AudioReverbPresetVocalConcert = 0x00000005,
  AudioReverbPresetKTV = 0x00000006,
  AudioReverbPresetStudio = 0x00000007,
  AudioReverbPresetVirtualStereo = 0x00200001,
  AudioReverbPresetElectronicVoice = 0x00300001,
  AudioReverbPresetThreeDimVoice = 0x00400001
};

typedef NS_ENUM(NSUInteger, VoiceConversionPreset) {
  VoiceConversionOff = 0x00000000,
  VoiceConversionNeutral = 0x03010100,
  VoiceConversionSweet = 0x03010200,
  VoiceConversionSolid = 0x03010300,
  VoiceConversionBass = 0x03010400
};

typedef NS_ENUM(NSUInteger, Voice3AType) {
  Voice3ADisable = 0,
  Voice3AAuto = 1,
  Voice3AHardware = 2,
  Voice3ASoftware = 3
};

typedef NS_ENUM(NSInteger, AudioEffectCoreState) {
  AudioEffectFailed = -1,
  AudioEffectOk = 0,
  AudioEffectPlaying = 1,
  AudioEffectFinish = 2
};

typedef struct BBLyricsInfo {
  int index;
  int beginTimeMs;
  int endTimeMs;
  float score;
} BBLyricsInfo;

typedef NS_ENUM(NSInteger, SoundId) { kMixingSoundId = 1, kOriginalSoundId = 2 };

/* Audio noise reduction level */
typedef NS_ENUM(NSInteger, AudioEffectNoiseLevel) {
  AudioEffectk0db = -1,  // close
  AudioEffectk6dB = 0,
  AudioEffectk12dB = 1,
  AudioEffectk18dB = 2,
  AudioEffectk21dB = 3
};

/** Audio output routing. */
typedef NS_ENUM(NSInteger, AudioOutputRouting) {
  /** Default. */
  AudioOutputRoutingDefault = -1,
  /** Headset.*/
  AudioOutputRoutingHeadset = 0,
  /** Earpiece. */
  AudioOutputRoutingEarpiece = 1,
  /** Headset with no microphone. */
  AudioOutputRoutingHeadsetNoMic = 2,
  /** Speakerphone. */
  AudioOutputRoutingSpeakerphone = 3,
  /** Loudspeaker. */
  AudioOutputRoutingLoudspeaker = 4,
  /** Bluetooth headset. */
  AudioOutputRoutingHeadsetBluetooth = 5
};

typedef NS_ENUM(NSInteger, AudioEffectCoreElement) {
  AudioEffectCoreAudition = 0,
  AudioEffectCoreRecord = 1,
  AudioEffectCoreEdit = 2,
  AudioEffectCoreProduct = 3,
  AudioEffectCoreRecordSingle = 4,
  AudioEffectCoreMark = 5,
  AudioEffectCoreFileDecoding = 6,
  AudioEffectCoreFileEncoding = 7,
  AudioEffectCoreTuner = 8
};

typedef NS_ENUM(NSInteger, AudioEffectTunerMode) {
  AudioEffectTunerStream = 0,
  AudioEffectTunerFile = 1
};

@protocol RtcAudioEffectDelegate <NSObject>
@optional
- (void)audioRouteChanged:(int)routing;
- (void)stateChanged:(int)state;
- (void)sliceScoreUpdate:(int)beginPosMs
                endPosMs:(int)endPosMs
                   pitch:(float)pitch
                   score:(float)score;
- (void)sentenceScoreUpdate:(int)index
               currentScore:(float)currentScore
                 totalScore:(float)totalScore;
- (void)recordAudioFrame:(int)sampleRate
                channels:(int)channels
                 samples:(int)samples
                    data:(int16_t* _Nullable)data;
- (void)productProgress:(float)progress;
- (void)audioVolumeIndication:(int)volume time:(int64_t)time;
@end

__attribute__((visibility("default")))
@interface RtcAudioEffectKit : NSObject
@property(nonatomic, weak) id<RtcAudioEffectDelegate> _Nullable delegate;
+ (void)nativeInit:(unsigned int)uid;
- (int)initialize:(AudioEffectCoreElement)element;
- (int)releaseElement;
- (int)start;
- (int)switchAccompany:(SoundId)soundId;
- (int)pause;
- (int)resume;
- (int)stop;
- (int)getAudioRouteType;
- (int)getAudioDelay;
- (int)setIndicationInterval:(int)interval;
- (int)setAudioProfile:(AudioProfile)profile;
- (int)enableAudioPlayback:(BOOL)enabled;
- (int)set3AType:(Voice3AType)type;
- (int)setEnableSpeakerphone:(BOOL)speakerOn;
- (int)enableInEarMonitoring:(BOOL)enabled;
- (int)setInEarMonitoringVolume:(int)volume;
- (int)setAudioRecordFilePath:(NSString* _Nullable)filename append:(BOOL)append;
- (int)setAudioOutputFilePath:(NSString* _Nullable)filename;
- (int)setMidiFilePath:(NSString* _Nullable)filename pos:(int)pos;
- (int)setAudioKMarkFilePath:(NSString* _Nullable)filename pos:(int)pos;
- (int)setAudioMixingFilePath:(NSString* _Nullable)filename pos:(int)pos;
- (int)setOriginalFilePath:(NSString* _Nullable)filename pos:(int)pos;
- (int)adjustAudioMixingVolume:(int)volume;
- (int)setMixingAlignTime:(int)time;
- (int)getMixingAlignTime;
- (int)setAudioMixingPitch:(int)pitch;
- (int)getAudioMixingDuration;
- (int)getAudioMixingCurrentPosition;
- (int)setAudioMixingPosition:(int)pos;
- (int)adjustRecordingSignalVolume:(int)volume;
- (int)adjustPlaybackSignalVolume:(int)volume;
- (int)setAudioEffectDataSource:(NSString* _Nullable)source;
- (int)setAudioEffectPreset:(AudioEffectPreset)preset;
- (int)getAudioEffectPreset;
- (int)setVoiceBeautifierPreset:(VoiceBeautifierPreset)preset;
- (int)setVoiceConversionPreset:(VoiceConversionPreset)preset;
- (int)setAudioEffectParameters:(AudioEffectPreset)preset param1:(int)param1 param2:(int)param2;
- (int)setVoiceBeautifierParameters:(VoiceBeautifierPreset)preset
                             param1:(int)param1
                             param2:(int)param2;
- (int)setLocalVoicePitch:(double)pitch;
- (int)setLocalVoiceEqualization:(AudioEqualizationbandFrequency)bandFrequency
                        bandGain:(int)bandGain;
- (int)setLocalVoiceReverb:(AudioReverbType)type value:(int)value;
- (int)setLocalVoiceChanger:(VoiceChanger)changer;
- (int)setLocalVoiceReverbPreset:(AudioReverbPreset)preset;
- (int)setTolerance:(float)tolerance;
- (int)setLyricsInfo:(BBLyricsInfo* _Nullable)info size:(int)size;
- (int)getKMarkResult;
- (int)enableHeadsetMode:(BOOL)enabled;
- (int)setNoiseLevel:(AudioEffectNoiseLevel)level;
- (int)getRecordDuration;
- (int)pushAudioDataMark:(int16_t* _Nullable)data
              sampleRate:(int)sampleRate
                 samples:(int)samples
                channels:(int)channels;
- (int)setParameters:(NSString* _Nonnull)options;

- (int)setAudioFileDecode:(NSString* _Nullable)inFile
                  outFile:(NSString* _Nullable)outFile
            outSampleRate:(int)outSampleRate
              outChannels:(int)outChannels;
- (NSString* _Nonnull)getParameters:(NSString* _Nonnull)key;
- (int)setTunerMode:(AudioEffectTunerMode)mode;
@end
