// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vip_mall_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VipMallBean _$VipMallBeanFromJson(Map<String, dynamic> json) {
  return VipMallBean(
    tab: Util.parseList(
        json['tab'], (e) => VipMallTab.fromJson(e as Map<String, dynamic>)),
    items: Util.parseList(json['items'],
        (e) => RecommendGoods.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$VipMallBeanToJson(VipMallBean instance) =>
    <String, dynamic>{
      'tab': instance.tab,
      'items': instance.items,
    };

VipMallTab _$VipMallTabFromJson(Map<String, dynamic> json) {
  return VipMallTab(
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['new_commodity_icon']) ?? '',
  );
}

Map<String, dynamic> _$VipMallTabToJson(VipMallTab instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
      'type': instance.type,
      'new_commodity_icon': instance.newCommodityIcon,
    };

RecommendGoods _$RecommendGoodsFromJson(Map<String, dynamic> json) {
  return RecommendGoods(
    Util.parseStr(json['title']) ?? '',
    Util.parseList(json['items'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$RecommendGoodsToJson(RecommendGoods instance) =>
    <String, dynamic>{
      'title': instance.title,
      'items': instance.items,
    };
