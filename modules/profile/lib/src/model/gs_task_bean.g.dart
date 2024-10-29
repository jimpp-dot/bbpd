// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gs_task_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GsTaskInfo _$GsTaskInfoFromJson(Map<String, dynamic> json) {
  return GsTaskInfo(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['position_note']),
    Util.notNullStr(json['desc_url']),
    Util.parseInt(json['end_time']),
    Util.parseInt(json['cur_level']),
    Util.parseInt(json['level_num']),
    (json['tasks'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k,
          Util.parseList(
              e, (ee) => GsTaskItem.fromJson(ee as Map<String, dynamic>))),
    ),
    Util.parseList(json['rewards'],
        (e) => GsRewardItem.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['reward_desc'], (e) => Util.notNullStr(e)),
  );
}

Map<String, dynamic> _$GsTaskInfoToJson(GsTaskInfo instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'position_note': instance.note,
      'desc_url': instance.descUrl,
      'end_time': instance.endTime,
      'cur_level': instance.curLevel,
      'level_num': instance.levelNum,
      'tasks': instance.tasks,
      'rewards': instance.rewards,
      'reward_desc': instance.rewardDesc,
    };

GsTaskItem _$GsTaskItemFromJson(Map<String, dynamic> json) {
  return GsTaskItem(
    icon: Util.notNullStr(json['icon']),
    title: Util.notNullStr(json['title']),
    totalProgress: Util.parseInt(json['total_progress']),
    curProgress: Util.parseInt(json['cur_progress']),
  );
}

Map<String, dynamic> _$GsTaskItemToJson(GsTaskItem instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'total_progress': instance.totalProgress,
      'cur_progress': instance.curProgress,
    };

GsRewardItem _$GsRewardItemFromJson(Map<String, dynamic> json) {
  return GsRewardItem(
    icon: Util.notNullStr(json['icon']),
    name: Util.notNullStr(json['name']),
  );
}

Map<String, dynamic> _$GsRewardItemToJson(GsRewardItem instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
    };

GsTaskRsp _$GsTaskRspFromJson(Map<String, dynamic> json) {
  return GsTaskRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : GsTaskInfo.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GsTaskRspToJson(GsTaskRsp instance) => <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

GsTaskFriendActivitItem _$GsTaskFriendActivitItemFromJson(
    Map<String, dynamic> json) {
  return GsTaskFriendActivitItem(
    name: Util.notNullStr(json['name']),
    uid: Util.parseInt(json['uid']),
    sex: Util.parseInt(json['sex']),
    icon: Util.notNullStr(json['icon']),
    status: Util.parseInt(json['status']),
    deadline: Util.parseInt(json['deadline']),
    award: Util.notNullStr(json['award']),
  );
}

GsFriendActivitRsp _$GsFriendActivitRspFromJson(Map<String, dynamic> json) {
  return GsFriendActivitRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(json['data'],
        (e) => GsTaskFriendActivitItem.fromJson(e as Map<String, dynamic>)),
  );
}
