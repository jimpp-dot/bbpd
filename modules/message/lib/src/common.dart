import 'dart:io';

import 'package:flutter/material.dart';
import 'package:message/k.dart';
import 'package:shared/shared.dart';

import 'friend_add_screen.dart';

/// 右上角操作按钮
/// [showRoom] 是否展示我的房间
/// [showFamily] 是否展现家族
onClickAddAction(BuildContext context, {bool showRoom = true, bool showFamily = true}) async {
  if (Session.isLogined == false) {
    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    loginManager.show(context);
    return;
  }
  List<SheetItem> res = [
    SheetItem(K.msg_add_friend, "friend"),
    SheetItem(K.msg_start_group_chat, "group"),
  ];
  if (Platform.isAndroid && Util.isAndroidVerify) {
    // 屏蔽家族和房间
  } else {
    if (showRoom == true) {
      res.add(SheetItem(K.msg_my_room, "room"));
    }
  }
  SheetCallback? result = await displayModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return RadioBottomSheet(title: R.string('choose_operate'), data: res);
      });
  if (result == null || result.reason == SheetCloseReason.Active) {
    return;
  }
  if (result.value?.key == 'friend') {
    FriendAddScreen.show(context, refer: 'massage_plus');
  } else if (result.value?.key == 'group') {
    IGroupManager groupManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GROUP);
    groupManager.openGroupCreateScreen(context, groupId: 0, uid: 0);
  } else if (result.value?.key == 'room') {
    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openInitOperateDisplay(context);
  }
}
