import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_select_target_action_ask_widget.dart';

class PoliceJoinWidget extends StatelessWidget {
  final ChatRoomData room;

  const PoliceJoinWidget({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    RoomPosition? selfPosition = room.positionForCurrentUser;
    WolfPositionData? selfWolfPositionData =
        room.positionForCurrentUser?.positionExpendData as WolfPositionData?;

    //不能操作或者已完成操作
    if (selfPosition == null ||
        selfWolfPositionData?.actionStatus != WolfActionStatus.enable) {
      return Container();
    }

    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: true);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          child: WolfSelectTargetActionAskWidget(
            actionTitle: K.wolf_v2_police_join_1,
            actionContentTitle: K.wolf_v2_police_join_2,
            actionContentDescription: K.wolf_v2_police_join_3,
            buttonLeftText: K.wolf_v2_give_up,
            buttonRightText: K.wolf_v2_police_join_4,
            onButtonLeftTap: () {
              wolfModel.joinPolice(room.rid, PoliceJoinFlag.giveUp);
            },
            onButtonRightTap: () {
              wolfModel.joinPolice(room.rid, PoliceJoinFlag.join);
            },
          ),
        ),
      ],
    );
  }
}
