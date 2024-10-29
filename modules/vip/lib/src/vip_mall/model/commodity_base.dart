import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commodity_base.g.dart';

/// 聊天气泡
@JsonSerializable()
class BubbleCommodity {
  @JsonKey(name: 'bubble_front_color')
  final String bubbleFontColor; // 气泡

  @JsonKey(name: 'bubble_desc_short')
  final String bubbleDescShort;

  @JsonKey(name: 'bubble_desc_long')
  final String bubbleDescLong;

  BubbleCommodity(
      this.bubbleFontColor, this.bubbleDescShort, this.bubbleDescLong);

  factory BubbleCommodity.fromJson(Map<String, dynamic> json) =>
      _$BubbleCommodityFromJson(json);

  Map<String, dynamic> toJson() => _$BubbleCommodityToJson(this);

  Color getTextColor() {
    if (Util.validStr(bubbleFontColor)) {
      return HexColor(bubbleFontColor);
    }
    return Colors.white;
  }
}

/// 入场横幅
@JsonSerializable()
class EffectCommodity {
  @JsonKey(name: 'vip_level', fromJson: Util.parseInt)
  final int vipLevel;

  @JsonKey(name: 'user_title', fromJson: Util.parseInt)
  final int userTitle;

  @JsonKey(name: 'title_new', fromJson: Util.parseInt)
  final int userTitleNew;

  @JsonKey(name: 'popularity_level', fromJson: Util.parseInt)
  final int popularityLevel;

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'panel_image')
  final String panelImage;

  @JsonKey(name: 'effect_front_color')
  final String effectFontColor;

  EffectCommodity(
      this.vipLevel,
      this.userTitle,
      this.userTitleNew,
      this.popularityLevel,
      this.userName,
      this.panelImage,
      this.effectFontColor);

  factory EffectCommodity.fromJson(Map<String, dynamic> json) =>
      _$EffectCommodityFromJson(json);

  Map<String, dynamic> toJson() => _$EffectCommodityToJson(this);

  Color getTextColor() {
    if (Util.validStr(effectFontColor)) {
      return HexColor(effectFontColor);
    }
    return Colors.white;
  }
}

/// 主页装扮
@JsonSerializable()
class DecorateCommodity {
  @JsonKey(fromJson: Util.parseInt)
  final int uid;
  @JsonKey(name: 'user_photo')
  final String userPhoto;

  @JsonKey(name: 'vip_level', fromJson: Util.parseInt)
  final int vipLevel;

  @JsonKey(name: 'user_title', fromJson: Util.parseInt)
  final int userTitle;

  @JsonKey(name: 'popularity_level', fromJson: Util.parseInt)
  final int popularityLevel;

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'title_icon')
  final String titleIcon;

  @JsonKey(name: 'panel_image')
  final String panelImage;

  @JsonKey(fromJson: Util.parseInt)
  final int age;

  @JsonKey(fromJson: Util.parseInt)
  final int sex;

  @JsonKey(fromJson: Util.parseInt)
  final int giftId;
  @JsonKey(name: 'vap_size', fromJson: Util.parseInt)
  final int vapSize;

  DecorateCommodity(
    this.uid,
    this.userPhoto,
    this.vipLevel,
    this.userTitle,
    this.popularityLevel,
    this.titleIcon,
    this.userName,
    this.panelImage,
    this.age,
    this.sex,
    this.giftId,
    this.vapSize,
  );

  factory DecorateCommodity.fromJson(Map<String, dynamic> json) =>
      _$DecorateCommodityFromJson(json);

  Map<String, dynamic> toJson() => _$DecorateCommodityToJson(this);
}
