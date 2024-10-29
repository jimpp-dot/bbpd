import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gift_skin_model.g.dart';

@JsonSerializable()
class GiftSkinModel {
  @JsonKey(fromJson: Util.parseInt)
  final int id;
  final String name;
  final String icon;

  @JsonKey(fromJson: Util.parseInt)
  final int total; // 解锁需要数据

  @JsonKey(fromJson: Util.parseInt)
  final int current; // 当前购买数

  final String tips;

  GiftSkinModel(
      this.name, this.id, this.icon, this.total, this.current, this.tips);

  factory GiftSkinModel.fromJson(Map<String, dynamic> json) =>
      _$GiftSkinModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiftSkinModelToJson(this);
}
