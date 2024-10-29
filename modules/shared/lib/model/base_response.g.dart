// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
  );
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
    };

DataRsp<T> _$DataRspFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return DataRsp<T>(
    success: Util.parseBool(json['success']),
    msg: json['msg'] ?? '',
    data: fromJsonT(json['data']),
  );
}
