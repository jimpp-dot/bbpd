import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gift_combo_model.g.dart';

@JsonSerializable(anyMap: true)
class GiftCombo {
  final String uuid; // 唯一标识
  final String type;
  @JsonKey(name: 'sub_type')
  final String subType;

  final String from;
  @JsonKey(fromJson: Util.parseInt)
  final int uid; // 发起连击的uid
  final String icon;
  @JsonKey(name: 'to_names')
  final String toNames;
  @JsonKey(name: 'combo_num', fromJson: Util.parseInt)
  final int comboNum; // 连击次数
  @JsonKey(name: 'combo_id', fromJson: Util.parseInt)
  final int comboId;
  final List<int> uids; // 打赏的用户列表
  final Map<String, String>? params;

  final Gift? gift;

  GiftCombo(
      {required this.uuid,
      required this.uid,
      required this.comboId,
      required this.comboNum,
      required this.uids,
      required this.type,
      required this.from,
      required this.icon,
      required this.toNames,
      required this.subType,
      this.params,
      this.gift});

  factory GiftCombo.fromJson(Map<String, dynamic> json) =>
      _$GiftComboFromJson(json);
}
