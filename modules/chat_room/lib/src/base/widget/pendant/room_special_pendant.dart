import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/associated_room/associated_room_dialog.dart';
import 'package:chat_room/src/base/widget/associated_room/associated_room_widget.dart';
import 'package:chat_room/src/base/widget/room_world_boss_act_widget.dart';
import 'package:chat_room/src/biz_plugin/pendant/pendant_util.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:flutter/material.dart';

/// 关联房间消息key
const String associatedRoomKey =
    '${RoomConstant.Event_Pb_Prefix}room.associated.message';

const String specialPendantKey = 'specialPendantKey';

/// 房间特殊挂件
class RoomSpecialPendant extends StatefulWidget {
  final ChatRoomData room;
  final ValueNotifier<int> tickNotifier;

  const RoomSpecialPendant(
      {super.key, required this.room, required this.tickNotifier});

  @override
  State<RoomSpecialPendant> createState() => _RoomSpecialPendantState();
}

class _RoomSpecialPendantState extends State<RoomSpecialPendant> {
  ResRoomPositionPluginItem? _associatedRoomData;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(specialPendantKey, _onEvent);
    widget.room.addListener(associatedRoomKey, _onEvent);
  }

  @override
  void dispose() {
    widget.room.removeListener(associatedRoomKey, _onEvent);
    eventCenter.removeListener(specialPendantKey, _onEvent);
    super.dispose();
  }

  void _onEvent(String type, dynamic data) {
    if (type == associatedRoomKey && data is Uint8List) {
      try {
        RoomChildrenRoomListItem itemData =
            RoomChildrenRoomListItem.fromBuffer(data);
        AssociatedRoomDialog.show(context, itemData);
      } catch (e) {
        Log.d(e.toString());
      }
    } else if (type == specialPendantKey && data is ResRoomPositionPluginItem) {
      if (data.pluginShowType == PendantShowType.delete.name) {
        if (_associatedRoomData?.pluginId == data.pluginId) {
          _associatedRoomData = null;
        }
      } else {
        _associatedRoomData = data;
      }
      refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_associatedRoomData != null || (widget.room.mainRid ?? 0) > 0)
          AssociatedRoomWidget(
            rid: widget.room.rid,
            mainRid: widget.room.mainRid ?? 0,
            endTime: _associatedRoomData?.stageInfo.endTime ?? 0,
            endCallback: _onAssociatedRoomHide,
            timerNotifier: widget.tickNotifier,
          ),
        // RoomWorldBossActWidget(room: widget.room),
      ],
    );
  }

  /// 超过显示时间后需要手动隐藏
  void _onAssociatedRoomHide() {
    _associatedRoomData = null;
    refresh();
  }
}
