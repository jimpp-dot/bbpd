// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oss_upload_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OssUploadDataResp _$OssUploadDataRespFromJson(Map<String, dynamic> json) {
  return OssUploadDataResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : OssUploadData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

OssUploadData _$OssUploadDataFromJson(Map<String, dynamic> json) {
  return OssUploadData(
    Util.notNullStr(json['accessid']),
    Util.notNullStr(json['host']),
    Util.notNullStr(json['policy']),
    Util.notNullStr(json['signature']),
    Util.notNullStr(json['expire']),
    Util.notNullStr(json['callback']),
    Util.notNullStr(json['dir']),
  );
}
