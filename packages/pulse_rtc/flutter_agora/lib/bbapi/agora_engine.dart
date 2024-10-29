import 'dart:ffi';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:aac_codec/aac_codec.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart' as agora;
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';

import '../src/agora_enum_converter.dart';
import 'agora_audio_recorder.dart';
import 'agora_channel.dart';
import 'agora_converter.dart';
import 'ktv_chorus_mixin.dart';

/// Agora 实现引擎
class AgoraEngine with RtcEngineInterface, KtvChorusMixin {
  @override
  bool get isInitialize => _initialize;

  bool _initialize = false;

  @override
  late RtcBridge bridge;

  AgoraAudioRecorder? _audioRecorder;

  late agora.RtcEngineEx _engineEx;

  AudioVolumeCallback? _audioVolumeCallback;
  ConnectionStateCallback? _connectionStateCallback;
  ErrorCallback? _errorCallback;
  VideoFrameWithUidCallback? _videoFrameWithUidCallback;
  AudioMixingStateCallback? _audioMixingStateCallback;
  UidWithElapsedCallback? _userJoinedCallback;
  UserOfflineCallback? _userOfflineCallback;
  WarningCallback? _warningCallback;
  LocalAudioStateChangeCallback? _localAudioStateChangeCallback;
  AudioRouteCallback? _audioRouteCallback;
  CapturedDataRecordStateUpdate? _capturedDataRecordStateUpdate;

  AgoraMusicLyricCallback? _agoraMusicLyricCallback;
  AgoraMusicPreloadCallback? _agoraMusicPreloadCallback;

  int _recordingSignalVolume = 100;

  ChannelMediaRelayConfiguration? _channelMediaRelayConfiguration;
  agora.ChannelMediaRelayState? _channelMediaRelayState;
  agora.ChannelMediaRelayError? _channelMediaRelayError;
  agora.ChannelMediaRelayEvent? _channelMediaRelayEvent;

  agora.AudioFrameObserver? _audioObserver;
  agora.ChannelMediaOptions? _channelMediaOptions;
  late int uid;

  // 是否上传aac数据到服务端，默认不上传
  bool _uploadAacBytes = false;

  agora.MusicContentCenter? _musicContentCenter;
  agora.MediaPlayer? _mediaPlayer;
  String? _resourceID;
  int _audioPlayOutDelay = 0;
  String? _channelName;

  @override
  set uploadAacBytes(bool value) {
    _uploadAacBytes = value;
  }

  @override
  bool get uploadAacBytes => _uploadAacBytes;

  /// 本地音频是否是静音状态，默认是
  bool _localAudioMute = true;

  /// 当前房间是否静音
  bool _localRoomMute = false;

  final Set<RtcEngineEventHandler> _rtcEngineEventHandlers = {};

  @override
  Future<void> initEngine(EngineConfig config) async {
    try {
      _engineEx = agora.createAgoraRtcEngineEx();
      await _engineEx.initialize(agora.RtcEngineContext(
        appId: config.appId,
        channelProfile: agora.ChannelProfileType.channelProfileLiveBroadcasting,
      ));
      _engineEx.registerEventHandler(_rtcEngineEventHandler);
      dataStreamId = await _engineEx.createDataStream(agora.DataStreamConfig(syncWithAudio: false, ordered: false));

      _initialize = true;
    } on Exception catch (e) {
      rtcLog('initEngine error$e');
    }
  }

  @override
  void registerEventHandler(RtcEngineEventHandler eventHandler) {
    _rtcEngineEventHandlers.add(eventHandler);
  }

  @override
  void unregisterEventHandler(RtcEngineEventHandler eventHandler) {
    _rtcEngineEventHandlers.remove(eventHandler);
  }

  @override
  Future<void> adjustAudioMixingVolume(int id, int volume) async {
    try {
      rtcLog('----------------- adjustAudioMixingVolume ----------------- id:$id,volume:$volume');

      await _mediaPlayer?.adjustPlayoutVolume(volume);
      await _mediaPlayer?.adjustPublishSignalVolume(volume);
    } catch (e) {
      rtcLog('adjustAudioMixingVolume error:$e');
    }
  }

  @override
  Future<void> adjustRecordingSignalVolume(int volume) async {
    try {
      _recordingSignalVolume = volume;
      return await _engineEx.adjustRecordingSignalVolume(volume);
    } on Exception catch (e) {
      rtcLog('adjustRecordingSignalVolume error:$e');
    }
  }

  @override
  Future<void> destroy() async {
    _capturedAudioDataCallback = null;
    _agoraMusicPreloadCallback = null;
    _agoraMusicLyricCallback = null;
    _capturedDataRecordStateUpdate = null;
    _channelMediaRelayState = null;
    _channelMediaRelayError = null;
    _channelMediaRelayEvent = null;
    _initialize = false;
    _localRoomMute = false;
    _audioObserver = null;
    _channelMediaOptions = null;

    if (_rtcEngineEventHandlers.isNotEmpty) {
      _rtcEngineEventHandlers.clear();
    }

    if (_mediaPlayer != null) {
      try {
        await _mediaPlayer!.stop();
        await _engineEx.destroyMediaPlayer(_mediaPlayer!);
        _mediaPlayer = null;
        _resourceID = null;
      } catch (e) {
        rtcLog('_mediaPlayer destroy error:$e');
      }
    }

    try {
      _musicContentCenter?.unregisterEventHandler();
      await _musicContentCenter?.release();
    } catch (e) {
      rtcLog('_musicContentCenter destroy error:$e');
    }
    _musicContentCenter = null;

    try {
      await _engineEx.release(sync: true);
    } on Exception catch (e) {
      rtcLog('_engineEx release error:$e');
    }
  }

  @override
  Future<void> disableAudio() async {
    try {
      return await _engineEx.disableAudio();
    } on Exception catch (e) {}
  }

  @override
  Future<void> disableVideo() async {
    try {
      return await _engineEx.disableVideo();
    } on Exception catch (e) {}
  }

  @override
  Future<void> enableAudio() async {
    try {
      return await _engineEx.enableAudio();
    } on Exception catch (e) {}
  }

  @override
  Future<void> enableAudioVolumeIndication(int interval, int smooth, bool report_vad) async {
    try {
      return await _engineEx.enableAudioVolumeIndication(interval: interval, smooth: smooth, reportVad: report_vad);
    } on Exception catch (e) {}
  }

  @override
  Future<void> enableInEarMonitoring(bool enabled) async {
    try {
      return await _engineEx.enableInEarMonitoring(
          enabled: enabled, includeAudioFilters: agora.EarMonitoringFilterType.earMonitoringFilterNone);
    } on Exception catch (e) {}
  }

  @override
  Future<void> enableLocalAudio(bool enabled) async {
    try {
      return await _engineEx.enableLocalAudio(enabled);
    } on Exception catch (e) {
      rtcLog('enableLocalAudio error:$e');
    }
  }

  @override
  Future<void> enableVideo() async {
    try {
      return await _engineEx.enableVideo();
    } on Exception catch (e) {
      rtcLog('enableVideo error:$e');
    }
  }

  @override
  Future<void> enableWebSdkInteroperability(bool enabled) async {
    try {
      return await _engineEx.enableWebSdkInteroperability(enabled);
    } on Exception catch (e) {
      rtcLog('enableWebSdkInteroperability error:$e');
    }
  }

  @override
  Future<int> getAudioMixingCurrentPosition(int id) async {
    try {
      return localTime - localPlayerPosition;
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<int> getAudioMixingDuration(String path) async {
    try {
      return await _mediaPlayer!.getDuration();
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<void> joinRoom(String token, String channelName, int optionalUid, {String? optionalInfo}) async {
    // 4.0.0版本以前的声网sdk上层调用未传optionalInfo 跟声网确认 以前的string类型optionalInfo无意义
    // 4.0.0版本兼容用以下默认options
    if (_channelMediaOptions == null) {
      _channelMediaOptions = agora.ChannelMediaOptions(
        publishCameraTrack: false,
        publishMicrophoneTrack: true,
        autoSubscribeAudio: true,
        autoSubscribeVideo: false,
      );
    }

    uid = optionalUid;
    _channelName = channelName;
    try {
      return await _engineEx.joinChannel(token: token, channelId: channelName, options: _channelMediaOptions!, uid: optionalUid);
    } on Exception catch (e) {
      rtcLog('joinChannel error:$e');
    }
  }

  @override
  Future<void> leaveChannel() async {
    try {
      return await _engineEx.leaveChannel();
    } on Exception catch (e) {
      rtcLog('leaveChannel error:$e');
    }
  }

  @override
  Future<void> muteAllRemoteAudioStreams(bool muted) async {
    rtcLog('----------------- muteAllRemoteAudioStreams ----------------- mute:$muted');
    try {
      return await _engineEx.muteAllRemoteAudioStreams(muted);
    } on Exception catch (e) {
      rtcLog('muteAllRemoteAudioStreams error:$e');
    }
  }

  @override
  Future<void> muteAllRemoteVideoStreams(bool muted) async {
    try {
      return await _engineEx.muteAllRemoteVideoStreams(muted);
    } on Exception catch (e) {
      rtcLog('muteAllRemoteVideoStreams error:$e');
    }
  }

  @override
  Future<void> muteMicrophone(bool mute) async {
    rtcLog('----------------- muteMicrophone ----------------- mute:$mute');
    _localAudioMute = mute;
    if (mute == true) {
      try {
        await _engineEx.adjustRecordingSignalVolume(0);
      } on Exception catch (e) {
        rtcLog('adjustRecordingSignalVolume error:$e');
      }
      await muteLocalAudioStream(false);
    } else {
      await adjustRecordingSignalVolume(_recordingSignalVolume);
    }
  }

  @override
  Future<void> muteRoom(bool mute) async {
    _localRoomMute = mute;
    await muteLocalMediaPlayer(mute);
    await muteAllRemoteAudioStreams(mute);
  }

  @override
  Future<void> muteLocalMediaPlayer(bool mute) async {
    rtcLog('----------------- muteLocalMediaPlayer ----------------- mute:$mute');
    try {
      await _mediaPlayer?.mute(mute);
    } catch (e) {
      rtcLog('muteLocalMediaPlayer error:$e');
    }
  }

  @override
  Future<void> muteLocalAudioStream(bool muted) async {
    rtcLog('----------------- muteLocalAudioStream ----------------- muted:$muted');
    _localAudioMute = muted;

    agora.ChannelMediaOptions newOptions = agora.ChannelMediaOptions(
      publishCameraTrack: _channelMediaOptions!.publishCameraTrack,
      publishMicrophoneTrack: !muted,
      autoSubscribeAudio: _channelMediaOptions!.autoSubscribeAudio,
      autoSubscribeVideo: _channelMediaOptions!.autoSubscribeVideo,
    );

    try {
      await _engineEx.updateChannelMediaOptions(newOptions);
      if (_localRoomMute) {
        muteAllRemoteAudioStreams(true);
      }
      return await _engineEx.muteLocalAudioStream(muted);
    } on Exception catch (e) {
      rtcLog('muteLocalAudioStream error:$e');
    }
  }

  @override
  Future<int> muteRemoteAudioStream(int uid, bool muted) async {
    rtcLog('----------------- muteRemoteAudioStream ----------------- mute:$muted， uid：$uid');
    try {
      await _engineEx.muteRemoteAudioStream(uid: uid, mute: muted);
    } on Exception catch (e) {
      rtcLog('muteRemoteAudioStream error:$e');
    }
    return 0;
  }

  @override
  Future<void> pauseAudioMixing(int id) async {
    try {
      return await _mediaPlayer!.pause();
    } catch (e) {
      rtcLog('pauseAudioMixing error:$e');
    }
  }

  @override
  Future<void> resumeAudioMixing(int id) async {
    try {
      return await _mediaPlayer!.resume();
    } catch (e) {
      rtcLog('resumeAudioMixing error:$e');
    }
  }

  @override
  Future<void> setAudioMixingPosition(int id, int pos) async {
    try {
      return await _mediaPlayer!.seek(pos);
    } catch (e) {
      rtcLog('setAudioMixingPosition error:$e');
    }
  }

  @override
  Future<void> setAudioProfile(AudioProfile profile, AudioScenario scenario) async {
    try {
      return await _engineEx.setAudioProfile(profile: audioProfile(profile), scenario: audioScenario(scenario));
    } on Exception catch (e) {
      rtcLog('setAudioProfile error:$e');
    }
  }

  @override
  Future<void> setChannelProfile(ChannelProfile profile) async {
    try {
      return await _engineEx.setChannelProfile(channelProfile(profile));
    } on Exception catch (e) {
      rtcLog('setChannelProfile error:$e');
    }
  }

  @override
  Future<void> setClientRole(ClientRole role) async {
    try {
      return await _engineEx.setClientRole(role: clientRole(role));
    } on Exception catch (e) {
      rtcLog('setClientRole error:$e');
    }
  }

  @override
  Future<void> setDefaultAudioRouteToSpeakerPhone(bool defaultToSpeaker) async {
    try {
      return await _engineEx.setDefaultAudioRouteToSpeakerphone(defaultToSpeaker);
    } on Exception catch (e) {
      rtcLog('setDefaultAudioRouteToSpeakerPhone error:$e');
    }
  }

  @override
  Future<void> setEnableSpeakerphone(bool enabled) async {
    try {
      return await _engineEx.setEnableSpeakerphone(enabled);
    } on Exception catch (e) {
      rtcLog('setEnableSpeakerphone error:$e');
    }
  }

  @override
  Future<void> setInEarMonitoringVolume(int volume) async {
    try {
      return await _engineEx.setInEarMonitoringVolume(volume);
    } on Exception catch (e) {
      rtcLog('setInEarMonitoringVolume error:$e');
    }
  }

  @override
  Future<void> startAudioMixing(
    int id,
    String path,
    bool noPublish,
    bool noMixMic, {
    int cycle = 1,
    int startPos = 0,
    String? resourceID,
  }) async {
    rtcLog(
        'StartAudioMixing, id: $id, path: $path, resourceID: $resourceID, noPublish: $noPublish, noMixMic: $noMixMic, startPos: $startPos');
    // 点歌流程时 勿进行audioMixing相关操作
    try {
      // 停掉之前的播放
      try {
        await _mediaPlayer?.stop();
      } catch (e) {
        rtcLog('StartAudioMixing, _mediaPlayer stop error:$e');
      }

      // 清除播放位置及长度
      localPlayerPosition = localTime - startPos;
      localPlayerDuration = 0;

      // 声网版权音乐使用MusicCenter创建MediaPlayer，无版权音乐使用EngineEx创建MediaPlayer
      if (_mediaPlayer == null) {
        await _initMediaPlayer(resourceID);
      } else {
        bool isPreAgoraMusic = (_resourceID?.isNotEmpty ?? false); // 上次播放的音乐是否为声网版权
        bool isCurrentAgoraMusic = (resourceID?.isNotEmpty ?? false); // 当前播放的音乐是否为声网版权

        // 版权切换时，销毁之前的MediaPlayer，创建新的
        if (isPreAgoraMusic != isCurrentAgoraMusic) {
          await _engineEx.destroyMediaPlayer(_mediaPlayer!);
          await _initMediaPlayer(resourceID);
        }
      }

      _resourceID = resourceID;

      rtcLog('StartAudioMixing, open url: $path, pos: $startPos, with MediaPlayer');

      if (isKtvChorusMode) {
        //开启MPK的主播，如 独唱或者合唱或者伴唱
        await engineEx?.setParameters("{\"rtc.video.enable_sync_render_ntp_broadcast_dynamic\":false}");

        // 合唱中，调低人声音量
        await engineEx?.adjustPlaybackSignalVolume(40);

        // KTV合唱中，设置chorus
        await engineEx?.setAudioScenario(agora.AudioScenarioType.audioScenarioChorus);
      }

      if (_mediaPlayer is agora.MusicPlayer) {
        await (_mediaPlayer as agora.MusicPlayer).openWithSongCode(songCode: int.parse(resourceID!), startPos: startPos);
      } else {
        await _mediaPlayer!.open(url: path, startPos: startPos);
      }

      // 使用MediaPlayer时，cycle=1播放一次，不用loop
      if (cycle > 1) {
        await _mediaPlayer!.setLoopCount(cycle - 1);
      }

      // 合唱场景下，只有领唱publishMediaPlayerAudioTrack（是否publish MediaPlayer）
      // 非合唱场景下，取决于noPublish
      agora.ChannelMediaOptions options = agora.ChannelMediaOptions(
        publishMediaPlayerAudioTrack: isChorusSinger ? (ktvRole == KtvClientRole.LeadSinger) : !noPublish,
        publishMediaPlayerId: _mediaPlayer?.getMediaPlayerId(),
      );
      await _engineEx.updateChannelMediaOptions(options);
    } on Exception catch (e) {
      rtcLog('startAudioMixing exception:$e');
    }
  }

  @override
  Future<void> startChannelMediaRelay(ChannelMediaRelayConfiguration channelMediaRelayConfiguration) async {
    _channelMediaRelayConfiguration = channelMediaRelayConfiguration;
    try {
      return await _engineEx.startChannelMediaRelay(convertChannelMediaRelay(channelMediaRelayConfiguration));
    } on Exception catch (e) {
      rtcLog('startChannelMediaRelay exception:$e');
    }
  }

  @override
  Future<void> updateChannelMediaRelay(ChannelMediaRelayConfiguration channelMediaRelayConfiguration) async {
    _channelMediaRelayConfiguration = channelMediaRelayConfiguration;
    try {
      return await _engineEx.updateChannelMediaRelay(convertChannelMediaRelay(channelMediaRelayConfiguration));
    } on Exception catch (e) {
      rtcLog('updateChannelMediaRelay exception:$e');
    }
  }

  @override
  ChannelMediaRelayConfiguration? getMediaRelayConfiguration() {
    if (_channelMediaRelayState == agora.ChannelMediaRelayState.relayStateRunning &&
        _channelMediaRelayError == agora.ChannelMediaRelayError.relayOk) {
      return _channelMediaRelayConfiguration;
    }
    return null;
  }

  @override
  bool isMediaReplaySuccess(String destRid) {
    if (_channelMediaRelayConfiguration?.destInfos.isEmpty ?? true) {
      rtcLog('isMediaReplaySuccess destInfo isEmpty');
      return false;
    }
    bool? containsDestRid = _channelMediaRelayConfiguration!.destInfos.any((element) => element.channelName == destRid);
    if (containsDestRid != true) {
      rtcLog('isMediaReplaySuccess destInfo not contains destRid');
      return false;
    }
    rtcLog('isMediaReplaySuccess MediaRelayState=$_channelMediaRelayState,MediaRelayError=$_channelMediaRelayError');
    return _channelMediaRelayState == agora.ChannelMediaRelayState.relayStateRunning &&
        _channelMediaRelayError == agora.ChannelMediaRelayError.relayOk;
  }

  @override
  Future<void> syncPullExtraStream(List<UserStream>? streamList) async {
    // 不需要实现
    return null;
  }

  @override
  Future<void> startPreview() async {
    try {
      return await _engineEx.startPreview();
    } on Exception catch (e) {
      rtcLog('startPreview exception:$e');
    }
  }

  @override
  Future<void> stopAudioMixing(int id) async {
    try {
      if (isKtvChorusMode) {
        //开启MPK的主播，如 独唱或者合唱或者伴唱
        await engineEx?.setParameters("{\"rtc.video.enable_sync_render_ntp_broadcast_dynamic\":false}");

        // 恢复人声音量
        await engineEx?.adjustPlaybackSignalVolume(100);

        // KTV房恢复使用 GAME_STREAMING
        await engineEx?.setAudioScenario(agora.AudioScenarioType.audioScenarioGameStreaming);
      }

      await _mediaPlayer?.stop();
    } catch (e) {
      rtcLog('stopAudioMixing error:$e');
    }
  }

  @override
  Future<void> stopChannelMediaRelay() async {
    _channelMediaRelayConfiguration = null;
    try {
      return await _engineEx.stopChannelMediaRelay();
    } catch (e) {
      rtcLog('stopChannelMediaRelay error:$e');
    }
  }

  @override
  Future<void> stopPreview() async {
    try {
      return await _engineEx.stopPreview();
    } on Exception catch (e) {
      rtcLog('stopPreview error:$e');
    }
  }

  @override
  Future<void> switchCamera() async {
    try {
      return await _engineEx.switchCamera();
    } on Exception catch (e) {
      rtcLog('switchCamera error:$e');
    }
  }

  @override
  void audioVolumeIndicationCallback(AudioVolumeCallback callback) {
    _audioVolumeCallback = callback;
  }

  @override
  void connectionStateChangeCallback(ConnectionStateCallback callback) {
    _connectionStateCallback = callback;
  }

  @override
  void errorCallback(ErrorCallback callback) {
    _errorCallback = callback;
  }

  @override
  void firstRemoteVideoFrameCallback(VideoFrameWithUidCallback callback) {
    _videoFrameWithUidCallback = callback;
  }

  @override
  void mixingStateChangedCallback(AudioMixingStateCallback callback) {
    _audioMixingStateCallback = callback;
  }

  @override
  void userJoinedCallback(UidWithElapsedCallback callback) {
    _userJoinedCallback = callback;
  }

  @override
  void userOffline(UserOfflineCallback callback) {
    _userOfflineCallback = callback;
  }

  @override
  void warningCallback(WarningCallback callback) {
    _warningCallback = callback;
  }

  @override
  void localAudioStateCallback(LocalAudioStateChangeCallback callback) {
    _localAudioStateChangeCallback = callback;
  }

  @override
  void audioRouteCallback(AudioRouteCallback callback) {
    _audioRouteCallback = callback;
  }

  @override
  void captureDataRecordStateCallback(CapturedDataRecordStateUpdate callback) {
    _capturedDataRecordStateUpdate = callback;
  }

  @override
  Future<void> playEffect({
    int soundId = 0,
    required String filePath,
    int loopCount = 0,
    double pitch = 1,
    double pan = 0,
    double gain = 100,
    int publish = 1,
  }) async {
    try {
      return await _engineEx.playEffect(
          soundId: soundId, filePath: filePath, loopCount: loopCount, pitch: pitch, pan: pan, gain: gain.floor(), publish: publish == 1);
    } on Exception catch (e) {
      rtcLog('playEffect error:$e');
    }
  }

  @override
  Future<void> stopAllEffects() async {
    try {
      return await _engineEx.stopAllEffects();
    } on Exception catch (e) {
      rtcLog('stopAllEffects error:$e');
    }
  }

  @override
  Future<void> stopEffect(int soundId) async {
    try {
      return await _engineEx.stopEffect(soundId);
    } on Exception catch (e) {
      rtcLog('stopEffect error:$e');
    }
  }

  @override
  Future<void> setVoiceProfile({double? pitch, List<double>? equalization}) async {
    try {
      if (pitch != null) {
        await _engineEx.setLocalVoicePitch(pitch);
      }
      if (equalization != null) {
        for (int i = 0; i < equalization.length; i++) {
          await _engineEx.setLocalVoiceEqualization(
            bandFrequency: AudioEqualizationBandFrequencyConverter.fromValue(i).e,
            bandGain: equalization[i].toInt(),
          );
        }
      }
    } on Exception catch (e) {
      rtcLog('setVoiceProfile exception:$e');
    }
  }

  @override
  Future<void> setParameters(String param) async {
    try {
      await _engineEx.setParameters(param);
    } on Exception catch (e) {}
  }

  @override
  Widget createVideoRenderWidget(int uid, {bool local = false, int facing = 0, Map<String, dynamic> args = const <String, dynamic>{}}) {
    // return agora.AgoraRenderWidget(uid, local: local, facing: facing, );
    /// TODO: 未实现
    return SizedBox.shrink();
  }

  @override
  Future<void> setVideoEncoderConfiguration(VideoEncoderConfiguration config) async {
    try {
      return await _engineEx.setVideoEncoderConfiguration(videoEncoderConfiguration(config));
    } on Exception catch (e) {}
  }

  @override
  Future<void> setAudioEffectPreset(AudioEffectPreset preset) async {
    try {
      return await _engineEx.setAudioEffectPreset(convertAudioEffectPreset(preset));
    } on Exception catch (e) {}
  }

  @override
  String getTag() {
    return RtcEngineEnum.Agora.name();
  }

  @override
  RtcEngineEnum getEnum() {
    return RtcEngineEnum.Agora;
  }

  RecordConfig? _recordConfig;

  @override
  Future<void> registerAudioFrameObserver({int? uid, int? rid}) async {
    // rtcLog('agora registerAudioFrameObserver _uploadAacBytes:$_uploadAacBytes,uid:$uid,rid:$rid');
    if (_uploadAacBytes) {
      try {
        if (_channel == null && uid != null && uid > 0 && rid != null && rid > 0) {
          _channel = await WebSocket.connect('ws://121.41.7.29:6789/connect?user_id=$uid&room_id=$rid');
        }
      } catch (e) {
        rtcLog(e);
      }
    }

    if (_audioObserver == null) {
      _audioObserver = agora.AudioFrameObserver(
        onRecordAudioFrame: (String channelId, agora.AudioFrame audioFrame) {
          _recordFrame(audioFrame.buffer!, audioFrame.samplesPerChannel!, 2, audioFrame.channels!, audioFrame.samplesPerSec!);
        },
      );
    }
    var mediaEngine = _engineEx.getMediaEngine();
    mediaEngine.registerAudioFrameObserver(_audioObserver!);
  }

  @override
  Future<void> unRegisterAudioFrameObserver() async {
    if (_uploadAacBytes && _channel != null) {
      print('unRegisterAudioFrameObserver close upload audio channel');
      _channel?.close();
    }

    if (_audioObserver != null) {
      var mediaEngine = _engineEx.getMediaEngine();
      mediaEngine.unregisterAudioFrameObserver(_audioObserver!);
      _audioObserver = null;
    }

    return Future.value(Void);
  }

  @override
  Future<void> startRecordingCapturedData(RecordConfig config) async {
    _audioRecorder ??= AgoraAudioRecorder();
    _audioRecorder!.startRecord(config);
    _recordConfig = config;
    _capturedDataRecordStateUpdate?.call(RecordState.Recording, 0, config);
    return null;
  }

  void _recordFrame(Uint8List samples, int numOfSamples, int bytesPerSample, int channels, int samplesPerSec) {
    // rtcLog('agora engine _recordFrame _uploadAacBytes:$_uploadAacBytes,_channel:$_channel,_localAudioMute:$_localAudioMute');
    /// 如果需要上传 && WebSocket连接成功 && 本地音频静音是关闭的 则进行上传音频数据流
    if (_uploadAacBytes && _channel != null && _localAudioMute == false) {
      // int sum = AacCodec.addWithCpp(1, 2);
      // print("liqf: sum = $sum");
      // var start = DateTime.now().microsecondsSinceEpoch;
      Uint8List aacBytes = AacCodec.pcmToAACBytes(samples);
      // var duration = DateTime.now().microsecondsSinceEpoch - start;
      // print('liqf: pcmToAACBytes duration = $duration us');
      _reportFrame(aacBytes);
    }
    _audioRecorder?.record(samples, numOfSamples, bytesPerSample, channels, samplesPerSec);
    _capturedAudioDataCallback?.call(samples, channels: channels, dataLength: numOfSamples * bytesPerSample, sampleRate: samplesPerSec);
  }

  WebSocket? _channel;

  void _reportFrame(Uint8List aacBytes) async {
    //上传给websocket
    try {
      _channel?.add(aacBytes);
      // print("_reportFrame aacBytes size = ${aacBytes.length}");
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> stopRecordingCapturedData() async {
    if (_audioRecorder == null) return;
    String? resultPath = await _audioRecorder?.endRecord();
    if (resultPath != null) {
      _recordConfig!.resultPath = resultPath;
      _capturedDataRecordStateUpdate?.call(RecordState.Success, 0, _recordConfig!);
    } else {
      _recordConfig!.resultPath = resultPath;
      _capturedDataRecordStateUpdate?.call(RecordState.NoRecord, 1, _recordConfig!);
    }
    _audioRecorder = null;
    return null;
  }

  CapturedAudioFrameCallback? _capturedAudioDataCallback;

  @override
  void setAudioDataHandler(CapturedAudioFrameCallback? callback) {
    _capturedAudioDataCallback = callback;
  }

  @override
  Future<void> setRecordingAudioFrameParameters({int? sampleRate, int? channel, int? mode, int? samplesPerCall}) async {
    ///  必须满足：sampleRate/channel = samplesPerCall;
    return await _engineEx.setRecordingAudioFrameParameters(
      sampleRate: sampleRate ?? 441000,
      channel: channel ?? 1,
      mode: agora.RawAudioFrameOpModeType.rawAudioFrameOpModeReadOnly,
      samplesPerCall: samplesPerCall ?? 441000,
    );
  }

  @override
  Future<RtcMultiChannel?> createRtcChannel(String channel) async {
    return await AgoraRtcChannel.create(channel, _engineEx, uid);
  }

  @override
  Future<void> destroyRtcChannel() async {
    return await AgoraRtcChannel.destroyAll();
  }

  @override
  Future<void> setAudioMixingPitch(int pitch) async {
    try {
      return await _engineEx.setAudioMixingPitch(pitch);
    } on Exception catch (e) {}
  }

  @override
  Future<void> enableLocalVideo(bool enabled) async {
    try {
      await _engineEx.enableLocalVideo(enabled);
    } on Exception catch (e) {}
  }

  @override
  Future<void> muteLocalVideoStream(bool muted) async {
    try {
      await _engineEx.muteAllRemoteVideoStreams(muted);
    } on Exception catch (e) {}
  }

  @override
  Future<void> enableCustomCaptureRender(bool enabled, {VideoEncoderConfiguration? config}) async {
    /// 封装了，但是没用到。
    /// await _engine.enableCustomCaptureRender(enabled);
  }

  @override
  Future<void> startCustomCapture() async {
    /// 封装了，但是没用到。
    /// await _engine.startCustomCapture();
  }

  @override
  Future<void> stopCustomCapture() async {
    /// 封装了，但是没用到。
    /// await _engine.stopCustomCapture();
  }

  @override
  Future<bool> setBeauty(bool enableBeauty) async {
    /// todo 未实现
    /// return await _engine.setBeauty(enableBeauty);
    return Future.value(false);
  }

  @override
  Future<void> enableDualStreamMode(bool enabled) async {
    try {
      await _engineEx.enableDualStreamMode(enabled: enabled);
    } on Exception catch (e) {}
  }

  @override
  Future<void> setRemoteVideoStreamType(int uid, VideoStreamType streamType) async {
    try {
      await _engineEx.setRemoteVideoStreamType(uid: uid, streamType: convertVideoStreamType(streamType));
    } on Exception catch (e) {}
  }

  @override
  Future<void> setRemoteDefaultVideoStreamType(VideoStreamType streamType) async {
    try {
      await _engineEx.setRemoteDefaultVideoStreamType(convertVideoStreamType(streamType));
    } on Exception catch (e) {}
  }

  agora.RtcEngineEventHandler get _rtcEngineEventHandler => agora.RtcEngineEventHandler(
        // token快要过期回调
        onTokenPrivilegeWillExpire: (agora.RtcConnection connection, String token) {
          _warningCallback?.call(WarningCode.TokenWillExpire);
        },
        //
        onAudioVolumeIndication:
            (agora.RtcConnection connection, List<agora.AudioVolumeInfo> speakers, int speakerNumber, int totalVolume) {
          _audioVolumeCallback?.call(audioVolumeInfoList(speakers), ratioVolume(totalVolume));
        },
        //
        onConnectionStateChanged:
            (agora.RtcConnection connection, agora.ConnectionStateType state, agora.ConnectionChangedReasonType reason) {
          rtcLog('agora connectionStateChanged state=$state,reason=$reason');
          _connectionStateCallback?.call(convertConnectStateType(state), convertConnectionChangeReason(reason));
        },
        //
        onError: (agora.ErrorCodeType err, String msg) {
          rtcLog('agora err $err');
          _errorCallback?.call(convertErrorCode(err));
        },
        //
        onFirstRemoteVideoFrame: (agora.RtcConnection connection, int remoteUid, int width, int height, int elapsed) {
          _videoFrameWithUidCallback?.call(remoteUid, width, height, elapsed);
        },
        //
        onAudioMixingStateChanged: (agora.AudioMixingStateType state, agora.AudioMixingReasonType reason) {
          rtcLog('agora audioMixingStateChanged $state,$reason');
          _audioMixingStateCallback?.call(convertAudioMixingStateCode(state, reason), convertAudioMixingReason(reason));
        },
        //
        onUserJoined: (agora.RtcConnection connection, int remoteUid, int elapsed) {
          _userJoinedCallback?.call(remoteUid, elapsed);
        },
        //
        onUserOffline: (agora.RtcConnection connection, int remoteUid, agora.UserOfflineReasonType reason) {
          _userOfflineCallback?.call(remoteUid, convertUserOfflineReason(reason));
        },
        // 声网确认 方法已删除
        // onWarning: (agora.WarnCodeType warn, String msg) {
        //   rtcLog('agora warning $warn');
        //   _warningCallback?.call(AgroaConvertUtil.convertWarningCode(warn));
        // },
        //
        onLocalAudioStateChanged: (agora.RtcConnection connection, agora.LocalAudioStreamState state, agora.LocalAudioStreamError error) {
          rtcLog('agora localAudioStateChanged $state,$error');
          _localAudioStateChangeCallback?.call(convertAudioLocalError(error), convertAudioLocalState(state));
        },
        onLocalAudioStats: (agora.RtcConnection connection, agora.LocalAudioStats stats) {
          // rtcLog('agora onLocalAudioStats, stats: ${stats.toJson()}, audioPlayoutDelay: ${stats.audioPlayoutDelay}');
          if ((stats.audioPlayoutDelay ?? 0) != 0) _audioPlayOutDelay = stats.audioPlayoutDelay!;
        },
        //
        onAudioRoutingChanged: (int routing) {
          _audioRouteCallback?.call(convertAudioOutputRouting(routing));
        },
        // 声网确认 方法已删除 通过AudioFrameObserver
        // onAudioRecordFrame: (samples, numOfSamples, bytesPerSample, channels, samplesPerSec) {
        //   _recordFrame(samples, numOfSamples, bytesPerSample, channels, samplesPerSec);
        // },
        //
        onChannelMediaRelayStateChanged: (agora.ChannelMediaRelayState state, agora.ChannelMediaRelayError code) {
          rtcLog('agora channelMediaRelayStateChanged state=$state,code=$code');
          _channelMediaRelayState = state;
          _channelMediaRelayError = code;
        },
        //
        onChannelMediaRelayEvent: (agora.ChannelMediaRelayEvent code) {
          rtcLog('agora channelMediaRelayEvent code=$code');
          _channelMediaRelayEvent = code;
        },
        //
        onLocalVideoStateChanged: (agora.VideoSourceType source, agora.LocalVideoStreamState state, agora.LocalVideoStreamError error) {
          rtcLog('agora localVideoStateChanged state=$state,error=$error');
        },
        onJoinChannelSuccess: (agora.RtcConnection connection, int elapsed) {
          rtcLog('agora onJoinChannelSuccess elapsed=$elapsed');
        },
        onStreamMessage: _onStreamMessage,
      );

  agora.MusicContentCenterEventHandler get _contentCenterEventHandler => agora.MusicContentCenterEventHandler(
          onLyricResult: (String requestId, int songCode, String lyricUrl, agora.MusicContentCenterStatusCode errorCode) {
        _agoraMusicLyricCallback?.call('$songCode', lyricUrl);
      }, onPreLoadEvent: (String requestId, int songCode, int percent, String lyricUrl, agora.PreloadStatusCode status,
              agora.MusicContentCenterStatusCode errorCode) {
        _agoraMusicPreloadCallback?.call(songCode, percent, convertPreloadStatusCode(status), '', lyricUrl);
      });

  agora.MediaPlayerSourceObserver get _mediaPlayerSourceObserver => agora.MediaPlayerSourceObserver(
      onPlayerSourceStateChanged: (agora.MediaPlayerState state, agora.MediaPlayerError ec) async {
        localPlayerState = state;
        if (state == agora.MediaPlayerState.playerStateOpenCompleted) {
          localPlayerDuration = await _mediaPlayer?.getDuration() ?? 0;
          await _mediaPlayer?.play();
          if (_localRoomMute) {
            await _mediaPlayer?.mute(_localRoomMute);
          }
        }
        switch (state) {
          case agora.MediaPlayerState.playerStateIdle:
            _audioMixingStateCallback?.call(AudioMixingStateCode.UnKnown, AudioMixingReason.OK);
            break;
          case agora.MediaPlayerState.playerStateOpening:
            break;
          case agora.MediaPlayerState.playerStateOpenCompleted:
            break;
          case agora.MediaPlayerState.playerStatePlaying:
            _audioMixingStateCallback?.call(AudioMixingStateCode.Playing, AudioMixingReason.OK);
            break;
          case agora.MediaPlayerState.playerStatePaused:
            _audioMixingStateCallback?.call(AudioMixingStateCode.Paused, AudioMixingReason.OK);
            break;
          case agora.MediaPlayerState.playerStatePlaybackCompleted:
          case agora.MediaPlayerState.playerStatePlaybackAllLoopsCompleted:
            _audioMixingStateCallback?.call(AudioMixingStateCode.PlayEnded, AudioMixingReason.OK);
            break;
          case agora.MediaPlayerState.playerStateStopped:
            _audioMixingStateCallback?.call(AudioMixingStateCode.Stopped, AudioMixingReason.OK);
            break;
          case agora.MediaPlayerState.playerStatePausingInternal:
            break;
          case agora.MediaPlayerState.playerStateStoppingInternal:
            break;
          case agora.MediaPlayerState.playerStateSeekingInternal:
            break;
          case agora.MediaPlayerState.playerStateGettingInternal:
            break;
          case agora.MediaPlayerState.playerStateNoneInternal:
            break;
          case agora.MediaPlayerState.playerStateDoNothingInternal:
            break;
          case agora.MediaPlayerState.playerStateSetTrackInternal:
            break;
          case agora.MediaPlayerState.playerStateFailed:
            _audioMixingStateCallback?.call(AudioMixingStateCode.Failed, AudioMixingReason.UnKnown);
            break;
        }
      },
      onPositionChanged: onPositionChanged);

  @override
  Future<void> preloadEffect(int soundId, String filePath) async {
    try {
      await _engineEx.preloadEffect(soundId: soundId, filePath: filePath);
    } on Exception catch (e) {}
  }

  @override
  Future<void> unloadEffect(int soundId) async {
    try {
      await _engineEx.unloadEffect(soundId);
    } on Exception catch (e) {}
  }

  @override
  Future<String> getAgoraLyric(String songCode) async {
    return await _musicContentCenter?.getLyric(songCode: int.parse(songCode)) ?? '';
  }

  @override
  Future<bool> isAgoraMusicPreloaded(int songCode) async {
    return await _musicContentCenter?.isPreloaded(songCode) ?? false;
  }

  @override
  Future<void> preloadAgoraMusic(int songCode) async {
    try {
      await _musicContentCenter?.preload(songCode);
    } catch (e) {
      print(e);
      return Future.value(Void);
    }
  }

  @override
  Future<void> initMusicContentCenter(String appId, String rtmToken, int uid) async {
    if (_musicContentCenter == null) {
      _musicContentCenter = _engineEx.getMusicContentCenter();
      _musicContentCenter!.registerEventHandler(_contentCenterEventHandler);

      _musicContentCenter!.initialize(agora.MusicContentCenterConfiguration(
        appId: appId,
        token: rtmToken,
        mccUid: uid,
      ));
    } else {
      _musicContentCenter!.renewToken(rtmToken);
    }
  }

  @override
  Future<void> setAgoraMusicLyricCallback(AgoraMusicLyricCallback callback) async {
    _agoraMusicLyricCallback = callback;
    return Future.value(Void);
  }

  @override
  Future<void> setAgoraMusicPreloadCallback(AgoraMusicPreloadCallback callback) async {
    _agoraMusicPreloadCallback = callback;
    return Future.value(Void);
  }

  // index:1 伴奏 0 原唱
  @override
  Future<void> setAudioTrackIndex(int index) async {
    try {
      return await _mediaPlayer?.selectAudioTrack(index);
    } catch (e) {
      print(e);
      return Future.value(Void);
    }
  }

  @override
  int get audioPlayOutDelay => _audioPlayOutDelay;

  @override
  agora.MediaPlayer? get mediaPlayer => _mediaPlayer;

  Future<void> _initMediaPlayer(String? resourceID) async {
    _mediaPlayer = (resourceID?.isEmpty ?? true) ? await _engineEx.createMediaPlayer() : await _musicContentCenter?.createMusicPlayer();
    if (_mediaPlayer == null) {
      rtcLog('startAudioMixing error, _musicContentCenter is null can not create MediaPlayer');
      return;
    }
    _mediaPlayer!.registerPlayerSourceObserver(_mediaPlayerSourceObserver);

    adjustAudioMixingVolume(0, 50); // 默认播放音量设为50%
  }

  @override
  String? get mainChannelName => _channelName;

  @override
  Future<void> setPushDirectAudioEnable(bool enable) => Future.value();

  @override
  Future<void> setSubscribeAudioBlacklist({required List<int> uidList, required int uidNumber}) =>
      _engineEx.setSubscribeAudioBlocklist(uidList: uidList, uidNumber: uidNumber);

  @override
  Future<void> renewToken(String token) {
    if (token.isEmpty) {
      return Future.value();
    }
    return _engineEx.renewToken(token);
  }

  @override
  agora.RtcEngineEx? get engineEx => _engineEx;

  @override
  Future<void> sendSEI(Uint8List data, int dataLength, {int? channelType}) async {
    try {
      await engineEx?.sendStreamMessage(streamId: dataStreamId, data: data, length: data.length);
    } on Exception catch (e) {
      rtcLog('sendSEI exception: $e');
    }
  }

  /// 监听流信息
  Future<void> _onStreamMessage(agora.RtcConnection connection, int remoteUid, int streamId, Uint8List data, int length, int sentTs) async {
    rtcLog('onStreamMessage, remoteUid: $remoteUid, streamId:$streamId, ktvRole: $ktvRole, length: $length, sentTs: $sentTs');
    if (data.isNotEmpty) {
      try {
        Map map = jsonDecode(utf8.decode(data));
        if (map['cmd'] == 'setLrcTime') {
          // KTV合唱模式逻辑理论上不应该在这处理，历史原因，暂时兼容下
          parseLrcTime(streamId, map);
        } else {
          SEICallback?.call('$streamId', data);
        }
      } catch (e) {
        rtcLog('_onStreamMessage exception: $e');
      }
    }
  }

  @override
  Future<int> getNetworkTime() async {
    return getNtpTime();
  }
}
