import 'dart:core';
import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

import '../models/generated/room_general_setting.pb.dart';
import '../providers/room_general_setting_repository.dart';

/// 房间通用设置管理

mixin RoomGeneralSettingMixin {
  /// 房间是否被禁言
  bool roomMute = false;

  ///  房间禁言倒计时，单位秒
  int muteCountdown = 0;

  /// 判断房间是否被禁言
  bool get isRoomMuted => roomMute && muteCountdown > 0;

  ResRoomGeneralSetting? generalSetting;

  /// 房间通用设置接口
  void loadRoomGeneralSetting({int rid = 0, VoidCallback? onRefresh}) async {
    if (Util.parseInt(rid) <= 0) return;
    ResRoomGeneralSetting resp =
        await RoomGeneralSettingRepository.roomGeneralSetting(rid: rid);
    if (resp.success && resp.hasData()) {
      generalSetting = resp;
      if (resp.data.hasRoomMute()) {
        // 用户被禁言逻辑
        roomMute = Util.parseBool(resp.data.roomMute.mute);
        muteCountdown = Util.parseInt(resp.data.roomMute.countdown);
        if (isRoomMuted) {
          eventCenter.emit(RoomConstant.Event_Room_User_Mute, muteCountdown);
        }
      } else {
        roomMute = false;
        muteCountdown = 0;
      }
      onRefresh?.call();
    } else {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }
}
