// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bar_room_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatBarRoomListItem _$ChatBarRoomListItemFromJson(Map<String, dynamic> json) {
  return ChatBarRoomListItem(
    rid: Util.parseInt(json['rid']),
    uid: Util.parseInt(json['uid']),
    name: Util.parseStr(json['name']) ?? '',
    property: Util.parseStr(json['property']) ?? '',
    icon: Util.parseStr(json['icon']) ?? '',
    onlineNum: Util.parseInt(json['onlineNum']),
    micIcons: Util.parseList(json['micIcons'], (e) => Util.parseStr(e) ?? ''),
    typeNameShow: Util.parseStr(json['typeNameShow']) ?? '',
    status: Util.parseStr(json['status']) ?? '',
    source: Util.parseInt(json['source']),
  );
}

Map<String, dynamic> _$ChatBarRoomListItemToJson(
        ChatBarRoomListItem instance) =>
    <String, dynamic>{
      'rid': instance.rid,
      'uid': instance.uid,
      'name': instance.name,
      'property': instance.property,
      'icon': instance.icon,
      'onlineNum': instance.onlineNum,
      'micIcons': instance.micIcons,
      'typeNameShow': instance.typeNameShow,
      'status': instance.status,
      'source': instance.source,
    };
