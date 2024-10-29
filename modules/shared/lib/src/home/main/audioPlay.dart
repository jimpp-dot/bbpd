import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/shared.dart';

class AudioPlay {
  static const String eventAudioPlayChanged = 'Home.Audio.Play';
  static const String eventAudioStopChanged = 'Home.Audio.Stop';
  static AudioPlay? _instance;

  static AudioPlay instance() {
    _instance ??= AudioPlay();
    return _instance!;
  }

  PlayerState playerState = PlayerState.stopped;
  AudioPlayer? _audioPlayer;
  StreamSubscription? _audioPlayerStateSubscription;
  StreamSubscription? _audioPlayerDurationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;

  String? currentPlayUrl;
  int currentUrlDuration = 0;
  int _messageId = 0; //处理 快捷回复中 currentPlayUrl相同 messageId不同问题
  int _leftSeconds = 0;

  closeSound() {
    if (_audioPlayer != null) {
      _audioPlayerStateSubscription?.cancel();
      _audioPlayerDurationSubscription?.cancel();
      _positionSubscription?.cancel();
      _playerCompleteSubscription?.cancel();
      _audioPlayer?.dispose();
      _audioPlayer = null;
      playerState = PlayerState.stopped;
    }
  }

  void _initPlayer() {
    if (_audioPlayer == null) {
      _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
      _positionSubscription = _audioPlayer!.onPositionChanged.listen((p) {
        if (playerState == PlayerState.playing) {
          Log.d('AudioPlay onPositionChanged :$p');
          _onTick(p.inSeconds);
        }
      });
      _audioPlayerDurationSubscription =
          _audioPlayer!.onDurationChanged.listen((duration) {
        Log.d('AudioPlay onDurationChanged :$duration');
        currentUrlDuration = duration.inSeconds;
      });
      _playerCompleteSubscription =
          _audioPlayer!.onPlayerComplete.listen((event) {
        Log.d('AudioPlay onPlayerComplete');
        playerState = PlayerState.completed;
        _onComplete();
      });

      _audioPlayerStateSubscription =
          _audioPlayer!.onPlayerStateChanged.listen((s) {
        Log.d('AudioPlay onPlayerStateChanged:$s');
        playerState = s;
      });
    }
  }

  ///根据url,播放音频  播放完成/播放错误/播放停止均释放
  Future<void> play(String url, int duration,
      {bool isLocal = false, int messageId = 0}) async {
    if (Util.isStringEmpty(url)) return;

    Log.d(
        'AudioPlay play url:$url ---duration:$duration, ---messageId:$messageId');
    try {
      _initPlayer();
      if (playerState == PlayerState.playing) {
        if (currentPlayUrl != url) {
          await stop();
          await _realPlay(url, duration,
              isLocal: isLocal, messageId: messageId);
        } else {
          await stop();
        }
      } else {
        await _realPlay(url, duration, isLocal: isLocal, messageId: messageId);
      }
    } catch (e) {
      Log.d('AudioPlay error');
    }
  }

  Future _realPlay(String url, int duration,
      {bool isLocal = false, int messageId = 0}) async {
    _messageId = messageId;
    currentUrlDuration = duration;
    _leftSeconds = currentUrlDuration;
    currentPlayUrl = url;
    await _audioPlayer?.play(isLocal ? DeviceFileSource(url) : UrlSource(url));
    _notifyPlay();
  }

  //停止
  Future stop({int messageId = 0}) async {
    Log.d('AudioPlay stop url:$currentPlayUrl, ---messageId:$_messageId');
    if (messageId > 0 && _messageId != messageId) {
      return;
    }

    if (_audioPlayer != null) {
      playerState = PlayerState.stopped;
      await _audioPlayer!.stop();
      _notifyStop();
      currentPlayUrl = "";
      currentUrlDuration = 0;
      _messageId = 0;
    }
  }

  _onComplete() {
    _notifyStop();
  }

  void _onTick(int elapsedSeconds) async {
    Log.d(
        'AudioPlay.onTick elapsedSeconds = $elapsedSeconds, currentPlayUrl = $currentPlayUrl');

    int leftSeconds = max(currentUrlDuration - elapsedSeconds, 0);
    if (leftSeconds == _leftSeconds) {
      return;
    }
    _leftSeconds = leftSeconds;

    _notifyPlay();
  }

  void _notifyPlay() {
    if (Util.isStringEmpty(currentPlayUrl)) return;
    eventCenter.emit(
      eventAudioPlayChanged,
      {
        'url': currentPlayUrl,
        'seconds': _leftSeconds,
        if (Util.parseInt(_messageId) > 0) 'messageid': _messageId,
      },
    );
  }

  void _notifyStop() {
    if (Util.isStringEmpty(currentPlayUrl)) return;
    Log.d('notifyStop:$currentPlayUrl');
    eventCenter.emit(eventAudioStopChanged, {
      'url': currentPlayUrl,
      'seconds': currentUrlDuration,
      if (Util.parseInt(_messageId) > 0) 'messageid': _messageId,
    });
  }
}
