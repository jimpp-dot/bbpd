import 'dart:async';

import 'package:shared/shared.dart';
import 'package:draw_guess/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

/// 画猜接龙：倒计时控件
class GuessQueueCountDown extends StatefulWidget {
  final ChatRoomData room;
  final int countDownTime;

  /// 倒计时到什么时间点，用这个时间跟房间timestamp比较，所有用户可以统一倒计时
  final VoidCallback? timeOutCallback;

  const GuessQueueCountDown({
    super.key,
    required this.room,
    required this.countDownTime,
    this.timeOutCallback,
  });

  @override
  GuessQueueCountDownState createState() => GuessQueueCountDownState();
}

class GuessQueueCountDownState extends State<GuessQueueCountDown> {
  Timer? _timer;
  int diff = 0;

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  @override
  void didUpdateWidget(GuessQueueCountDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.countDownTime != widget.countDownTime) {
      _init();
    }
  }

  _onTimer(Timer timer) {
    int diffTime = widget.countDownTime - widget.room.timestamp;
    Log.d(diffTime);
    if (diffTime <= 0) {
      diffTime = 0;
      _stop();
      widget.timeOutCallback?.call();
    }
    diff = diffTime;
    refresh();
  }

  _init() {
    diff = widget.room.serverTime > 0
        ? (widget.countDownTime - (widget.room.timestamp ?? 0))
        : 0;
    if (diff <= 0) {
      diff = 0;
      return;
    }
    _start();
  }

  _start() {
    _stop();
    Duration duration = const Duration(milliseconds: 1000);
    _timer = Timer.periodic(duration, _onTimer);
  }

  _stop() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage(Assets.draw_guess$ic_guess_queue_count_down_bg_webp),
          fit: BoxFit.cover,
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        '$diff',
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Color(0xFF313131),
        ),
      ),
    );
  }
}
