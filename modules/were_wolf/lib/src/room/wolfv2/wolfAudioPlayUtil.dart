import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/shared.dart';

///
/// wolf_voice todo
///
class WolfAudioPlayUtil {
  static WolfAudioPlayUtil? _instance;

  static WolfAudioPlayUtil instance() {
    _instance ??= WolfAudioPlayUtil();
    return _instance!;
  }

  static const AUDIO_PLAY_COMPLETE_EVENT = 'audio.play.complete.event';

  AudioPlayer? _audioPlayer;
  StreamSubscription? _audioPlayerStateSubscription;
  StreamSubscription? _playerCompleteSubscription;

  String? _currentPlayFilePath;
  PlayerState _audioPlayerState = PlayerState.stopped;

  String? _currentPlayFileName;

  Function? _CompleteCallback;

  ///
  /// 文件：本地文件或者网络文件
  /// 根据传入的url或者fileName，播放对应的文件；url有效时，则播放url；url无效时，播放对应path的fileName文件
  /// 1.如果没有播放的文件，则播放传入的文件
  /// 2.如果有播放的文件，且播放的文件不等于传入的文件，则停止正在播放的文件，并播放传入的文件
  /// 3.如果有播放的文件，且播放的文件等于传入的文件，则停止正在播放的文件
  ///
  Future<void> playAudio(String wholeFileName,
      {bool completeCallback = false,
      Function? onComplete,
      String? url}) async {
    try {
      String playPath;
      bool isLocal;

      if (url != null &&
          url.isNotEmpty &&
          (url.startsWith('http') || url.startsWith('https'))) {
        playPath = url;
        isLocal = false;
        _currentPlayFileName = url;
      } else {
        File file = File(wholeFileName);
        if (await file.exists() == false) {
          Log.d("playAudio file is not exists");
          return;
        }

        playPath = file.path;
        isLocal = true;
        _currentPlayFileName = wholeFileName;
      }
      Log.d(
          "playAudio _currentPlayFileName=$_currentPlayFileName isLocal=$isLocal");
      _CompleteCallback = onComplete;
      if (_audioPlayer == null) {
        _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
        _playerCompleteSubscription =
            _audioPlayer!.onPlayerComplete.listen((event) {
          //播放完成
          if (completeCallback) {
            eventCenter.emit(AUDIO_PLAY_COMPLETE_EVENT, _currentPlayFileName);
          }
          if (_CompleteCallback != null) {
            Log.d("initToNightAction onComplete call");
            _CompleteCallback!.call();
          }
        });
        _audioPlayerStateSubscription =
            _audioPlayer!.onPlayerStateChanged.listen(
          (s) {
            _audioPlayerState = s;
          },
          onError: (msg) {
            _audioPlayerState = PlayerState.stopped;
            if (completeCallback) {
              eventCenter.emit(AUDIO_PLAY_COMPLETE_EVENT, _currentPlayFileName);
            }
            if (_CompleteCallback != null) {
              _CompleteCallback!.call();
            }
          },
        );
        _realPlay(playPath, isLocal);
      } else {
        if (_audioPlayerState == PlayerState.playing) {
          if (_currentPlayFilePath != playPath) {
            await stop();
            _realPlay(playPath, isLocal);
          } else {
            await stop();
          }
        } else {
          _realPlay(playPath, isLocal);
        }
      }
    } catch (e) {}
  }

  bool isPlaying() {
    return _audioPlayerState == PlayerState.playing;
  }

  Future _realPlay(String playPath, bool isLocal) async {
    _audioPlayerState = PlayerState.playing;
    _currentPlayFilePath = playPath;
    await _audioPlayer
        ?.play(isLocal ? DeviceFileSource(playPath) : UrlSource(playPath));
  }

  //停止
  Future stop() async {
    if (_audioPlayer != null) {
      if (_audioPlayerState == PlayerState.playing ||
          _audioPlayerState == PlayerState.paused) {
        _audioPlayerState = PlayerState.stopped;
        await _audioPlayer!.stop();
      }
    }
  }

  closeSound() {
    if (_audioPlayer != null) {
      _audioPlayerStateSubscription?.cancel();
      _audioPlayerStateSubscription = null;
      _playerCompleteSubscription?.cancel();
      _audioPlayer?.dispose();
      _audioPlayer = null;
    }
  }
}
