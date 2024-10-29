import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

/// 点唱工具类
class JukeMusicUtil {
  /// 支持点唱歌单价格设置
  static bool supportJukeMusic(ChatRoomData? room) {
    return ChatRoomUtil.isJukeMusicRoom(room?.config);
  }

  /// 点唱歌单的操作权限,身份为房主or接待，且当前在接待位
  static bool get canOperate {
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room == null) {
      return false;
    }
    int position = -1;
    for (RoomPosition pos in room.positions) {
      if (Session.uid == pos.uid) {
        position = pos.position;
        break;
      }
    }
    return ChatRoomUtil.isReceptionChair(position) &&
        (room.isCreator || room.isReception);
  }
}
