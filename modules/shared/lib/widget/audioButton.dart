import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/shared.dart' hide PlayerState;
import 'package:shared/widget/audioPlayAnimtion.dart';
import 'package:shared/widget/images_animator.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

typedef OnAudioStop = void Function(int playtime);

/// 音频播放控件
class AudioButton extends StatefulWidget {
  final int style;

  final String audioUrl;
  final int duration;
  final bool isLocal;
  final PlayerMode mode;
  final double scale;
  final VoidCallback? onTap;
  final bool recordingActive;

  final OnAudioStop onAudioStop;

  const AudioButton({
    super.key,
    this.style = 0,
    required this.audioUrl,
    required this.duration,
    this.isLocal = false,
    this.mode = PlayerMode.mediaPlayer,
    this.scale = 1,
    this.onTap,
    required this.onAudioStop,
    this.recordingActive = false,
  });

  @override
  AudioButtonState createState() => AudioButtonState();
}

class AudioButtonState extends State<AudioButton>
    with
        AutomaticKeepAliveClientMixin<AudioButton>,
        TickerProviderStateMixin<AudioButton>,
        WidgetsBindingObserver {
  late AudioPlayer _audioPlayer;
  Duration? _duration;
  Duration? _position;
  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateSubscription;

  late AnimationController _aniController;

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
    WidgetsBinding.instance.addObserver(this);
    eventCenter.addListener('Navigator.Page.Pop', _onPageChanged);
    eventCenter.addListener('Navigator.Page.Push', _onPageChanged);
    _aniController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    _initAudioPlayer();
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  _onPageChanged(String type, dynamic value) {
    // Log.d("_onPageChanged $type $value");
//    String pageName = value;
    _stop();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        _onPageVisible(true);
        break;
      case AppLifecycleState.paused: // 应用程序不可见，后台
        _onPageVisible(false);
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _aniController.dispose();
    _audioPlayer.stop();
    _audioPlayer.dispose();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateSubscription?.cancel();
    eventCenter.removeListener('Navigator.Page.Pop', _onPageChanged);
    eventCenter.removeListener('Navigator.Page.Push', _onPageChanged);
    super.dispose();
  }

  void _report(int time) {
    widget.onAudioStop(time);
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

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {});
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

    _aniController.reset();
    _aniController.repeat(reverse: false);
  }

  _stop() async {
    await _audioPlayer.stop();

    AudioManager._sharedInstance().startPlay(null);
    if (_position != null &&
        (_playerState == PlayerState.playing ||
            _playerState == PlayerState.paused)) {
      _report(_position!.inMilliseconds);
    }

    _playerState = PlayerState.stopped;
    _position = Duration.zero;
    if (mounted) {
      _aniController.reset();
      setState(() {});
    }
  }

  void _onComplete() {
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;

      _aniController.reset();

      _report(widget.duration * 1000);
    });
  }

  _onPageVisible(bool visible) {
    Log.d('_onPageVisible:$visible');
    if (visible) {
    } else {
      _stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    int time =
        _playerState == PlayerState.playing ? _positionText : widget.duration;
    super.build(context);

    if (widget.style == 0) {
      return VisibilityDetector(
        key: ValueKey(widget.audioUrl),
        onVisibilityChanged: (visibilityInfo) {
//        var visiblePercentage = visibilityInfo.visibleFraction * 100;
//        Log.d('Widget ${visibilityInfo.key} is $visiblePercentage% visible');
          if (visibilityInfo.visibleFraction == 0.0) {
            _onPageVisible(false);
          } else if (visibilityInfo.visibleFraction == 1.0) {
            _onPageVisible(true);
          }
        },
        child: Container(
          width: 183.0 * widget.scale,
          height: 42.0 * widget.scale,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFED9BFF), Color(0xFF6464FF)],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
            ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 16.0 * widget.scale,
                ),
                _playerState == PlayerState.playing
                    ? SizedBox(
                        width: 62.0 * widget.scale,
                        height: 19.0 * widget.scale,
                        child: AudioPlayAnimation(
                          _aniController,
                          widget.scale,
                          colors: null,
                        ),
                      )
                    : R.img(
                        'chat_friend_audio_default.png',
                        width: 62.0 * widget.scale,
                        height: 19.0 * widget.scale,
                        package: ComponentManager.MANAGER_BASE_CORE,
                      ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  '${Utility.formatTimeClock(time)}"',
                  style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 18.0 * widget.scale,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (widget.onTap != null) widget.onTap!();
          if (_playerState == PlayerState.playing) {
            _stop();
          } else {
            _play();
          }
        },
        child: Container(
          width: 84,
          height: 28,
          padding: const EdgeInsetsDirectional.only(start: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0XFFF6FCFF),
          ),
          child: Row(
            children: [
              ImagesAnimator(
                [
                  R.img('ic_quick_reply_voice_1.webp',
                      width: 20,
                      height: 20,
                      package: ComponentManager.MANAGER_CHAT) as Image,
                  R.img('ic_quick_reply_voice_2.webp',
                      width: 20,
                      height: 20,
                      package: ComponentManager.MANAGER_CHAT) as Image,
                  R.img('ic_quick_reply_voice.webp',
                      width: 20,
                      height: 20,
                      package: ComponentManager.MANAGER_CHAT) as Image,
                ],
                () => _playerState == PlayerState.playing,
                staticImage: R.img('ic_quick_reply_voice.webp',
                    width: 20,
                    height: 20,
                    package: ComponentManager.MANAGER_CHAT) as Image,
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 14,
              ),
              Text(
                '${Utility.formatTimeClock(time)}"',
                style: const TextStyle(fontSize: 13, color: Color(0XFF1ECBFF)),
              )
            ],
          ),
        ),
      );
    }
  }
}

class AudioManager {
  factory AudioManager() => _sharedInstance();

  static final AudioManager _instance = AudioManager._();

  AudioManager._() {
    // 具体初始化代码
  }

  AudioButtonState? _audioPlayer;

  static AudioManager _sharedInstance() {
    return _instance;
  }

  startPlay(AudioButtonState? state) {
    _audioPlayer = state;
  }

  stopPlay() {
    if (_audioPlayer != null) {
      _audioPlayer!._stop();
      _audioPlayer = null;
    }
  }
}
