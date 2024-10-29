import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class IBASEGameCoreManager extends IResourceLoader {
  void switchOnlineDev(bool enable);

  bool isOnlineDev();
}

abstract class IBASEGameNormalManager extends IResourceLoader {
  Widget buildGardenGamePage({Key? key});
}

abstract class IBASEGameRoomManager extends IResourceLoader {
  bool isGameMsg(List<int> msg);

  void handleMsg(List<int> msg);

  Widget buildRoomGamePage({
    Key? key,
    required String gameType,
    bool showLoadingPage = true,
    bool showLoadingCloseBtn = true,
  });

  Widget buildRoomGamePluginPanel({Key? key});
}

abstract class IBASEGameUnoManager extends IResourceLoader {
  Widget buildUnoPage({Key? key});
}
