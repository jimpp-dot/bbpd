import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:certificate/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BasK;
import 'package:certificate/k.dart';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

typedef OnRecordComplete = Function(String path, int duration);
typedef OnRecordRemoved = Function();
typedef OnTapFilter = bool Function();

/// 点击过滤器
typedef OnAudioState = Function(int state);

/// 0-默认；1-正在录音；2-正在播放

class AudioRecordButton extends StatefulWidget {
  final OnRecordComplete? onRecordComplete;

  /// 录音完成回调
  final OnRecordRemoved? onRecordRemoved;

  /// 录音删除回调
  final OnAudioState? onAudioState;

  /// 录音 开始播放/开始录音/结束播放/结束录音 回调
  final OnTapFilter? onTapFilter;

  /// 录音 按钮点击时间 过滤器
  final String audioUrl;
  final int audioDuration;
  final int maxRecordDuration;
  final int minRecordDuration;

  const AudioRecordButton({
    Key? key,
    required this.audioUrl,
    required this.audioDuration,
    this.onRecordComplete,
    this.onRecordRemoved,
    this.onAudioState,
    this.onTapFilter,
    this.maxRecordDuration = 120,
    this.minRecordDuration = 6,
  }) : super(key: key);

  @override
  _AudioRecordButtonState createState() => _AudioRecordButtonState();
}

class _AudioRecordButtonState extends State<AudioRecordButton>
    with TickerProviderStateMixin<AudioRecordButton> {
  int _duration = 0;

  bool _started = false;
  String? audioFilePath;

  late FlutterSound flutterSound;
  StreamSubscription? _recorderSubscription;

  Timer? _timer;

  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    Log.d('InitState, audioUrl: ${widget.audioUrl}');

    flutterSound = FlutterSound();
    flutterSound.setSubscriptionDuration(1);
    _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
    _duration = widget.audioDuration;

    _downloadAudioFile(widget.audioUrl);
  }

  @override
  void dispose() {
    super.dispose();

    if (_hasAudio) {
      _stopAudioPlay(fromDispose: true);
    } else {
      stopRecorder(fromDispose: true);
    }
    _audioPlayer.dispose();
    Log.d('dispose, audioUrl: ${widget.audioUrl}');
  }

  Future<void> _downloadAudioFile(String audio) async {
    if (audio.isNotEmpty) {
      final directory = await getApplicationDocumentsDirectory();
      File temp = File('${directory.path}/${Util.md5Encryption(audio)}.m4a');
      bool ok = await temp.exists();
      if (!ok) {
        if (!audio.startsWith(RegExp(r'http(s?)://'))) {
          audio = System.imageDomain + audio;
        }
        await _download(audio, temp.path);
      }
      audioFilePath = temp.path;
    }

    refresh();
  }

  Future<bool> _download(String downloadUrl, String downloadSavePath) async {
    var dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cr, String host, int port) {
        return true;
      };
      client.findProxy = null;
    };
    try {
      await dio.download(downloadUrl, downloadSavePath,
          onReceiveProgress: (int received, int total) {});
      return true;
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return false;
  }

  bool get _hasAudio {
    return audioFilePath != null && audioFilePath!.isNotEmpty;
  }

  Widget _buildDesc() {
    if (_hasAudio) {
      return GestureDetector(
        onTap: () {
          audioFilePath = null;
          _duration = 0;
          if (widget.onRecordRemoved != null) {
            widget.onRecordRemoved!();
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            K.cer_delete,
            style: R.textStyle.caption.copyWith(color: R.color.mainBrandColor),
          ),
        ),
      );
    } else {
      String str = '';
      if (_started) {
        str = K.cer_click_to_stop_record;
      } else {
        str = K.cer_click_to_start_record;
      }
      return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          str,
          style: R.textStyle.caption,
        ),
      );
    }
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String _getFormattedDuration(int duration) {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;

    return '${_twoDigits(minutes)}:${_twoDigits(seconds)}';
  }

  @override
  Widget build(BuildContext context) {
    Log.d(
        'In build audioFilePath: $audioFilePath, started: $_started, hasAudio: $_hasAudio, _duration: $_duration');

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            _getFormattedDuration(_duration),
            style: R.textStyle.caption,
          ),
        ),
        InkWell(
          onTap: _switchRecordStatus,
          borderRadius: BorderRadius.circular(24),
          child: Ink(
            width: 200,
            height: 48,
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: LinearGradient(
                colors: R.color.mainBrandGradientColors,
              ),
            ),
            child: Align(child: _getIcon()),
          ),
        ),
        _buildDesc(),
      ],
    );
  }

  Widget _getIcon() {
    String path = Assets.certificate$ic_stop_svg;
    if (!_started) {
      path = Assets.certificate$ic_play_svg;
      if (!_hasAudio) path = Assets.certificate$icon_voice_png;
    }

    return R.img(path,
        height: 28, width: 28, package: ComponentManager.MANAGER_CERTIFICATE);
  }

  void _switchRecordStatus() async {
    Log.d(
        'Button clicked, start to change status with audioFilePath: $audioFilePath, hasAudio: $_hasAudio, started: $_started');

    if (_hasAudio) {
      //有音频，播放
      if (widget.onTapFilter?.call() ?? false) {
        /// 点击过滤器拦截
        return;
      }
      if (_started) {
        _stopAudioPlay();
      } else {
        await _startAudioPlay(audioFilePath!);
      }
    } else {
      //无音频，录音
      if (widget.onTapFilter?.call() ?? false) {
        /// 点击过滤器拦截
        return;
      }
      if (_started) {
        await stopRecorder();
      } else {
        await startRecorder();
      }
    }
  }

  startRecorder() async {
    Log.d('Stop audio record...');

    try {
      String path = await flutterSound.startRecorder(null,
          sampleRate: 8000, numChannels: 1);
      Log.d('startRecorder: $path');
      if (path == "permission_granted") {
        return;
      }
      refresh(() {
        _started = true;
        widget.onAudioState?.call(1);
      });
      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        _duration = (e?.currentPosition.toInt() ?? 0) ~/ 1000;

        if (_duration >= widget.maxRecordDuration) {
          Fluttertoast.showToast(msg: K.cer_record_long_time);
          stopRecorder();
        }
        refresh();
      });
    } catch (err) {
      refresh(() {
        _started = false;
      });
      Fluttertoast.showToast(msg: BasK.K.base_record_failed);
      Log.d('startRecorder error: $err');
    }
  }

  stopRecorder({bool fromDispose = false}) async {
    Log.d('Stop audio record...');

    if (_started == false) return;

    try {
      String result = await flutterSound.stopRecorder();
      Log.d('realStopRecord: $result');

      if (!fromDispose) {
        refresh(() {
          _started = false;
          widget.onAudioState?.call(0);
        });
      }

      if (_recorderSubscription != null) {
        _recorderSubscription!.cancel();
        _recorderSubscription = null;
      }

      if (_duration >= widget.minRecordDuration) {
        if (Platform.isIOS) {
          audioFilePath = result.substring(7);
        } else if (Platform.isAndroid) {
          audioFilePath = result;
        }
        if (widget.onRecordComplete != null && audioFilePath != null) {
          widget.onRecordComplete!(audioFilePath!, _duration);
        }
      } else {
        if (!fromDispose) {
          refresh(() {
            _duration = 0;
            audioFilePath = null;
          });
          Fluttertoast.showToast(msg: K.cer_record_litte_time);
        }
      }
    } catch (e, s) {
      Log.e(s, stackTrace: s);
    }

    Log.d('After stop recorder, audioFilePath: $audioFilePath');
  }

  _startAudioPlay(String audioLocalFile) async {
    Log.d('Start audio play...');

    refresh(() {
      _started = true;
      widget.onAudioState?.call(2);
    });

    await _audioPlayer.play(DeviceFileSource(audioLocalFile));
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Log.d(
          'In timer tick, _duration: $_duration, audionDuration: ${widget.audioDuration}');

      if (_duration <= 0) {
        _stopAudioPlay();
      } else {
        refresh(() {
          _duration = _duration - 1;
        });
      }
    });
  }

  void _stopAudioPlay({bool fromDispose = false}) async {
    Log.d('Stop audio play...');

    _timer?.cancel();
    try {
      _audioPlayer.stop();
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    if (!fromDispose) {
      refresh(() {
        _duration = widget.audioDuration;
        _started = false;
        widget.onAudioState?.call(0);
      });
    }
    Log.d('Stop audio play..., duration: $_duration, started: $_started');
  }
}
