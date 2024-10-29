// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_rank_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyRankItem _$DailyRankItemFromJson(Map<String, dynamic> json) {
  return DailyRankItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['frame']) ?? '',
    Util.parseInt(json['score']),
    Util.parseStr(json['self_frame']) ?? '',
  );
}

Map<String, dynamic> _$DailyRankItemToJson(DailyRankItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'frame': instance.frame,
      'score': instance.score,
      'self_frame': instance.selfFrame,
    };

DailyRankTopItem _$DailyRankTopItemFromJson(Map<String, dynamic> json) {
  return DailyRankTopItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['frame']) ?? '',
    Util.parseInt(json['score']),
    Util.parseStr(json['self_frame']) ?? '',
    Util.parseInt(json['number1_times']),
  );
}

Map<String, dynamic> _$DailyRankTopItemToJson(DailyRankTopItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'frame': instance.frame,
      'score': instance.score,
      'self_frame': instance.selfFrame,
      'number1_times': instance.topDays,
    };

DailyRankResponse _$DailyRankResponseFromJson(Map<String, dynamic> json) {
  return DailyRankResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    topItem: json['number1'] == null
        ? null
        : DailyRankTopItem.fromJson(json['number1'] as Map<String, dynamic>),
    items: Util.parseList(
        json['list'], (e) => DailyRankItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$DailyRankResponseToJson(DailyRankResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'number1': instance.topItem,
      'list': instance.items,
    };

DailyStarItem _$DailyStarItemFromJson(Map<String, dynamic> json) {
  return DailyStarItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['date']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
  );
}

Map<String, dynamic> _$DailyStarItemToJson(DailyStarItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'date': instance.date,
      'name': instance.name,
      'icon': instance.icon,
    };

DailyStarResponse _$DailyStarResponseFromJson(Map<String, dynamic> json) {
  return DailyStarResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    items: Util.parseList(
        json['list'], (e) => DailyStarItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$DailyStarResponseToJson(DailyStarResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'list': instance.items,
    };
