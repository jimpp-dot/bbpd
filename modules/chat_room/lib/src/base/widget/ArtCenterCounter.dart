import 'package:chat_room/assets.dart';
import 'dart:async';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../chat_room.dart';

/// 主播房间转接到麦序房倒计时：即将转播（主播房间可见）、即将结束（麦序房和直播房间可见）
class ArtCenterCounter extends StatefulWidget {
  final bool isStart;

  /// 即将开始/即将结束
  final int counter;

  /// 倒计时时间（秒）
  final ChatRoomData room;

  const ArtCenterCounter(
      {super.key,
      required this.isStart,
      required this.counter,
      required this.room});

  @override
  State<ArtCenterCounter> createState() => ArtCenterCounterState();
}

class ArtCenterCounterState extends State<ArtCenterCounter> {
  Timer? _timer;
  int _diff = 0;

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
  void didUpdateWidget(ArtCenterCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.counter != widget.counter) {
      _init();
    }
  }

  _onTimer(Timer timer) {
    int diff = widget.counter - widget.room.timestamp;
    if (diff <= 0) {
      widget.room.emit(RoomConstant.Event_Refresh);
      _stop();
    }

    if (diff == 5 &&
        widget.isStart == false &&
        Util.validStr(widget.room.artCenterCounterMgs) &&
        widget.room.isArtCenterAll) {
      /// 麦序房切换主播顶部提示
      widget.room.emit(
        '${RoomConstant.Event_Prefix}room.art.center.change.anchor',
        {'artCenterChangeAnchor': widget.room.artCenterCounterMgs},
      );
      widget.room.artCenterCounterMgs = '';
    }

    _diff = diff;
    Log.d("counter onTimer $diff");
    refresh();
  }

  _init() {
    _diff = widget.counter - widget.room.timestamp;
    if (_diff <= 0 || (widget.room.serverTime) == 0) {
      _diff = 0;
      widget.room.emit(RoomConstant.Event_Refresh);
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
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        R.img(
          widget.isStart
              ? RoomAssets.chat_room$art_center_start_counter_bg_webp
              : RoomAssets.chat_room$art_center_end_counter_bg_webp,
          width: 60,
          height: 84,
        ),
        Container(
          width: 60,
          height: 20,
          alignment: AlignmentDirectional.center,
          child: NumText(
            '${_diff}s',
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
