// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intimate_interact_task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntimateInteractTaskData _$IntimateInteractTaskDataFromJson(
    Map<String, dynamic> json) {
  return IntimateInteractTaskData(
    IntimateInteractGiftData.fromJson(
        json['gift'] != null ? json['gift'] as Map<String, dynamic> : {}),
    Util.parseInt(json['gift_num']),
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['status']),
    Util.parseInt(json['task_id']),
    Util.parseStr(json['task_name']) ?? '',
  );
}

Map<String, dynamic> _$IntimateInteractTaskDataToJson(
        IntimateInteractTaskData instance) =>
    <String, dynamic>{
      'gift': instance.gift,
      'gift_num': instance.giftNum,
      'name': instance.name,
      'status': instance.status,
      'task_id': instance.taskId,
      'task_name': instance.taskName,
    };
