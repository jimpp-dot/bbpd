import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_select_target_action_widget.dart';

///狼人夜晚行动
///如果未行动,则显示界面可以行动；如果已完成行动,则隐藏掉界面不可以再次行动
class WolfNightActionWidget extends StatelessWidget {
  final ChatRoomData room;

  const WolfNightActionWidget({super.key, required this.room});

  String getKillResult(RoomPosition selfPosition) {
    StringBuffer sb = StringBuffer();
    room.positions.where((_) {
      WolfPositionData wolfPositionData =
          _.positionExpendData as WolfPositionData;
      return wolfPositionData.role == WolfRole.Werewolf &&
          wolfPositionData.actionUid > 0;
    }).forEach((_) {
      RoomPosition? actionPosition;
      WolfPositionData elementWolfPositionData =
          _.positionExpendData as WolfPositionData;
      for (var element in room.positions) {
        if (element.uidOrOrigin == elementWolfPositionData.actionUid) {
          actionPosition = element;
        }
      }
      sb.writeln(K.wolf_v2_wolf_action_target([
        WolfParseUtil.encodePosition(_.position, selfPosition),
        WolfParseUtil.encodePosition(actionPosition?.position, selfPosition)
      ]));
    });
    return sb.toString().trim();
  }

  @override
  Widget build(BuildContext context) {
    WolfConfigData? wolfConfigData =
        room.config?.configExpendData as WolfConfigData?;

    RoomPosition? selfPosition = room.positionForCurrentUser;
    WolfPositionData? selfWolfPositionData =
        selfPosition?.positionExpendData as WolfPositionData?;

    //不能操作或者已完成操作
    if (selfWolfPositionData?.actionStatus != WolfActionStatus.enable) {
      return Container();
    }

    WolfModel model = Provider.of<WolfModel>(context, listen: true);
    RoomPosition? targetPosition;
    int? targetUid;
    if (wolfConfigData?.currentResult != null) {
      targetUid = wolfConfigData!.currentResult!['killTarget'];
    }
    if (targetUid != null && targetUid > 0) {
      for (var _ in room.positions) {
        if (_.uidOrOrigin == targetUid) {
          targetPosition = _;
          break;
        }
      }
    } else {
      targetPosition = model.targetPosition;
    }

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          child: WolfSelectTargetActionWidget(
            actionTitle: K.wolf_v2_wolf_action_desc,
            buttonText: K.wolf_v2_wolf_action,
            onButtonTap: () async {
              if (targetPosition != null) {
                //没有选定目标不允许确认击杀
                bool op = await model.wolfKill(
                  room.rid,
                  0,
                  1,
                  wolfConfigData?.count ?? 0,
                  isConfirm: true,
                );
                if (op) {
                  //操作成功
                  model.actionUid = 0; //清除选中的目标
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
