import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';

const int NormalStatus = 0;
const int RecordingStatus = 1;
const int CompletedStatus = 2;
const int AuditionStatus = 3;

typedef RecordComplete = Function(String? path, int? duration);

/// 录音弹窗
class AudioRecorderWidget extends StatefulWidget {
  final RecordComplete onCompleted;
  final int? maximumDuration;
  final RecordComplete? onFinish;
  final VoidCallback? onStartRecord;
  final VoidCallback? onDelete;
  final String? audioUrl;
  final int duration;
  final bool supportDark;

  /// 下面两个margin不一致是因为两种状态下按钮的row.height发生了变化
  //只有一个录制按钮时距离底部的margin
  final double maxBottomMargin;

  //三个按钮都出时距离底部的margin
  double minBottomMargin = 0;
  final int minDuration;
  final AudioRecordType type;

  AudioRecorderWidget({
    Key? key,
    required this.onCompleted,
    this.maximumDuration,
    this.onStartRecord,
    this.onFinish,
    this.onDelete,
    required this.audioUrl,
    required this.duration,
    this.minDuration = 0,
    this.type = AudioRecordType.editAudio,
    this.supportDark = true,
    required this.maxBottomMargin,
  }) : super(key: key) {
    minBottomMargin = max(0, maxBottomMargin - 6);
  }

  @override
  State<AudioRecorderWidget> createState() {
    return _AudioRecorderWidgetState();
  }
}

class _AudioRecorderWidgetState extends State<AudioRecorderWidget>
    with TickerProviderStateMixin<AudioRecorderWidget> {
  int _duration = 0;
  String? _audioUrl;
  int _status = NormalStatus;
  StreamSubscription? _recorderSubscription;
  int _secondTimer = 0;
  late FlutterSound flutterSound;

  late AudioPlayer _audioPlayer;
  StreamSubscription? _audioPlayerStateSubscription;
  StreamSubscription? _audioPlayerDurationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  PlayerState _playerState = PlayerState.stopped;

  late Animation<double> _circleScale;
  late Animation<double> _firstBarScale;
  late Animation<double> _secondBarScale;
  late Animation<double> _thirdBarScale;
  late Animation<double> _fourthBarScale;
  late Animation<double> _fifthBarScale;
  late AnimationController _inController;

  bool _isRecording = false;

  int _position = 0; // 试音播放进度

  int get _positionText {
    int position = 0;
    position = _position;
    return max(_duration - position, 0);
  }

  @override
  void initState() {
    super.initState();
    _audioUrl = widget.audioUrl;
    _duration = widget.duration;
    if (_audioUrl != null && _audioUrl!.trim().isNotEmpty) {
      _status = CompletedStatus;
    }
    _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
    _positionSubscription = _audioPlayer.onPositionChanged.listen((p) {
      if (p.inSeconds == _position) return;
      Log.d('AudioPlay onPositionChanged :$p');
      _position = p.inSeconds;
      if (mounted) setState(() {});
    });

    _playerCompleteSubscription = _audioPlayer.onPlayerComplete.listen((event) {
      Log.d('AudioPlay onPlayerComplete');
      _playerState = PlayerState.completed;
      _playComplete();
    });

    _audioPlayerStateSubscription =
        _audioPlayer.onPlayerStateChanged.listen((s) {
      Log.d('AudioPlay onPlayerStateChanged:$s');
      _playerState = s;
      if (s == PlayerState.stopped) {
        _playComplete();
      }
    });

    flutterSound = FlutterSound();
    flutterSound.setSubscriptionDuration(1);

    _inController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _circleScale = Tween(begin: 1.0, end: 1.22).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _firstBarScale = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 1, end: 2.5), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 2.5, end: 1.0), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _secondBarScale = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.3333, end: 2.5), weight: 117),
      TweenSequenceItem<double>(
          tween: Tween(begin: 2.5, end: 1.0), weight: 150),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.0, end: 1.3333), weight: 33),
    ]).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _thirdBarScale = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.75, end: 2.5), weight: 75),
      TweenSequenceItem<double>(
          tween: Tween(begin: 2.5, end: 1.0), weight: 150),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.0, end: 1.75), weight: 75),
    ]).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _fourthBarScale = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 2.167, end: 2.5), weight: 33),
      TweenSequenceItem<double>(
          tween: Tween(begin: 2.5, end: 1.0), weight: 150),
      TweenSequenceItem<double>(
          tween: Tween(begin: 1.0, end: 2.167), weight: 117),
    ]).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _fifthBarScale = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 2.5, end: 1), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 1, end: 2.5), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
  }

  @override
  void dispose() {
    if (_secondTimer > 0) JsTimer.clearTimeout(_secondTimer);
    _audioPlayerStateSubscription?.cancel();
    _audioPlayerDurationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();

    _audioPlayer.dispose();

    _inController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            _getTimeText(),
            style: TextStyle(
              fontSize: 13,
              // color: widget.type == AudioRecordType.quickReply
              //     ? (widget.supportDark
              //         ? R.colors.secondTextColor
              //         : R.color.secondTextColor)
              //     : R.colors.mainBgColor,

              color: Colors.white,


            ),
          ),
          const SizedBox(height: 8),
          _buildRecordButtons(),
          SizedBox(
              height: _status >= CompletedStatus
                  ? widget.minBottomMargin
                  : widget.maxBottomMargin),
        ],
      ),
    );
  }

  String _getTimeText() {
    if (_status == NormalStatus) {
      if (widget.minDuration > 0) {
        return K.personal_min_time_tips(['${widget.minDuration}']);
      }
      return K.personal_tap_record;
    }
    return Utility.formatTimeClock(
        _status == AuditionStatus ? _positionText : _duration);
  }

  Widget _buildRecordButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (_status >= CompletedStatus) _buildDeleteButton(),
        if (_status >= CompletedStatus) const SizedBox(width: 16),
        _buildRecordButton(),
        if (_status >= CompletedStatus) const SizedBox(width: 16),
        if (_status >= CompletedStatus) _buildFinishButton(),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: _deleteRecord,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          Container(
            width: 56,
            height: 56,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.4),Colors.black.withOpacity(0.4)],
                // colors: widget.type == AudioRecordType.quickReply
                //     ? (widget.supportDark
                //         ? R.colors.mainBrandGradientColors
                //         : R.color.mainBrandGradientColors)
                //     : [Colors.white, Colors.white],
                begin: const Alignment(-0.5, -0.5),
                end: const Alignment(0.5, 0.5),
              ),
            ),
            child: R.img(Assets.personaldata$cancel_record_webp,
                width: 22,
                height: 24,
                color: widget.type == AudioRecordType.quickReply
                    ? Colors.white
                    : R.color.mainBrandColor),
          ),
          const SizedBox(height: 2),
          Text(
            K.personal_retake_record,
            style: const TextStyle(
              color: Colors.white,

              // color: widget.type == AudioRecordType.quickReply
              //     ? (widget.supportDark
              //         ? R.colors.secondTextColor
              //         : R.color.secondTextColor)
              //     : R.colors.mainBgColor,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinishButton() {
    return GestureDetector(
      onTap: _onSuccTap,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          Container(
            width: 56,
            height: 56,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  // colors: widget.type == AudioRecordType.quickReply
                  //     ? (widget.supportDark
                  //         ? R.colors.mainBrandGradientColors
                  //         : R.color.mainBrandGradientColors)
                  //     : [Colors.white, Colors.white],
                  colors: [Colors.black.withOpacity(0.4),Colors.black.withOpacity(0.4)],

                  begin: const Alignment(-0.5, -0.5),
                  end: const Alignment(0.5, 0.5),
                )),
            child: R.img('test_listen.svg',
                width: 40,
                height: 40,
                color: widget.type == AudioRecordType.quickReply
                    ? Colors.white
                    : R.color.mainBrandColor,
                package: ComponentManager.MANAGER_PERSONALDATA),
          ),
          const SizedBox(height: 2),
          Text(
            K.personal_listen_test,
            style: TextStyle(
              color: Colors.white,
              // color: widget.type == AudioRecordType.quickReply
              //     ? (widget.supportDark
              //         ? R.colors.secondTextColor
              //         : R.color.secondTextColor)
              //     : R.colors.mainBgColor,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordButton() {
    double diameter = 80;
    double outerDimDistance = 3;
    double innerDiameter = diameter - outerDimDistance * 2;
    return GestureDetector(
      onTap: _onRecordTap,
      child: SizedBox(
        width: diameter,
        height: diameter,
        child: AnimatedBuilder(
          animation: _inController,
          builder: (BuildContext context, _) {
            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: diameter,
                  height: diameter,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.type == AudioRecordType.quickReply
                          ? (widget.supportDark
                              ? R.colors.mainBrandColor.withOpacity(0.1)
                              : R.color.mainBrandColor.withOpacity(0.1))
                          : R.colors.mainBgColor.withOpacity(0.3),
                      width: outerDimDistance,
                    ),
                  ),
                ),
                if (_status == RecordingStatus)
                  Container(
                    width: diameter * _circleScale.value,
                    height: diameter * _circleScale.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: R.colors.mainBgColor.withOpacity(0.3),
                    ),
                  ),
                if (_status == CompletedStatus)
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: innerDiameter,
                    height: innerDiameter,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        // colors: widget.type == AudioRecordType.quickReply
                        //     ? (widget.supportDark
                        //         ? R.colors.mainBrandGradientColors
                        //         : R.color.mainBrandGradientColors)
                        //     : [Colors.white, Colors.white],

                        colors: [Colors.black.withOpacity(0.4),Colors.black.withOpacity(0.4)],



                        begin: const Alignment(-0.5, -0.5),
                        end: const Alignment(0.5, 0.5),
                      ),
                    ),
                    child: R.img(
                      Assets.personaldata$check_mark_svg,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                      width: 40,
                      height: 40,
                      color: widget.type == AudioRecordType.quickReply
                          ? Colors.white
                          : R.color.mainBrandColor,
                    ),
                  ),
                if (_status != CompletedStatus)
                  Container(
                    width: innerDiameter,
                    height: innerDiameter,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.4),Colors.black.withOpacity(0.4)],

                        // colors: widget.type == AudioRecordType.quickReply
                        //     ? (widget.supportDark
                        //         ? R.colors.mainBrandGradientColors
                        //         : R.color.mainBrandGradientColors)
                        //     : [Colors.white, Colors.white],
                        begin: const Alignment(-0.5, -0.5),
                        end: const Alignment(0.5, 0.5),
                      ),
                    ),
                    child: _buildWaveAnimView(),
                  ),
                if (_status == AuditionStatus)
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: innerDiameter,
                    height: innerDiameter,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: widget.type == AudioRecordType.quickReply
                            ? (widget.supportDark
                                ? R.colors.mainBrandGradientColors
                                : R.color.mainBrandGradientColors)
                            : [Colors.white, Colors.white],



                        begin: const Alignment(-0.5, -0.5),
                        end: const Alignment(0.5, 0.5),
                      ),
                    ),
                    child: R.img(
                      Assets.personaldata$playing_stop_svg,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                      width: 40,
                      height: 40,
                      color: widget.type == AudioRecordType.quickReply
                          ? Colors.white
                          : null,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildWaveAnimView() {
    Color waveColor = widget.type == AudioRecordType.quickReply
        ? Colors.white
        : R.colors.mainBrandColor;
    return SizedBox(
      width: 36,
      height: 30,
      child: (_status == RecordingStatus || _status == AuditionStatus)
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 4,
                  height: 12 * _firstBarScale.value,
                  decoration: BoxDecoration(
                    color: waveColor,
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 4,
                  height: 12 * _secondBarScale.value,
                  decoration: BoxDecoration(
                    color: waveColor.withOpacity(0.85),
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 4,
                  height: 12 * _thirdBarScale.value,
                  decoration: BoxDecoration(
                    color: waveColor.withOpacity(0.7),
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 4,
                  height: 12 * _fourthBarScale.value,
                  decoration: BoxDecoration(
                    color: waveColor.withOpacity(0.55),
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 4,
                  height: 12 * _fifthBarScale.value,
                  decoration: BoxDecoration(
                    color: waveColor.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ],
            )
          : R.img(
              BaseAssets.shared$chat_record_default_icon_png,
              width: 36,
              height: 30,
              package: ComponentManager.MANAGER_BASE_CORE,
              color: (widget.type == AudioRecordType.quickReply
                  ? Colors.white
                  : R.colors.mainBrandColor),
            ),
    );
  }

  void _deleteRecord() {
    _audioUrl = '';
    _duration = 0;
    _inController.reset();
    _status = NormalStatus;

    if (mounted) {
      setState(() {});
    }

    if (widget.onDelete != null) widget.onDelete!();
  }

  void _onRecordTap() async {
    if (_status == NormalStatus) {
      // 开始录音
      if (_isRecording) return;
      _inController.reset();
      _inController.repeat(reverse: true);
      startRecorder();
    } else if (_status == RecordingStatus) {
      // 停止录音
      if (!_isRecording) return;
      _inController.reset();
      stopRecorder();
    } else if (_status == CompletedStatus) {
      widget.onCompleted(_audioUrl, _duration);
    } else if (_status == AuditionStatus) {
      _inController.reset();
      stopAudition();
    }
  }

  void _startPlayAudio() async {
    try {
      bool local = true;
      if (widget.audioUrl != null &&
          widget.audioUrl!.isNotEmpty &&
          widget.audioUrl == _audioUrl) {
        //远程链接
        local = false;
      }
      Log.d(
          'startAudition widget.audioUrl:${widget.audioUrl},_audioUrl:$_audioUrl');

      _position = 0;
      if (_playerState == PlayerState.playing) {
        await _audioPlayer.stop();
      }

      await _audioPlayer
          .play(local ? DeviceFileSource(_audioUrl!) : UrlSource(_audioUrl!));

      if (mounted) {
        setState(() {
          _status = AuditionStatus;
        });
      }
    } catch (e) {
      Fluttertoast.showCenter(msg: e.toString());
      Log.d('startAudition error${e.toString()}');
      if (mounted) {
        setState(() {
          _position = 0;
          _playerState = PlayerState.stopped;
          _status = CompletedStatus;
        });
      }
    }
  }

  void stopAudition() async {
    _position = 0;
    try {
      if (_playerState == PlayerState.playing) {
        await _audioPlayer.stop();
      }
    } catch (e) {
      Log.d('Stop audio play with error: $e');
    }

    if (mounted) {
      setState(() {
        _status = CompletedStatus;
      });
    }
  }

  void _playComplete() {
    _inController.reset();
    stopAudition();
  }

  void startRecorder() async {
    Log.d('startRecorder');
    try {
      _isRecording = true;
      String path = await flutterSound.startRecorder(null);
      Log.d('startRecorder path: $path');
      if (path == "permission_granted") {
        _isRecording = false;
        return;
      }
      if (widget.onStartRecord != null) {
        widget.onStartRecord!();
      }
      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        Log.d('onRecorderStateChanged: ${e!.currentPosition.toInt() ~/ 1000}');

        if (mounted) {
          setState(() {
            _duration = e.currentPosition.toInt() ~/ 1000;

            if (widget.maximumDuration != null &&
                _duration >= widget.maximumDuration!) {
              _timeout();
            }
          });
        }
      });

      setState(() {
        Log.d('setState RecordingStatus');
        _duration = 0;
        _status = RecordingStatus;
      });
    } catch (err) {
      Log.d('startRecorder error: $err');
      Fluttertoast.showToast(msg: BaseK.K.base_record_failed);
      _isRecording = false;
      setState(() {
        _status = NormalStatus;
      });
      if (widget.onFinish != null) {
        widget.onFinish!('', 0);
      }
      _secondTimer = JsTimer.setTimeout(_init, 1500);
    }
  }

  void stopRecorder() async {
    Log.d('stopRecorder');
    try {
      String result = await flutterSound.stopRecorder();
      Log.d('realStopRecord: $result');

      if (_recorderSubscription != null) {
        _recorderSubscription!.cancel();
        _recorderSubscription = null;
      }

      if (_duration > 0 &&
          (widget.minDuration == 0 || _duration > widget.minDuration)) {
        Log.d('duration: $_duration');
        if (Platform.isIOS) {
          _audioUrl = result.substring(7);
        } else if (Platform.isAndroid) {
          _audioUrl = result;
        }

        setState(() {
          _status = CompletedStatus;
        });
      } else {
        setState(() {
          Log.d('setState NormalStatus');
          _status = NormalStatus;
        });
      }
    } catch (err) {
      Log.d('realStopRecord error: $err');
      setState(() {
        _status = NormalStatus;
      });

      _secondTimer = JsTimer.setTimeout(_init, 1500);
    }
    _isRecording = false;
    if (widget.onFinish != null) {
      widget.onFinish!(_audioUrl ?? '', _duration);
    }
  }

  void _init() {
    Log.d('_init');
    JsTimer.clearTimeout(_secondTimer);
    setState(() {
      _status = NormalStatus;
    });
  }

  void _timeout() {
    Log.d("live _timeout, _isRecording: $_isRecording");

    if (!_isRecording) {
      return;
    }

    _inController.reset();
    stopRecorder();
  }

  //
  void _onSuccTap() {
    _inController.reset();
    _inController.repeat(reverse: true);
    _startPlayAudio();
  }
}
