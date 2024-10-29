// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../create_room/create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomTag _$RoomTagFromJson(Map<String, dynamic> json) {
  return RoomTag(
    Util.parseStr(json['type']),
    Util.parseStr(json['title']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['toast']),
  );
}

Map<String, dynamic> _$RoomTagToJson(RoomTag instance) => <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'icon': instance.icon,
      'toast': instance.toast,
    };
