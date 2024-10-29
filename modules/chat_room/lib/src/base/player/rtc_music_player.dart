import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/room_music_control.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';

import '../../../k.dart';
import '../../ktv/model/sound_type.dart';

typedef RtcAudioPlayerError = void Function(int code, String msg);

const play_err_code_url = -1;

/// 音频播放控制逻辑层
class RtcAudioPlayer {
  static const String TAG = 'room-rtc';

  /// 默认的伴奏的音量
  static const int defaultVolumeAccompany = 50;

  /// 默认的调节采集信号音量
  static const int defaultVolumeVoice = 80;

  static RtcAudioPlayer? _singleHolder;

  MusicScene? _musicScene;

  int _musicVolume = defaultVolumeAccompany;

  int get audioMixingVolume => _musicVolume;

  bool isError = false;

  MusicScene? get musicScene => _musicScene;

  RtcEngine? get _engine => ChatRoomData.getInstance()?.rtcController.engine;

  static RtcAudioPlayer get instance {
    _singleHolder ??= RtcAudioPlayer._();
    return _singleHolder!;
  }

  RtcAudioPlayer._();

  String? _currentPlayUrl;
  int _progress = 0;
  int _duration = 0;
  bool _isPlaying = false;
  bool _onPrepared = false;
  bool _isRelease = true;
  bool _isPaused = false;
  bool _inited = false;

  RtcAudioPlayerError? _playerListener;

  set playerErrorListener(RtcAudioPlayerError value) => _playerListener = value;

  bool get isPlaying => _isPlaying;

  set isPlaying(bool play) => _isPlaying = play;

  bool get isRelease => _isRelease;

  bool get isPaused => _isPaused;

  /// 数据是否初始化过
  bool get isInited => _inited;

  void initState(MusicScene scene) {
    _musicScene = scene;
  }

  bool isCurrentPlayPath(String path) {
    return _currentPlayUrl == path;
  }

  void dispose() {
    _playerListener = null;
  }

  _resetState() {
    _musicScene = null;
  }

  void onPrepared() {
    _onPrepared = true;
    isError = false;
  }

  bool get isPrepared => _onPrepared;

  onError() {
    _onPrepared = false;
    isPlaying = false;
    isError = true;
  }

  /// 开始播放音乐文件
  ///
  /// filePath:混音文件路径
  /// loopback:文件音频流是否发送给对端；如果设置为 true，文件音频流仅在本地可以听见，不会发送到对端
  /// replace:是否替换麦克风采集的音频
  /// cycle:-1无限循环播放混音文件；设置为正整数表示混音文件播放的次数
  startPlay(String? path,
      [bool loopback = false, bool replace = false, int cycle = -1]) async {
    if (path == null || path.isEmpty) {
      Log.w(tag: TAG, 'cant play music path is null or empty!');
      _playerListener?.call(play_err_code_url, K.room_invalid_cant_play);
      return;
    }
    _currentPlayUrl = path;
    _inited = true;
    _isPlaying = true;
    _onPrepared = false;
    _isRelease = false;
    _isPaused = false;
    isError = false;
    _duration = 0;

    Log.d(tag: TAG, 'audio start play->$path');

    await _engine?.adjustAudioMixingVolume(_musicVolume);
    await _engine?.startAudioMixing(path, loopback, replace, cycle: cycle);
  }

  void startPlayAgoraMusic(String? musicId, SoundType soundType) async {
    if (musicId == null || musicId.isEmpty) {
      Log.w(tag: TAG, 'cant play music path is null or empty!');
      _playerListener?.call(play_err_code_url, K.room_invalid_cant_play);
      return;
    }
    _currentPlayUrl = musicId;
    _inited = true;
    _isPlaying = true;
    _onPrepared = false;
    _isRelease = false;
    _isPaused = false;
    isError = false;
    _duration = 0;

    Log.d(tag: TAG, 'audio start play->$musicId');

    /// 声网版权音乐，不能直接覆盖上一个，需要先stop掉上一个，再播放下一个
    await _engine?.stopAudioMixing();
    await _engine?.adjustAudioMixingVolume(_musicVolume);
    await _engine?.startAudioMixing("", false, false,
        cycle: 1, startPos: 0, resourceID: musicId);
    _engine?.setAudioTrackIndex(soundType == SoundType.accompany ? 1 : 0);
  }

  void startPlayZegoMusic(String? musicId, SoundType soundType) async {
    if (musicId == null || musicId.isEmpty) {
      Log.w(tag: TAG, 'cant play music path is null or empty!');
      _playerListener?.call(play_err_code_url, K.room_invalid_cant_play);
      return;
    }
    _currentPlayUrl = musicId;
    _inited = true;
    _isPlaying = true;
    _onPrepared = false;
    _isRelease = false;
    _isPaused = false;
    isError = false;
    _duration = 0;

    Log.d(tag: TAG, 'audio start play->$musicId');
    ZegoMusicResource? requestResult = await _engine?.requestResource(musicId);
    if (requestResult != null && requestResult.resources.isNotEmpty) {
      String resourceId = requestResult.resources[0].resource_id;
      await _engine?.stopAudioMixing();
      await _engine?.adjustAudioMixingVolume(_musicVolume);
      await _engine?.startAudioMixing("", false, false,
          cycle: 1, startPos: 0, resourceID: resourceId);
      await _engine
          ?.setAudioTrackIndex(soundType == SoundType.accompany ? 0 : 1);
    }
  }

  adjustAudioMixingVolume(int volume) async {
    _musicVolume = volume;
    await _engine?.adjustAudioMixingVolume(volume);
  }

  stopPlay() async {
    if (!_isRelease) {
      _isPlaying = false;
      _isPaused = false;
      _onPrepared = false;
      _isRelease = true;
      await _engine?.stopAudioMixing();
      _currentPlayUrl = null;
      _progress = 0;
      _duration = 0;
      _inited = false;
      _resetState();
    }
  }

  resume() async {
    if (_isPlaying == false) {
      _isPlaying = true;
      _isPaused = false;
      await _engine?.resumeAudioMixing();
    }
  }

  pause() async {
    if (_isPlaying == true) {
      _isPlaying = false;
      _isPaused = true;
      await _engine?.pauseAudioMixing();
    }
  }

  Future<int> getAudioMixingDuration() async {
    if (_isRelease == true || !_onPrepared) {
      return 0;
    }
    if (_duration <= 0) {
      _duration = await _engine?.getAudioMixingDuration() ?? 0;
    }
    return _duration;
  }

  Future<int> getAudioMixingCurrentPosition() async {
    if (_isRelease == true || !_onPrepared) {
      return 0;
    }
    _progress = await _engine?.getAudioMixingCurrentPosition() ?? 0;
    return _progress;
  }

  static String formatTime(int time) {
    int second = time ~/ 1000;
    int m = second ~/ 60;
    int s = second % 60;
    return '${m > 9 ? m.toString() : '0$m'}:${s > 9 ? s.toString() : '0$s'}';
  }

  setAudioMixingPosition(int position) async {
    await _engine?.setAudioMixingPosition(position);
  }
}

/// mixin 进度，UI层：具有进度回调
mixin RtcAudioTickerStateMixin<T extends StatefulWidget> on State<T> {
  late RtcAudioPlayer _audioPlayer;
  Timer? _timer;
  int _progress = 0;
  int _duration = 0;

  RtcAudioPlayer get audioPlayer => _audioPlayer;

  int get progress => _progress;

  int get duration => _duration;

  @override
  void initState() {
    super.initState();
    _audioPlayer = RtcAudioPlayer.instance;
    _audioPlayer.playerErrorListener = _playError;
    // 退出重进重新更新一次进度
    updateProgress();
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
    _audioPlayer.dispose();
  }

  void startTimer() {
    _timer ??= Timer.periodic(const Duration(milliseconds: 1000), _onTimer);
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  stopAudio() {
    cancelTimer();
    _audioPlayer.stopPlay();
  }

  Future<void> _onTimer(Timer timer) async {
    if (_audioPlayer.isPlaying == false) return;
    updateProgress();
  }

  updateProgress() async {
    try {
      _duration = await _audioPlayer.getAudioMixingDuration();
      _progress = await _audioPlayer.getAudioMixingCurrentPosition();
      if (_progress > _duration) {
        _progress = _duration;
      }
      refresh();
    } catch (e) {
      Log.d(e);
    }
  }

  void _playError(int code, String msg) {
    if (msg.isEmpty) {
      return;
    }
    switch (code) {
      case play_err_code_url:
        Fluttertoast.showToast(msg: msg);
        break;
    }
  }
}
