// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_rank_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftRankItem _$GiftRankItemFromJson(Map<String, dynamic> json) {
  return GiftRankItem(
    Util.parseInt(json['uid']),
    Util.parseInt(json['stime']),
    Util.parseInt(json['gift_id']),
    Util.parseStr(json['gift_name']) ?? '',
    Util.parseInt(json['gift_worth']),
    Util.parseStr(json['user_name']) ?? '',
    Util.parseStr(json['user_icon']) ?? '',
    Util.parseInt(json['title']),
    Util.parseInt(json['title_new']),
    Util.parseInt(json['popularity_level']),
    Util.parseInt(json['vip_level']),
    Util.parseStr(json['badge_icon']) ?? '',
    Util.parseInt(json['gift_num']),
    Util.parseBool(json['awake_gift']),
  );
}

Map<String, dynamic> _$GiftRankItemToJson(GiftRankItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'stime': instance.stime,
      'gift_id': instance.giftId,
      'gift_name': instance.giftName,
      'gift_num': instance.giftNum,
      'gift_worth': instance.giftWorth,
      'user_name': instance.name,
      'user_icon': instance.icon,
      'title': instance.title,
      'title_new': instance.titleNew,
      'popularity_level': instance.popularityLevel,
      'vip_level': instance.vipLevel,
      'badge_icon': instance.badgeIcon,
      'awake_gift': instance.awakeGift,
    };

GiftMyRankItem _$GiftMyRankItemFromJson(Map<String, dynamic> json) {
  return GiftMyRankItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['rank']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['title']),
    Util.parseInt(json['pupularity_level']),
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['before_diff']),
  );
}

Map<String, dynamic> _$GiftMyRankItemToJson(GiftMyRankItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'rank': instance.rank,
      'name': instance.name,
      'icon': instance.icon,
      'title': instance.title,
      'pupularity_level': instance.popularityLevel,
      'vip_level': instance.vipLevel,
      'before_diff': instance.beforeDiff,
    };

GiftRankPrizeItem _$GiftRankPrizeItemFromJson(Map<String, dynamic> json) {
  return GiftRankPrizeItem(
    Util.parseInt(json['cid']),
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['image']) ?? '',
  );
}

Map<String, dynamic> _$GiftRankPrizeItemToJson(GiftRankPrizeItem instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'type': instance.type,
      'image': instance.image,
    };

GiftRankResponse _$GiftRankResponseFromJson(Map<String, dynamic> json) {
  return GiftRankResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    items: Util.parseList(
        json['list'], (e) => GiftRankItem.fromJson(e as Map<String, dynamic>)),
    my: json['my'] == null
        ? null
        : GiftMyRankItem.fromJson(json['my'] as Map<String, dynamic>),
    awards: (json['awards'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k,
          Util.parseList(e,
              (ee) => GiftRankPrizeItem.fromJson(ee as Map<String, dynamic>))),
    ),
  );
}

Map<String, dynamic> _$GiftRankResponseToJson(GiftRankResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'list': instance.items,
      'my': instance.my,
      'awards': instance.awards,
    };
