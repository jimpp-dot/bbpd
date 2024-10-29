import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/dialog/wolf_auto_full_dialog.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_select_target_action_widget.dart';
import 'package:were_wolf/src/room/wolfv2/wolfSourceUtil.dart';

///
class SeerNightActionWidget extends StatelessWidget {
  final ChatRoomData room;

  const SeerNightActionWidget({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    RoomPosition? selfPosition = room.positionForCurrentUser;
    WolfPositionData? selfWolfPositionData =
        selfPosition?.positionExpendData as WolfPositionData?;

    //不能操作或者已完成操作
    if (selfPosition == null ||
        selfWolfPositionData?.actionStatus != WolfActionStatus.enable) {
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
            actionTitle: K.wolf_v2_seer_action_desc,
            buttonText: K.wolf_v2_seer_action,
            onButtonTap: () async {
              if (targetPosition != null) {
                //没有选定目标不允许确认
                Object? obj = await model.seerRole(
                    room.rid, targetPosition.uidOrOrigin, true);
                if (obj != null) {
                  //查验成功
                  model.actionUid = 0; //清除选中的目标

                  WolfPositionData? wolfPositionData =
                      targetPosition.positionExpendData as WolfPositionData?;
                  if (wolfPositionData?.role == WolfRole.Werewolf) {
                    model.setSeerMark(targetPosition.uidOrOrigin, 1);
                    WolfAutoFullDialog.show(
                      context: Constant.context,
                      type: 'state.night.seer.wolf',
                    );
                    WolfSourceUtil.playVoice('wolf_night_action_seer_wolf_tips',
                        onComplete: () {
                      WolfSourceUtil.playVoice('wolf_night_bg');
                    });
                  } else {
                    model.setSeerMark(targetPosition.uidOrOrigin, 2);
                    WolfAutoFullDialog.show(
                      context: Constant.context,
                      type: 'state.night.seer.good',
                    );
                    WolfSourceUtil.playVoice('wolf_night_action_seer_good_tips',
                        onComplete: () {
                      WolfSourceUtil.playVoice('wolf_night_bg');
                    });
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
