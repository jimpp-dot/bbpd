import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final Duration period;
  final Duration? stop;
  final VoidCallback? onTick;
  final WidgetBuilder builder;

  const TimerWidget(
      {super.key,
      this.period = const Duration(seconds: 1),
      this.onTick,
      required this.builder,
      this.stop = const Duration(seconds: 5)});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    initTimer();
  }

  void initTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(widget.period, (_) {
      if (widget.onTick != null) widget.onTick!();
      if (mounted) setState(() {});
      if (widget.stop != null &&
          _.tick >= widget.stop!.inMilliseconds ~/ widget.period.inMilliseconds)
        _.cancel();
    });
  }

  @override
  void didUpdateWidget(TimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    initTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
