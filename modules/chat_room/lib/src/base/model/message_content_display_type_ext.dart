import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/chat_room.dart';

enum RoomMessageDisplayType {
  unknown,
  welcomeTargetToMe, //向我打招呼（带表情）
}

extension DisplayTypeExt on MessageContent {
  RoomMessageDisplayType get displayType {
    if (type == MessageType.Message) {
      if (extra?['show_welcome_bubble'] != null &&
          Util.parseBool(extra?['show_welcome_bubble'])) {
        return RoomMessageDisplayType.welcomeTargetToMe;
      }
    }

    return RoomMessageDisplayType.unknown;
  }

  bool get customBackground {
    return [RoomMessageDisplayType.welcomeTargetToMe].contains(displayType);
  }
}
