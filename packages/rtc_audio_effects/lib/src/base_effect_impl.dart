import 'dart:async';

import 'package:flutter/services.dart';

import 'base_effect_api.dart';
import 'base_effect_model.dart';

class BaseEffectImpl with BaseEffectApi {
  static const MethodChannel _channel = MethodChannel('ly.plugins.audio_effect_core');
  static const EventChannel _event = EventChannel('ly.plugins.audio_effect_event_handler');

  BaseEffectImpl._();

  static final BaseEffectImpl inst = BaseEffectImpl._();

  /// Used to receive the native event stream
  static StreamSubscription<dynamic>? _streamSubscription;

  @override
  createEffectCore() async {
    _registerEventHandler();
    await _channel.invokeMethod('createEffectCore');
  }

  @override
  initialize(int element) async {
    await _channel.invokeMethod('initialize', {'element': element});
  }

  @override
  adjustAudioMixingVolume(int volume) async {
    await _channel.invokeMethod('adjustAudioMixingVolume', {"volume": volume});
  }

  @override
  adjustRecordingSignalVolume(int volume) async {
    await _channel.invokeMethod('adjustRecordingSignalVolume', {'volume': volume});
  }

  @override
  enableInEarMonitoring(bool enabled) async {
    await _channel.invokeMethod('enableInEarMonitoring', {'enabled': enabled});
  }

  @override
  pause() async {
    await _channel.invokeMethod('pause');
  }

  @override
  release() async {
    await _channel.invokeMethod('release');
    await _unregisterEventHandler();
  }

  @override
  resume() async {
    await _channel.invokeMethod('resume');
  }

  @override
  setAudioEffectPreset(int preset) async {
    await _channel.invokeMethod('setAudioEffectPreset', {'preset': preset});
  }

  @override
  setAudioKMarkFilePath(String path, int pos) async {
    await _channel.invokeMethod('setAudioKMarkFilePath', {
      'path': path,
      'pos': pos,
    });
  }

  @override
  setMidiFilePath(String path, int pos) async {
    await _channel.invokeMethod('setMidiFilePath', {
      'path': path,
      'pos': pos,
    });
  }

  @override
  setAudioMixingFilePath(String path, int pos) async {
    await _channel.invokeMethod('setAudioMixingFilePath', {
      'path': path,
      'pos': pos,
    });
  }

  @override
  setAudioMixingPitch(int pitch) async {
    await _channel.invokeMethod('setAudioMixingPitch', {'pitch': pitch});
  }

  @override
  setAudioOutputFilePath(String path) async {
    await _channel.invokeMethod('setAudioOutputFilePath', {'path': path});
  }

  @override
  setAudioRecordFilePath(String path, {bool append = false}) async {
    await _channel.invokeMethod('setAudioRecordFilePath', {'path': path, 'append': append});
  }

  @override
  setOriginalFilePath(String path, {int pos = 0}) async {
    return await _channel.invokeMethod('setOriginalFilePath', {
      'path': path,
      'pos': pos,
    });
  }

  @override
  setAudioProfile(int profile) async {
    await _channel.invokeMethod('setAudioProfile', {"profile": profile});
  }

  @override
  setLocalVoicePitch(double pitch) async {
    await _channel.invokeMethod('setLocalVoicePitch', {'pitch': pitch});
  }

  @override
  setLyricsInfo(List<LyricsInfo> lyricsInfos) async {
    var list = lyricsInfos.map((e) => e.toJson()).toList();
    await _channel.invokeMethod('setLyricsInfo', {"lyricsInfos": list});
  }

  @override
  start() async {
    await _channel.invokeMethod('start');
  }

  @override
  stop() async {
    await _channel.invokeMethod('stop');
  }

  @override
  setAudioMixingPosition(int pos) async {
    await _channel.invokeMethod('setAudioMixingPosition', {'pos': pos});
  }

  @override
  Future<int> getAudioMixingDuration() async {
    return await _channel.invokeMethod('getAudioMixingDuration') ?? 0;
  }

  @override
  Future<int> getAudioEffectPreset() async {
    return await _channel.invokeMethod('getAudioEffectPreset') ?? 0;
  }

  @override
  Future<int> getAudioMixingCurrentPosition() async {
    return await _channel.invokeMethod('getAudioMixingCurrentPosition') ?? 0;
  }

  @override
  Future<int> getAudioRouteType() async {
    return await _channel.invokeMethod('getAudioRouteType') ?? 0;
  }

  /* EventHandler */
  static _registerEventHandler() {
    _streamSubscription = _event.receiveBroadcastStream().listen(_eventListener);
  }

  static _unregisterEventHandler() async {
    await _streamSubscription?.cancel();
    _streamSubscription = null;
  }

  @override
  switchAccompany(int soundId) async {
    return await _channel.invokeMethod('switchAccompany', {'soundId': soundId});
  }

  @override
  setTolerance(double tolerance) async {
    return await _channel.invokeMethod('setTolerance', {'tolerance': tolerance});
  }

  @override
  setNoiseLevel(int level) async {
    return await _channel.invokeMethod('setNoiseLevel', {'level': level});
  }

  @override
  setInEarMonitoringVolume(int volume) async {
    await _channel.invokeMethod('setInEarMonitoringVolume', {'volume': volume});
  }

  @override
  adjustPlaybackSignalVolume(int volume) async {
    await _channel.invokeMethod('adjustPlaybackSignalVolume', {'volume': volume});
  }

  @override
  set3AType(int type) async {
    await _channel.invokeMethod('set3AType', {'type': type});
  }

  @override
  Future<int> getKMarkResult() async {
    return await _channel.invokeMethod('getKMarkResult');
  }

  @override
  Future<int> getAudioDelay() async {
    return await _channel.invokeMethod('getAudioDelay');
  }

  @override
  setIndicationInterval(int interval) async {
    await _channel.invokeMethod('setIndicationInterval', {'interval': interval});
  }

  @override
  Future<int> getRecordDuration() async {
    return await _channel.invokeMethod('getRecordDuration');
  }

  @override
  setParameters(String parameters) async {
    await _channel.invokeMethod('setParameters', {'parameters': parameters});
  }

  @override
  Future<String> getParameters(String key) async {
    return await _channel.invokeMethod('getParameters', {'key': key});
  }

  @override
  Future<int> setAudioFileDecode(String inFile, String outFile, int sampleRate, int channels) async {
    return await _channel.invokeMethod(
        'setAudioFileDecode', {'inFile': inFile, 'outFile': outFile, 'sampleRate': sampleRate, 'channels': channels});
  }

  @override
  pushAudioDataMark(
      {required Uint8List data, required int sampleRate, required int channels, required int samples}) async {
    await _channel.invokeMethod('pushAudioDataMark', {
      'data': data,
      'sampleRate': sampleRate,
      'channels': channels,
      'samples': samples,
    });
  }

  @override
  setTunerMode(int mode) async {
    await _channel.invokeMethod('setTunerMode', {'mode': mode});
  }

  static void _eventListener(dynamic data) {
    final Map<dynamic, dynamic> map = data;
    switch (map['method']) {
      case 'onStateChanged':
        var state = map['state'];
        BaseEffectApi.onStateChanged?.call(state);
        break;
      case 'onKMarkSliceScoreUpdate':
        int beginPosMs = map['beginPosMs'];
        int endPosMs = map['endPosMs'];
        double pitch = map['pitch'];
        double score = map['score'];
        BaseEffectApi.onKMarkSliceScoreUpdate?.call(beginPosMs, endPosMs, pitch, score);
        break;
      case 'onKMarkSentenceScoreUpdate':
        int index = map['index'];
        double currentScore = map['currentScore'];
        double totalScore = map['totalScore'];
        BaseEffectApi.onKMarkSentenceScoreUpdate?.call(index, currentScore, totalScore);
        break;
      case 'onProductProgress':
        double progress = map['progress'];
        BaseEffectApi.onProductProgress?.call(progress);
        break;
      case 'onRecordAudioFrame':
        int sampleRate = map['sampleRate'];
        int channels = map['channels'];
        int samples = map['samples'];
        Uint8List audioData = map['data'];
        BaseEffectApi.onRecordAudioFrame
            ?.call(sampleRate: sampleRate, channels: channels, samples: samples, data: audioData);
        break;
      case 'onAudioRouteChanged':
        int routing = map['routing'];
        BaseEffectApi.onAudioRouteChanged?.call(routing);
        break;
      case 'onAudioVolumeIndication':
        int volume = map['volume'];
        int timeMs = map['timeMs'];
        BaseEffectApi.onAudioVolumeIndication?.call(volume, timeMs);
        break;
    }
  }
}
