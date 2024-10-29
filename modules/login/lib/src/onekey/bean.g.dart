// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneKeyLoginBean _$OneKeyLoginBeanFromJson(Map<String, dynamic> json) {
  return OneKeyLoginBean(
    data: json['data'] != null ? json['data'] as Map<String, dynamic> : {},
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
  );
}

Map<String, dynamic> _$OneKeyLoginBeanToJson(OneKeyLoginBean instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };
