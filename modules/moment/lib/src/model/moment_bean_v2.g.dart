// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_bean_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentPageResponseV2 _$MomentPageResponseV2FromJson(Map<String, dynamic> json) {
  return MomentPageResponseV2(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : MomentPageV2.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MomentPageResponseV2ToJson(
        MomentPageResponseV2 instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

MomentPageV2 _$MomentPageV2FromJson(Map<String, dynamic> json) {
  return MomentPageV2(
    Util.parseInt(json['next']),
    Util.parseList(
        json['output'], (e) => Moment.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$MomentPageV2ToJson(MomentPageV2 instance) =>
    <String, dynamic>{
      'next': instance.next,
      'output': instance.output,
    };
