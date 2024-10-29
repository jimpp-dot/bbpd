// ignore_for_file: empty_catches

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:synchronized/synchronized.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

import 'zego_channel.dart';
import 'zego_converter.dart';
import 'zego_copyrighted_music_controller.dart';

/// 即构的实现
/// https://doc-zh.zego.im/article/3550
/// 全局唯一实现，该对象一直存在于内存
///
class ZegoEngine with RtcEngineInterface, ZegoResourceCache {
  /// ** 版权方，其对应的枚举值信息，请联系 ZEGO 商务咨询 **
  final ZegoCopyrightedMusicVendorID vendorID = ZegoCopyrightedMusicVendorID.ZegoCopyrightedMusicVendor2;
  final ZegoCopyrightedMusicBillingMode mode = ZegoCopyrightedMusicBillingMode.Count;

  final bool debugSound = false;

  @override
  bool get isInitialize => _initialize;

  @override
  late RtcBridge bridge;

  bool _initialize = false;

  ZegoExpressEngine get _engine => ZegoExpressEngine.instance;

  String? _currentRoomID;
  int _myUid = 0;

  /// maxUid为当前系统支持的最大uid，
  /// 主唱混流：麦克风（main）+伴奏（Aux），需要设置不同ID，main为主唱的uid，Aux为uid+maxUid，
  /// 观众端监听混流中每路流的音量大小，用于麦圈的展示，过滤掉主唱的Aux（>maxUid）
  int maxUid = 1000000000;

  /// key 为 roomID
  final Map<String, List<ZegoStream>?> _roomStream = {};

  ClientRole? _role;
  MixStreamConfig? _mixStreamConfig;

  /// zego KTV合唱
  KtvClientRole _ktvRole = KtvClientRole.None;

  /// 合唱中的角色
  static const String MIX_STREAM_SURFIX = '_ktv_mix';

  /// 主唱混流的streamID后缀
  static const String ACCOMPANY_STREAM_SURFIX = '_ktv_accompany';

  /// 主唱伴奏流的streamID后缀
  ZegoMixerTask? _mixerTask;

  /// 混流推流task
  String? _currentAuxStreamID;

  /// Aux路推流ID
  Timer? _syncProcessTimer;

  /// 伴奏暂停时，没有进度变化的回调，需要timer定时同步状态给合唱的人
  UidWithElapsedCallback? _roomUserJoinCallback;
  UserOfflineCallback? _roomUserOfflineCallback;
  ConnectionStateCallback? _connectionStateCallback;
  AudioMixingStateCallback? _audioMixingStateCallback;
  WarningCallback? _warningCallback;
  ErrorCallback? _errorCallback;
  LocalAudioStateChangeCallback? _localAudioStateChangeCallback;
  CapturedDataRecordStateUpdate? _recordStateUpdateCallback;
  PlayerRecvSEICallback? _playerRecvSEICallback;
  NetworkQualityCallback? _networkQualityCallback;
  ZegoMusicDownloadProgress? musicDownloadProgress;

  ZegoRoomState? _currentRoomState;

  /// 当前房间模式
  RTCRoomMode? _currentRoomMode;

  /// 当前房间推的流
  String? _currentStreamID;

  /// 当前房间正在拉的流
  final Set<ZegoStream> _playStream = <ZegoStream>{};

  /// 外部房间的流
  List<UserStream>? _extraStreamList;

  /// 目标态，外部房间的流，保持还没有连接成功的数据
  List<UserStream>? _targetExtraStreamList;

  /// 被屏蔽说话的用户id
  final Set<int> _mutedPlayUid = <int>{};

  ZegoMediaPlayer? _mediaPlayer0;

  ZegoCopyrightedMusic? copyrightedMusic;

  // 是否上传aac数据到服务端，默认不上传
  bool _uploadAacBytes = false;

  @override
  set uploadAacBytes(bool value) => _uploadAacBytes = value;

  @override
  bool get uploadAacBytes => _uploadAacBytes;

  final _mediaPlayerLock = Lock();

  Future<ZegoMediaPlayer> get _mediaPlayer async {
    return _mediaPlayerLock.synchronized(() async {
      if (_mediaPlayer0 == null) {
        _mediaPlayer0 = await _engine.createMediaPlayer();
        // _mediaPlayer0?.setAudioTrackMode(ZegoMediaPlayerAudioTrackMode.Multiple);
        _setMediaCallBack();
      }
      return _mediaPlayer0!;
    });
  }

  /// 当前是否闭麦，从而不上传声波信息
  bool _isMute = false;

  ZegoAudioEffectPlayer? _audioEffectPlayer0;

  final _audioEffectLock = Lock();

  Future<ZegoAudioEffectPlayer> get _audioEffectPlayer async {
    return await _audioEffectLock.synchronized(() async {
      if (_audioEffectPlayer0 == null) {
        rtcLog('Zego createAudioEffectPlayer');
        _audioEffectPlayer0 = await _engine.createAudioEffectPlayer();

        /// 音效播放状态回调
        ZegoExpressEngine.onAudioEffectPlayStateUpdate =
            (ZegoAudioEffectPlayer audioEffectPlayer, int audioEffectID, ZegoAudioEffectPlayState state, int errorCode) {
          rtcLog('Zego audioEffect id=$audioEffectID,state=$state,errorCode=$errorCode');
        };
      }
      return _audioEffectPlayer0!;
    });
  }

  String? _mainRoomToken;

  ZegoMultiRoom? _zegoMultiRoom0;

  ZegoMultiRoom get _zegoMultiRoom {
    _zegoMultiRoom0 ??= ZegoMultiRoom(this);
    return _zegoMultiRoom0!;
  }

  /// 处理上层不同RTC，时序问题，对于声网
  /// 1.registerAudioFrameObserver
  /// 2.setRecordingAudioFrameParameters
  ZegoAudioFrameParam? _zegoAudioFrameParam;
  bool? _needRegisterAudioFrameObserver;

  final Set<RtcEngineEventHandler> _rtcEngineEventHandlers = {};

  @override
  void registerEventHandler(RtcEngineEventHandler eventHandler) {
    _rtcEngineEventHandlers.add(eventHandler);
  }

  @override
  void unregisterEventHandler(RtcEngineEventHandler eventHandler) {
    _rtcEngineEventHandlers.remove(eventHandler);
  }

  @override
  Future<void> initEngine(EngineConfig config) async {
    if (_initialize) {
      await destroy();
    }

    await ZegoExpressEngine.getVersion().then((value) => rtcLog('Zego SDK Version: $value'));

    _setZegoEventCallback();

    if (config.enableMultiRoom == true) {
      ZegoExpressEngine.setRoomMode(ZegoRoomMode.MultiRoom);
    }

    await ZegoExpressEngine.createEngineWithProfile(
      ZegoEngineProfile(
        int.parse(config.appId),
        channelProfile(config.profile!),
        appSign: config.appSign,
        enablePlatformView: config.enablePlatformView,
      ),
    );

    /// 支持Aux流publish，KTV主唱模式下需要将伴奏流单独publish，该接口只能在engine初始化时调用，期间不能更改
    await enableAuxAudioIO(true);

    /// 开始或停止流量控制。
    await _engine.enableTrafficControl(true, ZegoTrafficControlProperty.AdaptiveAudioBitrate);
    _initialize = true;
  }

  @override
  Future<void> joinRoom(String token, String channelName, int optionalUid, {String? optionalInfo}) async {
    _currentRoomID = channelName;
    _myUid = optionalUid;
    await leaveChannel();
    ZegoUser user = ZegoUser.id('$optionalUid');
    var config = ZegoRoomConfig.defaultConfig();
    config.isUserStatusNotify = true;
    config.token = token;
    _mainRoomToken = token;
    await _engine.loginRoom(channelName, user, config: config);
    // await initMusicCenter(_myUid);
  }

  @override
  Future<void> leaveChannel() async {
    if (_currentRoomID == null) {
      return;
    }
    await _engine.logoutRoom(_currentRoomID);
    return;
  }

  /// 版权音乐
  Future<void> initMusicCenter(int uid) async {
    if (uid > 0) {
      /** 3. 创建 CopyrightedMusic 对象 */
      copyrightedMusic = await _engine.createCopyrightedMusic();
      ZegoUser user = ZegoUser.id(uid.toString());
      ZegoCopyrightedMusicConfig config1 = ZegoCopyrightedMusicConfig(user);
      ZegoCopyrightedMusicInitResult result = await copyrightedMusic!.initCopyrightedMusic(config1);
      rtcLog(' initCopyrightedMusic result error code=====> ${result.errorCode}');
    }
  }

  /// [songId] 音乐 songID
  @override
  Future<ZegoMusicResource?> requestResource(String songID, {int resourceType = 1, bool useCache = true}) async {
    if (copyrightedMusic == null) return null;
    int now = DateTime.now().millisecondsSinceEpoch;
    rtcLog(' requestResource =====> $songID');

    /// 缓存
    if (useCache) {
      ZegoMusicResource? zegoMusicResource = getResource(songID, resourceType: resourceType);
      if (zegoMusicResource != null) {
        rtcLog('requestResource: $songID use cache');
        return zegoMusicResource;
      }
    }

    var config = ZegoCopyrightedMusicRequestConfig(songID, mode, vendorID: vendorID);

    /// 获取包含人声的歌曲资源
    ZegoCopyrightedMusicRequestResourceResult result =
        await copyrightedMusic!.requestResource(config, convertZegoCopyrightedMusicResourceType(resourceType));
    // result.errorCode: 错误码，详细请参考错误码文档 https://doc-zh.zego.im/article/5641。
    // result.resource: JSON 字符串，歌曲资源信息。
    rtcLog(' requestResource errorCode:${result.errorCode}');
    rtcLog(' requestResource resource:${result.resource}');
    try {
      if (result.errorCode == 0) {
        ZegoMusicResource zegoMusicResource = ZegoMusicResource.fromJson(jsonDecode(result.resource)['data']);
        zegoMusicResource.requestTime = now;
        saveResource(songID, zegoMusicResource, resourceType: resourceType);
        return zegoMusicResource;
      }
    } catch (e) {
      rtcLog(' requestResource fromJson error:$e');
    }

    return null;
  }

  @override
  Future<int> preloadMusic(String songCode, String resourceId) async {
    if (copyrightedMusic == null || resourceId.isEmpty) return -1;

    ZegoCopyrightedMusicDownloadResult downloadResult = await copyrightedMusic!.download(resourceId);
    if (downloadResult.errorCode == 0) {
      // 歌曲下载成功，可以进行播放等操作
      rtcLog(' downloadMusic success:$resourceId');
    } else {
      // 歌曲下载失败
      rtcLog(' downloadMusic failed:$resourceId, errorCode:${downloadResult.errorCode}');
    }
    return downloadResult.errorCode;
  }

  @override
  Future<String> getLyric(String songCode) async {
    if (copyrightedMusic == null) return '';
    ZegoCopyrightedMusicGetLrcLyricResult result = await copyrightedMusic!.getLrcLyric(songCode, vendorID: vendorID);
    // result.errorCode: 错误码，详细请参考错误码文档 https://docs.zegocloud.com/en/5548.html。
    // result.lyrics: JSON 字符串，逐行歌词信息。
    rtcLog(' getLyric songCode===>$songCode, result===> ${result.errorCode}, ');
    rtcLog(' getLyric :${result.lyrics}, ');
    if (result.errorCode == 0) {
      return result.lyrics;
    } else {
      return '';
    }
  }

  @override
  void setMusicDownloadCallback(ZegoMusicDownloadProgress? callback) {
    musicDownloadProgress = callback;
  }

  @override
  Future<bool> isMusicPreloaded(String songCode) async {
    if (copyrightedMusic == null) return false;

    bool result = await copyrightedMusic!.queryCache(
      songCode,
      ZegoCopyrightedMusicType.ZegoCopyrightedMusicAccompaniment,
      vendorID: vendorID,
    );
    rtcLog('isMusicPreloaded :$result');
    return result;
  }

  @override
  Future<void> adjustAudioMixingVolume(int id, int volume) async {
    return (await _mediaPlayer).setVolume(volume);
  }

  @override
  Future<void> adjustRecordingSignalVolume(int volume) async {
    return _engine.setCaptureVolume(volume);
  }

  @override
  void audioRouteCallback(AudioRouteCallback callback) {
    ZegoExpressEngine.onAudioRouteChange = (ZegoAudioRoute audioRoute) {
      callback.call(audioOutputRouting(audioRoute));
    };
  }

  @override
  void audioVolumeIndicationCallback(AudioVolumeCallback callback) {
    /// 本地采集音频声浪回调。
    ZegoExpressEngine.onCapturedSoundLevelUpdate = (double soundLevel) async {
      if (debugSound) {
        rtcLog(' self soundLevel = $soundLevel,_isMute=$_isMute, _role=$_role');
      }

      if (_role == ClientRole.Broadcaster && !_isMute) {
        var volumeInfo = AudioVolumeInfo(0, soundLevel.toInt(), 1);
        callback.call([volumeInfo], soundLevel.toInt());
      }
    };

    /// 远端拉流音频声浪回调。
    ZegoExpressEngine.onRemoteSoundLevelUpdate = (Map<String, double> soundLevels) {
      if (debugSound) {
        rtcLog('remote soundLevels = $soundLevels');
      }

      List<ZegoStream>? streamList = _roomStream[_currentRoomID];
      List<AudioVolumeInfo> volumeInfos = [];
      int totalVolume = 0;
      soundLevels.forEach((key, value) {
        String? uid;
        // 在当房间面
        if (streamList != null) {
          try {
            uid = streamList.firstWhere((e) => e.streamID == key).user.userID;
          } catch (e) {}
        }

        if (uid == null) {
          // 在外部连麦里面找
          try {
            uid = _extraStreamList?.firstWhere((e) => e.streamID == key).uid.toString();
          } catch (e) {}

          if (debugSound) {
            rtcLog('remote extra Stream=$key,uid=$uid');
          }
        }

        if (uid == null) {
          return;
        }
        var uidInt = int.tryParse(uid);
        if (uidInt == null) {
          return;
        }
        var volumeInfo = AudioVolumeInfo(uidInt, value.toInt(), 1);
        volumeInfos.add(volumeInfo);
        totalVolume += value.toInt();
      });
      if (debugSound) {
        rtcLog('remote volumeInfos.len = ${volumeInfos.length}');
      }
      callback.call(volumeInfos, totalVolume);
    };

    /// 混流中的每条单流的声浪更新通知。
    ZegoExpressEngine.onMixerSoundLevelUpdate = (Map<int, double> soundLevels) {
      List<AudioVolumeInfo> volumeInfos = [];
      int totalVolume = 0;
      soundLevels.forEach((uid, value) {
        int uidInt = uid;
        if (uidInt > 0 && uidInt < maxUid) {
          var volumeInfo = AudioVolumeInfo(uidInt, value.toInt(), 1);
          volumeInfos.add(volumeInfo);
          totalVolume += value.toInt();
        }
      });
      if (volumeInfos.isNotEmpty) {
        callback.call(volumeInfos, totalVolume);
      }
    };
  }

  @override
  void connectionStateChangeCallback(ConnectionStateCallback callback) {
    _connectionStateCallback = callback;
  }

  @override
  Widget createVideoRenderWidget(int uid, {bool local = false, int facing = 0, Map<String, dynamic> args = const <String, dynamic>{}}) {
    return const SizedBox.shrink();
  }

  @override
  Future<void> destroy() async {
    _rtcEngineEventHandlers.clear();
    if (_mediaPlayer0 != null) {
      await _engine.destroyMediaPlayer(_mediaPlayer0!);
      _mediaPlayer0 = null;
    }
    await _destroyAudioEffect();
    if (_currentStreamID != null) {
      await _engine.stopPublishingStream(channel: ZegoPublishChannel.Main);
    }
    _extraStreamList?.forEach((element) {
      _engine.stopPlayingStream(element.streamID!);
      _engine.setPlayStreamBufferIntervalRange(element.streamID!, -1, -1);
    });
    for (var element in _playStream) {
      _engine.stopPlayingStream(element.streamID);
      _engine.setPlayStreamBufferIntervalRange(element.streamID, -1, -1);
    }
    _stopSyncProcessTimer();
    stopPublishAuxStream();
    stopMixStream();

    clearResource();

    if (copyrightedMusic != null) {
      await _engine.destroyCopyrightedMusic(copyrightedMusic!);
      copyrightedMusic = null;
    }

    _extraStreamList = null;
    _targetExtraStreamList = null;
    _role = null;
    _mixStreamConfig = null;
    _currentStreamID = null;
    _isMute = false;
    _currentRoomState = null;
    _roomStream.clear();
    _playStream.clear();
    _mutedPlayUid.clear();
    _initialize = false;

    _roomUserJoinCallback = null;
    _roomUserOfflineCallback = null;
    _connectionStateCallback = null;
    _audioMixingStateCallback = null;
    _warningCallback = null;
    _errorCallback = null;
    _localAudioStateChangeCallback = null;
    _recordStateUpdateCallback = null;
    _playerRecvSEICallback = null;
    _networkQualityCallback = null;
    musicDownloadProgress = null;

    _clearMediaCallBack();
    _clearZegoEventCallback();
    return ZegoExpressEngine.destroyEngine();
  }

  void _clearZegoEventCallback() {
    ZegoExpressEngine.onRoomTokenWillExpire = null;
    ZegoExpressEngine.onRoomStateUpdate = null;
    ZegoExpressEngine.onPublisherStateUpdate = null;
    ZegoExpressEngine.onPlayerStateUpdate = null;
    ZegoExpressEngine.onRoomStreamUpdate = null;
    ZegoExpressEngine.onAudioRouteChange = null;
    ZegoExpressEngine.onPlayerRecvSEI = null;
    ZegoExpressEngine.onNetworkQuality = null;
    ZegoExpressEngine.onCapturedDataRecordStateUpdate = null;
    ZegoExpressEngine.onProcessCapturedAudioData = null;
    ZegoExpressEngine.onAudioEffectPlayStateUpdate = null;
    ZegoExpressEngine.onLocalDeviceExceptionOccurred = null;
    ZegoExpressEngine.onCapturedSoundLevelUpdate = null;
    ZegoExpressEngine.onRemoteSoundLevelUpdate = null;
    ZegoExpressEngine.onMixerSoundLevelUpdate = null;
    ZegoExpressEngine.onDownloadProgressUpdate = null;

    unregisterMusicListeners();
  }

  Future<void> _destroyAudioEffect() async {
    return await _audioEffectLock.synchronized(() async {
      if (_audioEffectPlayer0 != null) {
        await _engine.destroyAudioEffectPlayer(_audioEffectPlayer0!);
        _audioEffectPlayer0 = null;
      }
    });
  }

  @override
  Future<void> disableAudio() async {
    return await _engine.enableAudioCaptureDevice(false);
  }

  @override
  Future<void> disableVideo() async {
    await _engine.enableCamera(false);
    return await _engine.mutePublishStreamVideo(true);
  }

  @override
  Future<void> enableAudio() async {
    /// 音频模块默认开启，如果要关闭使用轻量级的 [enableLocalAudio]
    return;
  }

  /// 启动声浪监控，支持开启进阶功能。
  @override
  Future<void> enableAudioVolumeIndication(int interval, int smooth, bool reportVad) async {
    ZegoSoundLevelConfig soundLevelConfig = ZegoSoundLevelConfig(interval, reportVad);
    return await _engine.startSoundLevelMonitor(config: soundLevelConfig);
  }

  @override
  Future<void> enableInEarMonitoring(bool enabled) async {
    rtcLog('${getTag()} enableInEarMonitoring->$enabled');
    await _engine.enableHeadphoneMonitor(enabled);
    if (enabled == true) {
      await _engine.setAudioCaptureStereoMode(ZegoAudioCaptureStereoMode.Always);
    }
  }

  @override
  Future<void> enableLocalAudio(bool enabled) async {
    return await _engine.enableAudioCaptureDevice(enabled);
  }

  @override
  Future<void> enableVideo() async {
    return await _engine.enableCamera(true);
  }

  @override
  Future<void> enableWebSdkInteroperability(bool enabled) async {
    return;
  }

  @override
  void errorCallback(ErrorCallback callback) {
    _errorCallback = callback;
  }

  @override
  void firstRemoteVideoFrameCallback(callback) {
    return;
  }

  @override
  void captureDataRecordStateCallback(CapturedDataRecordStateUpdate callback) {
    _recordStateUpdateCallback = callback;
  }

  @override
  Future<int> getAudioMixingCurrentPosition(int id) async {
    return (await _mediaPlayer).getCurrentProgress();
  }

  @override
  Future<int> getAudioMixingDuration(String path) async {
    return (await _mediaPlayer).getTotalDuration();
  }

  //
  // public void enableDTX(boolean enable)
  //     是否开启离散音频包发送
  //     注意:
  //
  // 1.推流前调用有效。以 RTC 方式推流，此接口才会生效。
  // 2.可以和 enableVAD 配合使用。
  // 3.开启离散音频包发送可以在关闭麦克风或者静音的状态下，停止音频包的发送，节省用户流量。
  // 4.如果为音频单流(非混流)转推 CDN，开启此选项将导致 CDN 在设定时间内未收到数据包认为流关闭而断开连接，所以此种情况不建议开启。
  // 5.SDK 默认关闭该特性。
  // Parameters:
  // enable - true 开启，推流中检测为静音的数据包不发送；false 关闭，推流中的静音数据包照常发送。默认是 false。
  //
  // public void enableVAD(boolean enable)
  //     是否开启语音活动检测
  //     注意：在推流前调用，只有纯 UDP 方案才可以调用此接口.
  //
  // Parameters:
  // enable - true 开启; false 关闭, 默认关闭

  /// 刷新token
  @override
  Future<void> renewToken(String token) async {
    if (_currentRoomID == null) {
      return;
    }
    _mainRoomToken = token;
    return _engine.renewToken(_currentRoomID!, token);
  }

  /// 设置混流方式下，多路流的配置
  @override
  Future<void> setMixStreamConfig(MixStreamConfig config) async {
    _mixStreamConfig = config;
  }

  @override
  void localAudioStateCallback(LocalAudioStateChangeCallback callback) {
    _localAudioStateChangeCallback = callback;
  }

  @override
  void mixingStateChangedCallback(AudioMixingStateCallback callback) {
    _audioMixingStateCallback = callback;
    return;
  }

  @override
  Future<void> muteMicrophone(bool mute) async {
    _isMute = mute;
    if (_initialize) {
      try {
        await _engine.muteMicrophone(mute);
      } catch (e) {
        rtcLog('muteMicrophone error:$e');
      }
    }
    return;
  }

  @override
  Future<void> muteRoom(bool mute) async {
    if (!_initialize) return;
    rtcLog('muteRoom: $mute');
    muteLocalMediaPlayer(mute);
    await _engine.muteAllPlayStreamAudio(mute);
  }

  @override
  Future<void> muteLocalMediaPlayer(bool mute) async {
    rtcLog('muteLocalMediaPlayer: $mute');
    if (!_initialize) return;

    ZegoMediaPlayer player = await _mediaPlayer;
    await player.muteLocal(mute);
  }

  @override
  Future<void> muteAllRemoteAudioStreams(bool muted) async {
    //muteAllPlayAudioStreams禁用后才可调用 mutePlayStreamAudio 函数控制是否接收单条音频数据。
    //muteAllPlayStreamAudio方法必须要先打开才能再调用mutePlayStreamAudio
    rtcLog('muteAllRemoteAudioStreamsInit: $_initialize');
    if (_initialize) {
      try {
        rtcLog('muteAllRemoteAudioStreams: $muted');
        _engine.muteAllPlayAudioStreams(muted);

        //由于单独开启某一路流是有stop和start的，所以开启的时候需要全部start一下
        if (!muted) {
          _roomStream.forEach((key, value) {
            value?.forEach((element) {
              if (!_playStreamContains(element)) {
                muteRemoteAudioStream(int.parse(element.user.userID), muted);
              }
            });
          });
        }
      } catch (e) {}
    }
    return;

    // _roomStream.forEach((key, value) {
    //   value?.forEach((element) {
    //     _engine.mutePlayStreamAudio(element.streamID, muted);
    //   });
    // });
    // return;
  }

  @override
  Future<void> muteAllRemoteVideoStreams(bool muted) async {
    _roomStream.forEach((key, value) {
      value?.forEach((element) {
        _engine.mutePlayStreamVideo(element.streamID, muted);
      });
    });
    return;
  }

  @override
  Future<void> muteLocalAudioStream(bool muted) async {
    if (_initialize) {
      try {
        _isMute = muted;
        await _engine.mutePublishStreamAudio(muted);
      } catch (e) {
        rtcLog('muteLocalAudioStream error:$e');
      }
    }
    return;
  }

  @override
  Future<int> muteRemoteAudioStream(int uid, bool muted) async {
    if (muted) {
      _mutedPlayUid.add(uid);
    } else {
      _mutedPlayUid.remove(uid);
    }
    if (_currentRoomState != ZegoRoomState.Connected) {
      return 0;
    }
    ZegoStream? stream;
    try {
      stream = _roomStream[_currentRoomID]?.firstWhere((element) => element.user.userID == uid.toString());
    } catch (e) {}
    // if (stream != null) {
    //   await _engine.mutePlayStreamAudio(stream.streamID, muted);
    //   return 1;
    // }
    if (null == stream) {
      return -1;
    }
    if (_initialize) {
      try {
        await _engine.mutePlayStreamAudio(stream.streamID, muted);
        if (muted) {
          rtcLog('muteRemoteAudioStream stopPlayingStream->${stream.streamID}');
          await _engine.stopPlayingStream(stream.streamID);
          _engine.setPlayStreamBufferIntervalRange(stream.streamID, -1, -1);
          _mutedPlayUid.add(uid);
          _playStreamRemove(stream);
        } else {
          rtcLog('muteRemoteAudioStream startPlayingStream->${stream.streamID}');
          _playStream.add(stream);
          _mutedPlayUid.remove(uid);
          ZegoPlayerConfig config = ZegoPlayerConfig.defaultConfig();
          config.roomID = _currentRoomID;
          await _engine.mutePlayStreamAudio(stream.streamID, muted);
          await _engine.startPlayingStream(stream.streamID, config: config);
          await applyPlayBufferWithRoomMode(stream.streamID);
        }
      } catch (e) {}
    }
    return 0;
  }

  @override
  Future<void> pauseAudioMixing(int id) async {
    if (_initialize) {
      rtcLog('zego pauseAudioMixing $_mediaPlayer');
      await (await _mediaPlayer).pause();
    }
  }

  bool _isHttpUrl(String? url) {
    return url != null && (url.startsWith('http') || url.startsWith('https'));
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
    var player = await _audioEffectPlayer;
    var playCount = loopCount;
    if (loopCount == -1) {
      playCount = 0;
    } else if (loopCount == 0) {
      playCount = 1;
    }

    String filePath0 = filePath;
    if (_isHttpUrl(filePath)) {
      var file = await EffectFileManager.inst.saveFile(filePath);
      if (file == null) {
        return;
      }
      filePath0 = file.path;
    }

    rtcLog('Zego play Effect soundId=$soundId,loopCount=$loopCount,publish=$publish,filePath=$filePath');
    ZegoAudioEffectPlayConfig config = ZegoAudioEffectPlayConfig(playCount, publish == 1);
    await player.setVolume(soundId, 146);
    await player.start(soundId, path: filePath0, config: config);
  }

  @override
  Future<void> resumeAudioMixing(int id) async {
    rtcLog('zego media resume $_mediaPlayer');
    await (await _mediaPlayer).resume();
  }

  @override
  Future<void> setAudioEffectPreset(AudioEffectPreset preset) async {
    if (_initialize) {
      await _engine.setReverbPreset(reverbPreset(preset));
    }
    return;
  }

  @override
  Future<void> setAudioMixingPosition(int id, int pos) async {
    await (await _mediaPlayer).seekTo(pos);
  }

  @override
  Future<void> setRoomMode(RTCRoomMode mode) async {
    _currentRoomMode = mode;

    Map<String, String> advancedConfig = {
      'set_verbose': 'false',
      'prep_high_pass_filter': 'true',
    };
    // {
    //   'enforce_audio_loopback_in_sync': 'true',
    //   "enable_dtx": "true", // 是否开启 DTX，
    //   "enable_vad": "true" // 是否开启 VAD,目前这个不能在引擎之后动态设置，会影响到背景音乐的持续播放，先关闭
    //   'bluetooth_capture_only_voip': 'true',
    //   'max_channels': '20', // 同时最大可以拉取的流数量，取值范围(0, 50]
    //   超低延时模式，仅限合唱场景
    //   'ultra_low_latency': 'true',
    //   'enforce_audio_loopback_in_sync': 'true',
    //   高通滤波器
    //   'prep_high_pass_filter': 'false',
    //   混流对齐，仅限合唱场景
    //   'publish_stream_alignment': 'true',
    //   'is_stream_alignment': 'true',
    //   'set_verbose': 'false',
    //   'auxiliary_delay_mode':'0',  用于唱歌场景，自适应采集与渲染之间的延迟差异
    // }

    ZegoEngineConfig engineConfig = ZegoEngineConfig(advancedConfig: advancedConfig);
    switch (mode) {
      case RTCRoomMode.Default:
        break;
      case RTCRoomMode.ChatRoom:
        advancedConfig.addAll({
          'max_channels': '20',
          'bluetooth_capture_only_voip': 'true',
          'prep_high_pass_filter': 'true',
        });
        break;
      case RTCRoomMode.ChatRoom_KTV_Single:
        advancedConfig.addAll({
          'max_channels': '20',
          'bluetooth_capture_only_voip': 'true',
          'prep_high_pass_filter': 'false',
          'enforce_audio_loopback_in_sync': 'true',
          // 该配置仅限 官网 2022/08 月以后更新的版本，或者 Zego 提供的特定版本(0802 通过邮件发送）生效
          // 配置以后，需要手机先使用外放播放一段时长音频，以方便 SDK 获取设备的采集与渲染之间的延时差异
          // SDK 在获取差异以后，会自动在后续的音频采集与播放过程中，以获取到的差异为基准进行校正
          'auxiliary_delay_mode': '0'
        });
        break;
      case RTCRoomMode.ChatRoom_KTV_Chorus:
        advancedConfig.addAll({
          'max_channels': '20',
          'bluetooth_capture_only_voip': 'true',
          'prep_high_pass_filter': 'false',
          'enforce_audio_loopback_in_sync': 'true',
          'ultra_low_latency': 'true',
          'publish_stream_alignment': 'true',
          'is_stream_alignment': 'true',
          'volume_linear_gain': 'true',
        });
        break;
      default:
        break;
    }
    ZegoExpressEngine.setEngineConfig(engineConfig);
    return;
  }

  // 由于设置时机不同，所以不能与前面这个方法复用
  Future<void> applyPlayBufferWithRoomMode(String streamID) async {
    // 这个参数主要是影响拉流端的延迟与音质的表现，-1 为默认值
    // Zego 会在拉流侧设置一个类似缓冲池的 cache，min 决定了 cache 缓存的最短音频时长
    // max 会影响 cache 缓存的最长音频时长，当拉流侧网络存在抖动，导致网络时延大于 min
    // 则在感官上的表现，则是卡顿，因为此时 cache 内没有数据
    // 适当调高 min 的值会增强抗网络抖动的能力，但是也会增大整体的网络时延
    // 在单唱场景下，可以适当增加 min 值来保证歌唱的连续性
    if (_currentRoomMode == null) {
      return;
    }
    int minPlayBufferInterval = -1;
    int maxPlayBufferInterval = -1;
    switch (_currentRoomMode!) {
      case RTCRoomMode.Default:
      case RTCRoomMode.ChatRoom:
        // 麦下观众增加一下min，减少网络波动造成的卡顿，先临时在此加判断，后续抽成参数配置，可由上层配置
        minPlayBufferInterval = _role == ClientRole.Audience ? 500 : -1;
        maxPlayBufferInterval = -1;
        break;
      case RTCRoomMode.ChatRoom_KTV_Single:
        minPlayBufferInterval = 300;
        maxPlayBufferInterval = -1;
        break;
      case RTCRoomMode.ChatRoom_KTV_Chorus:
        // 为了保证合唱的参与者能够尽量对齐，不能让上限太高
        minPlayBufferInterval = 30;
        maxPlayBufferInterval = 150;
        break;
    }
    ZegoExpressEngine.instance.setPlayStreamBufferIntervalRange(streamID, minPlayBufferInterval, maxPlayBufferInterval);
  }

  @override
  // 修改了该方法的内部实现，将所有音频配置收束到该方法内，尽可能对齐声网配置方式、逻辑，无需单独调用 Zego 相关方法
  Future<void> setAudioProfile(AudioProfile profile, AudioScenario scenario) async {
    _setAudioConfigWithProfile(profile);
    applyScenario(scenario);
    return;
  }

  @override
  Future<void> setChannelProfile(ChannelProfile profile) async {
    // 已经在initEngine阶段设置过房间的场景
    return;
  }

  @override
  Future<void> setClientRole(ClientRole role) async {
    _role = role;
    if (_currentRoomState == ZegoRoomState.Connected) {
      _syncStream();
      _innerSyncPullExtraStream();
    }
    return;
  }

  @override
  Future<void> setKtvRole(KtvClientRole role) async {
    rtcLog('setKtvRole, old: $_ktvRole, newRole: $role');
    if (role.index != _ktvRole.index) {
      KtvClientRole oldRole = _ktvRole;
      _ktvRole = role;
      if (_currentRoomState == ZegoRoomState.Connected) {
        /// KTV角色切换，推流/拉流/混流/伴奏播放处理
        var player = await _mediaPlayer;
        switch (_ktvRole) {
          case KtvClientRole.LeadSinger:
            player.enableAux(false);
            // enableAuxAudioIO(true);
            break;
          case KtvClientRole.Chorus:
            player.enableAux(false);
            // enableAuxAudioIO(false);
            break;
          case KtvClientRole.Audience:
            player.enableAux(true);
            // enableAuxAudioIO(false);
            break;
          case KtvClientRole.None:
            player.enableAux(true);
            // enableAuxAudioIO(false);
            break;
        }

        if ((oldRole == KtvClientRole.Audience && _ktvRole != KtvClientRole.Audience) ||
            (oldRole != KtvClientRole.Audience && _ktvRole == KtvClientRole.Audience)) {
          /// 合唱观众和非合唱关注之间切换，需要把之前拉流的方式停掉
          for (var element in _playStream) {
            _engine.stopPlayingStream(element.streamID);
            _engine.setPlayStreamBufferIntervalRange(element.streamID, -1, -1);
          }
          _playStream.clear();
        }

        if ((oldRole != KtvClientRole.LeadSinger && oldRole != KtvClientRole.Chorus) &&
            (_ktvRole == KtvClientRole.LeadSinger || _ktvRole == KtvClientRole.Chorus)) {
          /// KTV主唱和伴唱，设置audio_device_mode为2，减少系统回声消除对人声的影响，减少延时
          String params = "{\"method\":\"express.audio.set_audio_device_mode\",\"params\":{\"mode\":2,\"channel\":0}}";
          String result = await _engine.callExperimentalAPI(params);
          rtcLog('set audio_device_mode 2, result: $result');
        } else if ((_ktvRole != KtvClientRole.LeadSinger && _ktvRole != KtvClientRole.Chorus) &&
            (oldRole == KtvClientRole.LeadSinger || oldRole == KtvClientRole.Chorus)) {
          /// 设置回默认值
          String mode = Platform.isIOS ? '3' : '6';
          String params = "{\"method\":\"express.audio.set_audio_device_mode\",\"params\":{\"mode\":$mode,\"channel\":0}}";
          String result = await _engine.callExperimentalAPI(params);
          rtcLog('set audio_device_mode $mode, result: $result');
        }

        _syncStream();
        if (_ktvRole == KtvClientRole.LeadSinger) {
          updateMixStream();
        }
        // _innerSyncPullExtraStream();
      }
    }
    return;
  }

  @override
  Future<void> setDefaultAudioRouteToSpeakerPhone(bool defaultToSpeaker) async {
    if (_initialize) {
      await _engine.setAudioRouteToSpeaker(defaultToSpeaker);
    }
    return;
  }

  @override
  Future<void> setEnableSpeakerphone(bool enabled) async {
    if (_initialize) {
      await _engine.setAudioRouteToSpeaker(enabled);
    }
    return;
  }

  @override
  Future<void> setInEarMonitoringVolume(int volume) async {
    return await _engine.setHeadphoneMonitorVolume(volume);
  }

  @override
  Future<void> setParameters(String param) async {
    return;
  }

  @override
  Future<void> setVideoEncoderConfiguration(VideoEncoderConfiguration config) async {
    return;
  }

  @override
  Future<void> setVoiceProfile({double? pitch, List<double>? equalization}) async {
    // double convertPitch = convertToZegoVoiceChangerParam(pitch);
    double? convertPitch = pitch;
    if (convertPitch != null) {
      ZegoVoiceChangerParam voiceChangerParam = ZegoVoiceChangerParam(convertPitch);
      await _engine.setVoiceChangerParam(voiceChangerParam);
    }
    if (equalization != null && equalization.isNotEmpty) {
      for (int i = 0; i < equalization.length; i++) {
        await _engine.setAudioEqualizerGain(i, equalization[i]);
      }
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
    var player = await _mediaPlayer;
    await player.stop();

    ZegoMediaPlayerLoadResourceResult result = ZegoMediaPlayerLoadResourceResult(0);

    // 后续由于接入 Zego 内置版权，所以传入的有可能是本地文件路径，或者是版权文件 resourceId，所以要先做判断
    if (path.isEmpty) {
      if (resourceID == null) {
        rtcLog('zego audio mixing start failed, please input path or resourceId');
        return;
      } else {
        result = await player.loadCopyrightedMusicResourceWithPosition(resourceID, startPos);
      }
    } else {
      result = await player.loadResource(path);
    }

    rtcLog('zego load resource result=${result.errorCode},path=$path');

    if (result.errorCode != 0) {
      return;
    }
    if (cycle == -1) {
      await player.enableRepeat(true);
    }
    await player.setProgressInterval(200);
    await player.start();
    if (noPublish == false) {
      /// 开启混音推流
      await player.enableAux(true);
    }
    if (startPos > 0) {
      await setAudioMixingPosition(id, startPos);
    }
    return;
  }

  @override
  Future<void> setAudioMixingPitch(int pitch) async {
    await (await _mediaPlayer).setVoiceChangerParam(
      ZegoMediaPlayerAudioChannel.All,
      ZegoVoiceChangerParam(convertAudioMixingPitch(pitch)),
    );
  }

  @override
  Future<void> startChannelMediaRelay(ChannelMediaRelayConfiguration channelMediaRelayConfiguration) async {
    // 不需要实现，通过syncPullExtraStream实现
    return;
  }

  @override
  Future<void> updateChannelMediaRelay(ChannelMediaRelayConfiguration channelMediaRelayConfiguration) async {
    /// 不需要实现，暂时只Agora支持
    return;
  }

  @override
  ChannelMediaRelayConfiguration? getMediaRelayConfiguration() {
    /// 不需要实现，暂时只Agora支持
    return null;
  }

  @override
  bool isMediaReplaySuccess(String destRid) {
    return false;
  }

  @override
  Future<void> syncPullExtraStream(List<UserStream>? streamList) async {
    /// 目前同一个房间只能有一种连麦模式.
    if (streamList?.isNotEmpty ?? false) {
      var userStream = streamList![0];
      if (userStream.zegoLinkType != 'stream') {
        rtcLog('syncPullExtraStream linkType not stream. return.');
        return;
      }
    }
    _targetExtraStreamList = streamList;
    if (_currentRoomState != ZegoRoomState.Connected) {
      return;
    }
    _innerSyncPullExtraStream();
  }

  void _innerSyncPullExtraStream() {
    // 新来的目标流为空？
    if (_targetExtraStreamList?.isEmpty ?? true) {
      _extraStreamList?.forEach((element) {
        rtcLog('syncPullExtraStream stopPlayingStream->${element.streamID}');
        _engine.stopPlayingStream(element.streamID!);
        _engine.setPlayStreamBufferIntervalRange(element.streamID!, -1, -1);
      });
      _extraStreamList = null;
      rtcLog('syncPullExtraStream clear all');
      return;
    }

    // 假设：_extraStreamList--> A 集合，streamList--> B 集合
    // 停止播放A不在B中的流
    // 播放B中不在A中的流
    // 赋值 A = B
    if (_extraStreamList?.isNotEmpty == true) {
      _extraStreamList!.removeWhere((element) {
        bool notContains = !_targetExtraStreamList!.contains(element);
        if (notContains) {
          rtcLog('syncPullExtraStream stopPlayingStream->${element.streamID}');
          _engine.stopPlayingStream(element.streamID!);
          _engine.setPlayStreamBufferIntervalRange(element.streamID!, -1, -1);
        }
        return notContains;
      });
    }

    for (var element in _targetExtraStreamList!) {
      if (_extraStreamList == null || !_extraStreamList!.contains(element)) {
        rtcLog('syncPullExtraStream startPlayingStream->${element.streamID}');
        ZegoPlayerConfig config = ZegoPlayerConfig.defaultConfig();
        config.roomID = _currentRoomID;
        _engine.startPlayingStream(element.streamID!, config: config);
        applyPlayBufferWithRoomMode(element.streamID!);
      }
    }

    _extraStreamList = _targetExtraStreamList;
    _extraStreamList?.forEach((e) {
      if (e.mic == 2) {
        _engine.mutePlayStreamAudio(e.streamID!, true);
      } else {
        _engine.mutePlayStreamAudio(e.streamID!, false);
      }
    });
    rtcLog('after syncPullExtraStream $_extraStreamList');
  }

  @override
  Future<void> startPreview() async {
    return;
  }

  @override
  Future<void> stopAllEffects() async {
    var player = await _audioEffectPlayer;
    await player.stopAll();
  }

  @override
  Future<void> stopAudioMixing(int id) async {
    await (await _mediaPlayer).stop();
  }

  @override
  Future<void> stopChannelMediaRelay() async {
    // 不需要实现
    return;
  }

  @override
  Future<void> stopEffect(int soundId) async {
    var player = await _audioEffectPlayer;
    await player.stop(soundId);
  }

  @override
  Future<void> stopPreview() async {
    return;
  }

  @override
  Future<void> switchCamera() async {
    return;
  }

  @override
  void userJoinedCallback(UidWithElapsedCallback callback) {
    _roomUserJoinCallback = callback;
  }

  @override
  void userOffline(UserOfflineCallback callback) {
    _roomUserOfflineCallback = callback;
  }

  @override
  void warningCallback(WarningCallback callback) {
    _warningCallback = callback;
  }

  @override
  Future<void> sendSEI(Uint8List data, int dataLength, {int? channelType}) async {
    ZegoPublishChannel channel = channelType == 2 ? ZegoPublishChannel.Aux : ZegoPublishChannel.Main;
    await _engine.sendSEI(data, dataLength, channel: channel);
  }

  @override
  void playerRecvSEICallback(PlayerRecvSEICallback callback) {
    _playerRecvSEICallback = callback;
  }

  @override
  networkQualityCallback(NetworkQualityCallback callback) {
    _networkQualityCallback = callback;
  }

  void _setZegoEventCallback() {
    ZegoExpressEngine.onRoomTokenWillExpire = (String roomID, int remainTimeInSecond) {
      rtcLog('zego 🚩 🚪 onRoomTokenWillExpire, roomID: $roomID, remainTimeInSecond=$remainTimeInSecond');
      _warningCallback?.call(WarningCode.TokenWillExpire);
    };

    /// 房间状态变化通知
    ZegoExpressEngine.onRoomStateUpdate = (String roomID, ZegoRoomState state, int errorCode, Map<String, dynamic> extendedData) {
      rtcLog('zego 🚩 🚪 Room state update, state: $state, errorCode: $errorCode, roomID: $roomID');
      if (_currentRoomID == roomID) {
        _currentRoomState = state;
        _connectionStateCallback?.call(connectionStateType(state), convertConnectionReason(errorCode));
        if (ZegoRoomState.Connected == state) {
          _syncStream();
          _innerSyncPullExtraStream();
        }
      } else if (_zegoMultiRoom.roomID == roomID) {
        _zegoMultiRoom.roomState = state;
      }
    };

    /// 推流状态回调
    ZegoExpressEngine.onPublisherStateUpdate =
        (String streamID, ZegoPublisherState state, int errorCode, Map<String, dynamic> extendedData) {
      rtcLog('zego 🚩 📤 Publisher state update, state: $state, errorCode: $errorCode, streamID: $streamID');
      if (state == ZegoPublisherState.NoPublish && errorCode != 0) {
        _warningCallback?.call(WarningCode.PublisherError);
        if (streamID.isNotEmpty && !streamID.endsWith(ACCOMPANY_STREAM_SURFIX) && !streamID.endsWith(MIX_STREAM_SURFIX)) {
          _currentStreamID = null;
        }
      } else if (state == ZegoPublisherState.Publishing) {
        if (streamID.isNotEmpty && !streamID.endsWith(ACCOMPANY_STREAM_SURFIX) && !streamID.endsWith(MIX_STREAM_SURFIX)) {
          _currentStreamID = streamID;
        }
        if (_ktvRole == KtvClientRole.LeadSinger) {
          updateMixStream();
        }
      }
    };

    /// 本地设备异常通知
    ZegoExpressEngine.onLocalDeviceExceptionOccurred = (ZegoDeviceExceptionType exceptionType, ZegoDeviceType deviceType, String deviceID) {
      rtcLog('zego 🚩 📤 onLocalDeviceExceptionOccurred: $exceptionType, deviceName: $deviceID');
      if (ZegoDeviceExceptionType.PermissionNotGranted == exceptionType) {
        if (deviceType == ZegoDeviceType.Microphone) {
          _localAudioStateChangeCallback?.call(AudioLocalError.DeviceNoPermission, AudioLocalState.Failed);
        }
      } else if (ZegoDeviceExceptionType.DeviceOccupied == exceptionType || exceptionType == ZegoDeviceExceptionType.SiriIsRecording) {
        _localAudioStateChangeCallback?.call(AudioLocalError.DeviceNoPermission, AudioLocalState.Failed);
      }
    };

    /// 拉流状态变更回调
    ZegoExpressEngine.onPlayerStateUpdate = (String streamID, ZegoPlayerState state, int errorCode, Map<String, dynamic> extendedData) {
      rtcLog('zego 🚩 📥 onPlayerStateUpdate, state: $state, errorCode: $errorCode, streamID: $streamID');
    };

    /// 相同房间内其他用户推的流增加或减少的通知。
    ZegoExpressEngine.onRoomStreamUpdate =
        (String roomID, ZegoUpdateType updateType, List<ZegoStream> streamList, Map<String, dynamic> extendedData) {
      if (RtcEngine.debug) {
        rtcLog(
            'zego 🚩 📥 onRoomStreamUpdate,currentRoom=$_currentRoomID,roomID:$roomID,updateType:$updateType,streamList.size:${streamList.length}');
      }

      List<ZegoStream> roomStreams = _roomStream[roomID] ?? [];
      bool chorusStreamChange = false;
      if (updateType == ZegoUpdateType.Add) {
        roomStreams.removeWhere((e) => streamList.any((element) => element.streamID == e.streamID));
        roomStreams.addAll(streamList);

        for (var element in streamList) {
          if (_isJoinedRoom(roomID)) {
            int? uid = int.tryParse(element.user.userID);
            if (_isChorusStream(element.streamID)) {
              chorusStreamChange = true;
            }
            if (_roomUserJoinCallback != null && uid != null && uid > 0) {
              _roomUserJoinCallback!.call(uid, 0);
            }
          }
        }
      } else if (updateType == ZegoUpdateType.Delete) {
        roomStreams.removeWhere((e) => streamList.any((element) => element.streamID == e.streamID));

        for (var element in streamList) {
          rtcLog('onRoomStreamUpdate stopPlayingStream->${element.streamID}');
          if (_isChorusStream(element.streamID)) {
            chorusStreamChange = true;
          }
          if (_playStreamContains(element)) {
            _engine.stopPlayingStream(element.streamID);
            _engine.setPlayStreamBufferIntervalRange(element.streamID, -1, -1);
            _playStreamRemove(element);
          }
          int? uid = int.tryParse(element.user.userID);
          if (_roomUserOfflineCallback != null && uid != null && uid > 0) {
            _roomUserOfflineCallback!.call(uid, UserOfflineReason.UnKnown);
          }
        }
      }
      _roomStream[roomID] = roomStreams;

      if (RtcEngine.debug) {
        for (var e in roomStreams) {
          rtcLog('zego updateType=$updateType,${e.streamID}');
        }
      }

      _printRoomStream();
      _syncStream();
      if (_ktvRole == KtvClientRole.LeadSinger && chorusStreamChange) {
        updateMixStream();
      }
    };

    /// 音频设备路由变更通知
    ZegoExpressEngine.onAudioRouteChange = (ZegoAudioRoute audioRoute) {
      rtcLog('zego onAudioRouteChange=$audioRoute');
    };

    /// 收到远端流的 SEI 内容
    ZegoExpressEngine.onPlayerRecvSEI = (String streamID, Uint8List data) async {
      _playerRecvSEICallback?.call(streamID, data);
      if (_ktvRole == KtvClientRole.Chorus) {
        try {
          /// 直接decode data，得到的数据有问题
          List<int> dataList = data.toList();
          Uint8List realData = Uint8List.fromList(dataList);
          PlayerSEIInfo playerSEIInfo = PlayerSEIInfo.fromUint8List(realData);

          int networkTime = await getNetworkTime();
          var player = await _mediaPlayer;
          int process = await player.getCurrentProgress();
          ZegoMediaPlayerState playerState = await player.getCurrentState();
          int state = (audioMixingState(playerState)).index;

          if (networkTime == 0 || playerSEIInfo.networkTime == 0) {
            return;
          }

          if (state != AudioMixingStateCode.Playing.index && state != AudioMixingStateCode.Paused.index) {
            return;
          }

          int processDelay = (networkTime - process) - (playerSEIInfo.networkTime - playerSEIInfo.process);
          int delay = _mixStreamConfig?.syncProcessDelay ?? 30;
          if (playerSEIInfo.playerState == AudioMixingStateCode.Playing.index && (processDelay > delay || processDelay < -delay)) {
            player.seekTo(process + processDelay);
          }
          if (playerSEIInfo.playerState != state) {
            if (playerSEIInfo.playerState == AudioMixingStateCode.Playing.index) {
              resumeAudioMixing(-1);
            } else if (playerSEIInfo.playerState == AudioMixingStateCode.Paused.index) {
              pauseAudioMixing(-1);
            }
          }
        } catch (e) {
          rtcLog('onPlayerRecvSEI, error: $e');
        }
      }
    };

    /// 房间内正在推流的用户的网络质量回调
    ZegoExpressEngine.onNetworkQuality = (userID, upstreamQuality, downstreamQuality) {
      _networkQualityCallback?.call(
        userID,
        convertStreamQualityLevel(upstreamQuality),
        convertStreamQualityLevel(downstreamQuality),
      );
    };

    registerMusicListeners();
  }

  /// KTV推流自己添加的对象，比对的是streamID
  bool _playStreamContains(ZegoStream element) => _playStream.where((e) => e.streamID == element.streamID).isNotEmpty;

  void _playStreamRemove(ZegoStream element) => _playStream.removeWhere((e) => e.streamID == element.streamID);

  bool _isJoinedRoom(String roomID) => _currentRoomID == roomID || _zegoMultiRoom.roomID == roomID;

  void _printRoomStream() {
    if (RtcEngine.debug) {
      _roomStream.forEach((key, value) {
        rtcLog('zego _printRoomStream roomID: $key, streamList.size: ${value?.length}');

        value?.forEach((element) {
          rtcLog('zego _printRoomStream ZegoStream->${element.print}');
        });
      });
    }
  }

  /// 同步当前推拉流状态
  void _syncStream() async {
    rtcLog('>>> syncStream role:$_role,roomState=$_currentRoomState');
    if (_role == null || _currentRoomState != ZegoRoomState.Connected) return;

    if (_role == ClientRole.Broadcaster) {
      String? targetPublishStreamID = bridge.rtcEngine.useDelegate?.publishStream;
      rtcLog('syncStream targetPublishStreamID=$targetPublishStreamID, _currentStreamID=$_currentStreamID');
      if (targetPublishStreamID != null && _currentStreamID != targetPublishStreamID) {
        await _engine.stopPublishingStream(channel: ZegoPublishChannel.Main);
        _currentStreamID = targetPublishStreamID;
        rtcLog('syncStream startPublishingStream streamID=$_currentStreamID,roomID=$_currentRoomID');
        // 在 ktv 合唱场景下，需要注意对主唱和合唱 两类角色进行流的对齐，需要处理 publishConfig 下的 forceSynchronousNetworkTime
        bool needSyncNetworkTime = _ktvRole == KtvClientRole.LeadSinger || _ktvRole == KtvClientRole.Chorus;
        var publisherConfig = ZegoPublisherConfig(roomID: _currentRoomID, forceSynchronousNetworkTime: needSyncNetworkTime ? 1 : 0);
        await _engine.startPublishingStream(_currentStreamID!, config: publisherConfig, channel: ZegoPublishChannel.Main);
      }
    } else if (_role == ClientRole.Audience && _currentStreamID != null) {
      rtcLog('syncStream stopPublishingStream streamID=$_currentStreamID');
      await _engine.stopPublishingStream(channel: ZegoPublishChannel.Main);
      _currentStreamID = null;
    }

    List<ZegoStream> currentRoomStreams = _roomStream[_currentRoomID] ?? [];

    rtcLog('syncStream room=$_currentRoomID,roomStreams.size=${currentRoomStreams.length}');

    if (_ktvRole == KtvClientRole.Audience) {
      /// 合唱观众：需要额外拉混音
      /// 混音SteamID不通过onRoomStreamUpdate回调，需要通过服务端额外下发的主唱StreamID进行拼接
      String? leadSingerStreamID = bridge.rtcEngine.useDelegate?.leadSingerStream;
      if (leadSingerStreamID != null && leadSingerStreamID.isNotEmpty) {
        String mixStreamID = '$leadSingerStreamID$MIX_STREAM_SURFIX';
        // 移除播放非当前领唱者的混流/合唱者的流
        _playStream.removeWhere((e) {
          bool removeOtherMix = e.streamID.endsWith(MIX_STREAM_SURFIX) && e.streamID != mixStreamID;
          if (removeOtherMix) {
            rtcLog('syncStream remove other ktv_mix->${e.streamID}');
          }
          bool removeMixContains = e.streamID == bridge.rtcEngine.useDelegate?.leadSingerStream || _isChorusStream(e.streamID);
          if (removeMixContains) {
            rtcLog('syncStream remove mix contains ->${e.streamID}');
          }
          if (removeOtherMix || removeMixContains) {
            _engine.stopPlayingStream(e.streamID);
            _engine.setPlayStreamBufferIntervalRange(e.streamID, -1, -1);
          }
          return removeOtherMix || removeMixContains;
        });
        bool hasMix = _playStream.any((element) => element.streamID == mixStreamID);
        if (!hasMix) {
          ZegoStream steam = ZegoStream(ZegoUser('', ''), mixStreamID, '');
          ZegoPlayerConfig config = ZegoPlayerConfig.defaultConfig();
          config.roomID = _currentRoomID;
          rtcLog('syncStream startPlayingStream->${steam.streamID}');
          _playStream.add(steam);
          _engine.startPlayingStream(steam.streamID, config: config);
          applyPlayBufferWithRoomMode(steam.streamID);
        }
      } else {
        _playStream.removeWhere((e) {
          bool isMix = e.streamID.endsWith(MIX_STREAM_SURFIX);
          if (isMix) {
            rtcLog('syncStream no ktv_mix remove cur->${e.streamID}');
            _engine.stopPlayingStream(e.streamID);
            _engine.setPlayStreamBufferIntervalRange(e.streamID, -1, -1);
          }
          return isMix;
        });
      }
    }

    for (var element in currentRoomStreams) {
      String streamID = element.streamID;
      int? uid;
      if (!streamID.endsWith(MIX_STREAM_SURFIX) && !streamID.endsWith(ACCOMPANY_STREAM_SURFIX)) {
        /// 非合唱观众：拉麦上所有人的麦克风流
        uid = int.tryParse(element.user.userID);

        if (_ktvRole == KtvClientRole.Audience) {
          /// KTV合唱模式下的观众（非主唱和合唱），由于拉了主唱的mix流，不再拉主唱和合唱的流
          if (element.streamID == bridge.rtcEngine.useDelegate?.leadSingerStream || _isChorusStream(element.streamID)) {
            uid = null;
          }
        }
      }

      if (uid != null) {
        bool? canSpeak = bridge.rtcEngine.useDelegate?.canSpeak?.call(uid);

        rtcLog(
            'syncStream play uid=$uid,canSpeak=$canSpeak,playContains=${_playStreamContains(element)},mutedContains=${_mutedPlayUid.contains(uid)}');
        // 拉流
        if (canSpeak != null && canSpeak == true && !_playStreamContains(element) && !_mutedPlayUid.contains(uid)) {
          _playStream.add(element);
          ZegoPlayerConfig config = ZegoPlayerConfig.defaultConfig();
          config.roomID = _currentRoomID;
          rtcLog('syncStream startPlayingStream->${element.streamID}');
          await _engine.startPlayingStream(element.streamID, config: config);
          applyPlayBufferWithRoomMode(element.streamID);
        }
      }
    }

    if (_ktvRole == KtvClientRole.LeadSinger) {
      /// 主唱还需要推伴奏流和混合流
      await startPublishAuxStream();
    } else {
      _stopSyncProcessTimer();
      await stopPublishAuxStream();
      await stopMixStream();
    }

    /// 同步拉取多房间流
    if (_zegoMultiRoom.roomID != null) {
      List<ZegoStream> multiRoomStreams = _roomStream[_zegoMultiRoom.roomID] ?? [];
      for (var element in multiRoomStreams) {
        int? uid = int.tryParse(element.user.userID);
        if (uid != null) {
          rtcLog(
              'syncStream zegoMultiRoom uid=$uid,playContains=${_playStreamContains(element)},muteAll=${_zegoMultiRoom.muteAllRemoteAudio}');
          // 拉流
          if (!_playStreamContains(element)) {
            _playStream.add(element);
            ZegoPlayerConfig config = ZegoPlayerConfig.defaultConfig();
            config.roomID = _zegoMultiRoom.roomID;
            await _engine.startPlayingStream(element.streamID, config: config);
            applyPlayBufferWithRoomMode(element.streamID);
          }
          // 同步音量
          if (_zegoMultiRoom.muteAllRemoteAudio == true) {
            await _engine.mutePlayStreamAudio(element.streamID, true);
          } else {
            await _engine.setPlayVolume(element.streamID, _zegoMultiRoom.getPlaybackSignalVolume());
          }
        }
      }
    }

    if (RtcEngine.debug) {
      rtcLog('syncStream over playStream=${_playStream.map((e) => e.streamID).toList()}');
    }
  }

  List<ZegoStream> getRoomStream(String roomID) {
    return _roomStream[roomID] ?? [];
  }

  @override
  String getTag() {
    return RtcEngineEnum.Zego.name();
  }

  void _setMediaCallBack() {
    ZegoExpressEngine.onMediaPlayerStateUpdate = (ZegoMediaPlayer mediaPlayer, ZegoMediaPlayerState state, int errorCode) async {
      rtcLog('zego media state update state->$state,errorCode->$errorCode');
      if (errorCode == 0) {
        _audioMixingStateCallback?.call(audioMixingState(state), AudioMixingReason.OK);

        if (state == ZegoMediaPlayerState.Playing && _ktvRole == KtvClientRole.LeadSinger) {
          /// 播放成功再推流
          // ZegoMediaPlayerState playerState = await (await _mediaPlayer).getCurrentState();
          startPublishAuxStream();
        } else if (state == ZegoMediaPlayerState.Pausing && _ktvRole == KtvClientRole.LeadSinger) {
          _startSyncProcessTimer();
        }
      } else {
        _audioMixingStateCallback?.call(AudioMixingStateCode.Failed, getMixingReason(errorCode));
      }
    };

    ZegoExpressEngine.onMediaPlayerNetworkEvent = (ZegoMediaPlayer mediaPlayer, ZegoMediaPlayerNetworkEvent networkEvent) {
      rtcLog('zego media network event->$ZegoMediaPlayerNetworkEvent');
    };

    ZegoExpressEngine.onMediaPlayerPlayingProgress = (ZegoMediaPlayer mediaPlayer, int millisecond) {
      if (_ktvRole == KtvClientRole.LeadSinger) {
        _stopSyncProcessTimer();
        startDataMonitorSync(millisecond);
      }
    };
  }

  void _clearMediaCallBack() {
    ZegoExpressEngine.onMediaPlayerStateUpdate = null;
    ZegoExpressEngine.onMediaPlayerNetworkEvent = null;
    ZegoExpressEngine.onMediaPlayerPlayingProgress = null;
  }

  @override
  Future<void> startRecordingCapturedData(RecordConfig config) async {
    await _engine.startRecordingCapturedData(ZegoDataRecordConfig(config.filePath, ZegoDataRecordType.OnlyAudio));
    ZegoExpressEngine.onCapturedDataRecordStateUpdate =
        (ZegoDataRecordState state, int errorCode, ZegoDataRecordConfig config, ZegoPublishChannel channel) {
      var recordConfig = convertRecordConfig(config);
      recordConfig.filePath = config.filePath;
      _recordStateUpdateCallback?.call(convertRecordState(state), errorCode, recordConfig);
    };
    return;
  }

  @override
  Future<void> stopRecordingCapturedData() async {
    await _engine.stopRecordingCapturedData();
    return;
  }

  @override
  void setAudioDataHandler(CapturedAudioFrameCallback? callback) {
    if (callback == null) {
      ZegoExpressEngine.onProcessCapturedAudioData = null;
      ZegoExpressEngine.onCapturedAudioData = null;
      return;
    }
    // ZegoExpressEngine.onCapturedAudioData = (Uint8List data, int dataLength, ZegoAudioFrameParam param) {
    //   callback.call(
    //     data,
    //     dataLength: dataLength,
    //     sampleRate: getSampleRate(param.sampleRate),
    //     channels: getAudioChannels(param.channel),
    //   );
    // };
    // 上面的方法会含有伴奏和混响的掺杂其中，使用下面的方法纯人声
    ZegoExpressEngine.onProcessCapturedAudioData = (Uint8List data, int dataLength, ZegoAudioFrameParam param, double timestamp) {
      callback.call(
        data,
        dataLength: dataLength,
        sampleRate: getSampleRate(param.sampleRate),
        channels: getAudioChannels(param.channel),
      );
    };
  }

  @override
  Future<void> registerAudioFrameObserver({int? uid, int? rid}) async {
    if (_zegoAudioFrameParam == null) {
      _needRegisterAudioFrameObserver = true;
      return;
    }
    // await _engine.startAudioDataObserver(
    //     ZegoAudioDataCallbackBitMask.ZEGO_AUDIO_DATA_CALLBACK_BIT_MASK_CAPTURED, _zegoAudioFrameParam!);
  }

  @override
  Future<void> unRegisterAudioFrameObserver() async {
    _needRegisterAudioFrameObserver = false;
    _zegoAudioFrameParam = null;
    // await _engine.stopAudioDataObserver();
  }

  @override
  Future<void> setRecordingAudioFrameParameters({int? sampleRate, int? channel, int? mode, int? samplesPerCall}) async {
    if (sampleRate != null && channel != null) {
      // enableCustomAudioRemoteProcessing 这个方法是需要提前到 joinChannel 前调用哈，然后会一直回调数据，leaveChannel 停止
      await _engine.enableCustomAudioCaptureProcessing(
        true,
        ZegoCustomAudioProcessConfig(convertZegoAudioSampleRate(sampleRate), convertZegoAudioChannel(channel), 0),
      );
      _zegoAudioFrameParam = ZegoAudioFrameParam(convertZegoAudioSampleRate(sampleRate), convertZegoAudioChannel(channel));
    }
    if (_needRegisterAudioFrameObserver == true) {
      await registerAudioFrameObserver();
    }
    return;
  }

  @override
  Future<RtcMultiChannel?> createRtcChannel(String channel) async {
    await _zegoMultiRoom.initData(channel, _mainRoomToken!);
    return _zegoMultiRoom;
  }

  @override
  Future<void> destroyRtcChannel() async {
    return await _zegoMultiRoom.destroy();
  }

  @override
  Future<int> audioTrackCount() async {
    return await (await _mediaPlayer).getAudioTrackCount();
  }

  ///[index] 1 原声， 0 伴奏
  @override
  Future<void> setAudioTrackIndex(int index) async {
    rtcLog('setAudioTrackIndex: $index');
    await (await _mediaPlayer).setAudioTrackIndex(index);
  }

  ///[index] 1 多音轨， 0 普通
  @override
  Future<void> setAudioTrackMode(int index) async {
    rtcLog('setAudioTrackMode: $index');
    await (await _mediaPlayer).setAudioTrackMode(convertAudioTrackMode(index));
  }

  @override
  RtcEngineEnum getEnum() => RtcEngineEnum.Zego;

  String _getAccompanyStreamId() {
    return '$_currentStreamID$ACCOMPANY_STREAM_SURFIX';
  }

  String _getMixStreamID() {
    return '$_currentStreamID$MIX_STREAM_SURFIX';
  }

  /// KTV合唱：推流：本地伴奏流
  Future<void> startPublishAuxStream() async {
    if (_currentStreamID != null && _currentAuxStreamID == null) {
      ZegoMediaPlayerState playerState = await (await _mediaPlayer).getCurrentState();
      if (playerState != ZegoMediaPlayerState.Playing && playerState != ZegoMediaPlayerState.Pausing) {
        return;
      }
      _currentAuxStreamID = _getAccompanyStreamId();
      // KTV 合唱场景下，主唱的辅路流是与需要与主唱人声以及合唱者人声进行对齐，所以要处理forceSynchronousNetworkTime
      bool needSyncNetworkTime = _ktvRole == KtvClientRole.LeadSinger;
      var publisherConfig = ZegoPublisherConfig(roomID: _currentRoomID, forceSynchronousNetworkTime: needSyncNetworkTime ? 1 : 0);
      rtcLog('startPublishAuxStream, _currentAuxStreamID: $_currentAuxStreamID');
      await _engine.startPublishingStream(_currentAuxStreamID!, config: publisherConfig, channel: ZegoPublishChannel.Aux);
      if (_ktvRole == KtvClientRole.LeadSinger) {
        updateMixStream();
      }
    }
  }

  /// KTV合唱：停止推流：本地伴奏流
  Future<void> stopPublishAuxStream() async {
    if (_currentAuxStreamID != null) {
      rtcLog('stopPublishAuxStream');
      await _engine.stopPublishingStream(channel: ZegoPublishChannel.Aux);
      _currentAuxStreamID = null;
    }
  }

  /// KTV合唱：第二路流是否配置媒体播放器(播放伴奏)
  Future<void> enableAuxAudioIO(bool enable) async {
    ZegoCustomAudioConfig zegoCustomAudioConfig = ZegoCustomAudioConfig(ZegoAudioSourceType.MediaPlayer);

    /// 开启自定义音频 IO 功能，支持其他路推流，支持 PCM 、AAC 格式数据。
    await _engine.enableCustomAudioIO(enable, zegoCustomAudioConfig, channel: ZegoPublishChannel.Aux);
  }

  /// KTV合唱：主唱混流推流，（主唱麦克风流+合唱麦克风流+本地伴奏）混流
  Future<void> updateMixStream() async {
    if (_currentStreamID == null) {
      return;
    }

    if (_mixerTask == null) {
      ZegoMediaPlayerState playerState = await (await _mediaPlayer).getCurrentState();
      if (playerState != ZegoMediaPlayerState.Playing && playerState != ZegoMediaPlayerState.Pausing) {
        return;
      }
      _mixerTask = ZegoMixerTask(_getMixStreamID());
    }
    _mixerTask!.enableSoundLevel = true;
    _mixerTask!.advancedConfig = {'is_stream_alignment': 'true'};
    _mixerTask!.audioConfig = ZegoMixerAudioConfig(128, ZegoAudioChannel.Stereo, ZegoAudioCodecID.Low3, ZegoAudioMixMode.Raw);

    List<ZegoMixerInput> inputList = [];
    Rect rect = const Rect.fromLTWH(0, 0, 0, 0);
    if (_currentStreamID != null) {
      ZegoMixerInput mainInput = ZegoMixerInput(
        _currentStreamID!,
        ZegoMixerInputContentType.Audio,
        rect,
        _myUid,
        _mixStreamConfig?.mainInputVolume ?? 100,
        false,
        -1,
      );
      inputList.add(mainInput);
      rtcLog('updateMixStream, inputList.add main: $_currentStreamID');
    }
    if (_currentAuxStreamID != null) {
      ZegoMixerInput auxInput = ZegoMixerInput(
        _currentAuxStreamID!,
        ZegoMixerInputContentType.Audio,
        rect,
        _myUid + maxUid,
        _mixStreamConfig?.auxInputVolume ?? 140,
        false,
        -1,
      );
      inputList.add(auxInput);
      rtcLog('updateMixStream, inputList.add _currentAuxStreamID: $_currentAuxStreamID');
    }

    for (var element in _playStream) {
      if (_isChorusStream(element.streamID)) {
        int? uid = int.tryParse(element.user.userID);
        if (uid != null) {
          ZegoMixerInput input = ZegoMixerInput(
              element.streamID, ZegoMixerInputContentType.Audio, rect, uid, _mixStreamConfig?.mainInputVolume ?? 100, false, -1);
          inputList.add(input);
          rtcLog('updateMixStream, inputList.add input: ${element.streamID}');
        }
      }
    }

    _mixerTask!.inputList = inputList;
    List<ZegoMixerOutput> output = [];
    output.add(ZegoMixerOutput(_getMixStreamID()));
    _mixerTask!.outputList = output;
    ZegoMixerStartResult result = await _engine.startMixerTask(_mixerTask!);
    rtcLog('startMixerTask, result, errorCode: ${result.errorCode}, extendedData: ${result.extendedData}');
  }

  bool _isChorusStream(String streamID) => bridge.rtcEngine.useDelegate?.chorusStream?.contains(streamID) ?? false;

  /// 停止混流推流
  Future<void> stopMixStream() async {
    if (_mixerTask != null) {
      rtcLog('stopMixStream');
      await _engine.stopMixerTask(_mixerTask!);
      _mixerTask = null;
    }
  }

  @override
  Future<int> getNetworkTime() async {
    ZegoNetworkTimeInfo zegoNetworkTimeInfo = await _engine.getNetworkTimeInfo();
    return zegoNetworkTimeInfo.timestamp;
  }

  @override
  Future<AudioOutputRouting> getAudioRouteType() async {
    ZegoAudioRoute route = await _engine.getAudioRouteType();
    return audioOutputRouting(route);
  }

  /// 同步伴奏播放进度
  Future<void> startDataMonitorSync(int process) async {
    int duration = await getAudioMixingDuration('');
    ZegoMediaPlayerState playerState = await (await _mediaPlayer).getCurrentState();
    int state = (audioMixingState(playerState)).index;
    int networkTime = await getNetworkTime();

    PlayerSEIInfo info = PlayerSEIInfo(process, duration, state, networkTime);
    Uint8List? list = info.toUint8List();
    if (list != null) {
      _engine.sendSEI(list, list.length, channel: ZegoPublishChannel.Main);
    }
  }

  Future<void> _startSyncProcessTimer() async {
    if (_syncProcessTimer == null && _ktvRole == KtvClientRole.LeadSinger) {
      _syncProcessTimer = Timer.periodic(const Duration(milliseconds: 200), (timer) async {
        ZegoMediaPlayerState playerState = await (await _mediaPlayer).getCurrentState();
        if (playerState == ZegoMediaPlayerState.Pausing) {
          int process = await (await _mediaPlayer).getCurrentProgress();
          startDataMonitorSync(process);
        }
      });
    }
  }

  void _stopSyncProcessTimer() {
    _syncProcessTimer?.cancel();
    _syncProcessTimer = null;
  }

  @override
  Future<void> preloadEffect(int soundId, String filePath) async {
    var player = await _audioEffectPlayer;
    await player.loadResource(soundId, filePath);
  }

  @override
  Future<void> unloadEffect(int soundId) async {
    var player = await _audioEffectPlayer;
    await player.unloadResource(soundId);
  }

  // Private For Zego
  Future<void> _setAudioConfigWithProfile(AudioProfile profile) async {
    // 由于厂商间的差异以及业务形态, 目前 Zego 将统一使用 Low3 -- Opus 音频编码
    // opus 与 aac 编码差异可以参考：https://magiclen.org/acoustics/
    // 选用 Opus 的原因：极低延时，Opus 编码效率比 AAC 更高，且在中低码率（502kbps）下，压缩效果跟 AAC 相差无几，仅舍弃了 >=20.1khz 的高频内容
    // 在目前最高码率也才 128kbps 的情况下，可以认为二者音质不会有太大区别
    // 但是需要注意的是，如果当前存在 cdn 的场景，则需要进行转码或者根据实际情况更换编码格式
    ZegoAudioConfig audioConfig = ZegoAudioConfig(18, ZegoAudioChannel.Mono, ZegoAudioCodecID.Low3);
    switch (profile) {
      case AudioProfile.Default:
        audioConfig.bitrate = 48;
        break;
      case AudioProfile.SpeechStandard:
        audioConfig.bitrate = 18;
        break;
      case AudioProfile.MusicStandard:
        audioConfig.bitrate = 64;
        break;
      case AudioProfile.MusicStandardStereo:
        audioConfig.bitrate = 80;
        // audioConfig.channel = ZegoAudioChannel.Stereo;
        break;
      case AudioProfile.MusicHighQuality:
        audioConfig.bitrate = 96;
        break;
      default:
        audioConfig.bitrate = 128;
        // audioConfig.channel = ZegoAudioChannel.Stereo;
        break;
    }

    await _engine.setAudioConfig(audioConfig);
  }

  Future<void> applyScenario(AudioScenario scenario) async {
    // 相关逻辑尽量对齐agora，参考 https://docs.agora.io/cn/Video/faq/system_volume
    // Zego 实际逻辑与声网还是存在一定差异，实际表现与声网不一致属于正常情况
    if (Platform.isIOS) {
      _engine.enableHeadphoneAEC(false);
    }

    ZegoANSMode ansMode = ZegoANSMode.AI;
    switch (RtcBizConfig.ansMode) {
      case 0:
        ansMode = ZegoANSMode.Soft;
        break;
      case 1:
        ansMode = ZegoANSMode.Medium;
        break;
      case 2:
        ansMode = ZegoANSMode.Aggressive;
        break;
      case 3:
        ansMode = ZegoANSMode.AI;
        break;
      case 4:
        ansMode = ZegoANSMode.AIBalanced;
        break;
    }
    rtcLog('ansMode=$ansMode');

    switch (scenario) {
      case AudioScenario.Default:
      case AudioScenario.ShowRoom:
        // 麦上通话、麦下媒体，耳机关闭软件前处理，
        switchAudioDeviceMode(3);
        break;
      case AudioScenario.ChatRoomEntertainment:
        // switchAudioDeviceMode(2);
        await _engine.setAudioDeviceMode(ZegoAudioDeviceMode.General);
        await _engine.enableAEC(true);
        await _engine.enableANS(true);
        await _engine.setAECMode(ZegoAECMode.Medium);
        await _engine.setANSMode(ansMode);
        await _engine.enableAGC(true);
        break;
      case AudioScenario.ChatRoomGaming:
        // 麦上、麦下均为通话音量，耳机关闭前处理
        switchAudioDeviceMode(8);
        break;
      case AudioScenario.Education:
        // 麦上通话音量，麦下媒体音量
        switchAudioDeviceMode(1);
        break;
      // 全程媒体音量，3A 处理有区别
      case AudioScenario.GameStreaming:
        await _engine.setAudioDeviceMode(ZegoAudioDeviceMode.General);
        // switchAudioDeviceMode(6);
        await _engine.enableAEC(true);
        await _engine.enableANS(true);
        await _engine.setAECMode(ZegoAECMode.Aggressive);
        await _engine.setANSMode(ansMode);
        await _engine.enableAGC(true);
        break;
      case AudioScenario.MEETING:
        _engine.enableAEC(true);
        _engine.enableANS(true);
        _engine.setAECMode(ZegoAECMode.Medium);
        // 会议场景需要比较强的降噪能力，所以启用 ai 降噪
        _engine.setANSMode(ansMode);
        break;
      default:
    }
  }

  @Deprecated('not used ')
  Future<void> switchAudioDeviceMode(int mode) async {
    String methodStr = '"method": "express.video.set_audio_device_mode"';
    String paramStr = '"param": {"mode": $mode}';
    _engine.callExperimentalAPI('{$methodStr,$paramStr}');
    if (mode == 1 || mode == 3 || mode == 8) {
      // applyHeadsetAEC();
    }
  }

  Future<void> applyHeadsetAEC() async {
    if (Platform.isIOS) {
      _engine.enableHeadphoneAEC(true);
      return;
    }
    if (Platform.isAndroid) {
      _engine.enableHeadphoneAEC(false);
    }
  }

  @override
  Future<void> enableVirtualStereo(bool enable, int angle) {
    return _engine.enableVirtualStereo(enable, angle);
  }

  @override
  Future<void> setReverbAdvancedParam(ReverbAdvancedParam param) async {
    return _engine.setReverbAdvancedParam(convertReverbAdvancedParam(param));
  }

  @override
  Future<void> setReverbEchoParam(ReverbEchoParam param) async {
    return _engine.setReverbEchoParam(convertReverbEchoParam(param));
  }

  @override
  Future<void> setElectronicEffects(bool enable, ElectronicEffectsMode mode, int tonal) async {
    return _engine.setElectronicEffects(enable, convertElectronicEffectsMode(mode), tonal);
  }
}
