import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/ktv/widget/ktv_music_play.dart';
import 'package:chat_room/src/ktv/model/ktv_music_model.dart';
import 'package:flutter/material.dart';

import '../rank/ktv_singer_rank_widget.dart';

/// KTV房间视图
///
class KtvMusicArea extends StatefulWidget {
  final KtvInfo ktvInfo;
  final KtvMusicModel model;
  final ChatRoomData room;

  const KtvMusicArea(
      {super.key,
      required this.room,
      required this.ktvInfo,
      required this.model});

  @override
  State<KtvMusicArea> createState() => _KtvMusicAreaState();
}

class _KtvMusicAreaState extends State<KtvMusicArea> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      if (mounted) widget.model.musicNum = widget.ktvInfo.listCount;
    });
  }

  @override
  void didUpdateWidget(KtvMusicArea oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.ktvInfo.currentSong == null &&
        oldWidget.ktvInfo.currentSong == null) {
      return;
    }

    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
          start: 16, end: 16, bottom: 4, top: 16),
      child: KtvMusicPlay(
        room: widget.room,
        ktvInfo: widget.ktvInfo,
        model: widget.model,
        onRankTap: _onRankTap,
      ),
    );
  }

  /// 排行榜点击
  void _onRankTap() {
    KtvSingerRankWidget.show(context);
  }
}
