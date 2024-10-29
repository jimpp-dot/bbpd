import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:message/src/model/accost_strategy_item.dart';

part 'accost_config.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccostConfig {
  int chatNumToday; //今天搭讪次数

  String? help; //帮助H5链接

  int selectedStrategyId; //选择的策略，0表示没有选择

  List<AccostStrategyItem> strategies;

  String? warningMsg;

  AccostConfig(this.chatNumToday, this.help, this.selectedStrategyId,
      this.strategies, this.warningMsg);

  factory AccostConfig.fromJson(Map<String, dynamic> json) =>
      _$AccostConfigFromJson(json);
}
