// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defend_relation_detail_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefendRelationDetailResponse _$DefendRelationDetailResponseFromJson(
    Map<String, dynamic> json) {
  return DefendRelationDetailResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : DefendRelationDetailBean.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}

DefendRelationDetailBean _$DefendRelationDetailBeanFromJson(
    Map<String, dynamic> json) {
  return DefendRelationDetailBean(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['expire']) ?? '',
    Util.parseStr(json['title']) ?? '',
    Util.parseStr(json['defend_value']) ?? '',
    Util.parseInt(json['money']),
    Util.parseInt(json['duration']),
    Util.parseInt(json['position']),
    Util.parseInt(json['border_index']),
    Util.parseInt(json['relation_score']),
    Util.parseInt(json['defend_level']),
    Util.parseStr(json['defend_level_name']) ?? '',
    Util.parseInt(json['defend_uid']),
    Util.parseStr(json['id']) ?? '',
    Util.parseInt(json['direction']),
    Util.parseBool(json['upgrade_open']),
    Util.parseInt(json['break_money']),
    Util.parseStr(json['card_bg']) ?? '',
    Util.parseStr(json['card_top']) ?? '',
    Util.parseInt(json['upgrade']),
    Util.parseInt(json['category']),
    Util.parseList(json['widget'],
            (e) => DefendAccessory.fromJson(e as Map<String, dynamic>)) ??
        [],
    Util.parseInt(json['upgrade_money']),
    Util.parseList(json['normal_privilege'],
            (e) => DefendPrivilege.fromJson(e as Map<String, dynamic>)) ??
        [],
    Util.parseList(json['upgrade_privilege'],
            (e) => DefendPrivilege.fromJson(e as Map<String, dynamic>)) ??
        [],
    Util.parseStr(json['upgrade_tips']) ?? '',
    Util.parseStr(json['diy_name']) ?? '',
    Util.parseInt(json['diy_status']),
    Util.parseStr(json['diy_fail_reason']) ?? '',
    Util.parseInt(json['start_time']),
  )
    ..couponModel = json['couponModel'] == null
        ? null
        : DefendCouponModel.fromJson(
            json['couponModel'] as Map<String, dynamic>)
    ..toIcon = Util.parseStr(json['to_icon'])
    ..toUid = Util.parseInt(json['to_uid'])
    ..toName = Util.parseStr(json['to_name']);
}

DefendPrivilege _$DefendPrivilegeFromJson(Map<String, dynamic> json) {
  return DefendPrivilege(
    defendLevel: Util.parseInt(json['defend_level']),
    desc: Util.parseStr(json['desc']) ?? '',
    background: Util.parseStr(json['background']) ?? '',
  );
}
