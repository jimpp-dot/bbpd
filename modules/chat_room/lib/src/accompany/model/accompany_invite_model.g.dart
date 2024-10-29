// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accompany_invite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccompanyInviteModel _$AccompanyInviteModelFromJson(Map<String, dynamic> json) {
  return AccompanyInviteModel(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.getRemoteImgUrl(json['icon']),
    Util.parseInt(json['online']),
    Util.parseDouble(json['distance']),
    Util.parseStr(json['online_dateline_diff']),
  );
}
