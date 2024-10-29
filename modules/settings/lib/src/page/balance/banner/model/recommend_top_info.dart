import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'recommend_top_info.g.dart';

@JsonSerializable(createToJson: false)
class RecommendTopInfo {
  @JsonKey(name: 'had_recommend', fromJson: Util.parseBool)
  final bool recommended;
  @JsonKey(name: 'charge_num', fromJson: Util.parseInt)
  final int chargeNum;
  @JsonKey(name: 'recommend_limit', fromJson: Util.parseInt)
  final int limitNum;
  @JsonKey(name: 'min_limit_text')
  final String limitText;
  @JsonKey(name: 'recommend_day_text')
  final String dayText;

  RecommendTopInfo(this.recommended, this.chargeNum, this.limitNum,
      this.limitText, this.dayText);

  factory RecommendTopInfo.fromJson(Map<String, dynamic> json) =>
      _$RecommendTopInfoFromJson(json);
}
