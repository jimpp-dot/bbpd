// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nobility_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NobilityCenterResponse _$NobilityCenterResponseFromJson(
    Map<String, dynamic> json) {
  return NobilityCenterResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    myInfo: json['title'] == null
        ? null
        : NobilityInfoItem.fromJson(json['title'] as Map<String, dynamic>),
    tabInfo: (json['config'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : TabInfoItem.fromJson(e as Map<String, dynamic>)),
    ),
    items: Util.parseList(json['benefit'],
        (e) => PrivilegeInfoItem.fromJson(e as Map<String, dynamic>)),
    grading: Util.parseInt(json['gain_growth']),
    curTime: Util.parseInt(json['curTime']),
    extend: json['extend'] == null
        ? null
        : NobilityExtend.fromJson(json['extend'] as Map<String, dynamic>),
  );
}

NobilityExtend _$NobilityExtendFromJson(Map<String, dynamic> json) {
  return NobilityExtend(
    monthlyPay: Util.parseInt(json['monthly_pay']),
    monthlyPayRequire: Util.parseInt(json['monthly_pay_require']),
    applyBanner: Util.parseInt(json['apply_banner']),
  );
}

NobilityInfoItem _$NobilityInfoItemFromJson(Map<String, dynamic> json) {
  return NobilityInfoItem(
    level: Util.parseInt(json['level']),
    growth: Util.parseInt(json['growth']),
    isExperienceCard: Util.parseBool(json['source']),
    effectiveTime: Util.parseInt(json['effective_time']),
    subscribeTime: Util.parseInt(json['subscribe_time']),
    experienceTime: Util.parseInt(json['experience_expiredAt']),
    prevLevel: Util.parseInt(json['prev_level']),
  );
}

PrivilegeInfoItem _$PrivilegeInfoItemFromJson(Map<String, dynamic> json) {
  return PrivilegeInfoItem(
    icon: Util.parseStr(json['icon']),
    popIcon: Util.parseStr(json['pop_icon']),
    disableIcon: Util.parseStr(json['dis_icon']),
    name: Util.parseStr(json['name']),
    remark: Util.parseStr(json['remark']),
    description: Util.parseStr(json['description']),
    popBottomDesc: Util.parseStr(json['button_desc']),
    type: Util.parseStr(json['type']),
    start: Util.parseInt(json['start']),
    format: (json['format'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k, (e as List?)?.map((e) => Util.parseStr(e) ?? '').toList()),
    ),
    key: Util.parseStr(json['key']),
  );
}

TabInfoItem _$TabInfoItemFromJson(Map<String, dynamic> json) {
  return TabInfoItem(
    name: Util.parseStr(json['name']),
    level: Util.parseInt(json['level']),
    growth: Util.parseInt(json['growth']),
    grading: Util.parseInt(json['grading']),
    effective: Util.parseInt(json['effective']),
    attenuation: Util.parseInt(json['attenuation']),
    icon: Util.parseStr(json['icon']),
    grayIcon: Util.parseStr(json['gray_icon']),
    loopIcon: Util.parseStr(json['loop_icon']),
  );
}

NobilityMealsResponse _$NobilityMealsResponseFromJson(
    Map<String, dynamic> json) {
  return NobilityMealsResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    items: Util.parseList(
        json['data'], (e) => MealInfo.fromJson(e as Map<String, dynamic>)),
    first: Util.parseInt(json['first']),
    desc: json['desc'] == null
        ? null
        : MealDesc.fromJson(json['desc'] as Map<String, dynamic>),
  );
}

MealInfo _$MealInfoFromJson(Map<String, dynamic> json) {
  return MealInfo(
    name: Util.parseStr(json['name']),
    price: Util.parseInt(json['price']),
    oriPrice: Util.parseInt(json['s_price']),
    firstPrice: Util.parseInt(json['first_price']),
    cycleId: Util.parseInt(json['cycle_id']),
    desc: Util.parseStr(json['desc']),
    tag: Util.parseStr(json['tab']),
    mealId: Util.parseInt(json['id']),
    hasSigned: Util.parseInt(json['has_signed']),
  );
}

NobilityGrowthResponse _$NobilityGrowthResponseFromJson(
    Map<String, dynamic> json) {
  return NobilityGrowthResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    items: Util.parseList(
        json['list'], (e) => GrowthInfo.fromJson(e as Map<String, dynamic>)),
    typeDesc:
        (json['type'] as List?)?.map((e) => Util.parseStr(e) ?? '').toList(),
  );
}

GrowthInfo _$GrowthInfoFromJson(Map<String, dynamic> json) {
  return GrowthInfo(
    id: Util.parseStr(json['id']),
    uid: Util.parseStr(json['uid']),
    appId: Util.parseStr(json['app_id']),
    growth: Util.parseStr(json['growth']),
    dateline: Util.parseStr(json['dateline']),
    type: Util.parseStr(json['type']),
  );
}

MealDesc _$MealDescFromJson(Map<String, dynamic> json) {
  return MealDesc(
    desc1: Util.parseStr(json['vip_auto_renewing_buy_desc1_android']),
    desc2: Util.parseStr(json['vip_auto_renewing_buy_desc2_android']),
    desc3: Util.parseStr(json['vip_auto_renewing_buy_desc3_android']),
  );
}
