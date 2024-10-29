import 'dart:math';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/main/wolf_repository.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_base_button.dart';

///狼人12人,准备/已准备按钮
///
class WolfRoleReadyWidget extends StatelessWidget {
  final ChatRoomData room;

  const WolfRoleReadyWidget({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    if (room.positionForCurrentUser == null ||
        room.positionForCurrentUser?.positionExpendData == null ||
        room.positionForCurrentUser!.positionExpendData is! WolfPositionData) {
      return const SizedBox.shrink();
    }

    RoomPosition selfPosition = room.positionForCurrentUser!;
    WolfPositionData selfWolfPositionData =
        room.positionForCurrentUser!.positionExpendData as WolfPositionData;

    bool isReady = selfWolfPositionData.readyState == WolfReadyState.ready;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 10.0),
          WolfBaseButton(
            image: isReady
                ? 'wolfv2/wolf_btn_unenable.webp'
                : 'wolfv2/wolf_btn_enable.webp',
            width: 113,
            height: 37,
            child: TimerWidget(
              stop: Duration(seconds: selfPosition.counter - room.timestamp),
              builder: (context) {
                String txt = isReady
                    ? K.was_ready
                    : '${K.ready}（${max(selfPosition.counter - room.timestamp, 0)}s)';
                Log.d('On timer tick, text: $txt');
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      txt,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2.0),
                  ],
                );
              },
            ),
            onTap: () {
              if (isReady) return;
              WolfRepository.setReady(room.rid, selfPosition.uid);
            },
          ),
          const SizedBox(height: 3.0),
        ],
      ),
    );
  }
}
