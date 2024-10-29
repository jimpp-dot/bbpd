// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gs_tool_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GsToolItem _$GsToolItemFromJson(Map<String, dynamic> json) {
  return GsToolItem(
    Util.parseBool(json['show_redpoint']),
    Util.notNullStr(json['type']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.parseColors(json['bg_color']),
    Util.notNullStr(json['jump_page']),
  );
}
