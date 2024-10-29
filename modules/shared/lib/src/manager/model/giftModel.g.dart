// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giftModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gift _$GiftFromJson(Map<String, dynamic> json) {
  return Gift(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']),
    Util.parseInt(json['isnaming']),
    Util.parseDouble(json['price']),
    Util.parseInt(json['title']),
    Util.parseStr(json['gift_type']) ?? 'normal',
    Util.parseStr(json['tag_url']),
    Util.parseInt(json['cid']),
    Util.parseStr(json['ctype']),
    Util.parseInt(json['cnum']),
    Util.parseInt(json['duction_money']),
    Util.parseInt(json['only_newpay']),
    Util.parseInt(json['state']),
    Util.parseInt(json['star']),
    (json['tag_list'] as List?)
        ?.map((e) =>
            e == null ? null : GiftTag.fromJson(e as Map<String, dynamic>))
        .toList(),
    Util.parseStr(json['jump_page']),
    Util.parseStr(json['grant_way']),
    Util.parseStr(json['grant_limit']),
    Util.parseStr(json['grant_limit_range']),
    Util.parseStr(json['tag_ids']),
    Util.parseInt(json['grant_limit_from']),
    Util.parseInt(json['grant_limit_to']),
    Util.parseStr(json['grant_status']) ?? 'unlock',
    Util.parseStr(json['grant_limit_icon']),
    Util.parseInt(json['num']),
    Util.parseStr(json['description']),
    json['skin'] == null
        ? null
        : GiftSkinModel.fromJson(json['skin'] as Map<String, dynamic>),
    Util.parseInt(json['is_combo']),
    Util.parseStr(json['unlock_tips']),
    Util.parseStr(json['jump_tips']),
    Util.parseInt(json['onmic_duration']),
    Util.parseStr(json['icon']),
    Util.parseBool(json['close_hit']),
    Util.parseStr(json['period_end_desc']),
    Util.parseBool(json['pub_red_packet']),
    (json['diy_list'] as List?)
        ?.map(
            (e) => e == null ? null : Gift.fromJson(e as Map<String, dynamic>))
        .toList(),
    Util.parseInt(json['default_index']),
    Util.parseInt(json['icon_num']),
    Util.parseStr(json['diy_bg']),
    Util.parseInt(json['diy_bg_size']),
    Util.parseInt(json['diy_preview_size']),
    (json['lucky_egg_info'] as List?)
        ?.map((e) => e as Map<String, dynamic>)
        .toList(),
    (json['gift_right_desc'] as List?)
        ?.map((e) => e as Map<String, dynamic>)
        .toList(),
    Util.parseStr(json['only_for_uname']),
    Util.parseInt(json['only_for_uid']),
  );
}

Map<String, dynamic> _$GiftToJson(Gift instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isnaming': instance.isnaming,
      'price': instance.price,
      'title': instance.title,
      'gift_type': instance.giftType,
      'tag_url': instance.tagUrl,
      'cid': instance.cid,
      'ctype': instance.ctype,
      'cnum': instance.cnum,
      'duction_money': instance.ductionMoney,
      'only_newpay': instance.onlyNewPay,
      'state': instance.state,
      'star': instance.star,
      'tag_list': instance.tagList,
      'jump_page': instance.jumpPage,
      'grant_way': instance.grantWay,
      'grant_limit': instance.grantLimit,
      'grant_limit_range': instance.grantLimitRange,
      'tag_ids': instance.tagIds,
      'grant_limit_from': instance.grantLimitFrom,
      'grant_limit_to': instance.grantLimitTo,
      'grant_limit_icon': instance.grantLimitIcon,
      'grant_status': instance.grantStatus,
      'num': instance.num,
      'description': instance.description,
      'skin': instance.giftSkin,
      'is_combo': instance.isCombo,
      'unlock_tips': instance.unlockTips,
      'jump_tips': instance.jumpTips,
      'onmic_duration': instance.micDuration,
      'icon': instance.icon,
      'close_hit': instance.closeHit,
      'period_end_desc': instance.periodDesc,
      'pub_red_packet': instance.isPubRedPacket,
      'icon_num': instance.iconNum,
      'diy_list': instance.diyGift,
      'default_index': instance.diyDefaultIndex,
      'diy_preview_size': instance.diyPreviewSize,
      'diy_bg_size': instance.diyBgSize,
      'diy_bg': instance.diyBg,
      'lucky_egg_info': instance.luckyEggInfo,
      'gift_right_desc': instance.giftRightDesc,
      'only_for_uname': instance.richManName,
      'only_for_uid': instance.richManUid,
    };

GiftTag _$GiftTagFromJson(Map<String, dynamic> json) {
  return GiftTag(
    Util.parseStr(json['id']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['remark']),
  );
}

Map<String, dynamic> _$GiftTagToJson(GiftTag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'remark': instance.remark,
    };
