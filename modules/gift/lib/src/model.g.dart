// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commodity _$CommodityFromJson(Map<String, dynamic> json) {
  return Commodity(
    Util.parseInt(json['cid']),
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['price']),
    Util.parseInt(json['period']),
    Util.parseInt(json['period_hour']),
    Util.parseInt(json['ext_id']),
    Util.parseStr(json['image']) ?? '',
  );
}

CouponInfo _$CouponInfoFromJson(Map<String, dynamic> json) {
  return CouponInfo(
    Util.parseInt(json['cid']),
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['price']),
    Util.parseInt(json['period']),
    Util.parseInt(json['period_hour']),
    Util.parseInt(json['ext_id']),
    Util.parseStr(json['image']) ?? '',
    Util.parseInt(json['id']),
    Util.parseInt(json['num']),
    Util.parseStr(json['coupon_type']) ?? '',
    Util.parseInt(json['duction_money']),
    Util.parseInt(json['only_newpay']),
    Util.parseInt(json['state']),
  );
}

ShopCommodity _$ShopCommodityFromJson(Map<String, dynamic> json) {
  return ShopCommodity(
      Util.parseInt(json['cid']),
      Util.parseStr(json['type']) ?? '',
      Util.parseStr(json['name']) ?? '',
      Util.parseInt(json['price']),
      Util.parseInt(json['period']),
      Util.parseInt(json['period_hour']),
      Util.parseInt(json['ext_id']),
      Util.parseStr(json['image']) ?? '',
      CouponInfo.fromJson(json['coupon'] != null
          ? json['coupon'] as Map<String, dynamic>
          : {}));
}

DecorateCommodity _$DecorateCommodityFromJson(Map<String, dynamic> json) {
  return DecorateCommodity(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['desc']) ?? '',
    Util.parseStr(json['content']) ?? '',
    Util.parseStr(json['image']) ?? '',
    formatGoodsType(
        json['decorate_type'] != null ? json['decorate_type'] as String : ''),
    Util.parseStr(json['decorate_type_name']) ?? '',
    Util.parseStr(json['corner_desc']) ?? '',
    Util.parseStr(json['bubble_desc']) ?? '',
    Util.parseStr(json['bubble_front_color']) ?? '',
    Util.parseStr(json['money_type']) ?? '',
    Util.parseInt(json['price']),
    Util.parseStr(json['period']) ?? '',
    CouponInfo.fromJson(
        json['coupon'] != null ? json['coupon'] as Map<String, dynamic> : {}),
    Util.parseInt(json['duction_rate']),
  );
}

PKCommodity _$PKCommodityFromJson(Map<String, dynamic> json) {
  return PKCommodity(
    id: Util.parseInt(json['pid']),
    icon: Util.parseStr(json['url']) ?? '',
    name: Util.parseStr(json['name']) ?? '',
    num: Util.parseInt(json['pnum']),
    desc: Util.parseStr(json['desc']) ?? '',
    expired: Util.parseInt(json['expired']),
  );
}
