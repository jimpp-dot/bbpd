import 'bean/beans.dart';
import 'bean/events.dart';
import 'rtc_api.dart';
import 'package:flutter/cupertino.dart';

import 'bean/enums.dart';

extension _ListIterator<T> on List<T> {
  safeForEach(void Function(T element) action) {
    final List<T> localListeners = List<T>.from(this);
    for (var listener in localListeners) {
      try {
        action(listener);
      } catch (exception, stack) {
        FlutterError.reportError(FlutterErrorDetails(
          exception: exception,
          stack: stack,
          library: 'events library',
        ));
      }
    }
  }
}

mixin RtcCallbackMixin implements RtcEventAddHandlerInterface {
  late RtcEngineInterface engineInterface;

  AudioVolumeCallback? _audioVolumeCallback;
  final List<AudioVolumeCallback> _audioVolumeCallbackList = <AudioVolumeCallback>[];

  ConnectionStateCallback? _connectionStateCallback;
  final List<ConnectionStateCallback> _connectionStateCallbackList = <ConnectionStateCallback>[];

  UidWithElapsedCallback? _userJoinedCallback;
  final List<UidWithElapsedCallback> _userJoinedCallbackList = <UidWithElapsedCallback>[];

  UserOfflineCallback? _userOfflineCallback;
  final List<UserOfflineCallback> _userOfflineCallbackList = <UserOfflineCallback>[];

  ErrorCallback? _errorCallback;
  final List<ErrorCallback> _errorCallbackList = <ErrorCallback>[];

  VideoFrameWithUidCallback? _firstRemoteVideoFrameCallback;
  final List<VideoFrameWithUidCallback> _firstRemoteVideoFrameCallbackList = <VideoFrameWithUidCallback>[];

  AudioMixingStateCallback? _audioMixingStateCallback;
  final List<AudioMixingStateCallback> _audioMixingStateCallbackList = <AudioMixingStateCallback>[];

  WarningCallback? _warningCallback;
  final List<WarningCallback> _warningCallbackList = <WarningCallback>[];

  AudioRouteCallback? _audioRouteCallback;
  final List<AudioRouteCallback> _audioRouteCallbackList = <AudioRouteCallback>[];

  LocalAudioStateChangeCallback? _localAudioStateCallback;
  final List<LocalAudioStateChangeCallback> _localAudioStateCallbackList = <LocalAudioStateChangeCallback>[];

  CapturedDataRecordStateUpdate? _onRecordCallback;
  final List<CapturedDataRecordStateUpdate> _onRecordCallbackList = <CapturedDataRecordStateUpdate>[];

  PlayerRecvSEICallback? _playerRecvSEICallback;
  final List<PlayerRecvSEICallback> _playerRecvSEICallbackList = [];

  NetworkQualityCallback? _networkQualityCallback;
  final List<NetworkQualityCallback> _networkQualityCallbackList = [];

  clearAllCallback() {
    // _audioVolumeCallback = null;
    _audioVolumeCallbackList.clear();
    // _connectionStateCallback = null;
    _connectionStateCallbackList.clear();
    // _userJoinedCallback = null;
    _userJoinedCallbackList.clear();
    // _userOfflineCallback = null;
    _userOfflineCallbackList.clear();
    // _errorCallback = null;
    _errorCallbackList.clear();
    // _firstRemoteVideoFrameCallback = null;
    _firstRemoteVideoFrameCallbackList.clear();
    // _audioMixingStateCallback = null;
    _audioMixingStateCallbackList.clear();
    // _warningCallback = null;
    _warningCallbackList.clear();
    // _audioRouteCallback = null;
    _audioRouteCallbackList.clear();
    _localAudioStateCallbackList.clear();
    _onRecordCallbackList.clear();
    _playerRecvSEICallbackList.clear();
    _networkQualityCallbackList.clear();
  }

  /// 这里注册的基本都是轻量级的监听，如果监听有性能考量，需要在实际监听的时候收听数据
  /// 这种：可以参考原始音频回调 setAudioDataHandler
  void registerCallback() {
    if (_audioVolumeCallback == null) {
      _audioVolumeCallback = (List<AudioVolumeInfo> speakers, int totalVolume) {
        onAudioVolumeCallback(speakers, totalVolume);
        _audioVolumeCallbackList.safeForEach((cb) => cb.call(speakers, totalVolume));
      };
      engineInterface.audioVolumeIndicationCallback(_audioVolumeCallback!);
    }
    if (_connectionStateCallback == null) {
      _connectionStateCallback = (ConnectionStateType state, ConnectionChangedReason reason) {
        onConnectionStateCallback(state, reason);
        _connectionStateCallbackList.safeForEach((cb) => cb.call(state, reason));
      };
      engineInterface.connectionStateChangeCallback(_connectionStateCallback!);
    }
    if (_errorCallback == null) {
      _errorCallback = (ErrorCode err) {
        onErrorCallback(err);
        _errorCallbackList.safeForEach((cb) => cb.call(err));
      };
      engineInterface.errorCallback(_errorCallback!);
    }
    if (_firstRemoteVideoFrameCallback == null) {
      _firstRemoteVideoFrameCallback = (int uid, int width, int height, int elapsed) {
        onFirstRemoteVideoFrameCallback(uid, width, height, elapsed);
        _firstRemoteVideoFrameCallbackList.safeForEach((cb) => cb.call(uid, width, height, elapsed));
      };
      engineInterface.firstRemoteVideoFrameCallback(_firstRemoteVideoFrameCallback!);
    }
    if (_audioMixingStateCallback == null) {
      _audioMixingStateCallback = (AudioMixingStateCode state, AudioMixingReason reason) {
        onAudioMixingStateCallback(state, reason);
        _audioMixingStateCallbackList.safeForEach((cb) => cb.call(state, reason));
      };
      engineInterface.mixingStateChangedCallback(_audioMixingStateCallback!);
    }
    if (_userJoinedCallback == null) {
      _userJoinedCallback = (int uid, int elapsed) {
        onUserJoinedCallback(uid, elapsed);
        _userJoinedCallbackList.safeForEach((cb) => cb.call(uid, elapsed));
      };
      engineInterface.userJoinedCallback(_userJoinedCallback!);
    }
    if (_userOfflineCallback == null) {
      _userOfflineCallback = (int uid, UserOfflineReason reason) {
        onUserOfflineCallback(uid, reason);
        _userOfflineCallbackList.safeForEach((cb) => cb.call(uid, reason));
      };
      engineInterface.userOffline(_userOfflineCallback!);
    }
    if (_warningCallback == null) {
      _warningCallback = (WarningCode warn) {
        onWarningCallback(warn);
        _warningCallbackList.safeForEach((cb) => cb.call(warn));
      };
      engineInterface.warningCallback(_warningCallback!);
    }
    if (_audioRouteCallback == null) {
      _audioRouteCallback = (AudioOutputRouting routing) {
        onAudioRouteCallback(routing);
        _audioRouteCallbackList.safeForEach((cb) => cb.call(routing));
      };
      engineInterface.audioRouteCallback(_audioRouteCallback!);
    }
    if (_localAudioStateCallback == null) {
      _localAudioStateCallback = (error, state) {
        onLocalAudioStateCallback(error, state);
        _localAudioStateCallbackList.safeForEach((cb) => cb.call(error, state));
      };
      engineInterface.localAudioStateCallback(_localAudioStateCallback!);
    }
    if (_onRecordCallback == null) {
      _onRecordCallback = (RecordState state, int errorCode, RecordConfig config) {
        onCaptureDataRecordStateCallback(state, errorCode, config);
        _onRecordCallbackList.safeForEach((cb) => cb.call(state, errorCode, config));
      };
      engineInterface.captureDataRecordStateCallback(_onRecordCallback!);
    }
    if (_playerRecvSEICallback == null) {
      _playerRecvSEICallback = (streamID, data) {
        _playerRecvSEICallbackList.safeForEach((cb) => cb.call(streamID, data));
      };
      engineInterface.playerRecvSEICallback(_playerRecvSEICallback!);
    }
    if (_networkQualityCallback == null) {
      _networkQualityCallback =
          (String userID, StreamQualityLevel upstreamQuality, StreamQualityLevel downstreamQuality) {
        _networkQualityCallbackList.safeForEach((cb) => cb.call(userID, upstreamQuality, downstreamQuality));
      };
      engineInterface.networkQualityCallback(_networkQualityCallback!);
    }
  }

  @override
  addAudioVolumeIndicationCallback(AudioVolumeCallback callback) {
    _audioVolumeCallbackList.add(callback);
  }

  @override
  addConnectionStateChangeCallback(ConnectionStateCallback callback) {
    _connectionStateCallbackList.add(callback);
  }

  @override
  addErrorCallback(ErrorCallback callback) {
    _errorCallbackList.add(callback);
  }

  @override
  addFirstRemoteVideoFrameCallback(VideoFrameWithUidCallback callback) {
    _firstRemoteVideoFrameCallbackList.add(callback);
  }

  @override
  addMixingStateChangedCallback(AudioMixingStateCallback callback) {
    _audioMixingStateCallbackList.add(callback);
  }

  @override
  addUserJoinedCallback(UidWithElapsedCallback callback) {
    _userJoinedCallbackList.add(callback);
  }

  @override
  addUserOffline(UserOfflineCallback callback) {
    _userOfflineCallbackList.add(callback);
  }

  @override
  addWarningCallback(WarningCallback callback) {
    _warningCallbackList.add(callback);
  }

  @override
  addAudioRouteCallback(AudioRouteCallback callback) {
    _audioRouteCallbackList.add(callback);
  }

  @override
  removeAudioVolumeIndicationCallback(callback) {
    _audioVolumeCallbackList.remove(callback);
  }

  @override
  removeConnectionStateChangeCallback(callback) {
    _connectionStateCallbackList.remove(callback);
  }

  @override
  removeErrorCallback(callback) {
    _errorCallbackList.remove(callback);
  }

  @override
  removeFirstRemoteVideoFrameCallback(callback) {
    _firstRemoteVideoFrameCallbackList.remove(callback);
  }

  @override
  removeMixingStateChangedCallback(callback) {
    _audioMixingStateCallbackList.remove(callback);
  }

  @override
  removeUserJoinedCallback(callback) {
    _userJoinedCallbackList.remove(callback);
  }

  @override
  removeUserOffline(callback) {
    _userOfflineCallbackList.remove(callback);
  }

  @override
  removeWarningCallback(callback) {
    _warningCallbackList.remove(callback);
  }

  @override
  removeAudioRouteCallback(AudioRouteCallback callback) {
    _audioRouteCallbackList.remove(callback);
  }

  @override
  addLocalAudioStateChangeCallback(LocalAudioStateChangeCallback callback) {
    _localAudioStateCallbackList.add(callback);
  }

  @override
  removeLocalAudioStateChangeCallback(LocalAudioStateChangeCallback callback) {
    _localAudioStateCallbackList.remove(callback);
  }

  @override
  addCaptureDataRecordStateCallback(CapturedDataRecordStateUpdate callback) {
    _onRecordCallbackList.add(callback);
  }

  @override
  removeCaptureDataRecordStateCallback(CapturedDataRecordStateUpdate callback) {
    _onRecordCallbackList.remove(callback);
  }

  @override
  addPlayerRecvSEICallback(PlayerRecvSEICallback callback) {
    _playerRecvSEICallbackList.add(callback);
  }

  @override
  removePlayerRecvSEICallback(PlayerRecvSEICallback callback) {
    _playerRecvSEICallbackList.remove(callback);
  }

  @override
  addNetworkQualityCallback(NetworkQualityCallback callback){
    _networkQualityCallbackList.add(callback);
  }

  @override
  removeNetworkQualityCallback(NetworkQualityCallback callback) {
    _networkQualityCallbackList.remove(callback);
  }

  @protected
  void onAudioVolumeCallback(List<AudioVolumeInfo> speakers, int totalVolume) {}

  @protected
  void onConnectionStateCallback(ConnectionStateType state, ConnectionChangedReason reason) {}

  @protected
  void onErrorCallback(ErrorCode err) {}

  @protected
  void onFirstRemoteVideoFrameCallback(int uid, int width, int height, int elapsed) {}

  @protected
  void onAudioMixingStateCallback(AudioMixingStateCode state, AudioMixingReason reason) {}

  @protected
  void onUserJoinedCallback(int uid, int elapsed) {}

  @protected
  void onUserOfflineCallback(int uid, UserOfflineReason reason) {}

  @protected
  void onWarningCallback(WarningCode warn) {}

  @protected
  void onAudioRouteCallback(AudioOutputRouting routing) {}

  @protected
  void onLocalAudioStateCallback(AudioLocalError error, AudioLocalState state) {}

  @protected
  void onCaptureDataRecordStateCallback(RecordState state, int errorCode, RecordConfig config) {}

}
