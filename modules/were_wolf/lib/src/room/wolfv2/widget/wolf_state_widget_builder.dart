import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/widget/guard_night_action_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/night_no_action_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/police_change_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/police_desc_order_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/police_join_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/seer_night_action_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/witch_night_antidote_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/witch_night_poison_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_datetime_hunter_takeaway_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_datetime_vote_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_night_action_widget.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_plice_vote_widget.dart';

class WolfStateWidgetBuilder {
  static Widget build(BuildContext context, ChatRoomData room) {
    if (room.config == null) return Container();
    WolfConfigData? wolfConfigData =
        room.config?.configExpendData as WolfConfigData?;
    WolfState? state = wolfConfigData?.state;
    RoomPosition? selfPosition = room.positionForCurrentUser;

    Log.d("WolfStateWidgetBuilder state.toString()=${state.toString()}");

    switch (state) {
      //夜晚行动
      case WolfState.NightAction:
      case WolfState.NightAntidote:
      case WolfState.NightPoison:
        WolfPositionData? wolfPositionData =
            selfPosition?.positionExpendData as WolfPositionData?;
        WolfRole? role = wolfPositionData?.role;

        if (wolfPositionData?.isDead ?? true) {
          //角色死亡,等待其它玩家行动
          return NightNoActionWidget(
            room: room,
          );
        }
        if (role == WolfRole.Werewolf ||
            role == WolfRole.Seer ||
            role == WolfRole.Guard) {
          //狼人/预言家/守卫
          if (state == WolfState.NightAction) {
            //行动阶段
            if (role == WolfRole.Werewolf) {
              //狼人行动
              return WolfNightActionWidget(
                room: room,
              );
            }
            if (role == WolfRole.Seer) {
              //预言家行动
              return SeerNightActionWidget(
                room: room,
              );
            }
            if (role == WolfRole.Guard) {
              //守卫行动
              return const GuardNightActionWidget();
            }
          }
        }
        if (role == WolfRole.Witch) {
          //女巫
          if (state == WolfState.NightAntidote) {
            //解药阶段
            return WitchNightAntidoteWidget(room: room);
          } else if (state == WolfState.NightPoison) {
            //毒药阶段
            return WitchNightPoisonWidget(
              room: room,
            );
          }
        }
        return NightNoActionWidget(
          room: room,
        );
      case WolfState.PoliceJoin:
        return PoliceJoinWidget(
          room: room,
        );
      case WolfState.PoliceVote:
        return PoliceVoteWidget(
          room: room,
        );
      case WolfState.DaytimeVote:
        return DaytimeVoteWidget(
          room: room,
        );
      case WolfState.PoliceChange:
        return PoliceChangeWidget(
          room: room,
        );
      case WolfState.PoliceDescOrder:
        return PoliceDescOrderWidget(
          room: room,
        );
      case WolfState.DaytimeGun:
        return DaytimeHunterTakeAwayWidget(
          room: room,
        );
      default:
        return Container();
    }
  }
}
