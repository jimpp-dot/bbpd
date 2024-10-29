// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaItem _$MediaItemFromJson(Map<String, dynamic> json) {
  return MediaItem(
    Util.parseInt(json['id']),
    Util.parseInt(json['uid']),
    Util.notNullStr(json['image']),
    Util.parseInt(json['status']),
    MediaItem.parseType(json['type']),
    Util.parseBool(json['checked']),
  )..video = Util.notNullStr(json['vedio']);
}

Commodity _$CommodityFromJson(Map<String, dynamic> json) {
  return Commodity(
    Util.parseInt(json['id']),
    Util.parseInt(json['cid']),
    Commodity.parseType(json['type']),
    Util.parseInt(json['duction_money']),
    Util.parseBool(json['only_newpay']),
    Util.parseBool(json['state']),
  );
}

GiftMediaInfo _$GiftMediaInfoFromJson(Map<String, dynamic> json) {
  return GiftMediaInfo(
    Util.parseInt(json['id']),
    Util.parseInt(json['uid']),
    Util.notNullStr(json['image']),
    Util.parseInt(json['status']),
    MediaItem.parseType(json['type']),
    Util.parseBool(json['checked']),
    Util.parseInt(json['rid']),
    GiftMediaInfo.parseLock(json['lock']),
    Util.parseInt(json['gift_id']),
    Util.notNullStr(json['gift_name']),
    Util.parseInt(json['gift_price']),
    Util.notNullStr(json['gift_icon']),
    Util.parseInt(json['img_id']),
    json['commodity'] == null
        ? null
        : Commodity.fromJson(json['commodity'] as Map<String, dynamic>),
  )..video = Util.notNullStr(json['vedio']);
}

MediaListRsp _$MediaListRspFromJson(Map<String, dynamic> json) {
  return MediaListRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(
        json['data'], (e) => MediaItem.fromJson(e as Map<String, dynamic>)),
  );
}

GiftMediaInfoListRsp _$GiftMediaInfoListRspFromJson(Map<String, dynamic> json) {
  return GiftMediaInfoListRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(
        json['data'], (e) => GiftMediaInfo.fromJson(e as Map<String, dynamic>)),
    money: Util.parseInt(json['money']),
  );
}
