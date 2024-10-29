// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_setting_right_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomSettingRightBean _$RoomSettingRightBeanFromJson(Map<String, dynamic> json) {
  return RoomSettingRightBean(
    data: json['data'] == null
        ? null
        : RoomSettingRightData.fromJson(json['data'] as Map<String, dynamic>),
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
  );
}

RoomSettingRightData _$RoomSettingRightDataFromJson(Map<String, dynamic> json) {
  return RoomSettingRightData(
      Util.parseList(json['option'],
          (e) => OptionItem.fromJson(e as Map<String, dynamic>)),
      Util.parseList(json['playing'],
          (e) => FriendsPlayingItem.fromJson(e as Map<String, dynamic>)),
      Util.parseList(
          json['rooms'], (e) => RoomItem.fromJson(e as Map<String, dynamic>)));
}

RoomItem _$RoomItemFromJson(Map<String, dynamic> json) {
  return RoomItem(
    Util.parseInt(json['uid']),
    Util.parseInt(json['rid']),
    Util.parseInt(json['online_num']),
    Util.parseInt(json['real']),
    Util.parseInt(json['utitle']),
    Util.parseInt(json['num_boy']),
    Util.parseInt(json['num_girl']),
    Util.parseBool(json['boss_uid']),
    Util.parseBool(json['password']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['prefix']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['uname']),
    Util.notNullStr(json['types']),
    Util.notNullStr(json['effect']),
    json['typeName'] == null
        ? null
        : RoomTag.fromJson(json['typeName'] as Map<String, dynamic>),
    Util.parseBool(json['isgame']),
    Util.notNullStr(json['state']),
    Util.notNullStr(json['frame']),
    Util.notNullStr(json['left_frame']),
    Util.parseInt(json['ppnum']),
    Util.notNullStr(json['type']),
    Util.parseInt(json['sex']),
    Util.notNullStr(json['property']),
    Util.parseBool(json['isBiz']),
  );
}

RoomTag _$RoomTagFromJson(Map<String, dynamic> json) {
  return RoomTag(
    Util.notNullStr(json['label']),
    Util.notNullStr(json['val']),
    Util.notNullStr(json['color']),
    Util.notNullStr(json['show']),
    Util.parseList(json['bg'], (e) => Util.notNullStr(e)),
  );
}
