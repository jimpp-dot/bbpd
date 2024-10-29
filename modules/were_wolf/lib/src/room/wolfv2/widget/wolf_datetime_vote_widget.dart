import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_select_target_action_widget.dart';

class DaytimeVoteWidget extends StatelessWidget {
  final ChatRoomData room;

  const DaytimeVoteWidget({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    WolfConfigData? wolfConfigData =
        room.config?.configExpendData as WolfConfigData?;

    RoomPosition? selfPosition = room.positionForCurrentUser;
    WolfPositionData? selfWolfPositionData =
        selfPosition?.positionExpendData as WolfPositionData?;

    //不能操作或者已完成操作
    if (selfPosition == null ||
        selfWolfPositionData?.actionStatus != WolfActionStatus.enable ||
        (selfWolfPositionData?.isDead ?? false)) {
      return Container();
    }

    WolfModel model = Provider.of<WolfModel>(context, listen: true);
    RoomPosition? targetPosition = model.targetPosition;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          child: WolfSelectTargetActionWidget(
            actionTitle: K.wolf_v2_vote_action_desc,
            buttonText: K.wolf_v2_vote_action,
            onButtonTap: () async {
              if (targetPosition != null) {
                //没有选定目标不允许确认
                int? cuid = targetPosition.uidOrOrigin;
                if (cuid > 0) {
                  bool op = await model.vote(
                      room.rid, cuid, 1, wolfConfigData?.count ?? 0, true);
                  if (op) {
                    //操作成功
                    model.actionUid = 0; //清除选中的目标
                  }
                }
              }
            },
            actionPositions: targetPosition != null ? [targetPosition] : null,
          ),
        ),
      ],
    );
  }
}
