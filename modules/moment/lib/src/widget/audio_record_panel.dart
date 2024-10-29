import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:moment/k.dart';

/// 发表动态录音界面
class RecorderPanel extends StatefulWidget {
  final RecordComplete? onCompleted;
  final ValueNotifier<bool> isRecording;
  final int maxRecordSeconds;
  final int minRecordSeconds;
  final Color progressColor;

  const RecorderPanel({
    super.key,
    this.onCompleted,
    required this.isRecording,
    this.maxRecordSeconds = 300,
    this.minRecordSeconds = 3,
    this.progressColor = Colors.red,
  });

  @override
  _RecorderPanelState createState() => _RecorderPanelState();
}

class _RecorderPanelState extends State<RecorderPanel> {
  late FlutterSound flutterSound;
  StreamSubscription? _recorderSubscription;
  int _duration = 0;

  @override
  void initState() {
    super.initState();
    flutterSound = FlutterSound();
    flutterSound.setSubscriptionDuration(1);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.isRecording.value) {
      stopRecord();
    }
  }

  void startRecord() async {
    try {
      widget.isRecording.value = true;

      String path = await flutterSound.startRecorder(null);
      Log.d('startRecorder: $path');
      if (path == "permission_granted") {
        widget.isRecording.value = false;
        return;
      }

      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        if (e == null) {
          return;
        }
        Log.d(e.currentPosition.toInt() ~/ 1000);

        if (mounted) {
          setState(() {
            _duration = e.currentPosition.toInt() ~/ 1000;
            if (_duration >= widget.maxRecordSeconds) {
              stopRecord();
            }
          });
        }
      });
    } catch (err) {
      widget.isRecording.value = false;
      Log.d('startRecorder error: $err');
      Fluttertoast.showToast(
          msg: K.audio_record_failed, gravity: ToastGravity.CENTER);
    }
  }

  void stopRecord() async {
    widget.isRecording.value = false;
    try {
      String result = await flutterSound.stopRecorder();
      Log.d('realStopRecord: $result');

      if (_recorderSubscription != null) {
        _recorderSubscription!.cancel();
        _recorderSubscription = null;
      }

      if (!mounted) {
        return;
      }

      if (_duration >= widget.minRecordSeconds) {
        widget.onCompleted?.call(result, _duration);
      } else {
        Fluttertoast.showToast(
            msg: K.moment_recording_too_short, gravity: ToastGravity.CENTER);
        _duration = 0;
        setState(() {});
      }
    } catch (err) {
      Fluttertoast.showToast(
          msg: K.audio_record_failed, gravity: ToastGravity.CENTER);
      Log.d('realStopRecord error: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.0, color: R.colors.dividerColor),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Text(
                    Utility.formatTimeClock(_duration),
                    style: R.textStyle.body1
                        .copyWith(color: R.colors.secondTextColor),
                  ),
                  GestureDetector(
                    onTap: _onRecordTaped,
                    child: Container(
                      height: 88.0,
                      width: 88.0,
                      margin: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                      child: _buildButton(),
                    ),
                  ),
                  Text(
                    widget.isRecording.value
                        ? K.moment_stop_recording
                        : K.moment_start_recording,
                    style: R.textStyle.caption
                        .copyWith(color: R.colors.mainTextColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _onRecordTaped() {
    if (widget.isRecording.value) {
      stopRecord();
    } else {
      startRecord();
    }
  }

  Widget _buildButton() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFF5F5F5), width: 4.0),
              borderRadius: BorderRadius.circular(44)),
        ),
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
              color: widget.progressColor,
              borderRadius: BorderRadius.circular(36)),
        ),
        if (widget.isRecording.value)
          CircularProgress(
            maxSeconds: widget.maxRecordSeconds,
            color: widget.progressColor,
            onComplete: () {
              stopRecord();
            },
          ),
        R.img(
          widget.isRecording.value
              ? 'ic_record_stop.svg'
              : 'ic_record_start.svg',
          package: ComponentManager.MANAGER_MOMENT,
          width: 28.0,
          height: 28.0,
        ),
      ],
    );
  }
}

/// 路由圆形进度条
class CircularProgress extends StatefulWidget {
  final VoidCallback? onComplete;
  final Color color;
  final int maxSeconds;

  const CircularProgress(
      {super.key,
      this.onComplete,
      this.color = Colors.red,
      this.maxSeconds = 300});

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    Log.d('CircularProgress initState');
    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: widget.maxSeconds));
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _animationController.reset();
        if (widget.onComplete != null) {
          widget.onComplete!();
        }
//        if (isForward) {
//          _animationController.reverse();
//        } else {
//          _animationController.forward();
//        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    Log.d('CircularProgress dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return GradientCircularProgressIndicator(
          // No gradient
          colors: [widget.color, widget.color],
          radius: 40.0,
          stokeWidth: 2.0,
          value: _animationController.value,
        );
      },
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  ///粗细
  final double stokeWidth;

  /// 圆的半径
  final double radius;

  ///两端是否为圆角
  final bool strokeCapRound;

  /// 当前进度，取值范围 [0.0-1.0]
  final double value;

  /// 进度条背景色
  final Color backgroundColor;

  /// 进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;

  /// 渐变色数组
  final List<Color>? colors;

  /// 渐变色的终止点，对应colors属性
  final List<double>? stops;

  const GradientCircularProgressIndicator({
    super.key,
    this.stokeWidth = 2.0,
    required this.radius,
    this.colors,
    this.stops,
    this.strokeCapRound = false,
    this.backgroundColor = Colors.transparent,
    this.totalAngle = 2 * pi,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    double offset = .0;
    if (strokeCapRound) {
      offset = asin(stokeWidth / (radius * 2 - stokeWidth));
    }
    var localColors = colors ?? [];
    if (colors == null) {
      Color color = R.colors.mainBrandColor;
      localColors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: CircleProgressBarPainter(
          stokeWidth: stokeWidth,
          strokeCapRound: strokeCapRound,
          backgroundColor: backgroundColor,
          value: value,
          total: totalAngle,
          radius: radius,
          colors: localColors,
        ),
      ),
    );
  }
}

class CircleProgressBarPainter extends CustomPainter {
  final double stokeWidth;
  final bool strokeCapRound;
  final double? value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double? radius;
  final List<double>? stops;

  CircleProgressBarPainter({
    required this.stokeWidth,
    this.strokeCapRound = false,
    this.value,
    required this.backgroundColor,
    required this.colors,
    required this.total,
    this.radius,
    this.stops,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius!);
    }
    double offset = stokeWidth / 2.0;
    double theValue = (value ?? .0);
    theValue = theValue.clamp(.0, 1.0) * total;
    double start = .0;

    if (strokeCapRound) {
      start = asin(stokeWidth / (size.width - stokeWidth));
    }

    Rect rect = Offset(offset, offset) &
        Size(size.width - stokeWidth, size.height - stokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = stokeWidth;

    // 先画背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, start, total, false, paint);
    }

    // 再画前景，应用渐变
    if (theValue > 0) {
      paint.shader = SweepGradient(
        startAngle: 0.0,
        endAngle: theValue,
        colors: colors,
        stops: stops,
      ).createShader(rect);

      canvas.drawArc(rect, start, theValue, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
