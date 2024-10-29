// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_room_choose_anchor_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewRoomChooseAnchorItem _$NewRoomChooseAnchorItemFromJson(
        Map<String, dynamic> json) =>
    NewRoomChooseAnchorItem(
      uid: Util.parseInt(json['uid']),
      icon: Util.notNullStr(json['icon']),
      name: Util.notNullStr(json['name']),
    );

Map<String, dynamic> _$NewRoomChooseAnchorItemToJson(
        NewRoomChooseAnchorItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'icon': instance.icon,
      'name': instance.name,
    };
