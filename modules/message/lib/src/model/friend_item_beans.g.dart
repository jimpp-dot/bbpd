// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_item_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendItem _$FriendItemFromJson(Map<String, dynamic> json) {
  return FriendItem(
    uid: Util.parseInt(json['uid']),
    age: Util.parseInt(json['age']),
    sex: Util.parseInt(json['sex']),
    icon: Util.parseStr(json['icon']),
    name: Util.parseStr(json['name']),
    online: Util.parseBool(json['online_status']),
    dateline: Util.parseInt(json['dateline']),
    type: FriendItem.parseType(json['type']),
    rid: Util.parseInt(json['in_room']),
    roomName: Util.parseStr(json['room_name']),
    roomTag: Util.parseStr(json['room_tag_new']),
    roomRole: FriendItem.parseRoomRole(json['room_role']),
    onlineNum: Util.parseInt(json['room_online_num']),
    tagBg: Util.parseColors(json['room_tag_bg']),
    isGame: Util.parseInt(json['is_game']),
    roomIcon: Util.parseStr(json['room_icon']),
  );
}
