import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import '../song_list/ktv_song_list_page.dart';

class KtvMusicIdleSinger extends StatelessWidget {
  final ChatRoomData room;

  const KtvMusicIdleSinger(this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 115,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              _onOrder(context);
            },
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.3),
              ),
              alignment: AlignmentDirectional.center,
              child: R.img(
                'ic_add.png',
                width: 22,
                height: 22,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            K.room_ktv_to_sing,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }

  void _onOrder(BuildContext context) {
    /// KTV 定位到点歌TAB
    bool isCreator = room.createor?.uid == Session.uid;
    KtvSongListPage.show(
      context,
      room,
      SongSheetType.rcmd,
      isRoomMaster: isCreator,
      autoMic: room.config?.mode == RoomMode.Lock,
      musicNum: 0,
    );
  }
}
