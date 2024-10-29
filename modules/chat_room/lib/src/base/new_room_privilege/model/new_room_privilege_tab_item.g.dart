// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_room_privilege_tab_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewRoomPrivilegeTabItem _$NewRoomPrivilegeTabItemFromJson(
        Map<String, dynamic> json) =>
    NewRoomPrivilegeTabItem(
      name: Util.parseStr(json['name']),
      selected: Util.parseBool(json['selected']),
    );

Map<String, dynamic> _$NewRoomPrivilegeTabItemToJson(
        NewRoomPrivilegeTabItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'selected': instance.selected,
    };
