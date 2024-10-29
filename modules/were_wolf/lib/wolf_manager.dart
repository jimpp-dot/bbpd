import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'src/room/guide/wolf_guide_screen.dart';
import 'src/room/msg/wolfMsgWidget.dart';
import 'src/room/wolf_room_page.dart';
import 'src/room/wolfv2/model/wolf_beans.dart';
import 'src/room/wolfv2/wolfSourceUtil.dart';
import 'src/wolf_test_screen.dart';

class WereWolfManager extends IWereWolfManager {
  static const String WOLF6 = 'wolf6';
  static const String WOLF9 = 'wolf';
  static const String NEWWOLF6 = 'newwolf6';
  static const String NEWWOLF9 = 'newwolf9';
  static const String WOLF12 = 'wolf12';

  @override
  Widget getWolfRoomPage(dynamic room,
      {bool displayEmoteAtMic = true, bool displayMessageList = true}) {
    return WolfRoomPage(room,
        displayEmoteAtMic: displayEmoteAtMic,
        displayMessageList: displayMessageList);
  }

  @override
  bool isWolf6(String typeLabel) {
    return WOLF6 == typeLabel || NEWWOLF6 == typeLabel;
  }

  @override
  bool isWolf9(String typeLabel) {
    return WOLF9 == typeLabel || NEWWOLF9 == typeLabel;
  }

  @override
  Widget getWolfMsgWidget(message) {
    return WolfMsgWidget(message: message);
  }

  @override
  getWolfConfigData(Map data) {
    return WolfConfigData.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  getWolfPositionData(Map data) {
    return WolfPositionData.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  int getOriginUid(positionExpendData) {
    if (positionExpendData != null && positionExpendData is WolfPositionData) {
      WolfPositionData wolfData = positionExpendData;
      return wolfData.origin;
    }
    return 0;
  }

  @override
  bool isGaming() {
    if (ChatRoomData.getInstance()?.config?.configExpendData != null) {
      WolfConfigData wolfConfigData = ChatRoomData.getInstance()
          ?.config
          ?.configExpendData as WolfConfigData;
      WolfState state = wolfConfigData.state;
      return state != WolfState.Wait &&
          state != WolfState.GameEnd &&
          state != WolfState.End;
    }
    return false;
  }

  @override
  bool isNewWolfRoom() {
    if (ChatRoomData.getInstance()?.config?.configExpendData != null) {
      WolfConfigData wolfConfigData = ChatRoomData.getInstance()
          ?.config
          ?.configExpendData as WolfConfigData;
      return wolfConfigData.playerType == PlayerType.player12 ||
          wolfConfigData.playerType == PlayerType.newplayer6 ||
          wolfConfigData.playerType == PlayerType.newplayer9;
    }
    return false;
  }

  @override
  bool isWolfStateTypeDay() {
    if (ChatRoomData.getInstance()?.config?.configExpendData != null) {
      WolfConfigData wolfConfigData = ChatRoomData.getInstance()
          ?.config
          ?.configExpendData as WolfConfigData;
      return wolfConfigData.stateType == WolfStateType.day;
    }
    return false;
  }

  @override
  Future openWolfTestScreen(BuildContext context, {int mode = 1}) {
    return WolfTestScreen.show(context, mode: mode);
  }

  @override
  String getTypeLabel() {
    String? typeLabel = ChatRoomData.getInstance()?.config?.type;
    if (ChatRoomData.getInstance()?.config?.configExpendData != null) {
      WolfConfigData wolfConfigData = ChatRoomData.getInstance()
          ?.config
          ?.configExpendData as WolfConfigData;
      switch (wolfConfigData.playerType) {
        case PlayerType.player6:
          typeLabel = WOLF6;
          break;
        case PlayerType.player9:
          typeLabel = WOLF9;
          break;
        case PlayerType.player12:
          typeLabel = WOLF12;
          break;
        case PlayerType.newplayer6:
          typeLabel = NEWWOLF6;
          break;
        case PlayerType.newplayer9:
          typeLabel = NEWWOLF9;
          break;
      }
    }
    return typeLabel ?? '';
  }

  @override
  String? getPublishDeal() {
    if (ChatRoomData.getInstance()?.config?.game != Games.Wolf) {
      return null;
    }
    String? publishDeal;
    WolfConfigData? wolfConfigData =
        ChatRoomData.getInstance()?.config?.configExpendData as WolfConfigData?;
    if (wolfConfigData != null) {
      publishDeal = wolfConfigData.publishDeal ? '1' : '0';
    }
    return publishDeal;
  }

  @override
  bool checkToDispose(positionExpendData) {
    if (ChatRoomData.getInstance()?.config?.configExpendData != null &&
        positionExpendData is WolfPositionData) {
      WolfConfigData wolfConfigData = ChatRoomData.getInstance()
          ?.config
          ?.configExpendData as WolfConfigData;
      WolfState state = wolfConfigData.state;
      WolfPositionData wolfPositionData = positionExpendData;
      return state != WolfState.Wait &&
          state != WolfState.GameEnd &&
          state != WolfState.End &&
          !wolfPositionData.isDead;
    }
    return false;
  }

  @override
  bool isGameStarted() {
    if (ChatRoomData.getInstance()?.config?.configExpendData != null) {
      WolfConfigData wolfConfigData = ChatRoomData.getInstance()
          ?.config
          ?.configExpendData as WolfConfigData;
      WolfState state = wolfConfigData.state;
      return state != WolfState.Wait;
    }
    return false;
  }

  @override
  Widget getWolfBg(BuildContext context) {
    bool isTypeDay = isWolfStateTypeDay();
    return R.img(
      isTypeDay ? 'wolfv2/bg_wolf_day.webp' : 'wolfv2/bg_wolf_night.webp',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      package: ComponentManager.MANAGER_WERE_WOLF,
      fit: BoxFit.cover,
    );
  }

  @override
  Future<bool?> openWolfGuideScreen(BuildContext context) async {
    return await WolfGuideScreen.openGuideScreen(System.context);
  }

  @override
  bool isInRoom() {
    int rid = 0;
    if (ChatRoomData.exists()) {
      //房间存在
      rid = ChatRoomData.getInstance()!.rid;
    }
    bool flag = rid > 0;
    return flag;
  }

  @override
  Future<void> init() async {
    await WolfSourceUtil.initDeleteZipFileDir();
  }

  @override
  int getGameType() {
    int gameType = 0;
    if (ChatRoomData.getInstance()?.config?.configExpendData
        is WolfConfigData) {
      WolfConfigData wolfConfigData = ChatRoomData.getInstance()
          ?.config
          ?.configExpendData as WolfConfigData;
      switch (wolfConfigData.playerType) {
        case PlayerType.player9:
          gameType = 1;
          break;
        case PlayerType.player6:
          gameType = 2;
          break;
        case PlayerType.player12:
          gameType = 3;
          break;
        case PlayerType.newplayer9:
          gameType = 4;
          break;
        case PlayerType.newplayer6:
          gameType = 5;
          break;
      }
    }
    return gameType;
  }
}
