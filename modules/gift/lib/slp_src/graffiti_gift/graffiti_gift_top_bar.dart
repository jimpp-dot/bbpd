import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'graffiti_gift_panel.dart';

class GraffitiGiftTopBar extends StatelessWidget {
  final String icon;
  final ChatRoomData room;
  final int uid;

  const GraffitiGiftTopBar(
      {super.key, required this.icon, required this.room, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8, start: 8, end: 8),
      child: GestureDetector(
        onTap: () => GraffitiGiftPanel.show(context, room, uid),
        child: CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(icon),
          width: Util.width - 8 * 2,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
