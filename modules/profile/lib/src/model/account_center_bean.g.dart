// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_center_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountCenterBean _$AccountCenterBeanFromJson(Map<String, dynamic> json) {
  return AccountCenterBean(
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['vip_new_level']),
    Util.parseInt(json['popularity_level']),
    Util.parseInt(json['popularity_new_level']),
    Util.parseInt(json['viability_mlevel']),
    Util.notNullStr(json['viability_title']),
    Util.parseInt(json['viability_slevel']),
    Util.parseInt(json['banban_coin']),
    Util.parseInt(json['gold_coin']),
    Util.parseInt(json['popularity_num']),
    Util.notNullStr(json['tips']),
    Util.parseInt(json['money_coupon']),
  );
}
