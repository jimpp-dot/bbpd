// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_business_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomBusinessTaskInfo _$RoomBusinessTaskInfoFromJson(Map<String, dynamic> json) {
  return RoomBusinessTaskInfo(
    Util.parseInt(json['current_point']),
    Util.notNullStr(json['link']),
    Util.parseList(json['box_info'],
        (e) => RoomBusinessBoxInfo.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['task_info'],
        (e) => RoomTaskItem.fromJson(e as Map<String, dynamic>)),
  );
}

RoomBusinessBoxInfo _$RoomBusinessBoxInfoFromJson(Map<String, dynamic> json) {
  return RoomBusinessBoxInfo(
    Util.notNullStr(json['icon']),
    Util.parseInt(json['point']),
    Util.parseInt(json['level']),
    Util.parseInt(json['box_status']),
  );
}

RoomTaskItem _$RoomTaskItemFromJson(Map<String, dynamic> json) {
  return RoomTaskItem(
    Util.notNullStr(json['title']),
    Util.notNullStr(json['icon']),
    RoomTask.parseType(json['type']),
    Util.notNullStr(json['rate']),
    Util.parseInt(json['add_exp']),
    Util.parseBool(json['complete']),
    Util.parseBool(json['status']),
    Util.parseInt(json['add_point']),
  );
}
