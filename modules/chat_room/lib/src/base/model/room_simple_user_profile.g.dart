// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_simple_user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomSimpleUserProfile _$RoomSimpleUserProfileFromJson(
    Map<String, dynamic> json) {
  return RoomSimpleUserProfile(
    data: json['data'] == null
        ? null
        : SimpleUserProfileItem.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..success = Util.parseBool(json['success'])
    ..msg = Util.parseStr(json['msg']);
}

Map<String, dynamic> _$RoomSimpleUserProfileToJson(
        RoomSimpleUserProfile instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

SimpleUserProfileItem _$SimpleUserProfileItemFromJson(
    Map<String, dynamic> json) {
  return SimpleUserProfileItem(
    uid: Util.parseInt(json['uid']),
    name: Util.notNullStr(json['name']),
    icon: Util.notNullStr(json['icon']),
    sex: Util.parseInt(json['sex']),
  );
}

Map<String, dynamic> _$SimpleUserProfileItemToJson(
        SimpleUserProfileItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'sex': instance.sex,
    };
