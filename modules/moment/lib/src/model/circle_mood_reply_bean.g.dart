// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_mood_reply_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleMoodReplyResp _$CircleMoodReplyRespFromJson(Map<String, dynamic> json) =>
    CircleMoodReplyResp(
      success: Util.parseBool(json['success']),
      msg: Util.parseStr(json['msg']),
      data: json['data'] == null
          ? null
          : CircleMoodReplyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CircleMoodReplyRespToJson(
        CircleMoodReplyResp instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
    };

CircleMoodReplyData _$CircleMoodReplyDataFromJson(Map<String, dynamic> json) =>
    CircleMoodReplyData(
      msg: Util.parseStr(json['msg']),
    );

Map<String, dynamic> _$CircleMoodReplyDataToJson(
        CircleMoodReplyData instance) =>
    <String, dynamic>{
      'msg': instance.msg,
    };
