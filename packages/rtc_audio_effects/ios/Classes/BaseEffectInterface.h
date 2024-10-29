//
//  BaseEffectInterface.h
//  base_effect_core
//
//  Created by eagle on 2022/2/22.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>


@protocol BaseEffectInterface <NSObject>

// 需要与Release成对存在
-(void)createEffectCore:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)initialize:(FlutterMethodCall*)call result:(FlutterResult)result;

// 原唱 人的干声
-(void)setAudioKMarkFilePath:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)setMidiFilePath:(FlutterMethodCall*)call result:(FlutterResult)result;

// 伴奏
-(void)setAudioMixingFilePath:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)setAudioOutputFilePath:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)setOriginalFilePath:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)setAudioRecordFilePath:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)setLyricsInfo:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)pushAudioDataMark:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)getKMarkResult:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)enableInEarMonitoring:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)setAudioEffectPreset:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)setAudioProfile:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)start:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)stop:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)resume:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)pause:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)release:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)adjustAudioMixingVolume:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)adjustRecordingSignalVolume:(FlutterMethodCall*)call result:(FlutterResult)result;

/// 设置本地语音音调。
///
/// 该方法改变本地说话人声音的音调。
///
/// 参数
/// pitch    语音频率。可以在 [0.5, 2.0] 范围内设置。取值越小，则音调越低。默认值为 1.0，表示不需要修改音调。
-(void)setLocalVoicePitch:(FlutterMethodCall*)call result:(FlutterResult)result;

/// 调整本地播放的音乐文件的音调。
/// 按半音音阶调整本地播放的音乐文件的音调，默认值为 0，即不调整音调。取值范围为 [-12,12]，每相邻两个值的音高距离相差半音。取值的绝对值越大，音调升高或降低得越多。
-(void)setAudioMixingPitch:(FlutterMethodCall*)call result:(FlutterResult)result;

/// 0就是重新开始，录制文件也会同步
-(void)setAudioMixingPosition:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)getAudioMixingDuration:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)getAudioMixingCurrentPosition:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)switchAccompany:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)setTolerance:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)setNoiseLevel:(FlutterMethodCall*)call result:(FlutterResult)result;

-(void)getAudioRouteType:(FlutterMethodCall*)call result:(FlutterResult)result;

/// 设置播放音量
-(void)adjustPlaybackSignalVolume:(FlutterMethodCall*)call result:(FlutterResult)result;

/// 设置耳返音量
-(void)setInEarMonitoringVolume:(FlutterMethodCall*)call result:(FlutterResult)result;

/// 回声消除
-(void)set3AType:(FlutterMethodCall*)call result:(FlutterResult)result;
-(void)getAudioDelay:(FlutterMethodCall*)call result:(FlutterResult)result;
-(void)setIndicationInterval:(FlutterMethodCall*)call result:(FlutterResult)result;
-(void)setParameters:(FlutterMethodCall*)call result:(FlutterResult)result;
-(void)getParameters:(FlutterMethodCall*)call result:(FlutterResult)result;
-(void)setAudioFileDecode:(FlutterMethodCall*)call result:(FlutterResult)result;
-(void)setTunerMode:(FlutterMethodCall*)call result:(FlutterResult)result;
@end
