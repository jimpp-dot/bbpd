import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/shared.dart' hide PlayerState;
import 'package:flutter/material.dart';

enum AudioPath {
  Net,
  Local,
}

/// 朋友圈 or 动态发布 音频播放控件
class AudioMoment extends StatefulWidget {
  final String audioUrl;
  final int duration;
  final AudioPath audioPath;
  final GestureTapCallback? onTap;
  final bool isLocal;
  final PlayerMode mode;

  const AudioMoment({
    super.key,
    required this.audioUrl,
    required this.duration,
    required this.audioPath,
    this.isLocal = false,
    this.mode = PlayerMode.mediaPlayer,
    this.onTap,
  });

  @override
  AudioMomentState createState() => AudioMomentState();
}

class AudioMomentState extends State<AudioMoment>
    with AutomaticKeepAliveClientMixin<AudioMoment> {
  late AudioPlayer _audioPlayer;
  Duration? _duration;
  Duration? _position;
  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateSubscription;

  int get _positionText {
    int position = 0;
    if (_position != null) {
      position = _position!.inSeconds;
    }
    return max(widget.duration - position, 0);
  }

  @override
  void initState() {
    super.initState();
    Log.d('AudioMomentState initState');
    eventCenter.addListener('Navigator.Page.Pop', _onPageChanged);
    eventCenter.addListener('Navigator.Page.Push', _onPageChanged);
    _initAudioPlayer();
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  _onPageChanged(String type, dynamic value) {
    _stop();
  }

  @override
  void dispose() {
    Log.d('audio moment ~~~~~~~~~~~~~dispose~~~~~~~~~~~~');
    _audioPlayer.stop();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateSubscription?.cancel();
    eventCenter.removeListener('Navigator.Page.Pop', _onPageChanged);
    eventCenter.removeListener('Navigator.Page.Push', _onPageChanged);
    super.dispose();
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer();
    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });
    _positionSubscription =
        _audioPlayer.onPositionChanged.listen((p) => setState(() {
              _position = p;
            }));

    _playerCompleteSubscription = _audioPlayer.onPlayerComplete.listen((event) {
      _onComplete();
    });

    _playerStateSubscription =
        _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        _playerState = state;
      });
    });
  }

  _play() async {
    final playPosition = (_position != null &&
            _duration != null &&
            _position!.inMilliseconds > 0 &&
            _position!.inMilliseconds < _duration!.inMilliseconds)
        ? _position
        : null;
    Log.d('play:${widget.audioUrl}');
    AudioManager._sharedInstance().stopPlay();
    await _audioPlayer.play(
        widget.isLocal
            ? DeviceFileSource(widget.audioUrl)
            : UrlSource(widget.audioUrl),
        position: playPosition);
    AudioManager._sharedInstance().startPlay(this);
    setState(() => _playerState = PlayerState.playing);
  }

  _stop() async {
    await _audioPlayer.stop();
    AudioManager._sharedInstance().startPlay(null);
    _playerState = PlayerState.stopped;
    _position = const Duration();
    if (mounted) setState(() {});
  }

  void _onComplete() {
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: 180,
      height: 48,
      decoration: ShapeDecoration(
        gradient: LinearGradient(colors: R.colors.mainBrandGradientColors),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: InkWell(
        onTap: () {
          if (widget.onTap != null) widget.onTap!();

          if (_playerState == PlayerState.playing) {
            _stop();
          } else {
            _play();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            PositionedDirectional(
              start: 12,
              child: Image.asset(
                R.imagePath(
                  "icon_audio_playing.${_playerState != PlayerState.playing ? 'png' : 'webp'}",
                  package: ComponentManager.MANAGER_PERSONALDATA,
                ),
                width: 13,
                height: 15,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              _playerState == PlayerState.playing
                  ? '${_positionText}s'
                  : '${widget.duration}s',
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioManager {
  factory AudioManager() => _sharedInstance();

  static final AudioManager _instance = AudioManager._();

  AudioManager._() {
    // 具体初始化代码
  }

  AudioMomentState? _audioPlayer;

  static AudioManager _sharedInstance() {
    return _instance;
  }

  startPlay(AudioMomentState? state) {
    _audioPlayer = state;
  }

  stopPlay() {
    if (_audioPlayer != null) {
      _audioPlayer!._stop();
      _audioPlayer = null;
    }
  }
}
