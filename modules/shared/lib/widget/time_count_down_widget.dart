import 'dart:async';

import 'package:flutter/material.dart';

typedef TimerCountDownBuilder = Widget Function(
    BuildContext context, int remainTime);

/// 倒计时widget, 单位秒
class TimerCountDownWidget extends StatefulWidget {
  final int duration; // 倒计时时间 单位秒
  final int period; // 倒计时间隔 单位秒
  final bool autoStart; // 是否自动开始倒计时
  final VoidCallback? onEnd; // 倒计时结束回调
  final TimerCountDownBuilder builder;

  const TimerCountDownWidget(
      {super.key,
      required this.duration,
      this.period = 1,
      required this.builder,
      this.onEnd,
      this.autoStart = false});

  @override
  TimerCountDownWidgetState createState() => TimerCountDownWidgetState();
}

class TimerCountDownWidgetState extends State<TimerCountDownWidget> {
  Timer? _timer;
  late int totalTime;
  late int remainTime;

  @override
  void initState() {
    super.initState();
    totalTime = widget.duration;
    remainTime = totalTime;
    if (widget.autoStart) {
      _startCountDown();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  /// 开始倒计时
  void start() {
    _startCountDown();
  }

  /// 开始倒计时
  void _startCountDown() {
    remainTime = totalTime;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: widget.period), (_) {
      remainTime = totalTime - _.tick;
      if (_.tick >= totalTime) {
        remainTime = 1;
        _.cancel();
        if (widget.onEnd != null) widget.onEnd!();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, remainTime);
  }
}
