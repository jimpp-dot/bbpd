// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accost_strategy_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccostStrategyItem _$AccostStrategyItemFromJson(Map<String, dynamic> json) {
  return AccostStrategyItem(
    Util.parseInt(json['grade']),
    Util.parseIntList(json['msg_type_list']),
    Util.parseStr(json['name']),
    Util.parseStr(json['open_rate']),
    Util.parseStr(json['reply_rate']),
    Util.parseInt(json['state']),
    Util.parseInt(json['strategy_id']),
  );
}

Map<String, dynamic> _$AccostStrategyItemToJson(AccostStrategyItem instance) =>
    <String, dynamic>{
      'grade': instance.grade,
      'msg_type_list': instance.msgTypeList,
      'name': instance.name,
      'open_rate': instance.openRate,
      'reply_rate': instance.replyRate,
      'state': instance.state,
      'strategy_id': instance.strategyId,
    };
