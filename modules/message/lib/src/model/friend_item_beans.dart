import 'dart:ui';

import 'package:shared/k.dart' as BaseK;
import 'package:message/k.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'friend_item_beans.g.dart';

enum FriendItemType { follow, friend, accompany }

@JsonSerializable(createToJson: false)
class FriendItem {
  @JsonKey(fromJson: Util.parseInt)
  int uid;

  @JsonKey(fromJson: Util.parseInt)
  int age;
  @JsonKey(fromJson: Util.parseInt)
  int sex;
  String? icon;
  String? name;

  @JsonKey(name: 'online_status', fromJson: Util.parseBool)
  bool online;

  @JsonKey(fromJson: Util.parseInt)
  int dateline;

  @JsonKey(fromJson: FriendItem.parseType)
  FriendItemType type;

  @JsonKey(name: 'in_room', fromJson: Util.parseInt)
  int rid;

  @JsonKey(name: 'room_name')
  String? roomName;

  @JsonKey(name: 'room_tag_new')
  String? roomTag;

  @JsonKey(name: 'room_role', fromJson: FriendItem.parseRoomRole)
  String? roomRole;

  @JsonKey(name: 'room_online_num', fromJson: Util.parseInt)
  int onlineNum;

  @JsonKey(name: 'room_tag_bg', fromJson: Util.parseColors)
  List<Color> tagBg;

  @JsonKey(name: 'is_game', fromJson: Util.parseInt)
  int isGame;

  @JsonKey(
    name: 'room_icon',
  )
  String? roomIcon;

  FriendItem(
      {required this.uid,
      required this.age,
      required this.sex,
      required this.icon,
      required this.name,
      required this.online,
      required this.dateline,
      required this.type,
      required this.rid,
      required this.roomName,
      required this.roomTag,
      required this.roomRole,
      required this.onlineNum,
      required this.tagBg,
      required this.isGame,
      required this.roomIcon});

  factory FriendItem.fromJson(Map<String, dynamic> json) =>
      _$FriendItemFromJson(json);

  String get onlineDesc {
    if (online ?? true) return BaseK.K.base_current_online;
    return '${Utility.getDateDiff(dateline)}${K.msg_active}';
  }

  static FriendItemType parseType(dynamic value) {
    if (value == 'follow') {
      return FriendItemType.follow;
    } else if (value == 'friend') {
      return FriendItemType.friend;
    } else if (value == 'accompany') {
      return FriendItemType.accompany;
    } else {
      return FriendItemType.follow;
    }
  }

  static String parseRoomRole(dynamic value) {
    if (value == 'createor') {
      return BaseK.K.base_room_creator;
    } else if (value == 'admin') {
      return BaseK.K.base_room_admin;
    } else {
      return '';
    }
  }
}
