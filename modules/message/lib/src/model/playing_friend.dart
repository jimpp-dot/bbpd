import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:message/k.dart';
import 'package:shared/k.dart' as BaseK;

part 'playing_friend.g.dart';

enum FriendItemType { follow, friend, accompany }

@JsonSerializable(createToJson: false)
class PlayingFriendItem {
  @JsonKey(fromJson: Util.parseInt)
  final int uid;

  @JsonKey(fromJson: Util.parseInt)
  final int age;
  @JsonKey(fromJson: Util.parseInt)
  final int sex;
  final String? icon;
  final String? name;

  @JsonKey(name: 'online_status', fromJson: Util.parseBool)
  final bool online;

  @JsonKey(fromJson: Util.parseInt)
  final int dateline;

  @JsonKey(fromJson: PlayingFriendItem.parseType)
  final FriendItemType type;

  @JsonKey(name: 'in_room', fromJson: Util.parseInt)
  final int rid;

  @JsonKey(name: 'room_name')
  final String? roomName;

  @JsonKey(name: 'room_tag')
  final String? roomTag;

  @JsonKey(name: 'room_role', fromJson: PlayingFriendItem.parseRoomRole)
  final String? roomRole;

  @JsonKey(name: 'room_online_num', fromJson: Util.parseInt)
  final int onlineNum;

  @JsonKey(name: 'room_tag_bg', fromJson: Util.parseColors)
  final List<Color> tagBg;

  @JsonKey(name: 'is_game', fromJson: Util.parseInt)
  final int isGame;

  @JsonKey(
    name: 'room_icon',
  )
  final String? roomIcon;

  String? tag;

  PlayingFriendItem(
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

  factory PlayingFriendItem.fromJson(Map<String, dynamic> json) =>
      _$PlayingFriendItemFromJson(json);

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
