import 'package:chat_room/chat_room.dart';

class KtvUtil {
  KtvUtil._();

  static double getDiffHeight(ChatRoomData room) {
    if (room.ktvPkRank?.isPkModeOpen ?? false) {
      return 36.0 - 16.0;
    }
    return 0.0;
  }
}
