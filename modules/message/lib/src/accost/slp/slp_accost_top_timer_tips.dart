import 'dart:async';

import 'package:shared/shared.dart';
import 'package:message/k.dart';
import 'package:flutter/material.dart';

class BBAccostTopTimerTips extends StatefulWidget {
  final int duration;

  const BBAccostTopTimerTips({super.key, required this.duration});

  @override
  _BBAccostTopTimerTipsState createState() => _BBAccostTopTimerTipsState();
}

class _BBAccostTopTimerTipsState extends State<BBAccostTopTimerTips> {
  late Timer _timer;

  late int _duration;

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  void _initTimer() {
    _duration = widget.duration;
    _timer.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BBAccostTopTimerTips oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration && mounted) {
      _initTimer();
    }
  }

  void _onTimer(Timer timer) {
    if (!_timer.isActive || !mounted) return;
    _duration--;
    if (_duration < 0) {
      _duration = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Map<String, int> map = Utility.timeDistanceV3(_duration);

    String day = '${map['day']}';
    String hour = map['hour']! > 9 ? '${map['hour']}' : '0${map['hour']}';
    String min = map['min']! > 9 ? '${map['min']}' : '0${map['min']}';
    String sec = map['sec']! > 9 ? '${map['sec']}' : '0${map['sec']}';

    return Container(
      height: 38,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        color: R.colors.mainBrandColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Text(
            K.msg_match_pause_send,
            style: TextStyle(
                color: R.colors.mainBrandColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            K.msg_accost_timer_tips([day, hour, min, sec]),
            style: TextStyle(
                color: R.colors.mainBrandColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
