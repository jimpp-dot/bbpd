import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_select_target_action_widget.dart';
import 'package:were_wolf/src/room/wolfv2/wolfSourceUtil.dart';

///
/// 女巫毒药
///
class WitchNightPoisonWidget extends StatelessWidget {
  final ChatRoomData room;

  const WitchNightPoisonWidget({super.key, required this.room});

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

    WolfConfigData? wolfConfigData =
        room.config?.configExpendData as WolfConfigData?;
    if (wolfConfigData?.currentResult == null) return Container();

    WitchPoisonData poisonData =
        WitchPoisonData.fromJson(wolfConfigData?.currentResult!['poison']);

    bool actionFinished =
        selfWolfPositionData?.actionStatus == WolfActionStatus.finish;
    WolfModel model = Provider.of<WolfModel>(context, listen: true);
    RoomPosition? targetPosition = model.targetPosition;

    if (poisonData.hasPoison) {
      // 有毒药
      // 已经完成毒人
      if (actionFinished) {
        return Container();
      } else if (poisonData.antidoteTarget > 0) {
        // 使用了解药，不能再使用毒药
        return Container();
      } else {
        // 女巫毒人
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              bottom: 0.0,
              child: WolfSelectTargetActionWidget(
                actionTitle: K.wolf_v2_witch_poison_action_desc,
                buttonText: K.wolf_v2_witch_poison_action,
                onButtonTap: () async {
                  if (targetPosition != null) {
                    //没有选定目标不允许确认
                    Object? obj = await model.poison(
                        room.rid, targetPosition.uidOrOrigin, true);
                    if (obj != null) {
                      //操作成功
                      model.actionUid = 0; //清除选中的目标
                    }
                    WolfSourceUtil.playVoice(
                        'wolf_night_action_witch_poison_tips');
                  }
                },
                actionPositions:
                    targetPosition != null ? [targetPosition] : null,
                opFlag: 1,
              ),
            ),
          ],
        );
      }
    } else {
      // 没有毒药
      return Container();
    }
  }
}
