// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_playing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsPlayingItem _$FriendsPlayingItemFromJson(Map<String, dynamic> json) {
  return FriendsPlayingItem(
    uid: Util.parseInt(json['uid']),
    rid: Util.parseInt(json['in_room']),
    icon: Util.parseStr(json['icon']),
    name: Util.parseStr(json['name']),
    acuteIcon: Util.parseStr(json['acute_icon']),
    bgColors: Util.parseColors(json['bg']),
    show: Util.parseStr(json['show']),
    onlineStatus: Util.parseInt(json['online_status']),
  )
    ..roomTag = Util.parseStr(json['room_tag_new'])
    ..mark = Util.parseStr(json['rec_mark']);
}

FriendsPlayingRsp _$FriendsPlayingRspFromJson(Map<String, dynamic> json) {
  return FriendsPlayingRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(json['data'],
        (e) => FriendsPlayingItem.fromJson(e as Map<String, dynamic>)),
    total: Util.parseInt(json['total']),
  );
}
