import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'super_pack_beans.g.dart';

@JsonSerializable(createToJson: false)
class SuperPackResp extends BaseResponse {
  SuperPackList? data;

  SuperPackResp({bool success = false, String? msg, this.data})
      : super(success: success, msg: msg);

  factory SuperPackResp.fromJson(Map<String, dynamic> json) =>
      _$SuperPackRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class SuperPackList {
  List<SuperPackItem> packages;

  @JsonKey(name: 'left_days')
  int leftDays;

  @JsonKey(name: 'introduction')
  String introduction;

  SuperPackList(this.packages, this.leftDays, {this.introduction = ''});

  factory SuperPackList.fromJson(Map<String, dynamic> json) =>
      _$SuperPackListFromJson(json);
}

@JsonSerializable(createToJson: false)
class SuperPackItem {
  String name;

  int recharge;

  bool send;

  @JsonKey(name: 'more_pay')
  int morePay;

  int pay;

  List<ShopMailCommodity> gifts;

  SuperPackItem(
      this.name, this.recharge, this.gifts, this.send, this.morePay, this.pay);

  factory SuperPackItem.fromJson(Map<String, dynamic> json) =>
      _$SuperPackItemFromJson(json);
}
