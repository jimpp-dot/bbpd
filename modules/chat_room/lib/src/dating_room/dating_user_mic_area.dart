import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'dating_user_icon.dart';

/// 约会吧 麦位区域
///
class DatingUserMicArea extends StatelessWidget {
  final ChatRoomData room;

  const DatingUserMicArea(this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 36) / 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DatingUserIcon(
            room,
            room.positions[0],
            width: width,
            emptyDesc: K.host_position,
            isAnchor: true,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DatingUserIcon(
                  room,
                  room.positions[1],
                  emptyDesc: K.male_position,
                  sex: 1,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DatingUserIcon(
                  room,
                  room.positions[2],
                  emptyDesc: K.female_position,
                  sex: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
