// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_viewer_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomViewerBean _$RoomViewerBeanFromJson(Map<String, dynamic> json) {
  return RoomViewerBean(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['age']),
    Util.parseBool(json['is_friend']),
    Util.parseInt(json['popularity_level']),
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['title']),
    Util.parseInt(json['title_new']),
  );
}

Map<String, dynamic> _$RoomViewerBeanToJson(RoomViewerBean instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'sex': instance.sex,
      'age': instance.age,
      'is_friend': instance.isFriend,
      'popularity_level': instance.popularityLevel,
      'vip_level': instance.vipLevel,
      'title': instance.title,
      'title_new': instance.titleNew,
    };
