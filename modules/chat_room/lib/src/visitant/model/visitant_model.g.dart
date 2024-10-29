// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitantUpgradeMsg _$VisitantUpgradeMsgFromJson(Map<String, dynamic> json) {
  return VisitantUpgradeMsg(
    Util.notNullStr(json['message']),
    Util.notNullStr(json['type']),
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.parseInt(json['title_new']),
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['level_new']),
  );
}
