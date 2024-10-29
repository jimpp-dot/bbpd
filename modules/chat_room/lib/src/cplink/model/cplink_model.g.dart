// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cplink_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CpLinkConfigData _$CpLinkConfigDataFromJson(Map<String, dynamic> json) {
  return CpLinkConfigData(
    CpLinkConfigData.parseState(json['cplink_stage']),
    Util.parseList(json['cplink_top_list'], (e) => Util.parseInt(e)),
    Util.parseList(json['scene_config_new'],
        (e) => Scene.fromJson(e as Map<String, dynamic>)),
    Util.parseBool(json['fetch_relations']),
    Util.parseBool(json['show_defend_pat']),
    Util.parseInt(json['version']),
  );
}

RelationshipData _$RelationshipDataFromJson(Map<String, dynamic> json) {
  return RelationshipData(
    defendDays: Util.parseInt(json['defend_days']),
    relationships: Util.parseList(json['auction_config'],
        (e) => Relationship.fromJson(e as Map<String, dynamic>)),
    levels: Util.parseList(json['level_info'],
        (e) => RelationshipLevelInfo.fromJson(e as Map<String, dynamic>)),
  );
}

RelationshipDataV2 _$RelationshipDataV2FromJson(Map<String, dynamic> json) {
  return RelationshipDataV2(
    relationships: Util.parseList(json['auction_config'],
        (e) => Relationship.fromJson(e as Map<String, dynamic>)),
  );
}

DefendDaysData _$DefendDaysDataFromJson(Map<String, dynamic> json) {
  return DefendDaysData(
    curDefendDays: Util.parseInt(json['current']),
    nextDefendDays: Util.parseInt(json['next']),
    nextScore: Util.parseInt(json['score']),
  );
}

RelationshipLevelInfo _$RelationshipLevelInfoFromJson(
    Map<String, dynamic> json) {
  return RelationshipLevelInfo(
    score: Util.parseInt(json['score']),
    level: Util.parseInt(json['level']),
    title: Util.parseStr(json['title']),
  );
}

Relationship _$RelationshipFromJson(Map<String, dynamic> json) {
  return Relationship(
    id: Util.parseInt(json['id']),
    name: Util.parseStr(json['name']),
    lightStatus: Util.parseBool(json['light_status']),
    lightMoney: Util.parseInt(json['light_money']),
    defendValue: Util.parseInt(json['defend_value']),
    expireTime: Util.parseInt(json['expire_time']),
    defendDays: DefendDaysData.fromJson(json['defend_days_config']),
  );
}

Scene _$SceneFromJson(Map<String, dynamic> json) {
  return Scene(
    Util.parseInt(json['scene']),
    Util.parseInt(json['money']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
  );
}

CpLinkResult _$CpLinkResultFromJson(Map<String, dynamic> json) {
  return CpLinkResult(
    Util.parseStr(json['status']),
    Util.parseStr(json['url']),
    Util.parseInt(json['size']),
    Util.parseList(
        json['users'], (e) => UserInfo.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['rid']),
    Util.parseList(json['uids'], (e) => Util.parseStr(e) ?? ''),
    Util.parseStr(json['auction_duration']),
    Util.parseStr(json['auction_name']),
  );
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
    Util.parseStr(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
  );
}

DelayData _$DelayDataFromJson(Map<String, dynamic> json) {
  return DelayData(
    delayLeftTimes: Util.parseInt(json['delay_left_times']),
  );
}
