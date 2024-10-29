import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared/shared.dart' hide PlayerState;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message/src/accost/widget/voice_play_animtion.dart';
import 'package:message/src/auto_reply/model/auto_reply_item.dart';

class VoicePlayWidget extends StatefulWidget {
  final AutoReplyItem item;

  const VoicePlayWidget({Key? key, required this.item}) : super(key: key);

  @override
  _VoicePlayWidgetState createState() => _VoicePlayWidgetState();
}

class _VoicePlayWidgetState extends State<VoicePlayWidget>
    with TickerProviderStateMixin<VoicePlayWidget> {
  late String _audioUrl;
  int _duration = 0;
  int _position = 0;
  String? _error;

  late AudioPlayer _audioPlayer;
  PlayerState _playerState = PlayerState.stopped;
  late AnimationController _aniController;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateSubscription;

  @override
  void initState() {
    super.initState();
    _parseData();
    _aniController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _aniController.dispose();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      if (!mounted) return;
      setState(() {});
    });
    _positionSubscription =
        _audioPlayer.onPositionChanged.listen((p) => setState(() {
              _position = p.inSeconds;
            }));

    _playerCompleteSubscription = _audioPlayer.onPlayerComplete.listen((event) {
      _onComplete();
    });

    _playerStateSubscription =
        _audioPlayer.onPlayerStateChanged.listen((state) {
      Log.d('onPlayerStateChanged:$state');
      if (!mounted) return;
      setState(() {
        _playerState = state;
      });
    });
  }

  _play() async {
    Log.d('play audio:$_audioUrl');

    if (PlayerState.playing == _playerState) {
      await _stop();
    }
    await _audioPlayer.play(UrlSource(_audioUrl));
    _aniController.reset();
    _aniController.repeat(reverse: false);
  }

  _stop() async {
    await _audioPlayer.stop();
    _position = 0;
    _aniController.reset();
    if (mounted) setState(() {});
  }

  void _onComplete() {
    setState(() {
      _playerState = PlayerState.stopped;
      _position = 0;

      _aniController.reset();
    });
  }

  void _parseData() {
    try {
      Uri uri = Uri.parse(widget.item.content ?? '');
      _audioUrl = '${uri.origin}${uri.path}';
      _duration = int.parse(uri.queryParameters['duration'] ?? '0');
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
  }

  @override
  void didUpdateWidget(covariant VoicePlayWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _parseData();
  }

  @override
  Widget build(BuildContext context) {
    int time = _playerState == PlayerState.playing
        ? max(_duration - _position, 0)
        : _duration;
    return _error != null
        ? Text(
            _error!,
            style: TextStyle(fontSize: 14, color: R.color.mainTextColor),
          )
        : Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (_playerState == PlayerState.playing) {
                    _stop();
                  } else {
                    _play();
                  }
                },
                child: Container(
                  width: 32,
                  height: 32,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: R.color.mainBrandColor,
                  ),
                  child: R.img(
                    _playerState == PlayerState.playing
                        ? 'ic_accost_pause_voice.svg'
                        : 'ic_accost_play_voice.svg',
                    package: ComponentManager.MANAGER_MESSAGE,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: _buildWave(),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                '${time}s',
                style: TextStyle(fontSize: 14, color: R.color.mainBrandColor),
              ),
            ],
          );
  }

  Widget _buildWave() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return VoicePlayAnimation(
          _aniController,
          1.2,
          constraints.maxWidth,
        );
      },
    );
  }
}
