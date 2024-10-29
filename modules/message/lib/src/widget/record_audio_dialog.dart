import 'package:message/k.dart';
import 'dart:async';
import 'dart:io';
import 'package:shared/shared.dart';
import 'package:shared/model/oss_upload_data.dart';
import 'package:shared/widget/gradient_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'dart:math' as math;
import 'package:audioplayers/audioplayers.dart';

/// 录制音频弹框
class RecordAudioDialog extends StatefulWidget {
  final int maxRecordSeconds;
  final int minRecordSeconds;

  const RecordAudioDialog(
      {super.key, this.maxRecordSeconds = 60, this.minRecordSeconds = 5});

  static Future openRecordAudioDialog(BuildContext context,
      {int maxRecordSeconds = 60, int minRecordSeconds = 5}) {
    return DialogTransition.scaleShow(
      context: context,
      barrierDismissible: false,
      duration: const Duration(milliseconds: 250),
      builder: (context) => RecordAudioDialog(
        maxRecordSeconds: maxRecordSeconds,
        minRecordSeconds: minRecordSeconds,
      ),
    );
  }

  @override
  _RecordAudioDialogState createState() => _RecordAudioDialogState();
}

class _RecordAudioDialogState extends State<RecordAudioDialog> {
  late AudioPlayer _audioPlayer;
  late FlutterSound flutterSound;
  StreamSubscription? _recorderSubscription;
  String? _audioPath;
  int _duration = 0;
  bool _recordDoneUI = false;
  bool _recording = false;
  bool _playing = false;
  int _position = 0; // 试音播放进度
  Timer? _timer;
  final GlobalKey _recordBtnKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    flutterSound = FlutterSound();
    flutterSound.setSubscriptionDuration(0.01);
    _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    super.dispose();
    if (!_recordDoneUI && _recording) {
      _stopRecord();
    }
    _audioPlayer.dispose();
    _timer?.cancel();
  }

  void _startRecord() async {
    setState(() {
      _duration = 0;
      _recording = true;
      _recordDoneUI = false;
    });

    try {
      _duration = 0;
      String path = await flutterSound.startRecorder(null,
          sampleRate: 8000, numChannels: 1);
      if (path == "permission_granted") {
        setState(() {
          _duration = 0;
          _recording = false;
        });
        return;
      }

      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        if (e == null) {
          setState(() {
            _duration = 0;
            _recording = false;
          });
          return;
        }
        if (mounted) {
          setState(() {
            _duration = e.currentPosition.toInt() ~/ 1000;
            if (_duration >= widget.maxRecordSeconds) {
              _stopRecord();
            }
          });
        }
      });
    } catch (err) {
      setState(() {
        _duration = 0;
        _recording = false;
      });
      Fluttertoast.showToast(msg: K.msg_record_fail);
      if (_recorderSubscription != null) {
        _recorderSubscription!.cancel();
        _recorderSubscription = null;
      }
    }
  }

  void _stopRecord() async {
    try {
      String result = await flutterSound.stopRecorder();

      if (_recorderSubscription != null) {
        _recorderSubscription!.cancel();
        _recorderSubscription = null;
      }

      if (!mounted) {
        return;
      }

      if (_duration >= widget.minRecordSeconds) {
        if (Platform.isIOS) {
          _audioPath = result.substring(7);
        } else if (Platform.isAndroid) {
          _audioPath = result;
        }
        setState(() {
          _recording = false;
          _recordDoneUI = true;
        });
      } else {
        setState(() {
          _duration = 0;
          _recording = false;
        });
        Fluttertoast.showToast(msg: K.msg_record_time_too_short);
      }
    } catch (err) {
      setState(() {
        _duration = 0;
        _recording = false;
      });
      Fluttertoast.showToast(msg: K.msg_record_fail);
      if (_recorderSubscription != null) {
        _recorderSubscription!.cancel();
        _recorderSubscription = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Stack(children: [
            Container(
              width: 312,
              height: 285,
              decoration: BoxDecoration(
                color: R.colors.mainBgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsetsDirectional.only(top: 30),
              child: _buildContent(),
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: R.img(
                    'ic_close.svg',
                    package: ComponentManager.MANAGER_BASE_CORE,
                    width: 16,
                    height: 16,
                    color: R.colors.mainTextColor,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return '$n';
    } else {
      return '0$n';
    }
  }

  String get _timeStr {
    int time = _recordDoneUI ? _duration - _position : _duration;
    int min = time ~/ 60;
    int sec = time % 60;
    return '${_twoDigits(min)}:${_twoDigits(sec)}';
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 6),
        Text(
          _recordDoneUI ? K.msg_re_record : K.msg_click_record,
          style: TextStyle(
            fontSize: 18,
            color: R.colors.mainTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _timeStr,
          style: TextStyle(fontSize: 13, color: R.colors.secondTextColor),
        ),
        const SizedBox(height: 22),
        SizedBox(
          height: 116,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_recordDoneUI) _buildPlayColumn(),
              const SizedBox(width: 18),
              _buildRecordBtn(),
              const SizedBox(width: 18),
              if (_recordDoneUI) _buildDoneColumn(),
            ],
          ),
        ),
        const Spacer(),
        Text(
          K.msg_record_min_time_tip(['${widget.minRecordSeconds}']),
          style: TextStyle(
            fontSize: 13,
            color: R.colors.secondTextColor,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildRecordBtn() {
    double value = _recordDoneUI
        ? _position / _duration
        : _duration / widget.maxRecordSeconds;
    return GestureDetector(
      key: _recordBtnKey,
      onTap: () {
        if (_recordDoneUI) {
          if (_playing) {
            _stopAudition();
          } else {
            _startRecord();
          }
        } else {
          if (_recording) {
            _stopRecord();
          } else {
            _startRecord();
          }
        }
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          GradientCircularProgressIndicator(
            colors: R.colors.mainBrandGradientColors,
            radius: 46,
            strokeCapRound: true,
            stokeWidth: 4,
            value: value,
            rotate: 1.5 * math.pi,
            backgroundColor: R.colors.secondBgColor,
          ),
          Container(
            width: 80,
            height: 80,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                begin: AlignmentDirectional.centerEnd,
                end: AlignmentDirectional.centerStart,
                colors: R.colors.mainBrandGradientColors,
              ),
            ),
            child: R.img(
              _recording || _playing
                  ? 'ic_record_dialog_stop.svg'
                  : 'ic_record_dialog_voice.svg',
              package: ComponentManager.MANAGER_MESSAGE,
              width: 40,
              height: 40,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPlayColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () {
            _startAudition();
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: R.colors.secondBgColor,
            ),
            alignment: AlignmentDirectional.center,
            child: R.img(
              'ic_record_dialog_play.svg',
              package: ComponentManager.MANAGER_MESSAGE,
              width: 32,
              height: 32,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(K.msg_audition,
            style: TextStyle(fontSize: 11, color: R.colors.thirdTextColor)),
      ],
    );
  }

  Widget _buildDoneColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () {
            _uploadFile(_audioPath ?? '');
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: R.colors.secondBgColor,
            ),
            alignment: AlignmentDirectional.center,
            child: R.img(
              'ic_record_dialog_done.svg',
              package: ComponentManager.MANAGER_MESSAGE,
              width: 32,
              height: 32,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(K.msg_filter_complete,
            style: TextStyle(fontSize: 11, color: R.colors.thirdTextColor)),
      ],
    );
  }

  void _uploadFile(String path) async {
    OssUploadDataResp resp = await BaseRequestManager.getFileUploadUrl('audio');
    showLoading(K.msg_uploading);
    if (resp.success == true && resp.data != null) {
      bool result = false;
      try {
        result = await BaseRequestManager.uploadFile(resp.data!, File(path));
      } catch (e) {
        Log.d('_uploadFile, error: $e');
      }
      if (result) {
        hideLoading();
        String filePath =
            '${resp.data?.host ?? ''}/${BaseRequestManager.getOssFilePath(resp.data?.dir ?? '', File(path))}';
        Navigator.of(context).pop('$filePath?duration=$_duration');
      } else {
        hideLoading();
        Fluttertoast.showToast(msg: R.array('xhr_error_type_array')[6]);
      }
    } else {
      hideLoading();
      Fluttertoast.showToast(msg: resp.msg);
    }
  }

  void showLoading(String message) {
    CommonLoading.show(status: message);
  }

  void hideLoading() {
    CommonLoading.dismiss();
  }

  void _startAudition() async {
    try {
      setState(() {
        _position = 0;
        _playing = true;
      });

      await _audioPlayer.stop();
      await _audioPlayer.play(DeviceFileSource(_audioPath ?? ''));

      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _position++;
        if (_position == _duration) {
          _stopAudition();
        } else {
          setState(() {});
        }
      });
    } catch (e) {
      Fluttertoast.showCenter(msg: e.toString());
      setState(() {
        _position = 0;
        _playing = false;
      });
    }
  }

  void _stopAudition() async {
    try {
      setState(() {
        _position = 0;
        _playing = false;
      });
      _timer?.cancel();
      try {
        _audioPlayer.stop();
      } catch (e) {
        Log.d('Stop audio play with error: $e');
      }
    } catch (e) {}
  }
}
