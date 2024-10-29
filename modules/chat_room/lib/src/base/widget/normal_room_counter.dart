import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class NormalRoomCounter extends StatefulWidget {
  final int counter;

  const NormalRoomCounter({super.key, required this.counter});

  @override
  NormalRoomCounterState createState() {
    return NormalRoomCounterState();
  }
}

class NormalRoomCounterState extends State<NormalRoomCounter> {
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
  void didUpdateWidget(NormalRoomCounter oldWidget) {
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
      _timer!.cancel();
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
      width: 48,
      height: 40.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(R.imagePath('normal_room_counter_bg.webp',
              package: ComponentManager.MANAGER_BASE_ROOM)),
          fit: BoxFit.fill,
        ),
      ),
      alignment: AlignmentDirectional.topCenter,
      padding: const EdgeInsetsDirectional.only(top: 25),
      child: Text(
        _format(_diff),
        style: const TextStyle(
          fontSize: 9.0,
          color: Colors.white,
          height: 1.2,
        ),
      ),
    );
  }
}
