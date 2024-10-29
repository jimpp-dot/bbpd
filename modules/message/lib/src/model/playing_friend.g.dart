// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playing_friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayingFriendItem _$PlayingFriendItemFromJson(Map<String, dynamic> json) {
  return PlayingFriendItem(
    uid: Util.parseInt(json['uid']),
    age: Util.parseInt(json['age']),
    sex: Util.parseInt(json['sex']),
    icon: Util.parseStr(json['icon']),
    name: Util.parseStr(json['name']),
    online: Util.parseBool(json['online_status']),
    dateline: Util.parseInt(json['dateline']),
    type: PlayingFriendItem.parseType(json['type']),
    rid: Util.parseInt(json['in_room']),
    roomName: Util.parseStr(json['room_name']),
    roomTag: Util.parseStr(json['room_tag']),
    roomRole: PlayingFriendItem.parseRoomRole(json['room_role']),
    onlineNum: Util.parseInt(json['room_online_num']),
    tagBg: Util.parseColors(json['room_tag_bg']),
    isGame: Util.parseInt(json['is_game']),
    roomIcon: Util.parseStr(json['room_icon']),
  )..tag = Util.parseStr(json['tag']);
}
