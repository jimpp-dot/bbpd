import 'package:flutter/material.dart';
import 'player.dart';
import 'package:chat_room/chat_room.dart';

/// 6人游戏位
class GuessPlayerList extends StatelessWidget {
  final ChatRoomData room;
  final bool displayEmote;

  const GuessPlayerList({
    super.key,
    required this.room,
    this.displayEmote = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: room.positions.map((position) {
        return Expanded(
          child: Player(
            userIcon: UserIcon(
              room: room,
              position: position,
              showOffline: position.uid <= 0 && position.uidOrOrigin > 0,
              size: IconSize.small,
            ),
          ),
        );
      }).toList(growable: false),
    );
  }
}
