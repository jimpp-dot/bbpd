import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'ktv_room_task_bottom_sheet.dart';

/// ktv 任务入口
class KtvTaskWidget extends StatelessWidget {
  final ChatRoomData room;

  const KtvTaskWidget(this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      end: 7,
      bottom: 0,
      child: GestureDetector(
        onTap: () {
          KtvRoomTaskBottomSheet.show(context, room: room);
        },
        child: R.img(RoomAssets.chat_room$ktv_ktv_room_task_entry_webp,
            width: 46, height: 46),
      ),
    );
  }
}
