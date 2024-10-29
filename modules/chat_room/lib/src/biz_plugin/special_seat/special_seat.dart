import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'cp_seat/cp_seat_widget.dart';
import 'vip_seat/vip_seat_api.dart';
import 'vip_seat/vip_seat_widget.dart';

/// 特殊麦位
/// cp麦位 or vip麦位
class SpecialSeatWidget extends StatefulWidget {
  final ChatRoomData room;

  const SpecialSeatWidget(this.room, {Key? key}) : super(key: key);

  @override
  State<SpecialSeatWidget> createState() => _SpecialSeatWidgetState();
}

class _SpecialSeatWidgetState extends State<SpecialSeatWidget> {
  VipMicUserSimple? user;

  @override
  void initState() {
    super.initState();
    _loadData();
    widget.room
        .addListener('${RoomConstant.Event_Prefix}room.vip.mic.sync', _onEvent);
  }

  void _loadData() async {
    ApiVipMicSimpleResponse res =
        await VipSeatRepo.getVipSeat(widget.room.realRid);
    if (res.success) {
      user = res.data;
      Log.d('user: $user');
    } else {
      user = null;
    }
    refresh();
  }

  @override
  void dispose() {
    widget.room.removeListener(
        '${RoomConstant.Event_Prefix}room.vip.mic.sync', _onEvent);
    super.dispose();
  }

  _onEvent(String type, Object? data) {
    Log.d('room.vip.mic.sync');
    if (data != null && data is Map && data.containsKey('pb')) {
      try {
        user = VipMicUserSimple.fromBuffer(List<int>.from(data['pb']));
      } catch (e) {
        Log.d(' VipMicUserSimple fromBuffer failed');
      }

      refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) return const SizedBox.shrink();

    final seatWidgetMap = <String, Widget?>{
      "1": VipSeatWidget(widget.room, user: user),
      "2": CpSeatEntranceWidget(widget.room.rid, info: user!.cpInfo),
    };

    final child = seatWidgetMap['${user!.micType}'];
    return child ?? const SizedBox.shrink();
  }
}
