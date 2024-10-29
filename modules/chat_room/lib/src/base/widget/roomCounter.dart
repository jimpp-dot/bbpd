import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

/// 倒计时
class RoomCounter extends StatefulWidget {
  final int? counter;
  final String name;
  final bool isCplove;
  final bool isPuzzle;
  final Decoration? decoration;

  /// 是否麦位连线
  final bool micLink;
  final int? uid;

  const RoomCounter({
    Key? key,
    this.name = '',
    this.counter,
    this.isCplove = false,
    this.isPuzzle = false,
    this.micLink = false,
    this.uid,
    this.decoration,
  }) : super(key: key);

  @override
  State<RoomCounter> createState() => _State();
}

class _State extends State<RoomCounter> {
  Timer? _timer;
  int _diff = 0;
  final IRoomManager _roomManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);

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
  void didUpdateWidget(RoomCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.counter != widget.counter) {
      _init();
    }
  }

  _onTimer(Timer timer) {
    int diff = (widget.counter ?? 0) - _roomManager.getTimestamp();
    if (diff <= 0) {
      _stop();
    }

    Log.d("counter onTimer $diff");
    setState(() {
      _diff = diff;
    });
  }

  _init() {
    if (widget.counter == null) return;
    _diff = widget.counter! - _roomManager.getTimestamp();
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
    if (widget.counter == null) const SizedBox.shrink();
    if (_diff <= 0) {
      if (widget.name.isEmpty) {
        return const SizedBox.shrink();
      }

      if (widget.isPuzzle) {
        return _buildName(widget.name, 2);
      }

      if (widget.uid != null && widget.uid! <= 0) {
        return Text(
          widget.name,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: TextStyle(
            color: (widget.uid != null && widget.uid! <= 0)
                ? Colors.white.withOpacity(0.4)
                : Colors.white,
            fontSize: 12.0,
          ),
        );
      } else {
        return _buildName(widget.name, 1);
      }
    }

    if (widget.isCplove) {
      return Container(
        alignment: Alignment.center,
        height: 23.0,
        constraints: const BoxConstraints(maxWidth: 45.0),
        decoration: BoxDecoration(
            color: R.color.mainBrandColor,
            borderRadius: const BorderRadius.all(Radius.circular(11.5))),
        child: Text(
          _format(_diff),
          style: const TextStyle(fontSize: 12.0, color: Colors.white),
        ),
      );
    } else if (widget.micLink) {
      return Container(
        height: 16,
        decoration: const ShapeDecoration(
            shape: StadiumBorder(), color: Colors.white12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 6),
            const Text(
              '计时：',
              style: TextStyle(fontSize: 10.0, color: Colors.white54),
            ),
            NumText(
              _format(_diff),
              style: const TextStyle(fontSize: 10.0, color: Colors.white54),
            ),
            const SizedBox(width: 6),
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        height: 21.0,
        constraints: const BoxConstraints(maxWidth: 55.0),
        decoration: widget.decoration ??
            BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.5)),
                border: Border.all(color: Colors.white)),
        child: Text(
          _format(_diff),
          style: const TextStyle(fontSize: 12.0, color: Colors.white),
        ),
      );
    }
  }

  Widget _buildName(String name, int maxLine) {
    RoomPosition? position = ChatRoomUtil.getPositionByUid(widget.uid);
    List<Color>? colors = position?.colorfulName;

    if (colors == null || colors.isEmpty) {
      return Text(
        name,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      );
    }

    return ColorfulNickName(
      colors: colors,
      textBuild: (bool show, {Key? key, Paint? paint}) {
        return Text(
          name,
          key: key,
          maxLines: maxLine,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.0,
            foreground: paint,
          ),
        );
      },
    );
  }
}
