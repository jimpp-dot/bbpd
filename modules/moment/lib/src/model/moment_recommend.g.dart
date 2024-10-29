// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentRecommendResponse _$MomentRecommendResponseFromJson(
    Map<String, dynamic> json) {
  return MomentRecommendResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(
        json['data'], (e) => RecommendUser.fromJson(e as Map<String, dynamic>)),
    needVerify: Util.parseInt(json['need_verify']),
  );
}

Map<String, dynamic> _$MomentRecommendResponseToJson(
        MomentRecommendResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
      'need_verify': instance.needVerify,
    };

RecommendUser _$RecommendUserFromJson(Map<String, dynamic> json) {
  return RecommendUser(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['desc']),
  )..follow = Util.parseBool(json['follow']);
}

Map<String, dynamic> _$RecommendUserToJson(RecommendUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'desc': instance.desc,
      'follow': instance.follow,
    };
