import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_timer_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideConfig.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_role_ready_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_user_icon.dart';
import 'package:provider/provider.dart' hide Selector;

///
///
class WolfGuideCenterBottomWidget extends StatelessWidget {
  const WolfGuideCenterBottomWidget({super.key});

  String getTimerText(WolfModel wolfModel, int timer) {
    WolfGuideConfigState? state = wolfModel.data.currentState;
    if (state == WolfGuideConfigState.DaytimeDesc ||
        state == WolfGuideConfigState.DaytimeLastWords) {
      bool flag = false;
      int index = wolfModel.data.positions!.indexWhere((element) {
        WolfGuidePosition wolfGuidePosition =
            element.positionExpendData as WolfGuidePosition;
        return !wolfGuidePosition.isDead && wolfGuidePosition.isDesc;
      });

      int position = 0;
      if (index >= 0) {
        RoomPosition voicePosition = wolfModel.data.positions![index];
        if (voicePosition.uid == Session.uid) {
          flag = true;
        }
        position = voicePosition.position;
      }

      String txt1;
      if (flag) {
        txt1 = K.wolf_self_position;
      } else {
        txt1 = '${position + 1}';
      }

      return K.wolf_v2_room_timer_desc([txt1, '$timer']);
    }
    if (state == WolfGuideConfigState.GameEnd) {
      return K.wolf_v2_room_game_end(['$timer']);
    }
    if (state == WolfGuideConfigState.NightAntidote ||
        state == WolfGuideConfigState.NightPoison) {
      return K.wolf_v2_room_timer_other(['$timer']);
    }
    return K.wolf_v2_room_timer_self(['$timer']);
  }

  Widget _buildTimer(WolfModel wolfModel, double width) {
    int timer = wolfModel.data.currentStateLeaveTime;
    if (timer <= 0) return Container();

    return WolfGuideTimerWidget(
      key: GlobalKey(),
      stop: Duration(seconds: timer),
      builder: (context) {
        int curtTimer = wolfModel.data.currentStateLeaveTime;
        if (curtTimer <= 0) {
          return Container();
        }
        return Container(
          width: width,
          height: 28.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            color: const Color(0xff261E4C).withOpacity(0.6),
          ),
          child: Text(
            getTimerText(wolfModel, curtTimer),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);

    WolfGuideConfigState? state = wolfModel.data.currentState;

    if (state == WolfGuideConfigState.Wait) {
      //准备阶段
      return const WolfGuideRoleReadyWidget();
    }

    if (state == WolfGuideConfigState.End) {
      //结束阶段
      return Container(
        height: 44.0,
      );
    }

    double timerWidth = MediaQuery.of(context).size.width -
        2 * (25.0 + 16.0 + WolfGuideUserIcon.iconSize);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            width: 64.0,
            height: 44.0,
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Container(
            height: 44.0,
            alignment: Alignment.center,
            child: _buildTimer(wolfModel, timerWidth),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          const SizedBox(
            width: 64.0,
            height: 44.0,
          ),
        ],
      ),
    );
  }
}
