// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikesResponse _$LikesResponseFromJson(Map<String, dynamic> json) {
  return LikesResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(
        json['data'], (e) => LikeListUser.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$LikesResponseToJson(LikesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

LikeListUser _$LikeListUserFromJson(Map<String, dynamic> json) {
  return LikeListUser(
    topicId: Util.parseInt(json['topic_id']),
    uid: Util.parseInt(json['uid']),
    name: Util.parseStr(json['name']),
    icon: Util.parseStr(json['icon']),
    sex: Util.parseStr(json['sex']),
    age: Util.parseInt(json['age']),
    markName: Util.parseStr(json['mkname']),
    online: Util.parseInt(json['online']),
    time: Util.parseInt(json['time']),
    isfollow: Util.parseInt(json['isfollow']),
  );
}

Map<String, dynamic> _$LikeListUserToJson(LikeListUser instance) =>
    <String, dynamic>{
      'topic_id': instance.topicId,
      'uid': instance.uid,
      'icon': instance.icon,
      'sex': instance.sex,
      'age': instance.age,
      'name': instance.name,
      'mkname': instance.markName,
      'online': instance.online,
      'time': instance.time,
      'isfollow': instance.isfollow,
    };

LikeBean _$LikeBeanFromJson(Map<String, dynamic> json) {
  return LikeBean(
    topicId: Util.parseInt(json['topic_id']),
    uid: Util.parseInt(json['uid']),
    name: Util.parseStr(json['name']),
    icon: Util.parseStr(json['icon']),
    sex: Util.parseInt(json['sex']),
    age: Util.parseInt(json['age']),
    markName: Util.parseStr(json['mkname']),
    online: Util.parseInt(json['online']),
    time: Util.parseInt(json['time']),
  );
}

Map<String, dynamic> _$LikeBeanToJson(LikeBean instance) => <String, dynamic>{
      'topic_id': instance.topicId,
      'uid': instance.uid,
      'icon': instance.icon,
      'sex': instance.sex,
      'age': instance.age,
      'name': instance.name,
      'mkname': instance.markName,
      'online': instance.online,
      'time': instance.time,
    };
