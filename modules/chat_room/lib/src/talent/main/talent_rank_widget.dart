import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/talent/data/talent_main_view_model.dart';
import 'package:chat_room/src/talent/data/talent_models.dart';
import 'package:chat_room/src/talent/talent_helper.dart';
import 'package:chat_room/src/talent/vote/talent_vote_bottom_dialog.dart';

/// 才艺榜显示以及入口
///
class TalentRankWidget extends StatefulWidget {
  final ChatRoomData room;

  const TalentRankWidget({
    super.key,
    required this.room,
  });

  @override
  _TalentRankWidgetState createState() => _TalentRankWidgetState();
}

class _TalentRankWidgetState extends State<TalentRankWidget> {
  @override
  Widget build(BuildContext context) {
    return Selector<TalentMainViewModel, BroadcasterInfoResp?>(
      selector: (ctx, vm) {
        return vm.data;
      },
      builder: (context, data, child) {
        var info = data?.broadcasterInfo;
        if (info == null || info.currentAnchor == null) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRankNum(context, info),
            SizedBox(height: 10.dp),
            _buildStarNum(context, info),
          ],
        );
      },
    );
  }

  Widget _buildRankNum(BuildContext context, BroadcasterInfo info) {
    return GestureDetector(
      onTap: () {
        IRankManager rankManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
        rankManager.showRoomRankMainTabScreen(context,
            rid: widget.room.rid, tabType: 'star_week');
      },
      child: Container(
        height: 22.dp,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF).withOpacity(0.12),
          borderRadius: BorderRadius.circular(12.dp),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 4.dp),
            R.img(RoomAssets.chat_room$talent_talent_hot_icon_webp,
                width: 16.dp, height: 16.dp),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 2.dp),
              child: Text(
                info.rankDesc,
                style: TextStyle(
                    color: Colors.white, fontSize: 10.dp, height: 1.1),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 5.dp, end: 6.dp),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 10.dp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 星光值
  Widget _buildStarNum(BuildContext context, BroadcasterInfo info) {
    return GestureDetector(
      onTap: () {
        bool can = TalentHelper.verifyVote(widget.room, info);
        if (can) {
          TalentVoteBottomDialog.showBottomDialog(
            System.context,
            widget.room,
            info.programId,
            info.currentAnchor!,
            true,
          );
        }
      },
      child: Container(
        height: 22.dp,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xFFCA47F5).withOpacity(0.4),
            const Color(0xFF6464FF).withOpacity(0.4)
          ]),
          borderRadius: BorderRadius.circular(12.dp),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 4.dp),
            R.img(RoomAssets.chat_room$talent_talent_star_webp,
                width: 16.dp, height: 16.dp),
            NumText(
              '${info.starNum}',
              style:
                  TextStyle(color: Colors.white, fontSize: 10.dp, height: 1.1),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 5.dp, end: 6.dp),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 10.dp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
