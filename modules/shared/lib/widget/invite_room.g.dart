// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteRoomData _$InviteRoomDataFromJson(Map<String, dynamic> json) {
  return InviteRoomData(
    uid: Util.parseInt(json['uid']),
    rid: Util.parseInt(json['rid']),
    age: Util.parseInt(json['age']),
    sex: Util.parseInt(json['sex']),
    icon: Util.notNullStr(json['icon']),
    name: Util.notNullStr(json['name']),
    distance: Util.notNullStr(json['distance']),
    typeName: Util.notNullStr(json['type_label']),
    settlementChannel: Util.notNullStr(json['settlement_channel']),
    roomFactoryType: Util.notNullStr(json['room_factory_type']),
    channelType: Util.notNullStr(json['channel_type']),
    id: Util.parseInt(json['id']),
  );
}

Map<String, dynamic> _$InviteRoomDataToJson(InviteRoomData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'rid': instance.rid,
      'age': instance.age,
      'sex': instance.sex,
      'name': instance.name,
      'icon': instance.icon,
      'distance': instance.distance,
      'type_label': instance.typeName,
      'settlement_channel': instance.settlementChannel,
      'room_factory_type': instance.roomFactoryType,
      'channel_type': instance.channelType,
      'id': instance.id,
    };

InviteText _$InviteTextFromJson(Map<String, dynamic> json) {
  return InviteText(
    cancel: Util.notNullStr(json['cancel']),
    ok: Util.notNullStr(json['ok']),
    content: Util.notNullStr(json['content']),
  );
}

Map<String, dynamic> _$InviteTextToJson(InviteText instance) =>
    <String, dynamic>{
      'cancel': instance.cancel,
      'ok': instance.ok,
      'content': instance.content,
    };

InviteRoomRsp _$InviteRoomRspFromJson(Map<String, dynamic> json) {
  return InviteRoomRsp(
    msg: Util.parseStr(json['msg']),
    success: Util.parseBool(json['success']),
    data: json['data'] == null
        ? null
        : InviteRoomData.fromJson(json['data'] as Map<String, dynamic>),
    text: json['text'] == null
        ? null
        : InviteText.fromJson(json['text'] as Map<String, dynamic>),
  )..isNew = Util.parseBool(json['is_new']);
}

Map<String, dynamic> _$InviteRoomRspToJson(InviteRoomRsp instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'is_new': instance.isNew,
      'data': instance.data,
      'text': instance.text,
    };
