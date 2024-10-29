// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confess_v2_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfessV2EventTouchData _$ConfessV2EventTouchDataFromJson(
    Map<String, dynamic> json) {
  return ConfessV2EventTouchData(
    next: Util.parseBool(json['next']),
    text: Util.parseStr(json['text']),
    giftId: Util.parseInt(json['gift_id']),
    toUid: Util.parseInt(json['to_uid']),
  );
}

Map<String, dynamic> _$ConfessV2EventTouchDataToJson(
        ConfessV2EventTouchData instance) =>
    <String, dynamic>{
      'next': instance.next,
      'text': instance.text,
      'gift_id': instance.giftId,
      'to_uid': instance.toUid,
    };
