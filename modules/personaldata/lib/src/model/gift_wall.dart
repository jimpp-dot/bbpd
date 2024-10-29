import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gift_wall.g.dart';

@JsonSerializable(createToJson: false)
class GiftWall {
  bool success;
  GiftWallData? data;

  GiftWall(this.success, this.data);
  factory GiftWall.fromJson(Map<String, dynamic> json) =>
      _$GiftWallFromJson(json);
}

@JsonSerializable(createToJson: false)
class GiftWallData {
  @JsonKey(fromJson: Util.parseInt)
  int count;

  @JsonKey(name: 'gift_list')
  List<GiftBean>? giftList;

  GiftWallData(this.count, this.giftList);
  factory GiftWallData.fromJson(Map<String, dynamic> json) =>
      _$GiftWallDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class GiftBean {
  @JsonKey(fromJson: Util.parseInt)
  int gid;

  @JsonKey(fromJson: Util.parseInt)
  int num;

  String name;

  User? user;

  GiftBean(this.gid, this.num, this.name, this.user);
  factory GiftBean.fromJson(Map<String, dynamic> json) =>
      _$GiftBeanFromJson(json);
}

@JsonSerializable(createToJson: false)
class User {
  String name;
  String icon;

  User(this.name, this.icon);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
