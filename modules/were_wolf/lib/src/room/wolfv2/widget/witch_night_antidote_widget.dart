import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_select_target_action_widget.dart';

///
/// 女巫解药
///
class WitchNightAntidoteWidget extends StatelessWidget {
  final ChatRoomData room;

  const WitchNightAntidoteWidget({super.key, required this.room});

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

    WitchAntidoteData antidoteData =
        WitchAntidoteData.fromJson(wolfConfigData?.currentResult!['antidote']);

    WolfModel model = Provider.of<WolfModel>(context, listen: false);
    RoomPosition? targetPosition;
    for (var _ in room.positions) {
      if (_.uidOrOrigin == antidoteData.killTarget) {
        targetPosition = _;
        break;
      }
    }

    if (antidoteData.hasAntidote) {
      // 有解药
      if (antidoteData.killTarget <= 0) {
        // 平安夜
        return Container();
      } else {
        // 女巫救人
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              bottom: 0.0,
              child: WolfSelectTargetActionWidget(
                actionTitle: K.wolf_v2_witch_antidote_action_desc,
                buttonText: K.wolf_v2_witch_antidote_action,
                onButtonTap: () async {
                  if (targetPosition != null) {
                    //没有选定目标不允许确认
                    Object? obj = await model.antidote(
                        room.rid, targetPosition.uidOrOrigin, true);
                    if (obj != null) {
                      //操作成功
                      model.actionUid = 0; //清除选中的目标
                    }
                  }
                },
                actionPositions:
                    targetPosition != null ? [targetPosition] : null,
                opFlag: 2,
              ),
            ),
          ],
        );
      }
    } else {
      // 没有解药
      return Container();
    }
  }
}
