import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideConfig.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_select_target_action_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';
import 'package:provider/provider.dart' hide Selector;

///
///
class WolfGuideNightActionWidget extends StatelessWidget {
  const WolfGuideNightActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);

    RoomPosition? selfPosition = wolfModel.positionForCurrentUser();
    WolfGuidePosition? wolfGuidePosition =
        selfPosition?.positionExpendData as WolfGuidePosition?;

    //不能操作或者已完成操作
    if (wolfGuidePosition == null || !wolfGuidePosition.canAction) {
      return Container();
    }

    RoomPosition? targetPosition = wolfModel.targetPosition;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          child: WolfGuideSelectTargetActionWidget(
            actionTitle: K.wolf_v2_wolf_action_desc,
            buttonText: K.wolf_v2_wolf_action,
            onButtonTap: () async {
              if (targetPosition != null) {
                //没有选定目标不允许确认击杀
                wolfModel.wolfKill(targetPosition.uid, isConfirm: true);
                wolfModel.actionUid = 0; //清除选中的目标

                //击杀完成，检查是否跳到女巫阶段
                wolfModel.checkJumpNightAction();

                //刀人埋点
                int day = wolfModel.data.dayCount ?? 0 + 1;
                Tracker.instance.track(TrackEvent.wolf_ai_game_operate_click,
                    properties: {'op': '1', 'day': day + 1, 'isConfirm': '1'});
              }
            },
            actionPositions: targetPosition != null ? [targetPosition] : null,
          ),
        ),
      ],
    );
  }
}
