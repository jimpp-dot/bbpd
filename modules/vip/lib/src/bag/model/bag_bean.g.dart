// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BagTab _$BagTabFromJson(Map<String, dynamic> json) {
  return BagTab(
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['type']) ?? '',
    Util.parseInt(json['new']),
    Util.parseBool(json['show_detail']),
    Util.parseStr(json['detail_title']) ?? '',
    Util.parseList(json['detail'],
        (e) => TicketDetailTab.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['sub_tabs'], (e) => Util.parseStr(e) ?? ''),
  );
}

Map<String, dynamic> _$BagTabToJson(BagTab instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'new': instance.isNew,
      'show_detail': instance.showDetail,
      'detail_title': instance.detailTitle,
      'detail': instance.detail,
      'sub_tabs': instance.subTabs,
    };

BagGoods _$BagGoodsFromJson(Map<String, dynamic> json) {
  return BagGoods(
    cid: Util.parseInt(json['cid']),
    type: Util.parseStr(json['type']) ?? '',
    name: Util.parseStr(json['name']) ?? '',
    avatar: Util.parseStr(json['avatar']) ?? '',
    image: Util.getRemoteImgUrl(Util.parseStr(json['image']) ?? ''),
    imageBackground:
        Util.getRemoteImgUrl(Util.parseStr(json['image_bg']) ?? ''),
    desc: Util.parseStr(json['desc']) ?? '',
    bubbleDesc: Util.parseStr(json['bubble_desc']) ?? '',
    bubbleFontColor: Util.parseStr(json['bubble_front_color']) ?? '',
    price: Util.parseInt(json['price']),
    filterTabName: Util.parseStr(json['filter_tab_name']) ?? '',
    liveOnly: Util.parseInt(json['live_only']),
    liveLabel: Util.parseStr(json['live_label']) ?? '',
    inUseDesc: Util.parseStr(json['inuse_desc']) ?? '',
    id: Util.parseInt(json['id']),
    using: Util.parseInt(json['using']),
    used: Util.parseInt(json['used']),
    num: Util.parseInt(json['num']),
    coupon: Util.parseStr(json['coupon']) ?? '',
    expired: Util.parseInt(json['expired']),
    useUp: Util.parseInt(json['use_up']),
    explain: Util.parseStr(json['explain']) ?? '',
    leftTime: Util.parseStr(json['left_time']) ?? '',
    expires: Util.parseStr(json['expires']) ?? '',
    couponType: parseCouponType(Util.parseStr(json['coupon_type']) ?? ''),
    canGive: Util.parseInt(json['can_give']),
    extra: json['extra'],
    expireDatePage: Util.parseStr(json['expire_date_page']) ?? '',
    jumpPath: Util.parseStr(json['jump_path']) ?? '',
    jumpRid: Util.parseInt(json['jump_rid']),
    jumpType: Util.parseStr(json['jump_type']) ?? '',
    salePearl: Util.parseInt(json['salePearl']),
    canBreak: Util.parseInt(json['resolvable']),
    breakPrice: Util.parseInt(json['resolve_price']),
    breakImage: Util.parseStr(json['resolve_img']) ?? '',
    breakName: Util.parseStr(json['resolve_name']) ?? '',
    tabTitle: Util.parseStr(json['tab_title']) ?? '',
    prettyIds: Util.parseList(json['pretty_ids'],
        (e) => PrettyCard.fromJson(e as Map<String, dynamic>)),
    grade: Util.parseStr(json['grade']) ?? '',
    gradeIcon: Util.getRemoteImgUrl(Util.parseStr(json['grade_icon']) ?? ''),
    unuseInvalidDuration: Util.parseInt(json['unuse_invalid_duration']),
    order: Util.parseInt(json['order']),
    tips: Util.parseStr(json['tips']) ?? '',
  );
}

Map<String, dynamic> _$BagGoodsToJson(BagGoods instance) => <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'desc': instance.desc,
      'avatar': instance.avatar,
      'image': instance.image,
      'type': instance.type,
      'image_bg': instance.imageBackground,
      'bubble_desc': instance.bubbleDesc,
      'bubble_front_color': instance.bubbleFontColor,
      'price': instance.price,
      'filter_tab_name': instance.filterTabName,
      'live_only': instance.liveOnly,
      'live_label': instance.liveLabel,
      'inuse_desc': instance.inUseDesc,
      'id': instance.id,
      'using': instance.using,
      'used': instance.used,
      'num': instance.num,
      'coupon': instance.coupon,
      'expired': instance.expired,
      'use_up': instance.useUp,
      'explain': instance.explain,
      'left_time': instance.leftTime,
      'expires': instance.expires,
      'coupon_type': _$CouponTypeEnumMap[instance.couponType],
      'can_give': instance.canGive,
      'expire_date_page': instance.expireDatePage,
      'jump_path': instance.jumpPath,
      'jump_rid': instance.jumpRid,
      'jump_type': instance.jumpType,
      'salePearl': instance.salePearl,
      'resolvable': instance.canBreak,
      'resolve_price': instance.breakPrice,
      'resolve_img': instance.breakImage,
      'resolve_name': instance.breakName,
      'tab_title': instance.tabTitle,
      'pretty_ids': instance.prettyIds,
      'extra': instance.extra,
    };

const _$CouponTypeEnumMap = {
  CouponType.Title: 'Title',
  CouponType.Gift: 'Gift',
  CouponType.Defend: 'Defend',
  CouponType.RadioDefend: 'RadioDefend',
  CouponType.Key: 'Key',
  CouponType.Unknown: 'Unknown',
};

PrettyCard _$PrettyCardFromJson(Map<String, dynamic> json) {
  return PrettyCard(
    Util.parseInt(json['pretty_id']),
    Util.parseInt(json['status']),
  );
}

Map<String, dynamic> _$PrettyCardToJson(PrettyCard instance) =>
    <String, dynamic>{
      'pretty_id': instance.prettyId,
      'status': instance.status,
    };
