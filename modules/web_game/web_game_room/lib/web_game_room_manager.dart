import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'web_game_room.dart';

class WebGameRoomManager extends IBASEGameRoomManager {
  @override
  bool isGameMsg(List<int> msg) {
    return GameCodec.isGameMsg(msg);
  }

  @override
  void handleMsg(List<int> msg) {
    GameCodec.handleMsg(msg);
  }

  @override
  Widget buildRoomGamePage({
    Key? key,
    required String gameType,
    bool showLoadingPage = true,
    bool showLoadingCloseBtn = true,
  }) {
    return RoomGamePage(
      key: key,
      gameType: gameType,
      showLoadingPage: showLoadingPage,
      showLoadingCloseBtn: showLoadingCloseBtn,
    );
  }

  @override
  Widget buildRoomGamePluginPanel({Key? key}) {
    return RoomGamePluginPanel(key: key);
  }
}
