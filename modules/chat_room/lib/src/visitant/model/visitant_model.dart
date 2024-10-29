import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visitant_model.g.dart';

@JsonSerializable(createToJson: false)
class VisitantUpgradeMsg {
  String message;

  String type;

  int uid;

  String name;

  String icon;

  @JsonKey(name: 'title_new')
  int titleNew;

  @JsonKey(name: 'vip_level')
  int vipLevel;

  @JsonKey(name: 'level_new')
  int levelNew;

  VisitantUpgradeMsg(this.message, this.type, this.uid, this.name, this.icon,
      this.titleNew, this.vipLevel, this.levelNew);

  factory VisitantUpgradeMsg.fromJson(Map<String, dynamic> json) =>
      _$VisitantUpgradeMsgFromJson(json);
}
