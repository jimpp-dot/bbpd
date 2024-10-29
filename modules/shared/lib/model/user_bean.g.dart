// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'user_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBean _$UserBeanFromJson(Map<String, dynamic> json) {
  return UserBean(
    uid: Util.parseInt(json['uid']),
    name: Util.parseStr(json['name']),
    markName: Util.parseStr(json['mark_name']),
    icon: Util.parseStr(json['icon']),
    sex: Util.parseInt(json['sex']),
    age: Util.parseInt(json['age']),
    official: Util.parseInt(json['official']),
  );
}

Map<String, dynamic> _$UserBeanToJson(UserBean instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'mark_name': instance.markName,
      'icon': instance.icon,
      'sex': instance.sex,
      'age': instance.age,
      'official': instance.official,
    };

UserRelationResponse _$UserRelationResponseFromJson(Map<String, dynamic> json) {
  return UserRelationResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : RelationData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserRelationResponseToJson(
        UserRelationResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

RelationData _$RelationDataFromJson(Map<String, dynamic> json) {
  return RelationData(
    Util.parseInt(json['status']),
    Util.parseInt(json['time']),
    Util.parseList(json['users'],
        (e) => UserRelationBean.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$RelationDataToJson(RelationData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'time': instance.time,
      'users': instance.users,
    };

UserRelationBean _$UserRelationBeanFromJson(Map<String, dynamic> json) {
  return UserRelationBean(
    Util.parseInt(json['u']),
    Util.parseInt(json['f']),
  );
}

Map<String, dynamic> _$UserRelationBeanToJson(UserRelationBean instance) =>
    <String, dynamic>{
      'u': instance.uid,
      'f': instance.isFriend,
    };
