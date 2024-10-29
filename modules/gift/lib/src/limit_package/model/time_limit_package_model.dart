import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_limit_package_model.g.dart';

/// 限时礼包返回对象
///
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class TimeLimitPackageModel {
  List<TimeLimitPackageItem> packages;

  @JsonKey(name: 'left_days')
  int leftDays;

  @JsonKey(name: 'introduction')
  final String introduction;

  TimeLimitPackageModel(this.packages, this.leftDays, this.introduction);

  factory TimeLimitPackageModel.fromJson(Map<String, dynamic> json) =>
      _$TimeLimitPackageModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class TimeLimitPackageItem {
  String name;

  int recharge;

  List<ShopMailCommodity> gifts;

  TimeLimitPackageItem(this.name, this.recharge, this.gifts);

  factory TimeLimitPackageItem.fromJson(Map<String, dynamic> json) =>
      _$TimeLimitPackageItemFromJson(json);
}
