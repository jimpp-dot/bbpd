// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_mood_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleMoodResp _$CircleMoodRespFromJson(Map<String, dynamic> json) =>
    CircleMoodResp(
      success: Util.parseBool(json['success']),
      msg: Util.parseStr(json['msg']),
      data: json['data'] == null
          ? null
          : CircleMoodData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CircleMoodRespToJson(CircleMoodResp instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data?.toJson(),
    };

CircleMoodData _$CircleMoodDataFromJson(Map<String, dynamic> json) =>
    CircleMoodData(
      leftNum: Util.parseInt(json['left_num']),
      topic: json['topic'] == null
          ? null
          : Moment.fromJson(json['topic'] as Map<String, dynamic>),
      room: json['room'] == null
          ? null
          : CircleMoodDataRoom.fromJson(json['room'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CircleMoodDataToJson(CircleMoodData instance) =>
    <String, dynamic>{
      'left_num': instance.leftNum,
      'topic': instance.topic?.toJson(),
      'room': instance.room?.toJson(),
    };

CircleMoodDataRoom _$CircleMoodDataRoomFromJson(Map<String, dynamic> json) =>
    CircleMoodDataRoom(
      rid: Util.parseInt(json['rid']),
      uid: Util.parseInt(json['uid']),
      name: Util.parseStr(json['name']),
      icon: Util.parseStr(json['icon']),
    );

Map<String, dynamic> _$CircleMoodDataRoomToJson(CircleMoodDataRoom instance) =>
    <String, dynamic>{
      'rid': instance.rid,
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
    };
