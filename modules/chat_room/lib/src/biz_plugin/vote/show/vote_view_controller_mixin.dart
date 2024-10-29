import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_model.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/material.dart';

mixin VoteViewControllerMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(VOTE_TIME_OUT_EVENT, onTimeout);
  }

  @override
  void dispose() {
    eventCenter.removeListener(VOTE_TIME_OUT_EVENT, onTimeout);
    super.dispose();
  }

  /// 投票时间到
  void onTimeout(String type, dynamic data) {}

  /// pk图标
  Widget renderPkWidget() {
    return PositionedDirectional(
      end: 0,
      top: 0,
      width: 145.dp,
      height: 83.dp,
      child: IgnorePointer(
          child: R.img(RoomAssets.chat_room$vote_bg_pk_png,
              width: 145.dp, height: 83.dp, fit: BoxFit.fill)),
    );
  }

  /// 投票标题
  String titleWithOption(Vote? vote) {
    if (vote?.base == null) return '';
    String title = vote!.base.title;
    if (vote.base.selectType == 1) {
      return '$title（${K.room_multi_option}）';
    }
    return '$title（${K.room_single_option}）';
  }
}
