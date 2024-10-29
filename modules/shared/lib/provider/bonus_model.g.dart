// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonusRoomMap _$BonusRoomMapFromJson(Map<String, dynamic> json) {
  return BonusRoomMap(
    Util.parseInt(json['rid']),
    Util.parseIcon(json['icon']),
  );
}

Map<String, dynamic> _$BonusRoomMapToJson(BonusRoomMap instance) =>
    <String, dynamic>{
      'rid': instance.rid,
      'icon': instance.icon,
    };
