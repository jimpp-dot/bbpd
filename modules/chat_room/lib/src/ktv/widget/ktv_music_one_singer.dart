import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'ktv_music_singer_info.dart';
import 'ktv_singer_icon.dart';
import '../utils/ktv_util.dart';

class KtvMusicOneSinger extends StatelessWidget {
  final ChatRoomData room;

  final KtvInfo ktvInfo;
  final bool needAni;

  const KtvMusicOneSinger(
      {super.key,
      required this.room,
      required this.ktvInfo,
      this.needAni = false});

  @override
  Widget build(BuildContext context) {
    if (ktvInfo.currentSong == null || ktvInfo.currentSong?.uid == 0) {
      return SizedBox(height: _getContainerHeight());
    }

    return _buildNormal();
  }

  double _getContainerHeight() => 115 + KtvUtil.getDiffHeight(room);

  Widget _buildNormal() {
    return Stack(
      children: [
        SizedBox(
          width: Util.width - 32,
          height: _getContainerHeight(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              KtvSingerIcon(
                room,
                icon: ktvInfo.currentSong!.icon,
                uid: ktvInfo.currentSong!.uid,
                isPause: ktvInfo.currentSong!.status == KtvSingStatus.pause,
              ),
              KtvMusicSingerInfo(
                room: room,
                uid: ktvInfo.currentSong!.uid,
                name: ktvInfo.currentSong!.name,
                weekMusicalNotes: ktvInfo.currentSong!.weekMusicalNotes,
                songId: ktvInfo.currentSong!.sid,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
