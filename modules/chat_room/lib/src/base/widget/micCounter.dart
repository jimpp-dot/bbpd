import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class MicCounter extends StatefulWidget {
//	final ChatRoomData room;
  final int counter;

//	final UserIconStyle style;
  final double width;
  final double normalWidth;
  final bool isGuess;

  const MicCounter(
      {super.key,
      required this.counter,
      required this.width,
      required this.normalWidth,
      this.isGuess = false});

  @override
  MicCounterState createState() {
    return MicCounterState();
  }
}

class MicCounterState extends State<MicCounter> {
  Timer? _timer;
  int diff = 0;
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
  void didUpdateWidget(MicCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.counter != widget.counter) {
      _init();
    }
  }

  _onTimer(Timer timer) {
    // Log.d("onTimer ${this.widget.counter} => ${_roomManager.getTimestamp()}");
    int diff = widget.counter - _roomManager.getTimestamp();
    // Log.d(diff);
    if (diff <= 0) {
      _stop();
    }
    setState(() {
      this.diff = diff;
    });
  }

  _init() {
    diff = _roomManager.getServerTime() > 0
        ? widget.counter - _roomManager.getTimestamp()
        : 0;
    if (diff <= 0) {
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
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  Widget _buildNormal() {
    double width = widget.width; //IconStyles[this.widget.style].width;
    double height = 14.0 *
        width /
        widget
            .normalWidth; //14.0 * width / IconStyles[UserIconStyle.Normal].width;
    if (diff <= 0) {
      return const SizedBox(
        width: 0.0,
        height: 0.0,
      );
    }
    return PositionedDirectional(
        start: 0.0,
        top: 0.0,
        end: 0.0,
        bottom: 0.0,
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              start: 0.0,
              bottom: 0.0,
              width: width,
              height: height,
              child: IgnorePointer(
                  child: R.img("counter.svg",
                      width: width,
                      height: height,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                      color: R.color.mainBrandColor)),
            ),
            PositionedDirectional(
              start: 0.0,
              bottom: 0.0,
              width: width,
              height: height,
              child: IgnorePointer(
                  child: Center(
                child: Text(
                  "${diff}S",
                  style: TextStyle(
                      fontSize:
                          widget.width / widget.normalWidth < 0.75 ? 8.0 : 10.0,
                      color: Colors.white),
                ),
              )),
            ),
          ],
        ));
  }

  Widget _buildGuess() {
    if (diff <= 0) {
      return const SizedBox(
        width: 0.0,
        height: 0.0,
      );
    }
    return PositionedDirectional(
      start: 0,
      end: 0,
      top: 0,
      bottom: 0,
      child: ClipOval(
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              height: 12,
              child: Container(
                color: const Color(0xFFF8FF57),
                alignment: Alignment.center,
                child: Text(
                  '${diff}s',
                  style: const TextStyle(
                    color: Color(0xFFBE4B0B),
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isGuess) {
      return _buildGuess();
    }
    return _buildNormal();
  }
}
