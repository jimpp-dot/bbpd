import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';

String get keyLastSendMsgTime => 'room.talent.lastSendMsgTime${Session.uid}';

class TalentHelperNew {
  /// 拥有可编辑和添加列表权限的人
  static bool hasEditPermission(ChatRoomData? room) {
    if (room == null) return false;
    return room.isArtCenterAdmin;
  }

  /// 返回高斯模糊的
  static Widget blurDialogWidget({required Widget child, double? height}) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.vertical(
        top: Radius.circular(16.dp),
      ).resolve(TextDirection.ltr),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: height ?? Util.height * 0.85,
          color: const Color(0xB3171621),
          child: child,
        ),
      ),
    );
  }
}
