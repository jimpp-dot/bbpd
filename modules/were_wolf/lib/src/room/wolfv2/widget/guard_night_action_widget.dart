import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_select_target_action_widget.dart';
import 'package:were_wolf/src/room/wolfv2/wolfSourceUtil.dart';

class GuardNightActionWidget extends StatelessWidget {
  const GuardNightActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WolfModel model = Provider.of<WolfModel>(context, listen: true);
    ChatRoomData room = model.room;

    WolfConfigData? wolfConfigData =
        room.config?.configExpendData as WolfConfigData?;

    RoomPosition? selfPosition = room.positionForCurrentUser;
    WolfPositionData? selfWolfPositionData =
        selfPosition?.positionExpendData as WolfPositionData?;

    //不能操作或者已完成操作
    if (selfPosition == null ||
        selfWolfPositionData?.actionStatus != WolfActionStatus.enable) {
      return Container();
    }

    RoomPosition? targetPosition = model.targetPosition;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          child: WolfSelectTargetActionWidget(
            actionTitle: K.wolf_v2_guard_action_desc,
            buttonText: K.wolf_v2_guard_action,
            onButtonTap: () async {
              if (targetPosition != null) {
                //没有选定目标不允许确认
                bool op = await model.guardRole(
                    room.rid,
                    targetPosition.uidOrOrigin,
                    wolfConfigData?.count ?? 0,
                    true);
                if (op) {
                  //操作成功
                  model.actionUid = 0; //清除选中的目标
                }
              }
              WolfSourceUtil.playVoice('wolf_night_action_guard_target_tips',
                  onComplete: () {
                WolfSourceUtil.playVoice('wolf_night_bg');
              });
            },
            actionPositions: targetPosition != null ? [targetPosition] : null,
          ),
        ),
      ],
    );
  }
}
