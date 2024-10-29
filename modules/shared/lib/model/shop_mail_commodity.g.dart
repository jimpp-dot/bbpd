// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_mail_commodity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopMailCommodity _$ShopMailCommodityFromJson(Map<String, dynamic> json) {
  return ShopMailCommodity(
    cid: Util.parseInt(json['cid']),
    boxType: Util.parseInt(json['box_type']),
    name: Util.parseStr(json['name']),
    type: Util.parseStr(json['type']),
    desc: Util.parseStr(json['desc']),
    content: Util.parseStr(json['content']),
    avatar: Util.parseStr(json['avatar']),
    image: Util.getRemoteImgUrl(Util.parseStr(json['image'])),
    imagePop: Util.parseStr(json['image_pop']),
    imageBackground: Util.getRemoteImgUrl(Util.parseStr(json['image_bg'])),
    isLimited: Util.parseInt(json['is_limited']),
    cornerIcon: Util.getRemoteImgUrl(Util.parseStr(json['corner_icon'])),
    cornerDesc: Util.parseStr(json['corner_desc']),
    bubbleDesc: Util.parseStr(json['bubble_desc']),
    bubbleFontColor: Util.parseStr(json['bubble_front_color']),
    cType: Util.parseStr(json['c_type']),
    cNum: Util.parseInt(json['c_num']),
    moneyType: Util.parseStr(json['money_type']),
    price: Util.parseInt(json['price']),
    num: Util.parseInt(json['num']),
    subType: Util.parseStr(json['sub_type']),
    returnNum: Util.parseInt(json['return_num']),
    filterTabName: Util.parseStr(json['filter_tab_name']),
    colorConfig: json['color_config'] == null
        ? null
        : GiftColorConfig.fromJson(
            json['color_config'] as Map<String, dynamic>),
    gifts: Util.parseList(json['gifts'],
        (e) => CommodityGift.fromJson(e as Map<String, dynamic>)),
    liveOnly: Util.parseInt(json['live_only']),
    liveLabel: Util.parseStr(json['live_label']),
    jumpPath: Util.parseStr(json['jump_path']),
    inUseDesc: Util.parseStr(json['inuse_desc']),
    grade: Util.parseStr(json['grade']),
    gradeIcon: Util.getRemoteImgUrl(Util.parseStr(json['grade_icon'])),
    unuseInvalidDuration: Util.parseInt(json['unuse_invalid_duration']),
    order: Util.parseInt(json['order']),
    periodFmt: Util.parseStr(json['period_fmt']),
  );
}

Map<String, dynamic> _$ShopMailCommodityToJson(ShopMailCommodity instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'box_type': instance.boxType,
      'name': instance.name,
      'desc': instance.desc,
      'content': instance.content,
      'avatar': instance.avatar,
      'image': instance.image,
      'image_pop': instance.imagePop,
      'type': instance.type,
      'image_bg': instance.imageBackground,
      'is_limited': instance.isLimited,
      'corner_icon': instance.cornerIcon,
      'corner_desc': instance.cornerDesc,
      'bubble_desc': instance.bubbleDesc,
      'bubble_front_color': instance.bubbleFontColor,
      'c_type': instance.cType,
      'c_num': instance.cNum,
      'money_type': instance.moneyType,
      'price': instance.price,
      'color_config': instance.colorConfig,
      'gifts': instance.gifts,
      'num': instance.num,
      'sub_type': instance.subType,
      'return_num': instance.returnNum,
      'filter_tab_name': instance.filterTabName,
      'live_only': instance.liveOnly,
      'live_label': instance.liveLabel,
      'jump_path': instance.jumpPath,
      'inuse_desc': instance.inUseDesc,
      'period_fmt': instance.periodFmt,
    };

CommodityGift _$CommodityGiftFromJson(Map<String, dynamic> json) {
  return CommodityGift(
    id: Util.parseInt(json['id']),
    cid: Util.parseInt(json['cid']),
    cType: Util.parseStr(json['c_type']),
    groupId: Util.parseInt(json['group_id']),
    subType: Util.parseStr(json['sub_type']),
    cNum: Util.parseInt(json['c_num']),
    image: Util.getRemoteImgUrl(Util.parseStr(json['image'])),
    name: Util.parseStr(json['name']),
    type: Util.parseStr(json['type']),
    bubbleDesc: Util.parseStr(json['bubble_desc']),
    avatar: Util.parseStr(json['avatar']),
    bubbleFontColor: Util.parseStr(json['bubble_front_color']),
    desc: Util.parseStr(json['desc']),
    imageBg: Util.getRemoteImgUrl(Util.parseStr(json['image_bg'])),
    price: Util.parseInt(json['price']),
    period: Util.parseStr(json['period']) ?? '',
  );
}

Map<String, dynamic> _$CommodityGiftToJson(CommodityGift instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cid': instance.cid,
      'c_type': instance.cType,
      'group_id': instance.groupId,
      'sub_type': instance.subType,
      'c_num': instance.cNum,
      'image': instance.image,
      'name': instance.name,
      'type': instance.type,
      'bubble_desc': instance.bubbleDesc,
      'avatar': instance.avatar,
      'bubble_front_color': instance.bubbleFontColor,
      'desc': instance.desc,
      'image_bg': instance.imageBg,
      'price': instance.price,
      'period': instance.period,
    };

GiftColorConfig _$GiftColorConfigFromJson(Map<String, dynamic> json) {
  return GiftColorConfig(
    bgColor: Util.parseStr(json['bg_color']),
    textColor: Util.parseStr(json['text_color']),
    itemBgColor: Util.parseStr(json['item_bg_color']),
  );
}

Map<String, dynamic> _$GiftColorConfigToJson(GiftColorConfig instance) =>
    <String, dynamic>{
      'bg_color': instance.bgColor,
      'text_color': instance.textColor,
      'item_bg_color': instance.itemBgColor,
    };
