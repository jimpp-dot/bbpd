// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_task_light_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomLightUpUser _$RoomLightUpUserFromJson(Map<String, dynamic> json) {
  return RoomLightUpUser(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.parseBool(json['complete']),
    Util.parseInt(json['continuous_day']),
  );
}
