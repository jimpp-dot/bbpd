import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/game_list/util/game_list_util.dart';
import 'package:flutter/material.dart';

import '../../../../assets.dart';
import '../../../../k.dart';

/// 房间玩法列表标签入口
class GameListLabel extends StatelessWidget {
  final ChatRoomData room;

  const GameListLabel({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GameListUtil.openGameList(context, room),
      child: Container(
        height: 22,
        padding: const EdgeInsetsDirectional.only(start: 4, end: 8),
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.12),
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(RoomAssets.chat_room$room_ic_play_list_label_png,
                width: 16, height: 16),
            const SizedBox(width: 4),
            Center(
              child: Text(
                K.room_play_games_list,
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
