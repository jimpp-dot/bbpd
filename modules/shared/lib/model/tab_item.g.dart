// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TabItem _$TabItemFromJson(Map<String, dynamic> json) {
  return TabItem(
    Util.parseStr(json['type']),
    Util.parseStr(json['title']),
  )..gid = Util.parseInt(json['gid']);
}

Map<String, dynamic> _$TabItemToJson(TabItem instance) => <String, dynamic>{
      'type': instance.type,
      'title': instance.label,
      'gid': instance.gid,
    };
