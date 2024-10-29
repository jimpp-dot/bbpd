import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';

/// 房间用户资料卡
class RoomUserProfile {
  /// 打开房间用户资料卡
  /// [from] 0:房间坑位 1:公屏消息 2:其他 3: 世界频道,4:星舰群聊
  static Future openImageFloatScreenDisplayModalBottomSheet(
    BuildContext context,
    int uid,
    ChatRoomData? room,
    int from, {
    bool isOffline = false,
    String? nameReplace,
    String? avatarUrlReplace,
    bool useEmptyRoom = false,
    int chatGroupId = 0,
    int? toRid, // 去往另一个房间
    Widget? dmWidget,
  }) {
    IPersonalDataManager? personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    return personalDataManager!.openImageFloatScreenDisplayModalBottomSheet(
        context, uid, room, from,
        isOffline: isOffline,
        nameReplace: nameReplace ?? '',
        avatarUrlReplace: avatarUrlReplace ?? '',
        useEmptyRoom: useEmptyRoom,
        chatGroupId: chatGroupId,
        toRid: toRid ?? 0,
        dmWidget: dmWidget);
  }

  /// 获取房间用户资料卡widget
  static Widget getImageFloatScreen(BuildContext context,
      {int? uid,
      ChatRoomData? chatRoomData,
      int? from,
      Color? background,
      bool isOffline = false,
      int toRid = 0,
      String? nameReplace,
      String? avatarUrlReplace}) {
    IPersonalDataManager? personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    return personalDataManager!.getImageFloatScreen(context,
        uid: uid ?? 0,
        chatRoomData: chatRoomData,
        from: from ?? 0,
        background: background,
        isOffline: isOffline,
        toRid: toRid,
        nameReplace: nameReplace ?? '',
        avatarUrlReplace: avatarUrlReplace ?? '');
  }
}
