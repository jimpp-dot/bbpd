// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VipLevelResponse _$VipLevelResponseFromJson(Map<String, dynamic> json) {
  return VipLevelResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : VipLevel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VipLevelResponseToJson(VipLevelResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

VipLevel _$VipLevelFromJson(Map<String, dynamic> json) {
  return VipLevel(
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['level_icon']) ?? '',
    Util.parseStr(json['state']) ?? '',
    Util.parseInt(json['level']),
    Util.parseInt(json['start']),
    Util.parseInt(json['end']),
    Util.parseInt(json['current']),
    Util.parseInt(json['diff']),
    Util.parseList(
        json['list'], (e) => LevelItem.fromJson(e as Map<String, dynamic>)),
    Util.parseStr(json['next_lv_tx']) ?? '',
    Util.parseList(json['next_lv_list'],
        (e) => LevelItem.fromJson(e as Map<String, dynamic>)),
    json['switch_info'] == null
        ? null
        : SwitchInfo.fromJson(json['switch_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VipLevelToJson(VipLevel instance) => <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'level_icon': instance.levelIcon,
      'state': instance.state,
      'level': instance.level,
      'start': instance.start,
      'end': instance.end,
      'current': instance.current,
      'diff': instance.diff,
      'list': instance.list,
      'next_lv_tx': instance.nextLvTx,
      'next_lv_list': instance.nextLvList,
      'switch_info': instance.switchInfo,
    };

PopularityResponse _$PopularityResponseFromJson(Map<String, dynamic> json) {
  return PopularityResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : PopularityLevel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PopularityResponseToJson(PopularityResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

PopularityLevel _$PopularityLevelFromJson(Map<String, dynamic> json) {
  return PopularityLevel(
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['level_icon']) ?? '',
    Util.parseInt(json['level']),
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['start']),
    Util.parseInt(json['end']),
    Util.parseInt(json['current']),
    Util.parseInt(json['diff']),
    json['award'] == null
        ? null
        : PopularityAwards.fromJson(json['award'] as Map<String, dynamic>),
    Util.parseList(
        json['list'], (e) => LevelItem.fromJson(e as Map<String, dynamic>)),
    json['switch_info'] == null
        ? null
        : SwitchInfo.fromJson(json['switch_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PopularityLevelToJson(PopularityLevel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'level_icon': instance.levelIcon,
      'level': instance.level,
      'vip_level': instance.vipLevel,
      'start': instance.start,
      'end': instance.end,
      'current': instance.current,
      'diff': instance.diff,
      'award': instance.award,
      'list': instance.list,
      'switch_info': instance.switchInfo,
    };

LevelItem _$LevelItemFromJson(Map<String, dynamic> json) {
  return LevelItem(
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['remark']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['pop_icon']) ?? '',
    Util.parseStr(json['description']) ?? '',
    Util.parseStr(json['state']) ?? '',
    Util.parseStr(json['heat_remark']) ?? '',
    Util.parseStr(json['remark_new']) ?? '',
    Util.parseInt(json['from']),
    Util.parseInt(json['to']),
  );
}

Map<String, dynamic> _$LevelItemToJson(LevelItem instance) => <String, dynamic>{
      'name': instance.name,
      'remark': instance.remark,
      'remark_new': instance.remarkNew,
      'icon': instance.icon,
      'pop_icon': instance.popIcon,
      'description': instance.description,
      'state': instance.state,
      'heat_remark': instance.heatRemark,
      'from': instance.from,
      'to': instance.to,
    };

PopularityAwards _$PopularityAwardsFromJson(Map<String, dynamic> json) {
  return PopularityAwards(
    Util.parseInt(json['level']),
    Util.parseStr(json['state']) ?? '',
    Util.parseList(json['list'],
        (e) => PopularityAwardItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$PopularityAwardsToJson(PopularityAwards instance) =>
    <String, dynamic>{
      'level': instance.level,
      'state': instance.state,
      'list': instance.list,
    };

PopularityAwardItem _$PopularityAwardItemFromJson(Map<String, dynamic> json) {
  return PopularityAwardItem(
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['image']) ?? '',
  );
}

Map<String, dynamic> _$PopularityAwardItemToJson(
        PopularityAwardItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };

MyTitleResponse _$MyTitleResponseFromJson(Map<String, dynamic> json) {
  return MyTitleResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : MyTitle.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyTitleResponseToJson(MyTitleResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

MyTitle _$MyTitleFromJson(Map<String, dynamic> json) {
  return MyTitle(
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['title_index']),
    Util.parseList(
        json['list'], (e) => TitleInfo.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$MyTitleToJson(MyTitle instance) => <String, dynamic>{
      'vip_level': instance.vipLevel,
      'name': instance.name,
      'icon': instance.icon,
      'title_index': instance.titleIndex,
      'list': instance.list,
    };

TitleInfo _$TitleInfoFromJson(Map<String, dynamic> json) {
  return TitleInfo(
    Util.parseInt(json['id']),
    Util.parseInt(json['level']),
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['price']),
    Util.parseInt(json['money']),
    Util.parseInt(json['month']),
    Util.parseInt(json['cid']),
    Util.parseInt(json['cnum']),
    Util.parseInt(json['duction_money']),
    Util.parseInt(json['expacc']),
    Util.parseList(json['desc_list'],
        (e) => LevelItem.fromJson(e as Map<String, dynamic>)),
    Util.parseStr(json['state']) ?? '',
    Util.parseStr(json['buy_type']) ?? '',
    Util.parseInt(json['dateline']),
    Util.parseInt(json['discount']),
    Util.parseStr(json['deteline_format']) ?? '',
    Util.parseInt(json['diff_days']),
    Util.parseStr(json['ctype']) ?? '',
    Util.parseStr(json['gray_icon']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['loop_icon']) ?? '',
  );
}

Map<String, dynamic> _$TitleInfoToJson(TitleInfo instance) => <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'name': instance.name,
      'price': instance.price,
      'money': instance.money,
      'month': instance.month,
      'cid': instance.cid,
      'cnum': instance.cnum,
      'duction_money': instance.ductionMoney,
      'expacc': instance.expacc,
      'desc_list': instance.descList,
      'state': instance.state,
      'buy_type': instance.buyType,
      'dateline': instance.dateline,
      'discount': instance.discount,
      'deteline_format': instance.detelineFormat,
      'diff_days': instance.diffDays,
      'ctype': instance.ctype,
      'gray_icon': instance.grayIcon,
      'icon': instance.icon,
      'loop_icon': instance.loopIcon,
    };
