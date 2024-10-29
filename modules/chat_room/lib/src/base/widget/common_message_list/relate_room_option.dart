import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../../k.dart';
import '../../../protobuf/generated/drainage.pb.dart';
import '../../create_private_room/invite_private_room_view.dart';
import 'multi_tab_msg_repo.dart';

/// 关联房间【更多】操作
class RelateRoomOption {
  /// 更多操作
  /// permission：权限列表
  /// rid：当前选中tab所对应的rid
  /// currentRoomRid：当前所在房间rid
  static Future<void> moreOption(
      List<DrainagePermission> permission, int rid, int currentRoomRid) async {
    List<SheetItem> res = [];

    for (DrainagePermission data in permission) {
      if (data.operation == RoomDrainageOperation.RoomDrainageEnter) {
        /// 前往该房间
        res.add(SheetItem(data.copywriting, 'RoomDrainageEnter', rid));
      } else if (data.operation == RoomDrainageOperation.RoomDrainageInvite) {
        /// 邀请回主派对
        res.add(
            SheetItem(data.copywriting, 'RoomDrainageInvite', data.targetRid));
      } else if (data.operation ==
          RoomDrainageOperation.RoomDrainageCloseAndInvite) {
        /// 关闭并邀请回主派对
        res.add(SheetItem(
            data.copywriting, 'RoomDrainageCloseAndInvite', data.targetRid));
      } else if (data.operation ==
          RoomDrainageOperation.RoomDrainageChooseInvite) {
        /// 邀请大房用户进小房，邀请列表
        res.add(SheetItem(
            data.copywriting, 'RoomDrainageChooseInvite', data.targetRid));
      }
    }

    if (res.isEmpty) return;
    SheetCallback? result = await displayModalBottomSheet(
        context: System.context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
            showTitle: false,
            data: res,
          );
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == 'RoomDrainageEnter' &&
        Util.parseInt(result.value?.extra) > 0) {
      // 前往该房间
      IRoomManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      manager.openChatRoomScreenShow(
          System.context, Util.parseInt(result.value?.extra),
          refer: 'room_relate_message');
      return;
    } else if (result.value?.key == 'RoomDrainageInvite' &&
        Util.parseInt(result.value?.extra) > 0) {
      /// 邀请回主派对
      ResDrainageOperate res = await MultiTabMsgRepo.relateRoomOption(
          rid, Util.parseInt(result.value?.extra), 1);
      if (res.success) {
        Fluttertoast.showCenter(msg: K.room_has_send_invite_msg);
      } else if (Util.validStr(res.message)) {
        Fluttertoast.showCenter(msg: res.message);
      }
    } else if (result.value?.key == 'RoomDrainageCloseAndInvite' &&
        Util.parseInt(result.value?.extra) > 0) {
      /// 关闭并邀请回主派对
      bool? agree = await showDialog(
          context: System.context,
          builder: (context) {
            return ConfirmDialog(
              title: K.room_close_room,
              content: K.room_close_relative_room_content,
            );
          });

      if (agree == true) {
        /// 关闭并邀请
        ResDrainageOperate res = await MultiTabMsgRepo.relateRoomOption(
            rid, Util.parseInt(result.value?.extra), 2);
        if (res.success == false && Util.validStr(res.message)) {
          Fluttertoast.showCenter(msg: res.message);
        } else if (res.success &&
            (currentRoomRid != Util.parseInt(result.value?.extra))) {
          /// 关闭成功，自己跳到主房间
          IRoomManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          manager.openChatRoomScreenShow(
              System.context, Util.parseInt(result.value?.extra),
              refer: 'room_relate_message');
        }
      }
    } else if (result.value?.key == 'RoomDrainageChooseInvite' &&
        Util.parseInt(result.value?.extra) > 0) {
      /// 弹出邀请列表
      InvitePrivateRoomPage.show(
          System.context, rid, Util.parseInt(result.value?.extra));
    }
  }
}
