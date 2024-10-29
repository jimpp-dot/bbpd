// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welfare_history_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WelfareHistoryBean _$WelfareHistoryBeanFromJson(Map<String, dynamic> json) {
  return WelfareHistoryBean(
    data: Util.parseList(json['data'],
        (e) => WelfareHistoryData.fromJson(e as Map<String, dynamic>)),
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    limit: Util.parseInt(json['limit']),
  );
}

Map<String, dynamic> _$WelfareHistoryBeanToJson(WelfareHistoryBean instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
      'limit': instance.limit,
    };

WelfareHistoryData _$WelfareHistoryDataFromJson(Map<String, dynamic> json) {
  return WelfareHistoryData(
    cid: Util.parseInt(json['cid']),
    type: Util.parseStr(json['type']) ?? '',
    cType: Util.parseStr(json['c_type']) ?? '',
    name: Util.parseStr(json['name']) ?? '',
    avatar: Util.parseStr(json['avatar']) ?? '',
    image: Util.getRemoteImgUrl(Util.parseStr(json['image']) ?? ''),
    imageBackground:
        Util.getRemoteImgUrl(Util.parseStr(json['image_bg']) ?? ''),
    desc: Util.parseStr(json['desc']) ?? '',
    bubbleDesc: Util.parseStr(json['bubble_desc']) ?? '',
    bubbleFontColor: Util.parseStr(json['bubble_front_color']) ?? '',
    cNum: Util.parseInt(json['c_num']),
    id: Util.parseInt(json['id']),
    period: Util.parseStr(json['period']) ?? '',
    time: Util.parseStr(json['time']) ?? '',
  );
}

Map<String, dynamic> _$WelfareHistoryDataToJson(WelfareHistoryData instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'desc': instance.desc,
      'avatar': instance.avatar,
      'image': instance.image,
      'type': instance.type,
      'image_bg': instance.imageBackground,
      'bubble_desc': instance.bubbleDesc,
      'bubble_front_color': instance.bubbleFontColor,
      'c_type': instance.cType,
      'c_num': instance.cNum,
      'id': instance.id,
      'period': instance.period,
      'time': instance.time,
    };
