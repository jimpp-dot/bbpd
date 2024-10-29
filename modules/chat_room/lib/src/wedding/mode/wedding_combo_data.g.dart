// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wedding_combo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeddingComboConfig _$WeddingComboConfigFromJson(Map<String, dynamic> json) {
  return WeddingComboConfig(
    Util.notNullStr(json['notice']),
    Util.parseInt(json['duration']),
    Util.parseInt(json['unit_price']),
    Util.parseList(json['medium_image'], (e) => Util.notNullStr(e)),
    Util.parseList(json['big_image'], (e) => Util.notNullStr(e)),
    Util.parseList(json['small_images'], (e) => Util.notNullStr(e)),
    Util.parseInt(json['effect_interval_time']),
    Util.parseInt(json['effect_duration']),
  );
}

WeddingComboUser _$WeddingComboUserFromJson(Map<String, dynamic> json) {
  return WeddingComboUser(
    Util.parseInt(json['uid']),
    icon: Util.notNullStr(json['icon']),
    message: Util.notNullStr(json['message']),
    name: Util.notNullStr(json['name']),
    vipLevel: Util.parseInt(json['vip_level']),
  )..hitNum = Util.parseInt(json['hit_num']);
}

WeddingComboGift _$WeddingComboGiftFromJson(Map<String, dynamic> json) {
  return WeddingComboGift(
    Util.notNullStr(json['type']),
    Util.parseList(json['gift_list'],
        (e) => WeddingComboGiftItem.fromJson(e as Map<String, dynamic>)),
  );
}

WeddingComboGiftItem _$WeddingComboGiftItemFromJson(Map<String, dynamic> json) {
  return WeddingComboGiftItem(
    Util.parseInt(json['position']),
    Util.parseInt(json['index']),
    Util.parseDouble(json['w']),
    Util.parseDouble(json['h']),
    Util.parseInt(json['id']),
    Util.notNullStr(json['image_url']),
    Util.notNullStr(json['type']),
  );
}
