// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeInfo _$SubscribeInfoFromJson(Map<String, dynamic> json) {
  return SubscribeInfo(
    Util.parseBool(json['is_show_button']),
    Util.parseBool(json['is_subscribe_official']),
    Util.parseStr(json['official_guide_url']) ?? '',
  );
}
