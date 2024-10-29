// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'super_admin_patrol_tab_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuperAdminPatrolSubTab _$SuperAdminPatrolSubTabFromJson(
    Map<String, dynamic> json) {
  return SuperAdminPatrolSubTab(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['pid']),
  );
}

SuperAdminPatrolFirstTab _$SuperAdminPatrolFirstTabFromJson(
    Map<String, dynamic> json) {
  return SuperAdminPatrolFirstTab(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['pid']),
    Util.parseList(json['children'],
        (e) => SuperAdminPatrolSubTab.fromJson(e as Map<String, dynamic>)),
  );
}

SuperAdminPatrolTabData _$SuperAdminPatrolTabDataFromJson(
    Map<String, dynamic> json) {
  return SuperAdminPatrolTabData(
    Util.parseList(json['list'],
        (e) => SuperAdminPatrolFirstTab.fromJson(e as Map<String, dynamic>)),
  );
}

SuperAdminPatrolTabResponse _$SuperAdminPatrolTabResponseFromJson(
    Map<String, dynamic> json) {
  return SuperAdminPatrolTabResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : SuperAdminPatrolTabData.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}
