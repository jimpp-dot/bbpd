// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user_ranking_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderListRsp _$ReminderListRspFromJson(Map<String, dynamic> json) {
  return ReminderListRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(json['output'],
        (e) => NewUserRanking.fromJson(e as Map<String, dynamic>)),
    more: Util.parseBool(json['more']),
  );
}
