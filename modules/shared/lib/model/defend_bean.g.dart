// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defend_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDefendResponse _$ProfileDefendResponseFromJson(
    Map<String, dynamic> json) {
  return ProfileDefendResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'],
    defendConfigs: Util.parseList(json['defend_config'],
        (e) => DefendRelationModel.fromJson(e as Map<String, dynamic>)),
    commodities: json['commodities'],
  );
}

DefendCouponModel _$DefendCouponModelFromJson(Map<String, dynamic> json) {
  return DefendCouponModel(
    Util.parseInt(json['id']),
    Util.parseStr(json['type']) ?? '',
    Util.parseInt(json['ext_id']),
    Util.parseInt(json['num']),
    Util.parseInt(json['duction_money']),
  );
}

DefendRelationModel _$DefendRelationModelFromJson(Map<String, dynamic> json) {
  return DefendRelationModel(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['expire']),
    Util.parseStr(json['title']),
    Util.parseStr(json['defend_value']),
    Util.parseInt(json['money']),
    Util.parseInt(json['duration']),
    Util.parseInt(json['position']),
    Util.parseInt(json['border_index']),
    Util.parseInt(json['relation_score']),
    Util.parseInt(json['defend_level']),
    Util.parseStr(json['defend_level_name']),
    Util.parseInt(json['defend_uid']),
    Util.parseStr(json['id']),
    Util.parseInt(json['direction']),
    Util.parseBool(json['upgrade_open']),
    Util.parseInt(json['break_money']),
    Util.parseStr(json['card_bg']),
    Util.parseStr(json['card_top']),
    Util.parseInt(json['upgrade']),
    Util.parseInt(json['category']),
    Util.parseList(json['widget'],
        (e) => DefendAccessory.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['start_time']),
    lineBeforeUrl: Util.notNullStr(json['line_before_url']),
    lineUrl: Util.notNullStr(json['line_url']),
    hideDefendName: Util.parseBool(json['hide_defend_name']),
  )
    ..couponModel = json['couponModel'] == null
        ? null
        : DefendCouponModel.fromJson(
            json['couponModel'] as Map<String, dynamic>)
    ..meUid = Util.parseInt(json['me_uid'])
    ..meIcon = Util.parseStr(json['me_icon'])
    ..meName = Util.parseStr(json['me_name'])
    ..layout = Util.parseInt(json['layout']);
}

DefendAccessory _$DefendAccessoryFromJson(Map<String, dynamic> json) {
  return DefendAccessory(
    roomName: Util.parseStr(json['room_name']),
    widgetName: Util.parseStr(json['widget_name']),
    widgetArea: Util.parseInt(json['widget_area']),
    widgetImg: Util.parseStr(json['widget_img']),
    widgetLevel: Util.parseInt(json['widget_level']),
    widgetSendAt: Util.parseStr(json['widget_send_at']),
    widgetExpire: Util.parseStr(json['widget_expire']),
  );
}
