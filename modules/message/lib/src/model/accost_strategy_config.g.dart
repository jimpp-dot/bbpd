// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accost_strategy_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccostStrategyConfig _$AccostStrategyConfigFromJson(Map<String, dynamic> json) {
  return AccostStrategyConfig(
    Util.parseStr(json['strategy_name']),
    Util.parseList(json['msg_list'],
        (e) => AccostMsgItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$AccostStrategyConfigToJson(
        AccostStrategyConfig instance) =>
    <String, dynamic>{
      'strategy_name': instance.strategyName,
      'msg_list': instance.msgList,
    };
