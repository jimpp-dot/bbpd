import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_center_bean.g.dart';

@JsonSerializable(createToJson: false)
class AccountCenterBean {
  @JsonKey(name: 'vip_level') //VIP等级(0-5)
  int vipLevel;

  @JsonKey(name: 'vip_new_level') //VIP等级(0-100)
  int vipNewLevel;

  @JsonKey(name: 'popularity_level') //人气等级(0-8)
  int popularityLevel;

  @JsonKey(name: 'popularity_new_level') //人气等级(0-100)
  int popularityNewLevel;

  @JsonKey(name: 'viability_mlevel') //活跃等级
  int acitvityLevel;

  @JsonKey(name: 'viability_title') //活跃等级名称
  String acitvityLevelTitle;

  @JsonKey(name: 'viability_slevel') //活跃等级子等级
  int acitvitySubLevel;

  @JsonKey(name: 'banban_coin')
  int slpCoin;

  @JsonKey(name: 'gold_coin')
  int goldCoin;

  @JsonKey(name: 'popularity_num')
  int popularityNum;

  /// 代金券
  @JsonKey(name: 'money_coupon')
  int moneyCoupon;

  String tips;

  AccountCenterBean(
      this.vipLevel,
      this.vipNewLevel,
      this.popularityLevel,
      this.popularityNewLevel,
      this.acitvityLevel,
      this.acitvityLevelTitle,
      this.acitvitySubLevel,
      this.slpCoin,
      this.goldCoin,
      this.popularityNum,
      this.tips,
      this.moneyCoupon);

  factory AccountCenterBean.fromJson(Map<String, dynamic> json) =>
      _$AccountCenterBeanFromJson(json);
}
