import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../rank/ktv_pk_rank_widget.dart';
import '../rank/ktv_singer_rank_widget.dart';
import 'ktv_pk_rank_label.dart';

/// 排行榜入口
class KtvRankLabel extends StatelessWidget {
  final ChatRoomData room;
  final bool isPkMode;

  const KtvRankLabel(this.room, {super.key, this.isPkMode = false});

  void _onRankTap(BuildContext context, bool pkMode) {
    if (pkMode) {
      KtvPkRankWidget.show(context, room);
    } else {
      KtvSingerRankWidget.show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onRankTap(context, isPkMode),
      child: isPkMode
          ? KtvPkRankLabel(room: room)
          : Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.3),
              ),
              alignment: AlignmentDirectional.center,
              child: R.img(
                RoomAssets.chat_room$ic_ktv_rank_png,
                width: 18,
                height: 18,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
    );
  }
}
