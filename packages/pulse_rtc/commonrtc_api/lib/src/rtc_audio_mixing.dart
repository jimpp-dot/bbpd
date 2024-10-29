import 'bean/enums.dart';
import 'util/log.dart';
import 'rtc_base_engine.dart';

/// 实现 RtcAudioMixingInterface 的接口转换
mixin RtcAudioMixingAdapterMixin on RtcBaseEngine {
  static const TAG = 'AudioMixing';

  AudioPendingState? audioPendingState;
  AudioMixingStateCode? audioCurrentState;

  int _duration = 0;

  String? _currentPlayUrl;
  int? _currentUniqueID;

  String? get currentPlayUrl => _currentPlayUrl;

  Future<void> adjustAudioMixingVolume(int volume) async {
    rtcLog('$TAG adjustAudioMixingVolume volume=$volume');
    if (_currentUniqueID == null) {
      rtcLog('WARN:adjustAudioMixingVolume _currentUniqueID is Null');
      return;
    }
    return await engineInterface.adjustAudioMixingVolume(_currentUniqueID!, volume);
  }

  Future<int> getAudioMixingCurrentPosition() async {
    if (_currentUniqueID == null) {
      rtcLog('WARN:getAudioMixingCurrentPosition _currentUniqueID is Null');
      return 0;
    }
    return await engineInterface.getAudioMixingCurrentPosition(_currentUniqueID!);
  }

  Future<int> getAudioMixingDuration() async {
    if (_currentPlayUrl == null) {
      rtcLog('WARN:getAudioMixingDuration _currentPlayUrl is Null');
      return 0;
    }
    _duration = await engineInterface.getAudioMixingDuration(_currentPlayUrl!);
    return _duration;
  }

  Future<void> pauseAudioMixing() async {
    rtcLog('$TAG pauseAudioMixing');
    audioPendingState = AudioPendingState.paused;
    if (_currentUniqueID == null) {
      rtcLog('WARN:pauseAudioMixing _currentUniqueID is Null');
      return;
    }
    return await engineInterface.pauseAudioMixing(_currentUniqueID!);
  }

  Future<void> resumeAudioMixing() async {
    rtcLog('$TAG resumeAudioMixing');
    audioPendingState = AudioPendingState.playing;
    if (_currentUniqueID == null) {
      rtcLog('WARN:resumeAudioMixing _currentUniqueID is Null');
      return;
    }
    return await engineInterface.resumeAudioMixing(_currentUniqueID!);
  }

  Future<void> setAudioMixingPosition(int pos) async {
    rtcLog('$TAG setAudioMixingPosition pos->$pos');
    if (_currentUniqueID == null) {
      rtcLog('WARN:setAudioMixingPosition _currentUniqueID is Null');
      return;
    }
    return await engineInterface.setAudioMixingPosition(_currentUniqueID!, pos);
  }

  /// [resourceID] 版权音乐资源id
  /// [path] 音频资源本地路径
  Future<void> startAudioMixing(String path, bool noPublish, bool noMixMic, {int cycle = 1, int startPos = 0, String? resourceID}) async {
    int targetUniqueID = generateUniqueID(resourceID ?? path);
    // 目前一次只允许播放一个背景音乐.
    if (_currentUniqueID != null && _currentUniqueID != targetUniqueID) {
      rtcLog('WARN:startAudioMixing to play two diff filePath,stop before,curPath=$_currentPlayUrl,targetPath=$path');
      await stopAudioMixing();
    }
    _currentPlayUrl = resourceID ?? path;

    audioPendingState = AudioPendingState.playing;
    _currentUniqueID = generateUniqueID(_currentPlayUrl);

    rtcLog(
        '$TAG startAudioMixing start noPublish->$noPublish,noMixMic=$noMixMic,cycle=$cycle,startPos=$startPos, resourceID = $resourceID');
    await engineInterface.startAudioMixing(_currentUniqueID!, path, noPublish, noMixMic,
        cycle: cycle, startPos: startPos, resourceID: resourceID);
  }

  Future<void> stopAudioMixing() async {
    if (_currentUniqueID == null) {
      rtcLog('WARN:stopAudioMixing _currentUniqueID is Null');
    }
    if (_currentUniqueID != null && audioPendingState != AudioPendingState.release) {
      audioPendingState = AudioPendingState.release;
      rtcLog('$TAG stopAudioMixing $_currentPlayUrl');
      var stopUniqueID = _currentUniqueID;
      _currentUniqueID = null;

      _currentPlayUrl = null;
      await engineInterface.stopAudioMixing(stopUniqueID!);
    } else {
      return;
    }
  }

  Future<void> setAudioMixingPitch(int pitch) async {
    return await engineInterface.setAudioMixingPitch(pitch);
  }

  Future<void> setAudioTrackIndex(int index) async {
    await engineInterface.setAudioTrackIndex(index);
  }

  Future<int> audioTrackCount() async {
    return await engineInterface.audioTrackCount();
  }

  void innerOnAudioMixingStateCallback(AudioMixingStateCode state, AudioMixingReason reason) {
    rtcLog('$TAG AudioMixingState --> state=$state,errorCode=$reason');
    audioCurrentState = state;
  }
}

int generateUniqueID(String? str) {
  if (str == null) return 0;
  return str.hashCode;
}
