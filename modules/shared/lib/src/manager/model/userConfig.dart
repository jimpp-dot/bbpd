import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../pbModel/generated/api_im_data.pb.dart';

///该类为用户的在线状态以及房间状态类
class UserConfig {
  final int? uid;
  final int? online; // 0：离线，1：在线，2：隐身
  final int? room;
  final String? roomIcon;
  final String? prefix;

  final String? roomTypeName;

  /// 房间类型名称例如：连连看
  final List<Color>? bgColors;

  /// 渐变色
  final String? acuteIcon;

  /// 角标

  UserConfig(
      {this.uid,
      this.online,
      this.room,
      this.roomIcon,
      this.prefix,
      this.roomTypeName,
      this.bgColors,
      this.acuteIcon});

  UserConfig.fromJson(Map res)
      : uid = Util.parseInt(res['uid']),
        room = Util.parseInt(res['room']),
        online = Util.parseInt(res['online']),
        prefix = Util.parseStr(res['prefix']),
        roomIcon = Util.parseStr(res['roomicon']),
        roomTypeName = Util.parseStr(res['show']),
        bgColors = Util.parseColors(res['bg']),
        acuteIcon = Util.parseStr(res['acute_icon']);

  UserConfig.fromCloudRoomConfig(CloudRoomConfig config)
      : uid = config.hasUid() ? config.uid : 0,
        room = config.hasRoom() ? config.room : 0,
        online = config.hasOnline() ? config.online : 0,
        prefix = config.hasPrefix() ? config.prefix : '',
        roomIcon = config.hasRoomIcon() ? config.roomIcon : '',
        roomTypeName = config.hasShow() ? config.show : '',
        bgColors = config.bg.isNotEmpty ? Util.parseColors(config.bg) : [],
        acuteIcon = config.hasAcuteIcon() ? config.acuteIcon : '';

  UserConfig.fromCloudGroupConfig(CloudGroupConfig config)
      : uid = config.hasUid() ? config.uid : 0,
        room = config.hasRoom() ? config.room : 0,
        online = config.hasOnline() ? config.online : 0,
        prefix = config.hasPrefix() ? config.prefix : '',
        roomIcon = config.hasRoomIcon() ? config.roomIcon : '',
        roomTypeName = '',
        bgColors = [],
        acuteIcon = '';

  ///cloud/all接口返回数据转换 [ConfigData] -> [UserConfig]
  factory UserConfig.fromImUserData(
      ImUserData? userData, ImUserRoomData? roomData) {
    int status = Util.parseInt(userData?.onlineData.status);
    int ol = 0;
    if (status == 0) {
      //  0：未知，读online
      ol = Util.parseBool(userData?.onlineData.online) ? 1 : 0;
    } else if (status == 1) {
      // 1：在线
      ol = 1;
    } else if (status == 2) {
      // 2：离线
      ol = 0;
    } else if (status == 3) {
      // 3：隐身
      ol = 2;
    }
    return UserConfig(
        uid: userData?.uid ?? 0,
        online: ol,
        prefix: roomData?.prefix ?? '',
        room: roomData?.room ?? 0,
        roomIcon: roomData?.roomicon ?? '',
        roomTypeName: roomData?.show ?? '',
        bgColors: Util.parseColors(roomData?.bg),
        acuteIcon: roomData?.acuteIcon ?? '');
  }

  ///[GroupData] -> [UserConfig]
  UserConfig.fromImGroupData(ImGroupData? groupData)
      : uid = groupData?.uid ?? 0,
        room = groupData?.room ?? 0,
        online = groupData?.online ?? 0,
        prefix = groupData?.prefix ?? '',
        roomIcon = groupData?.roomIcon ?? '',
        roomTypeName = '',
        bgColors = [],
        acuteIcon = '';

  @override
  String toString() {
    return 'UserConfig{uid: $uid, online: $online, room: $room, roomIcon: $roomIcon, prefix: $prefix, roomTypeName: $roomTypeName, bgColors: $bgColors, acuteIcon: $acuteIcon}';
  }
}
