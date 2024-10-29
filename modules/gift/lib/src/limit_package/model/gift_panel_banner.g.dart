// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_panel_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftPanelBanner _$GiftPanelBannerFromJson(Map<String, dynamic> json) {
  return GiftPanelBanner(
    ExclusiveGift.fromJson(json['special'] != null
        ? (json['special'] as Map<String, dynamic>)
        : {}),
    Util.parseList(json['honor_prompts'],
        (e) => AllMicSendCondition.fromJson(e as Map<String, dynamic>)),
  );
}

ExclusiveGift _$ExclusiveGiftFromJson(Map<String, dynamic> json) {
  return ExclusiveGift(
    Util.parseInt(json['uid']),
    Util.getRemoteImgUrl(json['icon'] != null ? json['icon'] as String : ''),
    Util.parseInt(json['deadline']),
  );
}

AllMicSendCondition _$AllMicSendConditionFromJson(Map<String, dynamic> json) {
  return AllMicSendCondition(
    Util.getRemoteImgUrl(json['icon'] != null ? json['icon'] as String : ''),
    Util.parseInt(json['mic_user_num']),
    Util.parseInt(json['percent']),
    Util.parseInt(json['price']),
  );
}
