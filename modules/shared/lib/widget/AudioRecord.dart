import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

import '../k.dart';

const int NormalStatus = 0;
const int RecordingStatus = 1;
const int CompletedStatus = 2;
const int AuditionStatus = 3;

typedef RecordComplete = Function(String path, int duration);

/// 录音弹窗
class AudioRecord extends StatefulWidget {
  final RecordComplete onCompleted;
  final int? maximumDuration;

  const AudioRecord(
      {super.key, required this.onCompleted, this.maximumDuration});

  static void show(BuildContext context, RecordComplete onCompleted,
      int maximumDuration) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: R.color.mainBgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return SafeArea(
            child: AudioRecord(
                onCompleted: onCompleted, maximumDuration: maximumDuration));
      },
    );
  }

  @override
  State<AudioRecord> createState() {
    return _AudioRecordState();
  }
}

class _AudioRecordState extends State<AudioRecord>
    with TickerProviderStateMixin<AudioRecord> {
  int _duration = 0;
  String _audioUrl = '';
  int _status = NormalStatus;
  StreamSubscription? _recorderSubscription;
  int _secondTimer = 0;
  late FlutterSound flutterSound;

  late Animation<double> _circleScale;
  late Animation<double> _firstBarScale;
  late Animation<double> _secondBarScale;
  late Animation<double> _thirdBarScale;
  late Animation<double> _fourthBarScale;
  late Animation<double> _fifthBarScale;
  late AnimationController _inController;
  late AudioPlayer _audioPlayer;

  bool _isRecording = false;

  int _position = 0; // 试音播放进度
  Timer? _timer;

  int get _positionText {
    int position = _position;
    return max(_duration - position, 0);
  }

  @override
  void initState() {
    super.initState();

    flutterSound = FlutterSound();
    flutterSound.setSubscriptionDuration(1);
    _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);

    _inController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _circleScale = Tween(
      begin: 1.0,
      end: 1.22,
    ).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _firstBarScale = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 1, end: 2.5), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 2.5, end: 1.0), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
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
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
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
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
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
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _fifthBarScale = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 2.5, end: 1), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 1, end: 2.5), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: _inController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_secondTimer > 0) JsTimer.clearTimeout(_secondTimer);

    _inController.dispose();

    _timer?.cancel();

    super.dispose();
  }

  Future<bool> _onWillPop() {
    if (_isRecording) {
      Fluttertoast.showToast(msg: K.voice_recording);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = K.base_audio_status_normal;
    if (_status == RecordingStatus) {
      title = K.base_audio_status_recording;
    } else if (_status == CompletedStatus) {
      title = K.base_audio_status_complete;
    } else if (_status == AuditionStatus) {
      title = K.base_audio_status_audition;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        height: 365 + Util.iphoneXBottom,
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.only(top: 10),
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: R.color.thirdTextColor,
                borderRadius: const BorderRadius.all(Radius.circular(2.5)),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsetsDirectional.only(
                  top: 8, bottom: 40, start: 6),
              child: InkWell(
                onTap: _close,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: R.img(
                    'close_icon.svg',
                    width: 18,
                    color: R.color.mainTextColor,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  ),
                ),
              ),
            ),
            Text(
              Utility.formatTimeClock(
                  _status == AuditionStatus ? _positionText : _duration),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: R.color.secondTextColor),
            ),
            const SizedBox(height: 12),
            _buildRecordButtons(),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
            ),
          ],
        ),
      ),
    );
  }

  void _close() async {
    if (await _onWillPop()) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildRecordButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (_status >= CompletedStatus) _buildDeleteButton(),
        _buildRecordButton(),
        if (_status >= CompletedStatus) _buildFinishButton(),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: _deleteRecord,
      child: Container(
        width: 42,
        height: 42,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: R.color.thirdTextColor,
          borderRadius: const BorderRadius.all(Radius.circular(21)),
        ),
        child: R.img('ic_audio_delete.svg',
            width: 14,
            color: Colors.white,
            package: ComponentManager.MANAGER_BASE_CORE),
      ),
    );
  }

  Widget _buildFinishButton() {
    return GestureDetector(
      onTap: _onSuccTap,
      child: Container(
        width: 42,
        height: 42,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: R.color.mainBrandColor,
          borderRadius: const BorderRadius.all(Radius.circular(21)),
        ),
        child: R.img('ic_audio_finish.svg',
            width: 14,
            color: Colors.white,
            package: ComponentManager.MANAGER_BASE_CORE),
      ),
    );
  }

  Widget _buildRecordButton() {
    return GestureDetector(
      onTap: _onRecordTap,
      child: SizedBox(
        width: 150,
        height: 150,
        child: AnimatedBuilder(
          animation: _inController,
          builder: (BuildContext context, _) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: R.color.mainBrandColor.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(75)),
                  ),
                ),
                if (_status == RecordingStatus || _status == AuditionStatus)
                  Container(
                    width: 118 * _circleScale.value,
                    height: 118 * _circleScale.value,
                    decoration: BoxDecoration(
                      color: R.color.mainBrandColor.withOpacity(0.3),
                      borderRadius: BorderRadius.all(
                          Radius.circular(59 * _circleScale.value)),
                    ),
                  ),
                Container(
                  width: 112,
                  height: 112,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFA221), Color(0xFFFFEC00)],
                        begin: AlignmentDirectional.bottomStart,
                        end: AlignmentDirectional.topEnd),
                    borderRadius: BorderRadius.all(Radius.circular(56)),
                  ),
                ),
                SizedBox(
                  width: 36,
                  height: 30,
                  child: (_status == RecordingStatus ||
                          _status == AuditionStatus)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 4,
                              height: 12 * _firstBarScale.value,
                              decoration: BoxDecoration(
                                color: R.color.mainBgColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2)),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              width: 4,
                              height: 12 * _secondBarScale.value,
                              decoration: BoxDecoration(
                                color: R.color.mainBgColor.withOpacity(0.85),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2)),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              width: 4,
                              height: 12 * _thirdBarScale.value,
                              decoration: BoxDecoration(
                                color: R.color.mainBgColor.withOpacity(0.7),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2)),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              width: 4,
                              height: 12 * _fourthBarScale.value,
                              decoration: BoxDecoration(
                                color: R.color.mainBgColor.withOpacity(0.55),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2)),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              width: 4,
                              height: 12 * _fifthBarScale.value,
                              decoration: BoxDecoration(
                                color: R.color.mainBgColor.withOpacity(0.4),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2)),
                              ),
                            ),
                          ],
                        )
                      : R.img('chat_record_default_icon.png',
                          width: 36,
                          height: 30,
                          package: ComponentManager.MANAGER_BASE_CORE),
                ),
              ],
            );
          },
        ),
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
  }

  void _onRecordTap() async {
    if (_status == NormalStatus) {
      // 开始录音
      _inController.reset();
      _inController.repeat(reverse: true);
      startRecorder();
    } else if (_status == RecordingStatus) {
      // 停止录音
      _inController.reset();
      stopRecorder();
    } else if (_status == CompletedStatus) {
      _inController.reset();
      _inController.repeat(reverse: true);
      startAudition();
    } else if (_status == AuditionStatus) {
      _inController.reset();
      stopAudition();
    }
  }

  void startAudition() async {
    try {
      File imageFile = File(_audioUrl);
      bool ok = await imageFile.exists();
      await _audioPlayer.stop();

      if (!ok) return;

      _position = 0;
      await _audioPlayer.play(DeviceFileSource(_audioUrl));

      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _position++;
        Log.d('startAudition, _duration: $_duration, _position: $_position');
        if (_position == _duration) {
          _playComplete();
        } else {
          setState(() {});
        }
      });

      if (mounted) {
        setState(() {
          _status = AuditionStatus;
        });
      }
    } catch (e) {
      Log.d(e.toString());
      if (mounted) {
        setState(() {
          _position = 0;
          _status = CompletedStatus;
        });
      }
    }
  }

  void stopAudition() async {
    try {
      _timer?.cancel();
      _position = 0;
      try {
        _audioPlayer.stop();
      } catch (e) {
        Log.d('Stop audio play with error: $e');
      }

      if (mounted) {
        setState(() {
          _position = 0;
          _status = CompletedStatus;
        });
      }
    } catch (e) {
      Log.d(e.toString());
      if (mounted) {
        setState(() {
          _position = 0;
          _status = CompletedStatus;
        });
      }
    }
  }

  void _playComplete() {
    _inController.reset();
    stopAudition();
  }

  void startRecorder() async {
    try {
      _isRecording = true;
      String path = await flutterSound.startRecorder(null);
      Log.d('startRecorder: $path');
      if (path == "permission_granted") {
        _isRecording = false;
        return;
      }

      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        Log.d((e?.currentPosition.toInt() ?? 0) ~/ 1000);

        if (mounted) {
          setState(() {
            _duration = (e?.currentPosition.toInt() ?? 0) ~/ 1000;

            if (widget.maximumDuration != null &&
                _duration >= widget.maximumDuration!) {
              _timeout();
            }
          });
        }
      });

      setState(() {
        _status = RecordingStatus;
      });
    } catch (err) {
      Log.d('startRecorder error: $err');
      Fluttertoast.showToast(msg: K.base_record_failed);
      setState(() {
        _status = NormalStatus;
      });

      _secondTimer = JsTimer.setTimeout(_init, 1500);
    }
  }

  void stopRecorder() async {
    try {
      String result = await flutterSound.stopRecorder();
      Log.d('realStopRecord: $result');

      if (_recorderSubscription != null) {
        _recorderSubscription!.cancel();
        _recorderSubscription = null;
      }

      if (_duration > 0) {
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
          _status = NormalStatus;
        });

        _secondTimer = JsTimer.setTimeout(_init, 1500);
      }
    } catch (err) {
      Log.d('realStopRecord error: $err');
      setState(() {
        _status = NormalStatus;
      });

      _secondTimer = JsTimer.setTimeout(_init, 1500);
    }
    _isRecording = false;
  }

  void _init() {
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
    widget.onCompleted(_audioUrl, _duration);
    Navigator.of(context).pop();
  }
}
