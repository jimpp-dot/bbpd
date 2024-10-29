import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 心跳竞速：倒计时
class HeartRaceCounter extends StatefulWidget {
  final int counter;
  const HeartRaceCounter({super.key, this.counter = 0});

  @override
  HeartRaceCounterState createState() {
    return HeartRaceCounterState();
  }
}

class HeartRaceCounterState extends State<HeartRaceCounter> {
  Timer? _timer;
  int _diff = 0;
  late IRoomManager _roomManager;

  @override
  void initState() {
    super.initState();
    _roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    _init();
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  @override
  void didUpdateWidget(HeartRaceCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.counter != widget.counter) {
      _init();
    }
  }

  _onTimer(Timer timer) {
    int diff = widget.counter - _roomManager.getTimestamp();
    if (diff <= 0) {
      _stop();
    }

    Log.d("counter onTimer $diff");
    setState(() {
      _diff = diff;
    });
  }

  _init() {
    _diff = widget.counter - _roomManager.getTimestamp();
    if (_diff <= 0 || _roomManager.getServerTime() == 0) {
      _diff = 0;
      return;
    }
    _start();
  }

  _start() {
    _stop();
    Duration duration = const Duration(milliseconds: 1000);
    _timer = Timer.periodic(duration, _onTimer);
    Log.d("counter start");
  }

  _stop() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  _format(int second) {
    int m;
    int s;
    if (second <= 60) {
      s = second;
      m = 0;
    } else {
      m = second ~/ 60;
      s = second % 60;
    }
    return "${_withZero(m)}:${_withZero(s)}";
  }

  _withZero(int value) {
    return value < 10 ? "0$value" : value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(9),
        color: Colors.black.withOpacity(0.48),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 5,
          ),
          R.img(
            'art_center_counter_icon.webp',
            width: 12,
            height: 12,
            color: Colors.white,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            _format(_diff),
            style: const TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
