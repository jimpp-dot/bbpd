import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/private_my_room_panel.dart';
import 'package:flutter/material.dart';

/// 情感小屋：我的飞船
class PrivateRoomMyShip extends StatelessWidget {
  final ChatRoomData room;

  const PrivateRoomMyShip({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PrivateMyRoomPanel.show(context: context, rid: room.realRid),
      child: Container(
        height: 22,
        padding: const EdgeInsetsDirectional.only(start: 4, end: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(11),
          color: Colors.white10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(
              RoomAssets.chat_room$ic_private_room_entry_webp,
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 2),
            Text(
              K.room_private_room_panel_title,
              style: const TextStyle(
                  fontSize: 11, color: Colors.white, height: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
