// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_gift_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishGiftsResp _$WishGiftsRespFromJson(Map<String, dynamic> json) {
  return WishGiftsResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : WishGiftsData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

WishGiftsData _$WishGiftsDataFromJson(Map<String, dynamic> json) {
  return WishGiftsData(
    Util.parseList(
        json['gifts'], (e) => WishGift.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['top_senders'], (e) => (Util.parseStr(e) ?? '')),
    Util.parseBool(json['auto_open']),
    Util.parseInt(json['sender_num']),
    Util.parseInt(json['finish_num']),
    Util.parseStr(json['achieve_tips']) ?? '',
    Util.parseInt(json['countdown']),
    Util.parseStr(json['reward_words']) ?? '',
    Util.parseInt(json['reward_words_audit']),
  );
}

WishGift _$WishGiftFromJson(Map<String, dynamic> json) {
  return WishGift(
    Util.parseInt(json['gift_id']),
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['price']),
    Util.parseInt(json['wish_num']),
    Util.parseInt(json['income_num']),
  );
}
