import 'dart:math';

import 'package:shared/shared.dart';

///APP全局数据
class GlobalData {
  static int _CHAT_INVITE_ROOM_BUBBLE = 1;

  /// 聊天页面 加入房间气泡；APP启动仅允许一次

  static bool get showChatInviteRoomBubble {
    int result = _CHAT_INVITE_ROOM_BUBBLE;
    _CHAT_INVITE_ROOM_BUBBLE = max(result - 1, 0);

    return result > 0;
  }
}
