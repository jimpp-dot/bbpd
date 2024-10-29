// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_friend_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendFriendItem _$RecommendFriendItemFromJson(Map<String, dynamic> json) {
  return RecommendFriendItem(
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['uid']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['rid']),
    Util.parseStr(json['reason']),
    Util.parseStr(json['reason_color']),
    Util.parseInt(json['follow']),
    json['tag_info'] == null
        ? null
        : RecommendFriendTagInfo.fromJson(
            json['tag_info'] as Map<String, dynamic>),
  );
}

RecommendFriendTagInfo _$RecommendFriendTagInfoFromJson(
    Map<String, dynamic> json) {
  return RecommendFriendTagInfo(
    Util.parseStr(json['show']),
    Util.parseList(json['bg'], (e) => Util.parseStr(e) ?? ''),
    Util.parseStr(json['acute_icon']),
  );
}

RecommendFriendRsp _$RecommendFriendRspFromJson(Map<String, dynamic> json) {
  return RecommendFriendRsp(
      success: Util.parseBool(json['success']),
      msg: Util.parseStr(json['msg']),
      data: Util.parseList(json['data'],
          (e) => RecommendFriendItem.fromJson(e as Map<String, dynamic>)));
}
