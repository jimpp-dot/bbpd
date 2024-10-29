// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommodityBuyInfo _$CommodityBuyInfoFromJson(Map<String, dynamic> json) {
  return CommodityBuyInfo(
    Util.parseInt(json['cid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['desc']) ?? '',
    Util.parseStr(json['avatar']) ?? '',
    Util.getRemoteImgUrl(Util.parseStr(json['image']) ?? ''),
    Util.getRemoteImgUrl(Util.parseStr(json['image_bg']) ?? ''),
    Util.getRemoteImgUrl(Util.parseStr(json['corner_icon']) ?? ''),
    Util.parseStr(json['corner_desc']) ?? '',
    Util.parseInt(json['is_limited']),
    Util.parseStr(json['bubble_desc']) ?? '',
    Util.parseStr(json['bubble_front_color']) ?? '',
    Util.parseStr(json['money_type']) ?? '',
    Util.parseList(json['tags'], (e) => Util.parseStr(e) ?? ''),
    Util.parseInt(json['money']),
    Util.parseInt(json['saling_on_shop']),
    Util.parseInt(json['gold_coin']),
    Util.parseStr(json['shop_type']) ?? '',
    Util.parseInt(json['is_activity']),
    Util.parseStr(json['jump_page']) ?? '',
    Util.parseInt(json['is_multi_sku']),
    Util.parseStr(json['expire_date']) ?? '',
    Util.parseStr(json['expire_date_page']) ?? '',
    Util.parseList(
        json['items'], (e) => Item.fromJson(e as Map<String, dynamic>)),
    Util.parseStr(json['limit_icon']) ?? '',
    Util.parseStr(json['limit_desc']) ?? '',
    Util.parseStr(json['limit_type']) ?? '',
    json['extra'],
    Util.parseInt(json['piece_balance']),
    Util.parseStr(json['piece_icon']) ?? '',
    Util.parseStr(json['piece_desc']) ?? '',
    Util.parseStr(json['toast_msg']) ?? '',
    Util.parseStr(json['piece_jump_page']) ?? '',
    Util.parseInt(json['pearl_balance']),
    Util.parseStr(json['pearl_icon']) ?? '',
    Util.parseStr(json['pearl_desc']) ?? '',
    Util.parseInt(json['money_coupon']),
    Util.parseInt(json['score']),
    Util.parseList(json['items_by_score'],
        (e) => Item.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$CommodityBuyInfoToJson(CommodityBuyInfo instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'desc': instance.desc,
      'avatar': instance.avatar,
      'image': instance.image,
      'type': instance.type,
      'image_bg': instance.imageBackground,
      'is_limited': instance.isLimited,
      'corner_icon': instance.cornerIcon,
      'corner_desc': instance.cornerDesc,
      'bubble_desc': instance.bubbleDesc,
      'bubble_front_color': instance.bubbleFontColor,
      'money_type': instance.moneyType,
      'tags': instance.tags,
      'money': instance.money,
      'gold_coin': instance.goldCoin,
      'money_coupon': instance.goldBean,
      'shop_type': instance.shopType,
      'is_activity': instance.isActivity,
      'jump_page': instance.jumpPage,
      'is_multi_sku': instance.isMultiSku,
      'expire_date': instance.expireDate,
      'expire_date_page': instance.expireDatePage,
      'limit_icon': instance.limitIcon,
      'limit_desc': instance.limitDesc,
      'limit_type': instance.limitType,
      'items': instance.items,
      'piece_balance': instance.pieceBalance,
      'piece_icon': instance.pieceIcon,
      'piece_desc': instance.pieceDesc,
      'toast_msg': instance.toastMsg,
      'pearl_balance': instance.pearlBalance,
      'pearl_icon': instance.pearlIcon,
      'pearl_desc': instance.pearlDesc,
      'piece_jump_page': instance.pieceJumpPage,
      'extra': instance.extra,
      'score': instance.score,
      'items_by_score': instance.itemsByScore,
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    Util.parseInt(json['cid']),
    Util.parseInt(json['unit_price']),
    Util.parseInt(json['light_score']),
    Util.parseInt(json['coupon_money']),
    Util.parseInt(json['coupon_id']),
    Util.parseStr(json['duction_desc']) ?? '',
    Util.parseInt(json['duction_rate']),
    Util.parseStr(json['duction_extra']) ?? '',
    Util.parseInt(json['can_be_give']),
    Util.parseInt(json['duction_limit_min']),
    Util.parseInt(json['duction_limit_max']),
    Util.parseStr(json['period']) ?? '',
    Util.parseStr(json['duction_icon_coupon_desc']) ?? '',
    Util.parseStr(json['duction_icon_multi_desc']) ?? '',
    Util.parseInt(json['coupon_only_newpay']),
    Util.parseInt(json['coupon_state']),
    Util.parseStr(json['grade_icon']) ?? '',
    Util.parseInt(json['coupon_discount']),
    Util.parseStr(json['coupon_icon']) ?? '',
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'cid': instance.cid,
      'unit_price': instance.unitPrice,
      'coupon_id': instance.couponId,
      'coupon_money': instance.couponMoney,
      'coupon_only_newpay': instance.couponOnlyNewPay,
      'coupon_state': instance.couponState,
      'duction_icon_coupon_desc': instance.ductionIconCouponDesc,
      'duction_desc': instance.ductionDesc,
      'duction_icon_multi_desc': instance.ductionIconMultiDesc,
      'duction_rate': instance.ductionRate,
      'duction_extra': instance.ductionExtra,
      'can_be_give': instance.canBeGive,
      'duction_limit_min': instance.ductionLimitMin,
      'duction_limit_max': instance.ductionLimitMax,
      'period': instance.period,
      'coupon_discount': instance.couponDiscount,
      'coupon_icon': instance.couponIcon,
    };

CouponTip _$CouponTipFromJson(Map<String, dynamic> json) {
  return CouponTip(
    Util.parseInt(json['ucid']),
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['tips']) ?? '',
    Util.parseStr(json['explain_url']) ?? '',
  );
}

Map<String, dynamic> _$CouponTipToJson(CouponTip instance) => <String, dynamic>{
      'ucid': instance.ucid,
      'icon': instance.icon,
      'tips': instance.tips,
      'explain_url': instance.explainUrl,
    };
