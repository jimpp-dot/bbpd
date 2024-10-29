// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_create_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomCreateResponse _$RoomCreateResponseFromJson(Map<String, dynamic> json) {
  return RoomCreateResponse(
    data: json['data'] == null
        ? null
        : RoomCreate.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..success = Util.parseBool(json['success'])
    ..msg = Util.parseStr(json['msg']);
}

Map<String, dynamic> _$RoomCreateResponseToJson(RoomCreateResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

RoomCreate _$RoomCreateFromJson(Map<String, dynamic> json) {
  return RoomCreate(
    gameRooms: Util.parseList(json['game_room'],
        (e) => RoomCreateItem.fromJson(e as Map<String, dynamic>)),
    partyRooms: Util.parseList(json['party_room'],
        (e) => RoomCreateItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$RoomCreateToJson(RoomCreate instance) =>
    <String, dynamic>{
      'game_room': instance.gameRooms,
      'party_room': instance.partyRooms,
    };

RoomCreateItem _$RoomCreateItemFromJson(Map<String, dynamic> json) {
  return RoomCreateItem(
    name: Util.notNullStr(json['name']),
    icon: Util.notNullStr(json['icon']),
    bg: Util.notNullStr(json['back_image']),
    label: Util.notNullStr(json['type_label']),
    types: Util.parseList(json['type'],
        (e) => RoomCreateItemType.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$RoomCreateItemToJson(RoomCreateItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'back_image': instance.bg,
      'type_label': instance.label,
      'type': instance.types,
    };

RoomCreateItemType _$RoomCreateItemTypeFromJson(Map<String, dynamic> json) {
  return RoomCreateItemType(
    typeKey: Util.notNullStr(json['type']),
    typeName: Util.notNullStr(json['type_name']),
  );
}

Map<String, dynamic> _$RoomCreateItemTypeToJson(RoomCreateItemType instance) =>
    <String, dynamic>{
      'type': instance.typeKey,
      'type_name': instance.typeName,
    };
