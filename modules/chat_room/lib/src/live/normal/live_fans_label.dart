import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/roomNavUtil.dart';

/// 十星挑战
class LiveFansLabel extends StatelessWidget {
  final ChatRoomData room;

  const LiveFansLabel({Key? key, required this.room}) : super(key: key);

  Widget _renderFansGroupBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        RoomNavUtil.openStarChallengeScreen(context, roomData: room);
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(end: 4),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: Color(0x80B961C9),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(RoomAssets.chat_room$fans_fans_label_group_png,
                  width: 22, height: 22),
              const SizedBox(width: 2),
              Text(
                room.config?.liveChallenge ?? K.room_fans_challenge_title,
                style: const TextStyle(color: Colors.white, fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderFansGroupBtn(context);
  }
}
