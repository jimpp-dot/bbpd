// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welfare_pond_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WelfarePondBean _$WelfarePondBeanFromJson(Map<String, dynamic> json) {
  return WelfarePondBean(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(json['data'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$WelfarePondBeanToJson(WelfarePondBean instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };
