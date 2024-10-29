// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intimate_interact_create_invite_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntimateInteractCreateInviteData _$IntimateInteractCreateInviteDataFromJson(
    Map<String, dynamic> json) {
  return IntimateInteractCreateInviteData(
    Util.parseList(json['on_mic_icon_list'],
        (e) => UserBean.fromJson(e as Map<String, dynamic>)),
    json['task_list'] != null
        ? (json['task_list'] as Map<String, dynamic>)
        : {},
    Util.parseList(json['gift_list'],
        (e) => IntimateInteractGiftData.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['self_task'],
        (e) => IntimateInteractTaskData.fromJson(e as Map<String, dynamic>)),
    json['num_list'] != null ? (json['num_list'] as Map<String, dynamic>) : {},
    Util.parseInt(json['list_type']),
  );
}

Map<String, dynamic> _$IntimateInteractCreateInviteDataToJson(
        IntimateInteractCreateInviteData instance) =>
    <String, dynamic>{
      'on_mic_icon_list': instance.userList,
      'task_list': instance.taskMap,
      'gift_list': instance.giftList,
      'self_task': instance.selfTaskList,
      'num_list': instance.numMap,
      'list_type': instance.listType,
    };
