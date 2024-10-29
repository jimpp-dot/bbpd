import 'package:flutter/cupertino.dart';

import '../../shared.dart';

class MissionManager {
  /// 是否有卧底、画猜、狼人杀入口，不支持则对应的任务会由跳转游戏房变为跳转娱乐房
  static bool canEnterGameRoom = false;

  /// 任务
  static const String TAB_TASK = 'task';

  /// 奖励
  static const String TAB_AWARD = 'award';

  /// 兑换
  static const String TAB_EXCHANGE = 'exchange';

  static void gotoMissionCenter(BuildContext context, {String initTab = ''}) {
    String url = Util.isStringEmpty(initTab)
        ? Session.signUrl
        : Session.getSignUrl(initTab);
    BaseWebviewScreen.show(context,
        url: url, extra: {'can_enter_game_room': canEnterGameRoom});
  }
}
