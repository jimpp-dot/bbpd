import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'welfare_replace_bean.g.dart';

@JsonSerializable()
class WelfareReplaceBean {
  bool success;
  String msg;
  @JsonKey(name: 'card_type')
  String cardType;
  List<ShopMailCommodity> list;

  WelfareReplaceBean(
    this.success,
    this.cardType,
    this.msg,
    this.list,
  );

  factory WelfareReplaceBean.fromJson(Map<String, dynamic> json) =>
      _$WelfareReplaceBeanFromJson(json);

  Map<String, dynamic> toJson() => _$WelfareReplaceBeanToJson(this);
}
