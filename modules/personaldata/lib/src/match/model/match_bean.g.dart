// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchSimpleInfoResponse _$MatchSimpleInfoResponseFromJson(
    Map<String, dynamic> json) {
  return MatchSimpleInfoResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    likeNum: Util.parseInt(json['like_num']),
    residueNum: Util.parseStr(json['match_num']),
    count: Util.parseInt(json['count']),
  );
}

Map<String, dynamic> _$MatchSimpleInfoResponseToJson(
        MatchSimpleInfoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'like_num': instance.likeNum,
      'match_num': instance.residueNum,
      'count': instance.count,
    };

MatchMessageInfoResponse _$MatchMessageInfoResponseFromJson(
    Map<String, dynamic> json) {
  return MatchMessageInfoResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    count: Util.parseInt(json['count']),
    time: Util.parseInt(json['time']),
    message: Util.parseStr(json['message']) ?? '',
  );
}

Map<String, dynamic> _$MatchMessageInfoResponseToJson(
        MatchMessageInfoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'count': instance.count,
      'time': instance.time,
      'message': instance.message,
    };

RecommendUserListResponse _$RecommendUserListResponseFromJson(
    Map<String, dynamic> json) {
  return RecommendUserListResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    items: Util.parseList(json['data'],
        (e) => RecommendUserItem.fromJson(e as Map<String, dynamic>)),
    likeNum: Util.parseInt(json['like_num']),
    residueNum: Util.parseStr(json['match_num']),
  );
}

Map<String, dynamic> _$RecommendUserListResponseToJson(
        RecommendUserListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.items,
      'like_num': instance.likeNum,
      'match_num': instance.residueNum,
    };

RecommendUserItem _$RecommendUserItemFromJson(Map<String, dynamic> json) {
  return RecommendUserItem(
    name: Util.parseStr(json['name']),
    uid: Util.parseStr(json['uid']),
    rid: Util.parseInt(json['rid']),
    icon: Util.parseStr(json['icon']),
    city: Util.parseStr(json['city']) ?? '',
    distance: Util.parseInt(json['distance']),
    onlineStatus: Util.parseStr(json['online_status']),
    lastOnlineTime: Util.parseStr(json['online_diff']),
    noData: Util.parseBool(json['noData']),
    roomTag: Util.parseStr(json['room_tag']),
    isGame: Util.parseInt(json['is_game']),
    roomIcon: Util.parseStr(json['room_icon']),
  );
}

Map<String, dynamic> _$RecommendUserItemToJson(RecommendUserItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'icon': instance.icon,
      'city': instance.city,
      'distance': instance.distance,
      'rid': instance.rid,
      'online_status': instance.onlineStatus,
      'online_diff': instance.lastOnlineTime,
      'noData': instance.noData,
      'room_icon': instance.roomIcon,
      'room_tag': instance.roomTag,
      'is_game': instance.isGame,
    };

MatchUserListResponse _$MatchUserListResponseFromJson(
    Map<String, dynamic> json) {
  return MatchUserListResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    items: Util.parseList(
        json['data'], (e) => MatchUserItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$MatchUserListResponseToJson(
        MatchUserListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.items,
    };

MatchUserItem _$MatchUserItemFromJson(Map<String, dynamic> json) {
  return MatchUserItem(
    id: Util.parseStr(json['id']),
    name: Util.parseStr(json['name']),
    icon: Util.parseStr(json['icon']),
    uid: Util.parseStr(json['uid']),
    matchId: Util.parseStr(json['match_uid']),
    isAccept: Util.parseStr(json['is_accept']),
    matchMessage: Util.parseStr(json['match_message']),
    deleted: Util.parseStr(json['deleted']),
    createTime: Util.parseStr(json['create_time']),
    updateTime: Util.parseStr(json['update_time']),
    sex: Util.parseStr(json['sex']),
    age: Util.parseStr(json['age']),
    desText: Util.parseStr(json['online_text']),
  );
}

Map<String, dynamic> _$MatchUserItemToJson(MatchUserItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'uid': instance.uid,
      'match_uid': instance.matchId,
      'is_accept': instance.isAccept,
      'match_message': instance.matchMessage,
      'deleted': instance.deleted,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
      'sex': instance.sex,
      'age': instance.age,
      'online_text': instance.desText,
    };
