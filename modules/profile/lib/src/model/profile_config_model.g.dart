// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileConfigModel _$ProfileConfigModelFromJson(Map<String, dynamic> json) {
  return ProfileConfigModel(
    Util.parseInt(json['activity_week_challenge']),
    Util.notNullStr(json['benefit_url']),
    Util.parseInt(json['gs_sayhi']),
    Util.parseBool(json['gs_warning']),
    Util.parseInt(json['gs_upload_pic']),
    json['cloud_game_center'] == null
        ? null
        : CloudGameInfo.fromJson(
            json['cloud_game_center'] as Map<String, dynamic>),
    Util.parseList(json['func_center'], (e) => Util.parseMap(e)),
    Util.notNullStr(json['encounter']),
    Util.parseBool(json['gs_show_tool']),
    Util.parseBool(json['encounter_show_third']),
    Util.parseBool(json['show_gift_code']),
  );
}

CloudGameInfo _$CloudGameInfoFromJson(Map<String, dynamic> json) {
  return CloudGameInfo(
    Util.parseInt(json['free_duration']),
    Util.parseInt(json['charged_duration']),
    Util.parseInt(json['quick_channel_coupon']),
    json['cloud_card_info'] == null
        ? null
        : CloudCardInfo.fromJson(
            json['cloud_card_info'] as Map<String, dynamic>),
  );
}

CloudCardInfo _$CloudCardInfoFromJson(Map<String, dynamic> json) {
  return CloudCardInfo(
    Util.parseInt(json['cid']),
    Util.notNullStr(json['type']),
  );
}
