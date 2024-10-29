// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vip_mall_second_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VipMallSecondBean _$VipMallSecondBeanFromJson(Map<String, dynamic> json) {
  return VipMallSecondBean(
    Util.parseStr(json['title']) ?? '',
    Util.parseList(json['items'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
    Util.parseBool(json['show_category']),
  )..selectKey = Util.parseStr(json['selectKey']) ?? '';
}

Map<String, dynamic> _$VipMallSecondBeanToJson(VipMallSecondBean instance) =>
    <String, dynamic>{
      'title': instance.title,
      'items': instance.items,
      'show_category': instance.showCategory,
      'selectKey': instance.selectKey,
    };
