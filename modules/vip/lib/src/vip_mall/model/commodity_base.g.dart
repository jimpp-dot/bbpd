// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commodity_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BubbleCommodity _$BubbleCommodityFromJson(Map<String, dynamic> json) {
  return BubbleCommodity(
    Util.parseStr(json['bubble_front_color']) ?? '',
    Util.parseStr(json['bubble_desc_short']) ?? '',
    Util.parseStr(json['bubble_desc_long']) ?? '',
  );
}

Map<String, dynamic> _$BubbleCommodityToJson(BubbleCommodity instance) =>
    <String, dynamic>{
      'bubble_front_color': instance.bubbleFontColor,
      'bubble_desc_short': instance.bubbleDescShort,
      'bubble_desc_long': instance.bubbleDescLong,
    };

EffectCommodity _$EffectCommodityFromJson(Map<String, dynamic> json) {
  return EffectCommodity(
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['user_title']),
    Util.parseInt(json['title_new']),
    Util.parseInt(json['popularity_level']),
    Util.parseStr(json['user_name']) ?? '',
    Util.parseStr(json['panel_image']) ?? '',
    Util.parseStr(json['effect_front_color']) ?? '',
  );
}

Map<String, dynamic> _$EffectCommodityToJson(EffectCommodity instance) =>
    <String, dynamic>{
      'vip_level': instance.vipLevel,
      'user_title': instance.userTitle,
      'title_new': instance.userTitleNew,
      'popularity_level': instance.popularityLevel,
      'user_name': instance.userName,
      'panel_image': instance.panelImage,
      'effect_front_color': instance.effectFontColor,
    };

DecorateCommodity _$DecorateCommodityFromJson(Map<String, dynamic> json) {
  return DecorateCommodity(
    Util.parseInt(json['uid']),
    Util.parseStr(json['user_photo']) ?? '',
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['user_title']),
    Util.parseInt(json['popularity_level']),
    Util.parseStr(json['title_icon']) ?? '',
    Util.parseStr(json['user_name']) ?? '',
    Util.parseStr(json['panel_image']) ?? '',
    Util.parseInt(json['age']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['giftId']),
    Util.parseInt(json['vap_size']),
  );
}

Map<String, dynamic> _$DecorateCommodityToJson(DecorateCommodity instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'user_photo': instance.userPhoto,
      'vip_level': instance.vipLevel,
      'user_title': instance.userTitle,
      'popularity_level': instance.popularityLevel,
      'user_name': instance.userName,
      'title_icon': instance.titleIcon,
      'panel_image': instance.panelImage,
      'age': instance.age,
      'sex': instance.sex,
      'giftId': instance.giftId,
      'vap_size': instance.vapSize,
    };
