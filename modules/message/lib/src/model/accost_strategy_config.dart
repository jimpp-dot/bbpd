import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:message/src/model/accost_msg_item.dart';

part 'accost_strategy_config.g.dart';

@JsonSerializable()
class AccostStrategyConfig {
  @JsonKey(name: 'strategy_name')
  String? strategyName;

  @JsonKey(name: 'msg_list')
  List<AccostMsgItem> msgList;

  AccostStrategyConfig(this.strategyName, this.msgList);

  factory AccostStrategyConfig.fromJson(Map<String, dynamic> json) =>
      _$AccostStrategyConfigFromJson(json);
}
