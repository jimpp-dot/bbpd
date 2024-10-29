import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';

class UnderTimerWidget extends StatefulWidget {
  final ChatRoomData room;

  const UnderTimerWidget({super.key, required this.room});

  @override
  _UnderTimerWidgetState createState() => _UnderTimerWidgetState();
}

class _UnderTimerWidgetState extends State<UnderTimerWidget> {
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    int timer = 0;
    if (widget.room.config != null) {
      timer = widget.room.config!.counter - widget.room.timestamp;
    }
    if (timer <= 0) return Container();

    return Container(
      width: 90,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(R.imagePath('under/bg_under_timer.png',
                package: ComponentManager.MANAGER_BASE_ROOM))),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 2),
        child: Text(
          '${timer}s',
          style: R.textStyle.title.copyWith(color: Colors.white, fontSize: 26),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
      if (widget.room.config != null &&
          (widget.room.config!.counter - widget.room.timestamp <= 0)) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
