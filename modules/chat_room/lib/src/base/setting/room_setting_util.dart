import 'package:chat_room/chat_room.dart';

/// 房间设置相关配置
///
class RoomSettingUtil {
  RoomSettingUtil._();

  /// 是否展现房主位
  static bool showAdminChair(ChatRoomData room) {
    bool isAuction = room.config?.types == RoomTypes.Auction;
    bool isWedding = room.config?.types == RoomTypes.Wedding;
    bool isBirthday = room.isBusinessBirthday;

    if (isAuction || isWedding || isBirthday) {
      return false;
    }

    return true;
  }

  /// 自由上座
  static bool showInMicFree(ChatRoomData room) {
    return true;
  }

  /// 显示排行榜
  static bool showRank(ChatRoomData room) {
    bool isWedding = room.config?.types == RoomTypes.Wedding;
    if (isWedding) {
      return false;
    }

    return true;
  }

  /// 显示接待位
  static bool showReception(ChatRoomData room) {
    bool isAuction = room.config?.types == RoomTypes.Auction;
    bool isWedding = room.config?.types == RoomTypes.Wedding;

    if (isAuction || isWedding || room.isMicLink) {
      return false;
    }

    return true;
  }

  /// 老板位数量（可选0-4）
  static bool showBossChairNum(ChatRoomData room) {
    bool isAuction = room.config?.types == RoomTypes.Auction;
    bool isWedding = room.config?.types == RoomTypes.Wedding;
    bool isBirthday = room.isBusinessBirthday;

    if (isAuction || isWedding || isBirthday || room.isMicLink) {
      return false;
    }

    return true;
  }

  /// 两个老板位
  static bool showBigHeader(ChatRoomData room) {
    bool isBirthday = room.isBusinessBirthday;

    if (isBirthday) {
      return true;
    }

    return false;
  }
}
