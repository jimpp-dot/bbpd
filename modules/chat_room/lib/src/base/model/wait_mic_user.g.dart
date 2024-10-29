// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wait_mic_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaitMicUserInfo _$WaitMicUserInfoFromJson(Map<String, dynamic> json) {
  return WaitMicUserInfo(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['title']),
    Util.parseInt(json['title_new']),
    Util.parseInt(json['vip']),
    Util.parseInt(json['year']),
    Util.notNullStr(json['dateline_diff']),
    Util.parseBool(json['priority']),
    Util.notNullStr(json['song_name']),
    Util.notNullStr(json['song_id']),
  );
}

WaitMicUserListRsp _$WaitMicUserListRspFromJson(Map<String, dynamic> json) {
  return WaitMicUserListRsp(
    success: Util.parseBool(json['success']),
    positionTable: Util.parseList(json['position_table'],
        (e) => PositionIndex.fromJson(e as Map<String, dynamic>)),
    msg: Util.parseStr(json['msg']),
    waitMicUsers: Util.parseList(json['data'],
        (e) => WaitMicUserInfo.fromJson(e as Map<String, dynamic>)),
    gift: json['gift_info'] == null
        ? null
        : Gift.fromJson(json['gift_info'] as Map<String, dynamic>),
    singPower: Util.parseBool(json['sing_power']),
    hasOrderSong: Util.parseBool(json['has_order_song']),
  );
}
