import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accost_strategy_item.g.dart';

@JsonSerializable()
class AccostStrategyItem {
  int grade = 0; //评级，0表示暂无，1表示S、2表示A、3表示B、4表示C

  @JsonKey(name: 'msg_type_list', fromJson: Util.parseIntList)
  List<int> msgTypeList = []; //0暂无，1文字，2语音，3图片

  String? name;

  @JsonKey(name: 'open_rate')
  String? openRate; //打开率，空表示暂无

  @JsonKey(name: 'reply_rate')
  String? replyRate; //回复率，空表示暂无

  int state = 0; //状态，0审核中，1通过，2失败

  @JsonKey(name: 'strategy_id')
  int strategyId = 0;

  AccostStrategyItem.empty({this.strategyId = 0});

  AccostStrategyItem(this.grade, this.msgTypeList, this.name, this.openRate,
      this.replyRate, this.state, this.strategyId);

  factory AccostStrategyItem.fromJson(Map<String, dynamic> json) =>
      _$AccostStrategyItemFromJson(json);
}
