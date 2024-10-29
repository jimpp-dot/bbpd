import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/visitant/rank/visitant_rank_list.dart';

/// 贵宾榜入口标签
class VisitantLabel extends StatelessWidget {
  final ChatRoomData room;

  const VisitantLabel({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        height: 22,
        padding: const EdgeInsetsDirectional.only(start: 4, end: 8),
        decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: Colors.white.withOpacity(0.12)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (Util.isStringEmpty(room.visitantIcon))
              R.img('ic_room_visitant_rank.webp',
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  width: 16,
                  height: 16)
            else
              CommonAvatar(
                path: room.visitantIcon,
                shape: BoxShape.circle,
                size: 16,
              ),
            const SizedBox(width: 4),
            Text(K.room_visitant_rank_s,
                style: const TextStyle(fontSize: 11, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    VisitantRankListWidget.openRoomBottomMenu(context, room);
  }
}
