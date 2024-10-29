// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_screen_enhancement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicScreenEnhancementModel _$PublicScreenEnhancementModelFromJson(
    Map<String, dynamic> json) {
  return PublicScreenEnhancementModel(
    Util.parseBool(json['success']),
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PublicScreenEnhancementModelToJson(
        PublicScreenEnhancementModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    Util.parseList(json['content'], (e) => Util.notNullStr(e)),
    Util.parseInt(json['cid']),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'content': instance.content,
      'cid': instance.cid,
    };
