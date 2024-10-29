// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_wedding_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeddingData _$WeddingDataFromJson(Map<String, dynamic> json) {
  return WeddingData(
    parseWeddingState(Util.parseInt(json['stage'])),
    Util.parseInt(json['blessing_score']),
    Util.notNullStr(json['name']),
    Util.parseInt(json['wid']),
    json['scene'] == null
        ? null
        : WeddingScene.fromJson(json['scene'] as Map<String, dynamic>),
    Util.parseList(
        json['mics'], (e) => WeddingMic.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['effect'],
        (e) => WeddingEffect.fromJson(e as Map<String, dynamic>)),
    json['combo_config'] == null
        ? null
        : WeddingComboConfig.fromJson(
            json['combo_config'] as Map<String, dynamic>),
  );
}

WeddingScene _$WeddingSceneFromJson(Map<String, dynamic> json) {
  return WeddingScene(
    Util.parseInt(json['scene_id']),
    Util.notNullStr(json['scene_name']),
    Util.parseInt(json['price']),
    Util.notNullStr(json['bg']),
    Util.notNullStr(json['seat_bg']),
    Util.notNullStr(json['mc_header']),
    Util.notNullStr(json['bridegroom_header']),
    Util.notNullStr(json['bride_header']),
    Util.notNullStr(json['groomsman_header']),
    Util.notNullStr(json['bridesmaid_header']),
    Util.parseInt(json['wedding_flower_cid']),
  );
}

WeddingUpdate _$WeddingUpdateFromJson(Map<String, dynamic> json) {
  return WeddingUpdate(
    parseWeddingState(Util.parseInt(json['stage'])),
    Util.parseInt(json['blessing_score']),
  );
}

WeddingEffect _$WeddingEffectFromJson(Map<String, dynamic> json) {
  return WeddingEffect(
    parseWeddingState(Util.parseInt(json['stage'])),
    Util.notNullStr(json['url']),
    Util.parseInt(json['size']),
    Util.notNullStr(json['cover']),
  );
}

WeddingMic _$WeddingMicFromJson(Map<String, dynamic> json) {
  return WeddingMic(
    Util.parseInt(json['position']),
    Util.parseInt(json['uid']),
    parseWeddingRole(Util.parseInt(json['role'])),
  );
}
