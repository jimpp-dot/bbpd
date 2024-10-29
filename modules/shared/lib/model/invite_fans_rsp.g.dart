// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_fans_rsp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InviteFansResp _$InviteFansRespFromJson(Map<String, dynamic> json) {
  return InviteFansResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseMapNullable(json['data']),
  );
}
