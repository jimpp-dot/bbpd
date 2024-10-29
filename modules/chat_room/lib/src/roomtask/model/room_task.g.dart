// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomTaskInfo _$RoomTaskInfoFromJson(Map<String, dynamic> json) {
  return RoomTaskInfo(
    Util.parseInt(json['level']),
    Util.parseInt(json['today_exp']),
    Util.parseBool(json['today_signed']),
    Util.parseList(
        json['exp_info'], (e) => RoomTask.fromJson(e as Map<String, dynamic>)),
  );
}

RoomTaskInfoRsp _$RoomTaskInfoRspFromJson(Map<String, dynamic> json) {
  return RoomTaskInfoRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    taskInfo: json['data'] == null
        ? null
        : RoomTaskInfo.fromJson(json['data'] as Map<String, dynamic>),
  );
}

RoomTaskExpInfo _$RoomTaskExpInfoFromJson(Map<String, dynamic> json) {
  return RoomTaskExpInfo(
    Util.parseList(json['subtask_info'],
        (e) => RoomTaskItem.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['box_status']),
    Util.notNullStr(json['lightup_info']),
    Util.notNullStr(json['link']),
  );
}

RoomTask _$RoomTaskFromJson(Map<String, dynamic> json) {
  return RoomTask(
    Util.notNullStr(json['title']),
    Util.notNullStr(json['icon']),
    RoomTask.parseType(json['type']),
    Util.parseInt(json['limit']),
    Util.parseInt(json['current']),
    Util.notNullStr(json['rule']),
  );
}
