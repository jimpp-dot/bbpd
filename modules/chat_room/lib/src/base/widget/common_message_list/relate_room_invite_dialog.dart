import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 在小房间，被邀请回大房间（仅邀请/关闭并邀请）
/// 标题和内容由服务端下发
class RelateRoomInviteDialog {
  static Future<void> show(Map? data) async {
    if (data != null &&
        Util.validStr(data['title']) &&
        Util.validStr(data['content']) &&
        Util.parseInt(data['rid']) > 0) {
      bool? agree = await showDialog(
          context: System.context,
          builder: (context) {
            return ConfirmDialog(
              title: data['title'],
              content: data['content'],
            );
          });

      if (agree == true) {
        // 前往主房间
        IRoomManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        manager.openChatRoomScreenShow(
            System.context, Util.parseInt(data['rid']),
            refer: 'room_relate_invite');
      }
    }
  }
}
