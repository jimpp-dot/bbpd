// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'killer_nobility_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KillerNobilityCenterResponse _$KillerNobilityCenterResponseFromJson(
    Map<String, dynamic> json) {
  return KillerNobilityCenterResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    myInfo: json['title'] == null
        ? null
        : MyNobilityInfo.fromJson(json['title'] as Map<String, dynamic>),
    tabData: Util.parseList(json['config'],
        (e) => NobilityTabInfoItem.fromJson(e as Map<String, dynamic>)),
    items: Util.parseList(json['benefit'],
        (e) => PrivilegeInfoItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$KillerNobilityCenterResponseToJson(
        KillerNobilityCenterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'title': instance.myInfo,
      'config': instance.tabData,
      'benefit': instance.items,
    };

MyNobilityInfo _$MyNobilityInfoFromJson(Map<String, dynamic> json) {
  return MyNobilityInfo(
    title: Util.parseInt(json['title']),
    growth: Util.parseInt(json['month_growth']),
    rechargeCondition: Util.parseInt(json['has_title']),
  );
}

Map<String, dynamic> _$MyNobilityInfoToJson(MyNobilityInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'month_growth': instance.growth,
      'has_title': instance.rechargeCondition,
    };

NobilityTabInfoItem _$NobilityTabInfoItemFromJson(Map<String, dynamic> json) {
  return NobilityTabInfoItem(
    name: Util.parseStr(json['name']) ?? '',
    level: Util.parseInt(json['level']),
    growth: Util.parseInt(json['growth']),
    icon: Util.parseStr(json['icon']) ?? '',
    grayIcon: Util.parseStr(json['gray_icon']) ?? '',
    loopIcon: Util.parseStr(json['loop_icon']) ?? '',
  );
}

Map<String, dynamic> _$NobilityTabInfoItemToJson(
        NobilityTabInfoItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'growth': instance.growth,
      'icon': instance.icon,
      'gray_icon': instance.grayIcon,
      'loop_icon': instance.loopIcon,
    };

NobilityGrowthResponse _$NobilityGrowthResponseFromJson(
    Map<String, dynamic> json) {
  return NobilityGrowthResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    items: Util.parseList(
        json['list'], (e) => GrowthInfo.fromJson(e as Map<String, dynamic>)),
    typeDesc: Util.parseList(json['type'], (e) => Util.parseStr(e) ?? ''),
  );
}

Map<String, dynamic> _$NobilityGrowthResponseToJson(
        NobilityGrowthResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'list': instance.items,
      'type': instance.typeDesc,
    };

GrowthInfo _$GrowthInfoFromJson(Map<String, dynamic> json) {
  return GrowthInfo(
    id: Util.parseStr(json['id']) ?? '',
    uid: Util.parseStr(json['uid']) ?? '',
    appId: Util.parseStr(json['app_id']) ?? '',
    growth: Util.parseStr(json['growth']) ?? '',
    dateline: Util.parseStr(json['dateline']) ?? '',
    type: Util.parseStr(json['type']) ?? '',
  );
}

Map<String, dynamic> _$GrowthInfoToJson(GrowthInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'app_id': instance.appId,
      'growth': instance.growth,
      'dateline': instance.dateline,
      'type': instance.type,
    };
