import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/controller_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';

/// 房间通用按钮Mixin
mixin RoomControllerButtonMixin {
  ChatRoomData? get roomData;

  /// 分享按钮(邀请好友按钮)
  Widget get shareBtn => ControllerIconButton(
        buttonText: 'share',
        isNewStyle: false,
        normalIcon: 'controller/ic_room_invite.webp',
        disabledIcon: 'controller/ic_room_invite.webp',
        onClick: (BuildContext context, bool selected) async {
          if (roomData != null) {
            ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
            settingManager.share(context, roomData!.realRid,
                tp: 1, needInApp: true, newShareInRoom: true, rid: roomData!.rid, title: K.room_invite_friend);
          } else {
            Log.d('Do not config roomData');
          }
        },
      );
}
