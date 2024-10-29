import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

typedef OnError = void Function(Exception exception);

class SoundButtonSkill extends StatefulWidget {
  final String audioUrl;
  final int duration;
  final double width;
  final double height;
  final double margin;
  final double leftPadding;
  final double fontSize;
  final bool autoPlay;

  const SoundButtonSkill({
    super.key,
    required this.audioUrl,
    required this.duration,
    this.width = 80,
    this.height = 28,
    this.margin = 18,
    this.fontSize = 16,
    this.autoPlay = true,
    this.leftPadding = 14,
  });

  @override
  SoundButtonSkillState createState() => SoundButtonSkillState();
}

class SoundButtonSkillState extends State<SoundButtonSkill>
    with AutomaticKeepAliveClientMixin<SoundButtonSkill> {
  late Duration duration;
  late Duration position;

  late AudioPlayer audioPlayer;

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;

  get isPaused => playerState == PlayerState.paused;

  bool isMuted = false;

  int _delayTimer = 0;
  int _leftSeconds = 0;
  int _secondTimer = 0;

  late StreamSubscription _positionSubscription;
  late StreamSubscription _audioPlayerStateSubscription;
  late StreamSubscription _audioPlayerDurationSubscription;
  late StreamSubscription _playerCompleteSubscription;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Navigator.Page.Pop', _onPageChanged);
    eventCenter.addListener('Navigator.Page.Push', _onPageChanged);
    _initAudioPlayer();
    duration = Duration(seconds: widget.duration);
    position = const Duration(seconds: 0);
    if (widget.autoPlay) {
      _delayTimer = JsTimer.setTimeout(play, 500);
    }
    _leftSeconds = widget.duration;
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  _onPageChanged(String type, dynamic value) {
    Log.d("_onPageChanged $type $value");
    String pageName = value;
    if (pageName != '/skill') {
      setState(() {
        pause();
        if (_secondTimer > 0) JsTimer.clearTimeout(_secondTimer);
      });
    }
  }

  void onTick() async {
    if (_secondTimer > 0) JsTimer.clearTimeout(_secondTimer);

    if (playerState != PlayerState.playing) {
      return;
    }

    _leftSeconds--;
    setState(() {});

    if (_leftSeconds > 0) _secondTimer = JsTimer.setTimeout(onTick, 1000);
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    _audioPlayerDurationSubscription.cancel();
    _playerCompleteSubscription.cancel();
    audioPlayer.dispose();
    if (_delayTimer > 0) JsTimer.clearTimeout(_delayTimer);
    if (_secondTimer > 0) JsTimer.clearTimeout(_secondTimer);
    eventCenter.removeListener('Navigator.Page.Pop', _onPageChanged);
    eventCenter.removeListener('Navigator.Page.Push', _onPageChanged);
    super.dispose();
  }

  void _initAudioPlayer() {
    audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
    _positionSubscription = audioPlayer.onPositionChanged
        .listen((p) => setState(() => position = p));
    _audioPlayerDurationSubscription =
        audioPlayer.onDurationChanged.listen((event) {
      setState(() => duration = event);
    });
    _playerCompleteSubscription = audioPlayer.onPlayerComplete.listen((event) {
      onComplete();
    });
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
      if (!mounted) return;
      setState(() {
        playerState = s;
      });
    }, onError: (msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = Duration.zero;
        position = Duration.zero;
      });
    });
  }

  Future play() async {
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    mainManager.audioPlayStop();

    if (playerState == PlayerState.playing) {
      pause();
      return;
    }

    if (!mounted) return;
    setState(() {
      playerState = PlayerState.playing;
    });

    await audioPlayer.play(UrlSource(widget.audioUrl));

    _leftSeconds = widget.duration;
    if (_secondTimer > 0) JsTimer.clearTimeout(_secondTimer);
    _secondTimer = JsTimer.setTimeout(onTick, 1000);
  }

  Future pause() async {
    await audioPlayer.pause();
    if (!mounted) return;
    setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    await audioPlayer.stop();
    if (!mounted) return;
    setState(() {
      playerState = PlayerState.stopped;
      position = const Duration(seconds: 0);
    });
  }

  Future mute(bool muted) async {
    await audioPlayer.setVolume(muted ? 0 : 1);
    setState(() {
      isMuted = muted;
    });
  }

  void onComplete() {
    Log.d('audio onComplete');
    playerState = PlayerState.stopped;
    position = const Duration(seconds: 0);

    _leftSeconds = widget.duration;
    Log.d('${position.inSeconds}!!!!!!!');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: play,
      child: Container(
        margin: EdgeInsets.all(widget.margin),
        width: widget.width,
        height: widget.height,
        decoration: ShapeDecoration(
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.height / 2),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(width: 4.0),
            ClipOval(
              child: Container(
                width: 20,
                height: 20,
                color: Colors.white,
                child: R.img(
                  "home/icon_sound.${playerState != PlayerState.playing ? 'png' : 'webp'}",
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                  color: playerState != PlayerState.playing
                      ? R.color.mainBrandColor
                      : null,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: widget.leftPadding),
              child: Text(
                '${_leftSeconds.toString()}s',
                textScaleFactor: 1.0,
                style: TextStyle(
                    fontSize: widget.fontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
