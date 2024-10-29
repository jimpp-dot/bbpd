// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_bg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomBg _$RoomBgFromJson(Map<String, dynamic> json) {
  return RoomBg(
    Util.parseBool(json['success']),
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RoomBgToJson(RoomBg instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    Util.notNullStr(json['current']),
    Util.parseList(json['backgrounds'],
        (e) => Background.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'current': instance.current,
      'backgrounds': instance.backgrounds,
    };

Background _$BackgroundFromJson(Map<String, dynamic> json) {
  return Background(
    Util.notNullStr(json['type']),
    Util.notNullStr(json['url']),
    Util.parseBool(json['enable']),
    Util.notNullStr(json['message']),
  );
}

Map<String, dynamic> _$BackgroundToJson(Background instance) =>
    <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
      'enable': instance.enable,
      'message': instance.message,
    };
