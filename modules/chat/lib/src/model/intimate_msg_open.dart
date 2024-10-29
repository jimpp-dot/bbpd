import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'intimate_msg_open.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class IntimateMsgOpen {
  final bool canOpenPhoto;

  final bool isCommoditySent;

  final List<IntimateColorText> prompt;

  final List<ShopMailCommodity> commodityList;

  IntimateMsgOpen(
      this.canOpenPhoto, this.isCommoditySent, this.prompt, this.commodityList);

  factory IntimateMsgOpen.fromJson(Map<String, dynamic> json) =>
      _$IntimateMsgOpenFromJson(json);
}

@JsonSerializable(createToJson: false)
class IntimateColorText {
  final String? text;

  @JsonKey(fromJson: Util.parseColor)
  final Color? color;

  IntimateColorText(this.text, this.color);

  factory IntimateColorText.fromJson(Map<String, dynamic> json) =>
      _$IntimateColorTextFromJson(json);
}
