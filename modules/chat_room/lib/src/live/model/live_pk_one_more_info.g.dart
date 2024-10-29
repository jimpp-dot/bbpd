// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_pk_one_more_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivePKOneMoreInfo _$LivePKOneMoreInfoFromJson(Map<String, dynamic> json) {
  return LivePKOneMoreInfo(
    Util.parseInt(json['to_rid']),
    Util.parseInt(json['from_uid']),
    Util.notNullStr(json['pk_time']),
    Util.parseInt(json['from_rid']),
    Util.parseInt(json['expire_time']),
    Util.parseInt(json['to_uid']),
  )
    ..success = Util.parseBool(json['success'])
    ..msg = Util.parseStr(json['msg']);
}

Map<String, dynamic> _$LivePKOneMoreInfoToJson(LivePKOneMoreInfo instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'from_uid': instance.fromUid,
      'from_rid': instance.fromRid,
      'to_uid': instance.toUid,
      'to_rid': instance.toRid,
      'pk_time': instance.pkTime,
      'expire_time': instance.expireTime,
    };
