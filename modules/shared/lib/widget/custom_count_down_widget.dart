import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///自定义倒计时组件，返回小时，分钟，秒，外部自定义Widget

class CustomCountDownWidget extends StatefulWidget {
  final int counter;
  final Widget Function(int hour, int minute, int second) customChild;
  final void Function(int leftCount)? countDownCallback;
  const CustomCountDownWidget(
      {Key? key,
      required this.counter,
      required this.customChild,
      this.countDownCallback})
      : super(key: key);

  @override
  State<CustomCountDownWidget> createState() => _CustomCountDownWidgetState();
}

class _CustomCountDownWidgetState extends State<CustomCountDownWidget> {
  int _counter = 0;

  Timer? _countDownTimer;

  @override
  void initState() {
    super.initState();
    _counter = widget.counter;
    if (_counter > 0) {
      _start();
    }
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomCountDownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.counter != oldWidget.counter) {
      _counter = widget.counter;
      if (_counter > 0 && _countDownTimer == null) {
        _start();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child = widget.customChild(
        _getHour(_counter), _getMin(_counter), _getSecond(_counter));
    return child;
  }

  _onTimer(Timer timer) {
    if (_counter <= 0) {
      _stop();
    }
    setState(() {
      _counter = max(0, _counter - 1);
    });
    if (widget.countDownCallback != null) {
      widget.countDownCallback!(_counter);
    }
  }

  _start() {
    _stop();
    Duration duration = const Duration(milliseconds: 1000);
    _countDownTimer = Timer.periodic(duration, _onTimer);
  }

  _stop() {
    if (_countDownTimer != null) {
      _countDownTimer?.cancel();
      _countDownTimer = null;
    }
  }

  int _getHour(int time) {
    int hour = (time ~/ 3600).toInt();
    return hour;
  }

  int _getMin(int time) {
    int min = ((time - _getHour(time) * 3600) ~/ 60).toInt();
    return min;
  }

  int _getSecond(int time) {
    int second =
        ((time - _getHour(time) * 3600 - _getMin(time) * 60) % 60).toInt();
    return second;
  }
}
