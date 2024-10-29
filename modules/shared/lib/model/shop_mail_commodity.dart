// ignore_for_file: constant_identifier_names

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shop_mail_commodity.g.dart';

@JsonSerializable()
class ShopMailCommodity implements IShopMailCommodity {
  @JsonKey(fromJson: Util.parseInt)
  final int cid;
  @JsonKey(name: 'box_type')
  final int? boxType;
  final String? name;
  final String? desc;
  final String? content;
  final String? avatar;

  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String? image;

  @JsonKey(name: 'image_pop')
  final String? imagePop;

  final String? type;

  @JsonKey(name: 'image_bg', fromJson: Util.getRemoteImgUrl)
  final String? imageBackground;

  @JsonKey(name: 'is_limited', fromJson: Util.parseInt)
  final int? isLimited;

  @JsonKey(name: 'corner_icon', fromJson: Util.getRemoteImgUrl)
  final String? cornerIcon;

  @JsonKey(name: 'corner_desc')
  final String? cornerDesc;

  @JsonKey(name: 'bubble_desc')
  final String? bubbleDesc;

  @JsonKey(name: 'bubble_front_color')
  final String? bubbleFontColor;

  @JsonKey(name: 'c_type')
  final String? cType;

  @JsonKey(name: 'c_num')
  final int cNum;

  // money表示 当前app币 coin表示金币，piece 碎片, union_silver联盟银币， union_gold联盟金币
  @JsonKey(name: 'money_type')
  final String? moneyType;

  final int price;
  @JsonKey(name: 'color_config')
  final GiftColorConfig? colorConfig;

  @JsonKey(name: 'gifts')
  final List<CommodityGift>? gifts;

  final int? num;

  @JsonKey(name: 'sub_type')
  final String? subType;

  @JsonKey(name: 'return_num')
  final int? returnNum;

  @JsonKey(name: 'filter_tab_name')
  final String? filterTabName;

  @JsonKey(name: 'live_only')
  final int liveOnly; //1 主播专属

  @JsonKey(name: 'live_label')
  final String? liveLabel; //粉丝牌名

  @JsonKey(name: 'jump_path')
  final String? jumpPath;

  @JsonKey(name: 'inuse_desc')
  final String? inUseDesc;

  @JsonKey(name: 'grade')
  final String? grade;

  @JsonKey(name: 'grade_icon')
  final String? gradeIcon;

  /// 排序
  final int order;

  @JsonKey(name: 'unuse_invalid_duration')
  final int unuseInvalidDuration;

  @JsonKey(name: 'period_fmt')
  final String? periodFmt;

  ShopMailCommodity(
      {this.cid = 0,
      this.boxType = 0,
      this.name,
      this.type,
      this.desc,
      this.content,
      this.avatar,
      this.image,
      this.imagePop,
      this.imageBackground,
      this.isLimited = 0,
      this.cornerIcon,
      this.cornerDesc,
      this.bubbleDesc,
      this.bubbleFontColor,
      this.cType,
      this.cNum = 0,
      this.moneyType,
      this.price = 0,
      this.num = 0,
      this.subType,
      this.returnNum = 0,
      this.filterTabName,
      this.colorConfig,
      this.gifts,
      this.liveOnly = 0,
      this.liveLabel,
      this.jumpPath,
      this.inUseDesc,
      this.grade,
      this.gradeIcon,
      this.order = 0,
      this.unuseInvalidDuration = 0,
      this.periodFmt});

  factory ShopMailCommodity.fromJson(Map<String, dynamic> json) =>
      _$ShopMailCommodityFromJson(json);

  Map<String, dynamic> toJson() => _$ShopMailCommodityToJson(this);

  /// 是否限制购买
  bool get isLimitBuy {
    return (isLimited ?? 0) > 0;
  }

  Color getTextColor() {
    return Util.parseColor(bubbleFontColor, Colors.white)!;
  }

  Color get backgroundColor =>
      Util.parseColor(colorConfig?.bgColor, HexColor('#FFD988'))!;

  Color get allTextColor =>
      Util.parseColor(colorConfig?.textColor, HexColor('#553817'))!;

  Color get itemBackgroundColor =>
      Util.parseColor(colorConfig?.itemBgColor, HexColor('#493B1F'))!;

  @override
  ShopMailCommodityType get commodityType {
    return formatGoodsType(type);
  }

  String get itemCover {
    return Util.cover375(imageBackground) ?? '';
  }

  @JsonKey(ignore: true)
  @override
  String get commodityAvatar => avatar ?? '';

  @JsonKey(ignore: true)
  @override
  String get commodityBubbleDesc => bubbleDesc ?? '';

  @JsonKey(ignore: true)
  @override
  String get commodityImage => image ?? '';

  @JsonKey(ignore: true)
  @override
  Color get commodityBubbleFontColor => getTextColor();

  @JsonKey(ignore: true)
  @override
  int get commodityLiveOnly => liveOnly;

  @JsonKey(ignore: true)
  @override
  String get commodityLiveLabel => liveLabel ?? '';

  @override
  String toString() {
    return '{cid: $cid, boxType: $boxType, name: $name, periodFmt: $periodFmt, desc: $desc, content: $content, avatar: $avatar, image: $image, imagePop: $imagePop, type: $type, imageBackground: $imageBackground, isLimited: $isLimited, cornerIcon: $cornerIcon, cornerDesc: $cornerDesc, bubbleDesc: $bubbleDesc, bubbleFontColor: $bubbleFontColor, cType: $cType, cNum: $cNum, moneyType: $moneyType, price: $price, colorConfig: $colorConfig, gifts: $gifts, num: $num, subType: $subType, returnNum: $returnNum, filterTabName: $filterTabName, liveOnly: $liveOnly, liveLabel: $liveLabel}';
  }

  @JsonKey(ignore: true)
  String? get unuseInvalidDurationDisplay {
    if (unuseInvalidDuration <= 0) {
      return null;
    }

    double days = unuseInvalidDuration / (3600 * 24);
    if (days > 1) {
      return '${days.truncate()}天';
    } else {
      double hours = unuseInvalidDuration / 3600;

      return '${hours.truncate() < 1 ? 1 : hours.truncate()}小时';
    }
  }
}

@JsonSerializable()
class CommodityGift implements IShopMailCommodity {
  @JsonKey(fromJson: Util.parseInt)
  final int id;
  @JsonKey(fromJson: Util.parseInt)
  final int cid;
  @JsonKey(name: 'c_type')
  final String? cType;
  @JsonKey(name: 'group_id', fromJson: Util.parseInt)
  final int groupId;
  @JsonKey(name: 'sub_type')
  final String? subType;
  @JsonKey(name: 'c_num', fromJson: Util.parseInt)
  final int cNum;
  @JsonKey(name: 'image', fromJson: Util.getRemoteImgUrl)
  final String? image;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'bubble_desc')
  final String? bubbleDesc;
  @JsonKey(name: 'avatar')
  final String? avatar;
  @JsonKey(name: 'bubble_front_color')
  final String? bubbleFontColor;
  @JsonKey(name: 'desc')
  final String? desc;
  @JsonKey(name: 'image_bg', fromJson: Util.getRemoteImgUrl)
  final String? imageBg;
  @JsonKey(name: 'price', fromJson: Util.parseInt)
  final int price;

  /// 单位：分
  final String period;

  CommodityGift(
      {this.id = 0,
      this.cid = 0,
      this.cType,
      this.groupId = 0,
      this.subType,
      this.cNum = 0,
      this.image,
      this.name,
      this.type,
      this.bubbleDesc,
      this.avatar,
      this.bubbleFontColor,
      this.desc,
      this.imageBg,
      this.price = 0,
      this.period = ''});

  factory CommodityGift.fromJson(Map<String, dynamic> json) =>
      _$CommodityGiftFromJson(json);

  Map<String, dynamic> toJson() => _$CommodityGiftToJson(this);

  @JsonKey(ignore: true)
  @override
  String get commodityAvatar => avatar ?? '';

  @JsonKey(ignore: true)
  @override
  String get commodityBubbleDesc => bubbleDesc ?? '';

  @JsonKey(ignore: true)
  @override
  Color get commodityBubbleFontColor =>
      Util.parseColor(bubbleFontColor, Colors.white)!;

  @JsonKey(ignore: true)
  @override
  String get commodityImage => image ?? '';

  @JsonKey(ignore: true)
  @override
  ShopMailCommodityType get commodityType => formatGoodsType(type);

  @JsonKey(ignore: true)
  @override
  int get commodityLiveOnly => -1;

  @JsonKey(ignore: true)
  @override
  String get commodityLiveLabel => '';
}

@JsonSerializable()
class GiftColorConfig {
  @JsonKey(name: 'bg_color')
  final String? bgColor;
  @JsonKey(name: 'text_color')
  final String? textColor;
  @JsonKey(name: 'item_bg_color')
  final String? itemBgColor;

  GiftColorConfig({this.bgColor, this.textColor, this.itemBgColor});

  factory GiftColorConfig.fromJson(Map<String, dynamic> json) =>
      _$GiftColorConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GiftColorConfigToJson(this);
}
