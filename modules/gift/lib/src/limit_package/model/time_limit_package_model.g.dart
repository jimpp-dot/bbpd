// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_limit_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeLimitPackageModel _$TimeLimitPackageModelFromJson(
    Map<String, dynamic> json) {
  return TimeLimitPackageModel(
    Util.parseList(json['packages'],
        (e) => TimeLimitPackageItem.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['left_days']),
    Util.parseStr(json['introduction']) ?? '',
  );
}

TimeLimitPackageItem _$TimeLimitPackageItemFromJson(Map<String, dynamic> json) {
  return TimeLimitPackageItem(
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['recharge']),
    Util.parseList(json['gifts'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
  );
}
