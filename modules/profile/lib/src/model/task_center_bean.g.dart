// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_center_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskCenterBean _$TaskCenterBeanFromJson(Map<String, dynamic> json) {
  return TaskCenterBean(
    Util.parseInt(json['task_level']),
    Util.parseDouble(json['progress']),
    Util.notNullStr(json['task_name']),
    Util.notNullStr(json['award_name']),
    Util.notNullStr(json['award_count']),
    Util.notNullStr(json['tips']),
  );
}
