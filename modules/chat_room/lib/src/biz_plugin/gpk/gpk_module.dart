import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'gpk_constants.dart';

import 'create/gpk_c_screen.dart';

/// 房间分组PK模块入口
class RoomGPKModule {
  /// 打开分组PK创建页面
  static Future openCreateScreen(
      BuildContext context, final ChatRoomData room) async {
    if (room.gpkEnable == true) {
      Fluttertoast.showCenter(msg: K.room_gpk_already_in_gpk);
      return;
    }

    return await displayModalBottomSheet(
        context: context,
        isBarrierDismissible: false,
        fullscreenDialog: true,
        maxHeightRatio: 1,
        builder: (context) {
          return SizedBox(
            height: Util.height - Util.statusHeight,
            width: double.infinity,
            child: GPKCreateScreen(room: room),
          );
        });
  }

  /// 判断当前是否在有效的分组pk状态下.
  static bool isInGpkMode(final ChatRoomData? room) {
    if (room == null || room.gpkEnable == false) {
      return false;
    }
    return true;
  }

  /// 是否展现菜单小红点
  static bool showMenuRedDot(final ChatRoomData? room) {
    return room?.showGpk == true && Config.getBool(KEY_SHOW_MENU_REDDOT, true);
  }

  /// 设置是否展现菜单小红点
  static void setMenuRedDotShow(bool show) {
    Config.setBool(KEY_SHOW_MENU_REDDOT, show);
  }
}
