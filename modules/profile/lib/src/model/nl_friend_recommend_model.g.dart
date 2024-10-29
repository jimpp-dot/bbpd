// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nl_friend_recommend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NLAchieveRankItem _$NLAchieveRankItemFromJson(Map<String, dynamic> json) {
  return NLAchieveRankItem(
    Util.notNullStr(json['rank']),
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.parseInt(json['sex']),
    Util.notNullStr(json['score']),
  );
}

NLAchieveRankData _$NLAchieveRankDataFromJson(Map<String, dynamic> json) {
  return NLAchieveRankData(
    Util.parseList(json['list'],
        (e) => NLAchieveRankItem.fromJson(e as Map<String, dynamic>)),
    json['user_info'] == null
        ? null
        : NLAchieveRankItem.fromJson(json['user_info'] as Map<String, dynamic>),
    Util.parseBool(json['more']),
  );
}

NLAchieveRankRsp _$NLAchieveRankRspFromJson(Map<String, dynamic> json) {
  return NLAchieveRankRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : NLAchieveRankData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

NLRecommendFriendItem _$NLRecommendFriendItemFromJson(
    Map<String, dynamic> json) {
  return NLRecommendFriendItem(
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.parseInt(json['uid']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['age']),
    Util.parseInt(json['rid']),
    Util.parseInt(json['follow']),
    json['tag_info'] == null
        ? null
        : NLRecommendFriendTagInfo.fromJson(
            json['tag_info'] as Map<String, dynamic>),
    Util.parseInt(json['popularity_level']),
    Util.parseInt(json['vip_level']),
    Util.notNullStr(json['distance']),
    Util.notNullStr(json['score']),
    Util.parseBool(json['online']),
  );
}

NLRecommendFriendTagInfo _$NLRecommendFriendTagInfoFromJson(
    Map<String, dynamic> json) {
  return NLRecommendFriendTagInfo(
    Util.notNullStr(json['show']),
    Util.parseList(json['bg'], (e) => Util.notNullStr(e)),
    Util.notNullStr(json['acute_icon']),
  );
}

NLRecommendFriendData _$NLRecommendFriendDataFromJson(
    Map<String, dynamic> json) {
  return NLRecommendFriendData(
    Util.parseList(json['list'],
        (e) => NLRecommendFriendItem.fromJson(e as Map<String, dynamic>)),
  );
}

NLRecommendFriendRsp _$NLRecommendFriendRspFromJson(Map<String, dynamic> json) {
  return NLRecommendFriendRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : NLRecommendFriendData.fromJson(json['data'] as Map<String, dynamic>),
  );
}
