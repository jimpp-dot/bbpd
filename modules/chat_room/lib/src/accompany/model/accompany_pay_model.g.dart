// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accompany_pay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccompanyPayData _$AccompanyPayDataFromJson(Map<String, dynamic> json) {
  return AccompanyPayData(
    Util.parseInt(json['value']),
    Util.parseInt(json['duration']),
    Util.parseIcon(json['decorate']),
    Util.parseIcon(json['effect']),
    Util.parseInt(json['accompany_end_time']),
    Util.parseInt(json['total_time']),
    Util.parseBool(json['truth_enable']),
  );
}

Map<String, dynamic> _$AccompanyPayDataToJson(AccompanyPayData instance) =>
    <String, dynamic>{
      'value': instance.value,
      'duration': instance.duration,
      'decorate': instance.decorate,
      'effect': instance.effect,
      'accompany_end_time': instance.accompanyEndTime,
      'total_time': instance.totalTime,
      'truth_enable': instance.truthEnable,
    };

AccompanyGiftData _$AccompanyGiftDataFromJson(Map<String, dynamic> json) {
  return AccompanyGiftData(
    Util.parseInt(json['left_time']),
    Util.parseList(
        json['gift_newer'], (e) => Gift.fromJson(e as Map<String, dynamic>)),
    Util.parseList(
        json['gift_pay'], (e) => Gift.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['money']),
  );
}
