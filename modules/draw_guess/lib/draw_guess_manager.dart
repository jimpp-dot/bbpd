import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/queue/guess_queue_config.dart';
import 'package:draw_guess/src/room/queue/model/guess_queue_model.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_choose_mode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'src/room/guess/data.dart';
import 'src/room/guess/game_guess.dart';
import 'src/room/guess/guess_msg.dart';
import 'src/room/guess/player_list.dart';
import 'src/room/guess/src/draw_something.dart';
import 'src/room/queue/widget/guess_queue_widget.dart';
import 'package:provider/provider.dart' hide Selector;

class DrawGuessManager implements IDrawGuessManager {
  @override
  void loadStrings() {}

  @override
  Widget getGuessMsgWidget(message) {
    return GuessMsg(message: message);
  }

  @override
  bool isGaming() {
    GuessConfigData? guessConfigData = ChatRoomData.getInstance()
        ?.config
        ?.configExpendData as GuessConfigData?;
    return guessConfigData?.state != GameGuessState.wait &&
        guessConfigData?.state != GameGuessState.end;
  }

  @override
  bool isGuessQueueGaming(BuildContext context) {
    GuessQueueData data = context.watch<GuessQueueModel>().value;

    return data.state != GuessQueueState.Preparation &&
        data.state != GuessQueueState.End;
  }

  @override
  bool isDrawing() {
    GuessConfigData? guessConfigData = ChatRoomData.getInstance()
        ?.config
        ?.configExpendData as GuessConfigData?;
    return guessConfigData?.state == GameGuessState.drawing;
  }

  @override
  bool isDrawerChooseOrDrawing(positionExpendData) {
    if (positionExpendData is GuessPositionData) {
      GuessConfigData? guessConfigData = ChatRoomData.getInstance()
          ?.config
          ?.configExpendData as GuessConfigData?;
      if (positionExpendData.role == Role.drawer &&
          (guessConfigData?.state == GameGuessState.choose ||
              guessConfigData?.state == GameGuessState.drawing)) {
        return true;
      }
    }
    return false;
  }

  @override
  int getOriginUid(positionExpendData) {
    if (positionExpendData != null && positionExpendData is GuessPositionData) {
      GuessPositionData guessData = positionExpendData;
      return guessData.originId;
    }
    return 0;
  }

  @override
  int getAid(positionExpendData) {
    if (positionExpendData != null && positionExpendData is GuessPositionData) {
      GuessPositionData guessData = positionExpendData;
      return guessData.aid;
    }
    return 0;
  }

  @override
  Widget getGuess(room) {
    return GameGuess(room);
  }

  @override
  Widget getGuessPlayerList(room, bool displayEmote) {
    return GuessPlayerList(
      room: room,
      displayEmote: displayEmote,
    );
  }

  @override
  getGuessConfigData(Map data) {
    return GuessConfigData.fromJson(data);
  }

  @override
  getGuessPositionData(Map data) {
    return GuessPositionData.fromJson(data);
  }

  @override
  Widget getGuessQueueWidget(room, VoidCallback onSettingClick) {
    return GuessQueueWidget(
      room: room,
      onSettingClick: onSettingClick,
    );
  }

  @override
  Future<String?> showChooseGuessModePanel(BuildContext context) {
    return GuessQueueChooseModeWidget.show(context);
  }
}
