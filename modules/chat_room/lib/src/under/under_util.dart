import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';

import 'model/underData.dart';

class UnderUtil {
  static String getUnderStateStr(ChatRoomData room) {
    GameUnderState? state = room.config?.underData?.gameUnderState;
    if (state == GameUnderState.Wait || state == GameUnderState.Send) {
      //准备阶段
      return K.room_ready_step;
    } else if (state == GameUnderState.Vote) {
      //开始投票
      return K.room_start_vote_one_line;
    } else if (state == GameUnderState.Desc || state == GameUnderState.Ready) {
      if (room.config!.underData!.isPK) {
        //PK模式
        return K.room_pk_link;
      } else {
        //第X轮描述
        return '${K.room_which_times_in_wolf([
              '${room.config!.underData!.gameUnderCount + 1}'
            ])}${K.under_step_desc}';
      }
    } else if (state == GameUnderState.End ||
        state == GameUnderState.VoteResult ||
        state == GameUnderState.PublishDead) {
      //第X轮投票结果
      return '${K.room_which_times_in_wolf([
            '${room.config!.underData!.gameUnderCount + 1}'
          ])}${K.room_vote_result}';
    } else {
      return '';
    }
  }

  static Widget getUnderStateTip(ChatRoomData room) {
    TextStyle style = R.textStyle.body1.copyWith(color: Colors.white);
    GameUnderState? state = room.config?.underData?.gameUnderState;
    if (state == GameUnderState.Wait) {
      //4人以上即可开始游戏
      return Text(
        K.under_tip_wait,
        style: style,
      );
    } else if (state == GameUnderState.Vote) {
      //点击玩家头像投票
      return Text(
        K.under_tip_vote,
        style: style,
      );
    } else if (state == GameUnderState.Desc) {
      //X号 玩家正在发言
      int position = room.config?.underData?.gameUnderCurrent ?? 0;
      RoomPosition? roomPosition = room.positionForCurrentUser;
      if (roomPosition != null && roomPosition.position == position) {
        return Text(
          K.turn_you_to_speaking,
          style: style,
        );
      } else {
        String curPosition = '${position + 1}';
        return Text.rich(TextSpan(
            text: '${K.under_tip_desc_position([curPosition])} ',
            style: style.copyWith(color: const Color(0xFFFFC225)),
            children: [
              TextSpan(
                  text: K.under_tip_desc_content,
                  style: style.copyWith(color: Colors.white)),
            ]));
      }
    } else {
      return Container();
    }
  }
}
