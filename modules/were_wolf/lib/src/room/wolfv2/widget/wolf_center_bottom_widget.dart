import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/wolfv2/dialog/wolf_auto_full_dialog.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_role_ready_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_select_target_action_ask_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_user_icon.dart';
import 'package:were_wolf/src/room/wolfv2/wolfOpUtil.dart';
import 'package:were_wolf/src/room/wolfv2/wolfSourceUtil.dart';

///狼人12人游戏内容底部
///目前有几种视图样式：1.准备已准备  2.行动倒计时  3.行动倒计时+(左侧自爆按钮/右侧退水)  4.空
class WolfCenterBottomWidget extends StatelessWidget {
  final ChatRoomData room;

  const WolfCenterBottomWidget({super.key, required this.room});

  final double _icon_width = 60;
  final double _icon_height = 64;

  Widget? _buildExplode(WolfModel wolfModel, BuildContext context) {
    RoomPosition? selfPosition = room.positionForCurrentUser;
    if (selfPosition == null) return null;
    WolfPositionData? selfWolfPositionData =
        selfPosition.positionExpendData as WolfPositionData?;

    if (selfWolfPositionData?.role != WolfRole.Werewolf) return null;
    if (selfWolfPositionData!.isDead) return null;
    WolfConfigData wolfConfigData =
        room.config?.configExpendData as WolfConfigData;
    if (!wolfConfigData.canExplode) return null;

    return GestureDetector(
      onTap: () {
        double userIconHeight = WolfOpUtil.itemHeight * WolfOpUtil.sideCount +
            WolfOpUtil.spaceHeight * (WolfOpUtil.sideCount - 1) +
            6.0;

        double realWidth = MediaQuery.of(context).size.width -
            2 * (25.0 + 16.0 + WolfUserIcon.iconSize) -
            2.0;
        double realHeight = realWidth * 185.0 / 217.0;

        WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);
        showDialog(
          context: context,
          builder: (context) => Column(
            children: <Widget>[
              Container(
                height: userIconHeight + 88.0 - realHeight,
              ),
              WolfSelectTargetActionAskWidget(
                actionTitle: K.wolf_v2_wolf_explode,
                actionContentTitle: K.wolf_v2_wolf_explode_ask,
                actionContentDescription: '',
                buttonLeftText: K.wolf_v2_give_up,
                buttonRightText: K.wolf_v2_wolf_explode,
                onButtonLeftTap: () {
                  Navigator.of(context).pop();
                },
                onButtonRightTap: () async {
                  Navigator.of(context).pop();
                  Object? obj = await wolfModel.explode(room.rid);
                  if (obj != null) {
                    WolfAutoFullDialog.show(
                      context: Constant.context,
                      type: 'state.day.time.wolf.explode',
                    );
                    WolfSourceUtil.playVoice('wolf_explode_tips');

                    ///狼人自爆
                  }
                },
              ),
            ],
          ),
        );
      },
      child: R.img('wolfv2/ic_wolf_self_explode.webp',
          package: ComponentManager.MANAGER_WERE_WOLF,
          width: _icon_width,
          height: _icon_height),
    );
  }

  Widget? _buildExitPolice(WolfModel wolfModel, BuildContext context) {
    WolfConfigData? wolfConfigData =
        room.config?.configExpendData as WolfConfigData?;
    if (wolfConfigData?.currentResult == null) return null;
    RoomPosition? selfPosition = room.positionForCurrentUser;
    if (selfPosition == null) return null;

    Map? dataMap = wolfConfigData?.currentResult!['policeJoinConfig'];
    if (dataMap == null) return null;

    PoliceJoinConfig policeJoinConfig =
        PoliceJoinConfig.fromJson(dataMap as Map<String, dynamic>);
    if (policeJoinConfig.joinPosition.isEmpty) return null;

    if ((policeJoinConfig.canExit) &&
        policeJoinConfig.joinPosition.contains(selfPosition.position)) {
      return GestureDetector(
        onTap: () {
          double userIconHeight = WolfOpUtil.itemHeight * WolfOpUtil.sideCount +
              WolfOpUtil.spaceHeight * (WolfOpUtil.sideCount - 1) +
              6.0;

          double realWidth = MediaQuery.of(context).size.width -
              2 * (25.0 + 16.0 + WolfUserIcon.iconSize) -
              2.0;
          double realHeight = realWidth * 185.0 / 217.0;

          WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);
          showDialog(
            context: context,
            builder: (context) => Column(
              children: <Widget>[
                Container(
                  height: userIconHeight + 88.0 - realHeight,
                ),
                WolfSelectTargetActionAskWidget(
                  actionTitle: K.wolf_v2_police_join_5,
                  actionContentTitle: K.wolf_v2_police_join_6,
                  actionContentDescription: '',
                  buttonLeftText: K.wolf_v2_give_up,
                  buttonRightText: K.wolf_v2_police_join_5,
                  onButtonLeftTap: () {
                    Navigator.of(context).pop();
                  },
                  onButtonRightTap: () {
                    Navigator.of(context).pop();
                    wolfModel.joinPolice(room.rid, PoliceJoinFlag.exit);
                  },
                ),
              ],
            ),
          );
        },
        child: R.img('wolfv2/ic_wolf_exit_police.webp',
            package: ComponentManager.MANAGER_WERE_WOLF,
            width: _icon_width,
            height: _icon_height),
      );
    }
    return null;
  }

  int getTimer(RoomPosition? selfPosition) {
    int? counter = selfPosition != null && selfPosition.counter > 0
        ? selfPosition.counter
        : room.config?.counter;
    if (counter == null) return 0;
    int timer = counter - room.timestamp;
    return timer;
  }

  String getTimerText(RoomPosition? selfPosition, int timer) {
    WolfConfigData? wolfConfigData =
        room.config?.configExpendData as WolfConfigData?;
    WolfPositionData? selfWolfPositionData =
        selfPosition?.positionExpendData as WolfPositionData?;

    bool isSelfTimer = selfPosition != null &&
        selfWolfPositionData?.actionStatus == WolfActionStatus.enable;

    WolfState? wolfState = wolfConfigData?.state;
    if (wolfState == WolfState.DaytimeDesc ||
        wolfState == WolfState.DaytimeLastWords ||
        wolfState == WolfState.PoliceDesc) {
      return K.wolf_v2_room_timer_desc([
        WolfParseUtil.encodePosition(wolfConfigData!.current, selfPosition),
        '$timer'
      ]);
    } else {
      if (isSelfTimer) {
        return K.wolf_v2_room_timer_self(['$timer']);
      }
      if (wolfState == WolfState.GameEnd) {
        return K.wolf_v2_room_game_end(['$timer']);
      }
      return K.wolf_v2_room_timer_other(['$timer']);
    }
  }

  Widget _buildTimer(double width) {
    WolfConfigData? wolfConfigData =
        room.config?.configExpendData as WolfConfigData?;
    RoomPosition? selfPosition = room.positionForCurrentUser;

    //游戏结束不显示倒计时(已经弹出结果框了的)
    if (wolfConfigData != null && wolfConfigData.state == WolfState.End) {
      return Container();
    }

    if (wolfConfigData != null &&
            wolfConfigData.state == WolfState.DaytimeStartGun ||
        wolfConfigData != null &&
            wolfConfigData.state == WolfState.DaytimeStartVote ||
        wolfConfigData != null && wolfConfigData.state == WolfState.DaytimePK) {
      return Container();
    }

    int timer = getTimer(selfPosition);
    if (timer <= 0) return Container();

    return TimerWidget(
      key: GlobalKey(),
      stop: Duration(seconds: timer),
      builder: (context) {
        int curtTimer = getTimer(selfPosition);
        if (curtTimer <= 0) {
          return Container();
        }
        return Container(
          width: width,
          height: 28.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                6.0,
              ),
            ),
            color: const Color(0xff261E4C).withOpacity(0.6),
          ),
          child: Text(
            getTimerText(selfPosition, curtTimer),
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
    WolfConfigData? wolfConfigData =
        room.config?.configExpendData as WolfConfigData?;
    RoomPosition? selfPosition = room.positionForCurrentUser;
    WolfPositionData? selfWolfPositionData =
        selfPosition?.positionExpendData as WolfPositionData?;

    if (wolfConfigData?.state == WolfState.Wait) {
      //准备阶段
      if (selfWolfPositionData != null) {
        //麦上玩家
        return WolfRoleReadyWidget(room: room);
      } else {
        //麦下玩家
        return const SizedBox(
          height: 44.0,
        );
      }
    }

    double timerWidth = MediaQuery.of(context).size.width -
        2 * (25.0 + 16.0 + WolfUserIcon.iconSize);

    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: true);

    Widget? explodeWidget = _buildExplode(wolfModel, context);
    Widget? exitPoliceWidget = _buildExitPolice(wolfModel, context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          explodeWidget != null
              ? SizedBox(
                  width: _icon_width,
                  height: _icon_height,
                  child: _buildExplode(wolfModel, context),
                )
              : SizedBox(
                  width: _icon_width,
                  height: 44.0,
                ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Container(
            height: 44.0,
            alignment: Alignment.center,
            child: _buildTimer(timerWidth),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          exitPoliceWidget != null
              ? SizedBox(
                  width: _icon_width,
                  height: _icon_height,
                  child: _buildExitPolice(wolfModel, context),
                )
              : SizedBox(
                  width: _icon_width,
                  height: 44.0,
                ),
        ],
      ),
    );
  }
}
