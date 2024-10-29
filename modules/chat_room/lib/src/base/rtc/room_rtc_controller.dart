import 'dart:async';
import 'dart:io';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/room_rtc_extra.dart';
import 'package:chat_room/src/base/player/rtc_music_player.dart';
import 'package:chat_room/src/base/voice_profile.dart';
import 'package:chat_room/src/ktv/ktv_music_controller.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/music/playlist/music_playlist_manager.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/shared.dart';
import 'package:synchronized/synchronized.dart';

/// 房间模块Rtc的控制器
class RoomRtcController {
  static const _agoraVolumeIndicationInterval = 500;

  /// static 房间直接踩房，双引擎切换互斥
  static final _engineLock = Lock();

  static Completer<bool>? _completer;

  static Completer<bool>? get completer => _completer;

  bool _initialize = false;

  bool get initialized => _initialize;

  RtcEngine? _engine;

  RtcEngine? get engine => _engine;

  AudioProfile audioProfile = AudioProfile.MusicHighQualityStereo;
  AudioScenario audioScenario = AudioScenario.ChatRoomEntertainment;

  int _inflexion = 0;

  int get inflexion => _inflexion;

  final ChatRoomData room;

  bool? _pendingMuteLocalAudioStream;
  bool? _pendingOpenBackgroundMode;
  bool? _pendingSetMute;
  bool? _pendingEnableVad;
  final Map<int, bool> _pendingMuteRemoteAudioStream = {};
  CapturedAudioFrameCallback? _pendingCapturedAudioDataCallback;

  int? rtcType;

  RtcMultiChannel? _rtcChannel;

  AudioLocalError? _audioLocalError;
  AudioLocalState? _audioLocalState;

  RoomRtcController(this.room);

  initEngine(String token, RtcUseDelegate useDelegate) async {
    await _engineLock.synchronized(() async {
      if (_initialize) return;

      _completer = Completer();
      _completer!.future.timeout(const Duration(seconds: 10), onTimeout: () {
        _setCompleter(false);
        return false;
      });

      rtcType = room.currentRtcType;

      Log.d('rtc-engine initEngine sdk begin->${room.currentRtcType} token->$token');

      EngineConfig config;
      if (RtcBizConfig.rtcTypeZego == rtcType) {
        ChannelProfile profile;
        if (audioScenario == AudioScenario.GameStreaming) {
          profile = ChannelProfile.LiveBroadcasting;
        } else {
          profile = ChannelProfile.General;
        }
        _engine = RtcEngine.get(RtcEngineEnum.Zego);
        config = RtcBizConfig.zegoConfig..profile = profile;
      } else {
        _engine = RtcEngine.get(RtcEngineEnum.Agora);
        config = RtcBizConfig.agoraConfig
          ..profile = ChannelProfile.LiveBroadcasting
          ..isTestEnv = System.debug;
      }

      if (System.debug) {
        RtcEngine.debug = true;
        Fluttertoast.showCenter(msg: 'RTC: ${_engine!.getTag()}');
      }

      _audioLocalError = null;
      _audioLocalState = null;

      await _engine!.initEngine(config);
      await updateRoomRtcMode();

      /// 说猜房语言识别需要RTC原始音频数据，设置码率相关参数
      if (ChatRoomUtil.isSpeakGuess(room.config) || ChatRoomUtil.isGrabMic(room.config) || room.isKtvRoom || room.isKtvChorusRoom) {
        _engine!.engineInterface.uploadAacBytes = false;
        await _engine!.registerAudioFrameObserver();
        if (room.isKtvRoom || room.isKtvChorusRoom) {
          // ktv房间需要接入打分器，因此也需要RTC原始音频数据
          await _engine!.setRecordingAudioFrameParameters(sampleRate: 48000, channel: 1, mode: 0, samplesPerCall: 480);
        } else {
          await _engine!.setRecordingAudioFrameParameters(sampleRate: 16000, channel: 1, mode: 0, samplesPerCall: 1024);
        }
      } else {
        /// 配置开关是否将音频文件数据上传到服务端
        final connectivityResult = Util.connectivityResult;
        bool isOpenUploadAac = false;
        if (connectivityResult == ConnectivityResult.wifi) {
          if (AppConfig.uploadAacRids.isNotEmpty) {
            // Log.printD('----------------------AppConfig.uploadAacRids：${AppConfig.uploadAacRids}');
            /// 如果有房间白名单，只管房间白名单
            if (AppConfig.uploadAacRids.contains(room.config?.rid ?? -1)) {
              isOpenUploadAac = true;
            }
          } else if (AppConfig.openUploadAac) {
            // Log.printD('----------------------AppConfig.openUploadAac：${AppConfig.openUploadAac}');
            /// 没有下发房间白名单，才根据uid白名单处理
            isOpenUploadAac = true;
          } else {
            isOpenUploadAac = false;
          }
        }
        Log.d('----------------------isOpenUploadAac：$isOpenUploadAac');
        if (isOpenUploadAac) {
          _engine!.engineInterface.uploadAacBytes = true;
          await _engine!.registerAudioFrameObserver(uid: room.config?.uid ?? 0, rid: room.config?.rid ?? 0);
          await _engine!.setRecordingAudioFrameParameters(sampleRate: 16000, channel: 1, mode: 0, samplesPerCall: 2048);
        }
      }
      try {
        await _engine!.enableWebSdkInteroperability(true);
      } catch (e) {
        Log.d(e);
      }
      await _engine!.setChannelProfile(ChannelProfile.LiveBroadcasting);
      _engine!.useDelegate?.dispose();
      _engine!.useDelegate = useDelegate;
      await _engine!.disableVideo();
      await _engine!.setClientRole(ClientRole.Audience);
      await _engine!.enableAudioVolumeIndication(_agoraVolumeIndicationInterval, 3, true);
      if (Platform.isIOS) {
        // 保持AVAudioSession的active状态，避免影响unity游戏的背景音乐
        // 要在joinChannel之前调用
        await engine!.setParameters('{"che.audio.keep.audiosession":true}');
        // 修复在房，被系统声音打断后，听不到房间声音问题，通过参数设定重新链接，不通过下发
        await engine!.setParameters('{"che.audio.restartWhenInterrupted":true}');
        if (room.isKtvChorusRoom ?? false) {
          // GAME_STREAMING 场景下，使用媒体音量播放
          // KTV房默认使用 GAME_STREAMING
          audioScenario = AudioScenario.GameStreaming;
        }
      }
      Log.d('setAudioProfile profile=$audioProfile,scenario=$audioScenario');

      /// 依据不同的端上设备和不同的房型，客户端会设置不同的声音偏好设置。
      // 调用的声网API：setAudioProfile（AudioProfile profile, AudioScenario scenario）
      // profile 全都为 MusicHighQualityStereo
      // scenario取值：
      // 1. GameStreaming： iOS/Win32设备/音乐房/KTV
      // 2. ShowRoom ： 其他
      await _engine!.setAudioProfile(audioProfile, audioScenario);
      await _engine!.enableAudio();
      await _engine!.setDefaultAudioRouteToSpeakerPhone(true);
      await _engine!.joinRoom(token, '${room.realRid}', Session.uid);
      if (RtcBizConfig.rtcTypeZego != room.currentRtcType) {
        /// Zego的SEI数据需要通过视频流，所以Zego不执行此方法
        await _engine!.muteAllRemoteVideoStreams(true);
      }
      await ChatRoomUtil.setEarMonitoringToConfig();

      if (RtcBizConfig.rtcTypeAgora == room.currentRtcType) {
        await _engine!.setAgoraMusicPreloadCallback((int songCode, int percent, PreloadStatusCode status, String msg, String lyricUrl) {
          room.emit(RoomConstant.Event_AGORA_Music_Download, {
            'songCode': '$songCode',
            'percent': '$percent',
            'status': '${status.index}',
            'msg': msg,
            'lyricUrl': lyricUrl,
          });
        });
        await _engine!.setAgoraMusicLyricCallback((songCode, lyricUrl) {
          room.emit(RoomConstant.Event_AGORA_Music_Lyric, {'songCode': songCode, 'lyricUrl': lyricUrl});
        });
      }

      _initialize = true;
      _cancelSpeakerTimer();
      _startSpeakerTimer();

      if (_pendingMuteLocalAudioStream != null) {
        await muteLocalAudioStream(_pendingMuteLocalAudioStream!);
      }
      if (_pendingOpenBackgroundMode != null) {
        openBackgroundMode(_pendingOpenBackgroundMode!);
      }
      if (_pendingSetMute != null) {
        await setMute(_pendingSetMute!);
      }
      if (_pendingEnableVad != null) {
        enableVad(_pendingEnableVad!);
      }
      if (_pendingMuteRemoteAudioStream.isNotEmpty == true) {
        _pendingMuteRemoteAudioStream.forEach((key, value) {
          muteRemoteAudioStream(key, value);
        });
      }

      if (_pendingCapturedAudioDataCallback != null) {
        setAudioDataHandler(_pendingCapturedAudioDataCallback!);
      }

      if (_inflexion > 0) {
        await setVoiceEffect(_inflexion);
      }

      _addListener();
      _setCompleter(true);
      Log.d('rtc-engine initEngine sdk end->$rtcType token->$token');
    });
  }

  Future<void> updateRoomRtcMode() async {
    await _engine?.setRoomMode(RTCRoomMode.Default);
  }

  syncVoiceEffect(int inflexion) async {
    if (!_initialize) return;
    if (_inflexion != inflexion) {
      _inflexion = inflexion;
      await setVoiceEffect(inflexion);
    }
  }

  bool isSpeaker(int uid) {
    if (!_initialize) return false;
    return _engine!.rtcSpeaker.speakers.containsKey(uid);
  }

  Map<int, int> speakersWithTime() {
    if (!_initialize) return const <int, int>{};
    return _engine!.rtcSpeaker.speakersWithTime;
  }

  Map<int, bool> get speakers {
    if (!_initialize) return const <int, bool>{};
    return _engine!.rtcSpeaker.speakers;
  }

  Set<int> get mutedUserIds {
    if (!_initialize) return const <int>{};
    return _engine!.rtcSpeaker.mutedUserIds;
  }

  addMutedUserId(int id) {
    if (!_initialize) return;
    _engine!.rtcSpeaker.mutedUserIds.add(id);
  }

  removeMutedUserId(int id) {
    if (!_initialize) return;
    _engine!.rtcSpeaker.mutedUserIds.remove(id);
  }

  /// 设置变声
  /// 0:重置（无变声）
  /// 1:如花
  /// 2:香肠嘴
  /// 3:熊二
  /// 4:猪八戒
  Future<bool> setVoiceEffect(int effect) async {
    return await _engineLock.synchronized(() async {
      Log.d('setVoiceEffect effect: $effect, _initialize: $_initialize');
      if (!_initialize) {
        return false;
      }

      VoiceProfile? voiceProfile = VoiceProfile.getProfile(effect, rtcType);
      if (voiceProfile != null) {
        await _engine!.setVoiceProfile(pitch: voiceProfile.pitch, equalization: voiceProfile.equalization);
        return true;
      } else {
        return false;
      }
    });
  }

  _addListener() {
    _engine!.addConnectionStateChangeCallback(_connectionCallback);
    _engine!.addLocalAudioStateChangeCallback(_localAudioStateChangeCallback);
    _engine!.addMixingStateChangedCallback(_audioMixingStateCallback);
    _engine!.addWarningCallback(_warningCallback);
    _engine!.addErrorCallback(_errorCallback);
  }

  _audioMixingStateCallback(AudioMixingStateCode state, AudioMixingReason reason) {
    if (state == AudioMixingStateCode.Playing) {
      Log.d('onAudioMixing startAudioMixing/resumeAudioMixing success.[710]');
      if (!RtcAudioPlayer.instance.isRelease) {
        RtcAudioPlayer.instance.onPrepared();
      }
    } else if (state == AudioMixingStateCode.PlayEnded) {
      Log.d('onAudioMixingFinished, isPlaying: ${KtvMusicController.isPlaying}, uid: ${room.config?.ktvInfo?.currentSong?.uid}, '
          'totalTime: ${KtvMusicController.totalTime}, currentMixingPosition: ${KtvMusicController.currentMixingPosition}');

      if (room.isKtvRoom &&
          KtvMusicController.isPlaying &&
          (Session.uid == room.config?.ktvInfo?.currentSong?.uid || (KtvMusicController.isChorus)) &&
          (KtvMusicController.totalTime - KtvMusicController.currentMixingPosition).abs() <= 5000 &&
          KtvMusicController.totalTime > 0) {
        KtvMusicController.setIsPlaying(false);
        if (Session.uid == room.config?.ktvInfo?.currentSong?.uid) {
          Log.d('onAudioMixingFinished endsing');
          KtvRepo.endSing(Session.uid, room.rid, KtvMusicController.currentSongId);
        }
      } else {
        Log.d(
            'onAudioMixingFinished, isKtvRoom: ${room.isKtvRoom}, background.isRelease: ${MusicController.isRelease},musicRoom.release=${MusicPlayListManager.inst.player.isRelease}');
        if (!(room.isKtvRoom || room.isKtvChorusRoom)) {
          if (!MusicController.isRelease && MusicController.isPlaying) {
            MusicController.playNextMusic(auto: true);
          } else if (!MusicPlayListManager.inst.player.isRelease && RtcAudioPlayer.instance.isPrepared) {
            MusicPlayListManager.inst.handlePlayComplete();
          }
        }
      }
    } else if (state == AudioMixingStateCode.Failed) {
      Log.d('onAudioMixingError');
      if (reason == AudioMixingReason.TooFrequentCall) {
        Fluttertoast.showToast(msg: K.busy_operation_please_wait);
        return;
      }

      if (!(room.isKtvRoom || room.isKtvChorusRoom)) {
        if (!MusicController.isRelease && MusicController.isPlaying) {
          MusicController.playNextMusic(auto: true);
        } else if (!MusicPlayListManager.inst.player.isRelease) {
          MusicPlayListManager.inst.handlePlayError();
        }
      }
    }
  }

  void _localAudioStateChangeCallback(AudioLocalError error, AudioLocalState state) async {
    Log.d('_localAudioStateChangeCallback:$error, $state');

    _audioLocalError = error;
    _audioLocalState = state;

    if (room.role == ClientRole.Broadcaster) {
      if (state == AudioLocalState.Failed) {
        if (error == AudioLocalError.DeviceNoPermission) {
          // 申请权限
          bool result = await ChatRoomUtil.checkAudioAuthorization();
          if (result == true) {
            _audioLocalError = null;
            _audioLocalState = null;
          }
        } else if (error == AudioLocalError.DeviceBusy) {
          Fluttertoast.showToast(msg: K.room_rtc_devicebusy, gravity: ToastGravity.CENTER);
        } else {
          // 提示异常
          Fluttertoast.showToast(msg: K.room_agora_audio_error, gravity: ToastGravity.CENTER);
        }
      }
    }
  }

  void _connectionCallback(state, reason) {
    if (state == ConnectionStateType.Reconnecting) {
      //onConnectionInterrupted
      //        Fluttertoast.showToast(
      //            msg: R.string('network_suspend_retry'), gravity: ToastGravity.CENTER);
    } else if (state == ConnectionStateType.Disconnected) {
      if (reason == ConnectionChangedReason.InvalidToken) {
        Fluttertoast.showToast(msg: K.room_rtc_invalidtoken, gravity: ToastGravity.CENTER);
      } else {
        // Fluttertoast.showToast(msg: K.room_rtc_disconnected, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _warningCallback(WarningCode warn) async {
    Log.d('rtc-engine error callback:$warn ');
    if (warn == WarningCode.PublisherError) {
      Fluttertoast.showToast(msg: K.room_rtc_publisher_error, gravity: ToastGravity.CENTER);
    } else if (warn == WarningCode.TokenWillExpire) {
      renewToken();
    }
  }

  void addRecordStateCallback(CapturedDataRecordStateUpdate? callback) {
    if (callback == null) return;
    engine!.addCaptureDataRecordStateCallback(callback);
  }

  void removeRecordStateCallback(CapturedDataRecordStateUpdate? callback) {
    if (callback == null) return;
    engine!.removeCaptureDataRecordStateCallback(callback);
  }

  Future<void> startRecordingCapturedData(RecordConfig config) async {
    return await engine!.startRecordingCapturedData(config);
  }

  ChannelMediaRelayConfiguration? getMediaRelayConfiguration() {
    if (!_initialize) return null;
    return engine!.getMediaRelayConfiguration();
  }

  Future<void> stopRecordingCapturedData() async {
    return await engine!.stopRecordingCapturedData();
  }

  _clearListener() {
    if (!_initialize) return;
    _engine?.removeConnectionStateChangeCallback(_connectionCallback);
    _engine?.removeLocalAudioStateChangeCallback(_localAudioStateChangeCallback);
    _engine?.removeMixingStateChangedCallback(_audioMixingStateCallback);
    _engine?.removeWarningCallback(_warningCallback);
    _engine?.removeErrorCallback(_errorCallback);
  }

  Future<void> setClientRole(ClientRole role) async {
    Log.d('rtc-engine: room_rtc_controller switch setClientRole->$role');
    if (!_initialize) return;
    await renewToken();
    return _engine?.setClientRole(role);
  }

  Future<void> renewToken() async {
    Log.d('rtc-engine: room_rtc_controller renewToken');
    if (!_initialize || RtcBizConfig.rtcTypeZego != room.currentRtcType) return;
    String? token = await _engine?.useDelegate?.renewToken?.call();
    if (token != null) {
      await _engine?.renewToken(token);
    }
    return;
  }

  void _startSpeakerTimer() {
    if (!_initialize) return;
    _engine?.rtcSpeaker.startSpeakerTimer();
  }

  void _cancelSpeakerTimer() {
    if (!_initialize) return;
    _engine?.rtcSpeaker.cancelSpeakerTimer();
  }

  void recoverMutedUser(int uid, {bool force = false}) {
    if (!_initialize) return;
    _engine?.rtcSpeaker.recoverMutedUser(uid, force: force);
  }

  /// 设置房间主频道麦上用户
  void setSubPubChannel(List<RoomPosition>? positions) {
    if (positions == null || positions.isEmpty) {
      return;
    }
    if (!_initialize) return;
    List<int> pubUids = positions.map((e) => e.uid).where((e) => e > 0).toList();
    var pubChannel = SubChannel.pub(pubUids);
    _engine?.setSubPubChannel(pubChannel);
  }

  /// 设置私有子频道集合
  void setSubPrivateChannel(List<SubChannel> privateChannel) {
    if (!_initialize) return;
    _engine?.setSubPrivateChannel(privateChannel);
  }

  Future<void> syncSubChannelStreamState() async {
    if (!_initialize) return;
    return await _engine?.syncSubChannelStreamState();
  }

  void _setCompleter(bool success) {
    if (_completer != null && !_completer!.isCompleted) {
      _completer!.complete(success);
    }
    _completer = null;
  }

  Future<void> destroy() async {
    Log.d('rtc-engine room control try destroy->$rtcType, lock:${_engineLock.locked}');
    await _engineLock.synchronized(() async {
      if (_initialize == false) return;
      _engine?.useDelegate?.dispose();
      _engine?.useDelegate = null;
      _cancelSpeakerTimer();
      _clearListener();
      _audioLocalError = null;
      _audioLocalState = null;
      _setCompleter(false);
      rtcType = null;
      _initialize = false;
      ChatRoomUtil.pkRelayDestRid = 0;
      ChatRoomUtil.talentRelayDestRid = 0;
      ChatRoomUtil.subChannelId = 0;
      MusicController.destroy();
      await _engine?.stopAudioMixing();
      await _engine?.unRegisterAudioFrameObserver();
      await _engine?.stopChannelMediaRelay();
      await _engine?.leaveChannel();
      await _engine?.destroy();
      Log.d('rtc-engine room control real destroy->$rtcType');
    });
  }

  void enableVad(bool enableVad) {
    if (!_initialize) {
      _pendingEnableVad = enableVad;
      return;
    }
    _pendingEnableVad = null;
    _engine?.enableVad = enableVad;
  }

  void setVadCheckInterval(int second) {
    _engine?.setVadCheckInterval(second);
  }

  void syncPullExtraStream() async {
    if (!_initialize) return;
    RoomRtcExtra? extra = room.config?.rtcExtra;
    var list = _convertUserStream(extra);
    Log.d('rtc-engine room control syncPullExtraStream->$list');
    _engine?.syncPullExtraStream(list);
  }

  List<UserStream>? _convertUserStream(RoomRtcExtra? extra) {
    if (extra == null || extra.extraList.isEmpty) return null;
    return extra.extraList.map((e) => UserStream(e.uid, e.rid, streamID: e.streamID, mic: e.mic, zegoLinkType: e.zegoLinkType)).toList();
  }

  Future<void> muteLocalAudioStream(bool mute) async {
    if (!_initialize) {
      _pendingMuteLocalAudioStream = mute;
      return;
    }
    _pendingMuteLocalAudioStream = null;
    await _engine?.muteLocalAudioStream(mute);
  }

  void openBackgroundMode(bool isBackgroundMusicMode) {
    if (!_initialize) {
      _pendingOpenBackgroundMode = isBackgroundMusicMode;
      return;
    }
    _pendingOpenBackgroundMode = null;
    _engine?.openBackgroundMode = isBackgroundMusicMode;
  }

  Future<void> setMute(bool value) async {
    if (!_initialize) {
      _pendingSetMute = value;
      return;
    }
    _pendingSetMute = null;
    await _engine?.setMute(value);
  }

  void checkLocalAudioState() {
    // 可能的错误提示
    if (_engine?.mute == false && room.role == ClientRole.Broadcaster) {
      if (_audioLocalState == AudioLocalState.Failed && _audioLocalError != null) {
        if (_audioLocalError == AudioLocalError.DeviceBusy) {
          Fluttertoast.showToast(msg: K.room_rtc_devicebusy, gravity: ToastGravity.CENTER);
        } else if (_audioLocalError != AudioLocalError.Ok) {
          // 提示异常
          Fluttertoast.showToast(msg: K.room_agora_audio_error, gravity: ToastGravity.CENTER);
        }
      }
    }
  }

  Future<int?> muteRemoteAudioStream(int uid, bool muted) async {
    if (!_initialize) {
      _pendingMuteRemoteAudioStream[uid] = muted;
      return -1;
    }
    _pendingMuteRemoteAudioStream.remove(uid);
    return await _engine?.muteRemoteAudioStream(uid, muted);
  }

  /// 停止/开始接收音频流
  Future<void> muteAllRemoteAudioStreams(bool mute) async {
    await _engine?.muteAllRemoteAudioStreams(mute);
  }

  /// 设置监听原始音频数据，设置为null取消监听
  void setAudioDataHandler(CapturedAudioFrameCallback? callback) {
    if (!_initialize) {
      _pendingCapturedAudioDataCallback = callback;
      return;
    }
    _engine?.setAudioDataHandler(callback);
  }

  Future<void> startAudioMixing(String filePath, bool loopback, bool replace, int cycle, {int startPos = 0, String? resourceID}) async {
    if (!_initialize) {
      Log.d('rtc-engine startAudioMixing not initialize,check your code.');
      return;
    }
    return await _engine?.startAudioMixing(filePath, loopback, replace, cycle: cycle, startPos: startPos, resourceID: resourceID);
  }

  Future<void> resumeAudioMixing() async {
    if (!_initialize) {
      Log.d('rtc-engine resumeAudioMixing not initialize,check your code.');
      return;
    }
    return await _engine?.resumeAudioMixing();
  }

  Future<void> setAudioMixingPosition(int pos) async {
    if (!_initialize) {
      Log.d('rtc-engine setAudioMixingPosition not initialize,check your code.');
      return;
    }
    return await _engine?.setAudioMixingPosition(pos);
  }

  Future<void> adjustAudioMixingVolume(int volume) async {
    if (!_initialize) {
      Log.d('rtc-engine adjustAudioMixingVolume not initialize,check your code.');
      return;
    }
    return await _engine?.adjustAudioMixingVolume(volume);
  }

  Future<void> adjustRecordingSignalVolume(int volume) async {
    if (!_initialize) {
      Log.d('rtc-engine adjustRecordingSignalVolume not initialize,check your code.');
      return;
    }
    return await _engine?.adjustRecordingSignalVolume(volume);
  }

  Future<void> setAudioEffectPreset(AudioEffectPreset preset) async {
    if (!_initialize) {
      Log.d('rtc-engine setAudioEffectPreset not initialize,check your code.');
      return;
    }
    return await _engine?.setAudioEffectPreset(preset);
  }

  Future<int?> audioTrackCount() async {
    if (!_initialize) {
      Log.d('rtc-engine audioTrackCount not initialize,check your code.');
      return 0;
    }
    return await _engine?.audioTrackCount();
  }

  /// 设置音轨 原声 or 伴奏
  Future<void> setAudioTrackIndex(int index) async {
    if (!_initialize) {
      Log.d('rtc-engine setAudioTrackIndex not initialize,check your code.');
      return;
    }
    return await _engine?.setAudioTrackIndex(index);
  }

  Future<void> pauseAudioMixing() async {
    if (!_initialize) {
      Log.d('rtc-engine pauseAudioMixing not initialize,check your code.');
      return;
    }
    return await _engine?.pauseAudioMixing();
  }

  Future<void> stopAudioMixing() async {
    if (!_initialize) {
      Log.d('rtc-engine stopAudioMixing not initialize,check your code.');
      return;
    }
    return await _engine?.stopAudioMixing();
  }

  Future<void> addMixingStateChangedCallback(AudioMixingStateCallback callback) async {
    if (!_initialize) {
      Log.d('rtc-engine addMixingStateChangedCallback not initialize,check your code.');
      return;
    }
    return await _engine?.addMixingStateChangedCallback(callback);
  }

  Future<void> removeMixingStateChangedCallback(AudioMixingStateCallback callback) async {
    if (!_initialize) {
      Log.d('rtc-engine removeMixingStateChangedCallback not initialize,check your code.');
      return;
    }
    return await _engine?.removeMixingStateChangedCallback(callback);
  }

  Future<int> getAudioMixingCurrentPosition() async {
    if (!_initialize) {
      Log.d('rtc-engine getAudioMixingCurrentPosition not initialize,check your code.');
      return 0;
    }
    return (await _engine?.getAudioMixingCurrentPosition()) ?? 0;
  }

  Future<int> getAudioMixingDuration() async {
    if (!_initialize) {
      Log.d('rtc-engine getAudioMixingDuration not initialize,check your code.');
      return 0;
    }
    return (await _engine?.getAudioMixingDuration()) ?? 0;
  }

  Future<void> setAudioMixingPitch(int pitch) async {
    await _engine?.setAudioMixingPitch(pitch);
  }

  Future<AudioOutputRouting?> getAudioRouteType() async {
    return await _engine?.getAudioRouteType();
  }

  /// 创建子频道
  Future<void> createRtcChannel(String channel) async {
    if (_engine == null || false == _initialize) {
      return;
    }
    if (_rtcChannel != null) {
      Log.d('rtc-engine roomRtc createRtcChannel _rtcChannel!=null,destroy before.');
      await _rtcChannel?.leaveChannel();
      await _rtcChannel?.destroy();
    }
    _rtcChannel = await _engine?.createRtcChannel(channel);
    Log.d('rtc-engine roomRtc createRtcChannel _rtcChannel->$_rtcChannel');
  }

  /// 多频道是否存在
  bool get isMultiChannelExist => _rtcChannel != null;

  /// 多频道关闭静音
  Future<void> multiChannelMuteAllRemoteAudioStreams(bool mute) async {
    await _rtcChannel?.muteAllRemoteAudioStreams(mute);
  }

  /// 多频道离开房间
  Future<void> multiChannelLeaveChannel() async {
    await _rtcChannel?.leaveChannel();
  }

  /// 多频道销毁
  Future<void> multiChannelDestroy() async {
    await _rtcChannel?.destroy();
    Log.d('rtc-engine roomRtc multiChannelDestroy');
    _rtcChannel = null;
  }

  /// 多频道加入房间
  Future<void> multiChannelJoinChannel(String token, String optionalInfo, int optionalUid, ChannelMediaOptions options) async {
    await _rtcChannel?.joinChannel(token, optionalInfo, optionalUid, options);
  }

  /// 多频道设置角色
  Future<void> multiChannelSetClientRole(ClientRole role) async {
    await _rtcChannel?.setClientRole(role);
  }

  Future<void> multiChannelAdjustPlaybackVolume(int volume) async {
    await _rtcChannel?.adjustPlaybackSignalVolume(volume);
  }

  int multiChannelGetPlaybackSignalVolume() {
    return _rtcChannel?.getPlaybackSignalVolume() ?? 0;
  }

  Future<void> setKtvRole(KtvClientRole role, {String? subChannelToken}) async {
    if (!_initialize) {
      Log.d('rtc-engine setKtvRole not initialize,check your code.');
      return;
    }
    if (subChannelToken?.isNotEmpty ?? false) _engine?.useDelegate?.subChannelToken = () => subChannelToken ?? '';
    await _engine?.setKtvRole(role);
  }

  Future<void> setSubscribeAudioBlacklist({List<int>? uidList, int uidNumber = 0}) async {
    if (!_initialize) {
      Log.d('rtc-engine setKtvRole not initialize,check your code.');
      return;
    }
    await _engine?.setSubscribeAudioBlacklist(uidList: uidList ?? [], uidNumber: uidNumber);
  }

  void _errorCallback(ErrorCode err) {
    Log.d('rtc-engine error callback:${err.errorMsg().toString()}');
    PulseLog.instance.log(RtcExceptionBody(err.errorMsg().toString(), 'room'));
  }
}
