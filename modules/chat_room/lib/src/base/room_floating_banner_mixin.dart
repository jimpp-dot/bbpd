import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/pendant/room_activity_pendant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'widget/pendant/room_banner_pendant.dart';
import 'widget/pendant/room_base_pendant.dart';
import 'widget/pendant/room_function_pendant.dart';
import 'widget/pendant/room_special_pendant.dart';

mixin RoomFloatingBannerMixin<T extends StatefulWidget> on State<T> {
  final SwiperController _controller = SwiperController();
  final ValueNotifier<int> _tickNotifier = ValueNotifier(0);

  Timer? _swiperTimer;
  Timer? _tickTimer;

  final double _endOffset = 6;

  @override
  void initState() {
    super.initState();
    _initSwiperTimer();
    _initTickTimer();
  }

  @override
  void dispose() {
    _cancelTickTimer();
    _cancelSwiperTimer();
    _controller.dispose();
    super.dispose();
  }

  void _initSwiperTimer() {
    _swiperTimer ??= Timer.periodic(
        const Duration(milliseconds: 5000), (_) => _controller.next());
  }

  void _cancelSwiperTimer() {
    _swiperTimer?.cancel();
    _swiperTimer = null;
  }

  void _initTickTimer() {
    _tickTimer = Timer.periodic(
        const Duration(seconds: 1), (_) => _tickNotifier.value++);
  }

  void _cancelTickTimer() {
    _tickTimer?.cancel();
    _tickTimer = null;
  }

  Widget buildFloatingBanner(ChatRoomData room) {
    return RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // 房间特殊挂件
          RoomSpecialPendant(room: room, tickNotifier: _tickNotifier),
          // 房间活动挂件
          Padding(
            padding: EdgeInsetsDirectional.only(end: _endOffset),
            child: RoomActivityPendant(
              room: room,
              controller: _controller,
              wrapListener: _wrapListener,
              tickNotifier: _tickNotifier,
            ),
          ),
          // 房间功能型挂件
          Padding(
            padding: EdgeInsetsDirectional.only(end: _endOffset),
            child: RoomFunctionPendant(
              room: room,
              controller: _controller,
              wrapListener: _wrapListener,
              tickNotifier: _tickNotifier,
            ),
          ),
          // 房间Banner挂件
          Padding(
            padding: EdgeInsetsDirectional.only(end: _endOffset),
            child: RoomBannerPendant(
              room: room,
              controller: _controller,
              wrapListener: _wrapListener,
              tickNotifier: _tickNotifier,
            ),
          ),
        ],
      ),
    );
  }

  Widget _wrapListener(PendantItem item) {
    return Listener(
      key: ValueKey(item.key),
      onPointerDown: (_) => _cancelSwiperTimer(),
      onPointerUp: (_) => _initSwiperTimer(),
      child: item.widget,
    );
  }

  double get preMadeRecruitBottom => Util.iphoneXBottom + 60;
}
