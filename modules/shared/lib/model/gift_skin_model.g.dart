// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_skin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftSkinModel _$GiftSkinModelFromJson(Map<String, dynamic> json) {
  return GiftSkinModel(
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['id']),
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['total']),
    Util.parseInt(json['current']),
    Util.parseStr(json['tips']) ?? '',
  );
}

Map<String, dynamic> _$GiftSkinModelToJson(GiftSkinModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'total': instance.total,
      'current': instance.current,
      'tips': instance.tips,
    };
