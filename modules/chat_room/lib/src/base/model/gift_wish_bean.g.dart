// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_wish_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomWishGiftsData _$RoomWishGiftsDataFromJson(Map<String, dynamic> json) {
  return RoomWishGiftsData(
    Util.parseBool(json['show']),
    Util.parseInt(json['percent']),
    json['champion'] == null
        ? null
        : Champion.fromJson(json['champion'] as Map<String, dynamic>),
    Util.parseList(
        json['gifts'], (e) => RoomWishGift.fromJson(e as Map<String, dynamic>)),
  );
}

RoomWishGift _$RoomWishGiftFromJson(Map<String, dynamic> json) {
  return RoomWishGift(
    Util.parseInt(json['gift_id']),
    Util.notNullStr(json['name']),
  );
}

Champion _$ChampionFromJson(Map<String, dynamic> json) {
  return Champion(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['icon']),
  );
}
