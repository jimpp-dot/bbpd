import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/shared.dart' hide PlayerState;
import 'package:flutter/material.dart';
import 'package:message/src/accost/widget/voice_play_animtion.dart';
import 'package:message/src/model/pb/generated/slp_gs.pb.dart';

class BbStrategyVoicePlayWidget extends StatefulWidget {
  final GsChatMsg item;

  const BbStrategyVoicePlayWidget({super.key, required this.item});

  @override
  _BbStrategyVoicePlayWidgetState createState() =>
      _BbStrategyVoicePlayWidgetState();
}

class _BbStrategyVoicePlayWidgetState extends State<BbStrategyVoicePlayWidget>
    with TickerProviderStateMixin<BbStrategyVoicePlayWidget> {
  GsChatMsg get item => widget.item;
  String _audioUrl = '';
  int _duration = 0;
  int _position = 0;
  String? _error;

  late AudioPlayer _audioPlayer;
  PlayerState _playerState = PlayerState.stopped;
  late AnimationController _aniController;
  late StreamSubscription _durationSubscription;
  late StreamSubscription _positionSubscription;
  late StreamSubscription _playerCompleteSubscription;
  late StreamSubscription _playerStateSubscription;

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
    _durationSubscription.cancel();
    _positionSubscription.cancel();
    _playerCompleteSubscription.cancel();
    _playerStateSubscription.cancel();
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
      if (!mounted) return;
      setState(() {
        _playerState = state;
      });
    });
  }

  _play() async {
    if (PlayerState.playing == _playerState) {
      await _stop();
    }
    await _audioPlayer.play(UrlSource(_audioUrl));
    setState(() => _playerState = PlayerState.playing);
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
      Uri uri = Uri.parse(item.content);
      _audioUrl = '${uri.origin}${uri.path}';
      _duration = Util.parseInt(uri.queryParameters['duration']);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
  }

  @override
  void didUpdateWidget(covariant BbStrategyVoicePlayWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _parseData();
  }

  @override
  Widget build(BuildContext context) {
    bool auditFail = item.state == 2;
    int time = _playerState == PlayerState.playing
        ? max(_duration - _position, 0)
        : _duration;
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: auditFail
                ? const Color(0xFFFF5F7D)
                : R.colors.mainTextColor.withOpacity(0.2),
            width: 0.5),
      ),
      child: _error != null
          ? Text(
              _error!,
              style: TextStyle(fontSize: 14, color: R.colors.mainTextColor),
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
                      color: R.colors.mainBrandColor,
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
                  style:
                      TextStyle(fontSize: 14, color: R.colors.mainBrandColor),
                ),
              ],
            ),
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
