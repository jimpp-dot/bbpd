import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gs_tool_item.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GsToolItem {
  bool showRedpoint;
  final String type;
  final String name;
  final String icon;
  @JsonKey(fromJson: Util.parseColors)
  final List<Color> bgColor;
  final String jumpPage;

  GsToolItem(this.showRedpoint, this.type, this.name, this.icon, this.bgColor,
      this.jumpPage);

  factory GsToolItem.fromJson(Map<String, dynamic> json) =>
      _$GsToolItemFromJson(json);
}
