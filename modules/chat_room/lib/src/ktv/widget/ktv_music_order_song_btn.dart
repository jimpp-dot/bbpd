import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/ktv_music_model.dart';
import '../song_list/ktv_song_list_page.dart';

/// 点歌按钮
///
class KtvMusicOrderSongBtn extends StatelessWidget {
  final ChatRoomData room;

  const KtvMusicOrderSongBtn({Key? key, required this.room}) : super(key: key);

  void _onTap(BuildContext context) {
    var model = context.read<KtvMusicModel>();
    var tab = (model.singMode != KtvMusicSingMode.none)
        ? SongSheetType.ordered
        : SongSheetType.rcmd;
    bool isCreator = room.createor?.uid == Session.uid;

    /// KTV 已点/点歌 页
    KtvSongListPage.show(
      context,
      room,
      tab,
      isRoomMaster: isCreator,
      autoMic: room.config?.mode == RoomMode.Lock,
      musicNum: model.musicNum,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            R.img(RoomAssets.chat_room$sing_entrance_bg_webp,
                width: 60, height: 60),
            PositionedDirectional(end: -2, top: -4, child: _buildText()),
          ],
        ),
      ),
    );
  }

  Widget _buildText() {
    return Selector<KtvMusicModel, int>(
      selector: (context, model) => model.musicNum,
      shouldRebuild: (pre, next) => pre != next,
      builder: (context, count, child) {
        if (count > 0) {
          return Container(
            padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
            decoration: const ShapeDecoration(
                shape: StadiumBorder(), color: Colors.white),
            child: Text(
              '$count',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
