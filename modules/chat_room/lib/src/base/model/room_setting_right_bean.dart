import 'package:shared/shared.dart';
import 'package:shared/model/friends_playing.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'option_beans.dart';
part 'room_setting_right_bean.g.dart';

@JsonSerializable(createToJson: false)
class RoomSettingRightBean extends BaseResponse {
  RoomSettingRightData? data;

  RoomSettingRightBean({this.data, super.success, super.msg});

  factory RoomSettingRightBean.fromJson(Map<String, dynamic> json) =>
      _$RoomSettingRightBeanFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomSettingRightData {
  final List<OptionItem> option;
  final List<FriendsPlayingItem> playing;
  final List<RoomItem> rooms;

  RoomSettingRightData(this.option, this.playing, this.rooms);
  factory RoomSettingRightData.fromJson(Map<String, dynamic> json) =>
      _$RoomSettingRightDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomItem {
  final int rid;
  final int uid;
  @JsonKey(name: 'online_num')
  final int onlineNum;
  @JsonKey(name: 'real')
  final int realNum;
  @JsonKey(name: 'utitle')
  final int userTitle;
  @JsonKey(name: 'num_boy')
  final int numBoy;
  @JsonKey(name: 'num_girl')
  final int numGirl;
  @JsonKey(name: 'boss_uid')
  final bool isBusy;
  @JsonKey(name: 'password')
  final bool isPassword;
  @JsonKey(name: 'name')
  final String roomName;
  final String prefix;
  @JsonKey(name: 'icon')
  final String roomIcon;
  @JsonKey(name: 'uname')
  final String userName;
  final String types;
  final String effect;
  @JsonKey(name: 'typeName')
  final RoomTag? tag;
  @JsonKey(name: 'isgame')
  final bool isGameRoom;
  @JsonKey(name: 'state')
  final String gameProcess; //wait为游戏等待,其它为游戏中
  final String frame; // 房间年度盛典头像框
  @JsonKey(name: 'left_frame')
  final String leftFrame; // 头像上房间角标
  final int ppnum; // 服务端计算的在线人数
  final String type;
  final int sex;
  @JsonKey(name: 'property')
  final String roomProperty;
  bool isBiz; //是否商业化推荐

  RoomItem(
      this.uid,
      this.rid,
      this.onlineNum,
      this.realNum,
      this.userTitle,
      this.numBoy,
      this.numGirl,
      this.isBusy,
      this.isPassword,
      this.roomName,
      this.prefix,
      this.roomIcon,
      this.userName,
      this.types,
      this.effect,
      this.tag,
      this.isGameRoom,
      this.gameProcess,
      this.frame,
      this.leftFrame,
      this.ppnum,
      this.type,
      this.sex,
      this.roomProperty,
      this.isBiz);

  factory RoomItem.fromJson(Map<String, dynamic> json) =>
      _$RoomItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomTag {
  final String label;
  final String val;
  final String color;
  final String show;
  final List<String> bg;

  List<Color> get bgColors {
    List<Color> colors = [];
    for (var element in bg) {
      String colorStr = '0xff${element.substring(1)}';
      Color color = Color(int.parse(colorStr));
      colors.add(color);
    }

    return colors;
  }

  RoomTag(this.label, this.val, this.color, this.show, this.bg);
  factory RoomTag.fromJson(Map<String, dynamic> json) =>
      _$RoomTagFromJson(json);
}
