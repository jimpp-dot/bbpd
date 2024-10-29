// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accost_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccostConfig _$AccostConfigFromJson(Map<String, dynamic> json) {
  return AccostConfig(
    Util.parseInt(json['chat_num_today']),
    Util.parseStr(json['help']),
    Util.parseInt(json['selected_strategy_id']),
    Util.parseList(json['strategies'],
        (e) => AccostStrategyItem.fromJson(e as Map<String, dynamic>)),
    Util.parseStr(json['warning_msg']),
  );
}

Map<String, dynamic> _$AccostConfigToJson(AccostConfig instance) =>
    <String, dynamic>{
      'chat_num_today': instance.chatNumToday,
      'help': instance.help,
      'selected_strategy_id': instance.selectedStrategyId,
      'strategies': instance.strategies,
      'warning_msg': instance.warningMsg,
    };
