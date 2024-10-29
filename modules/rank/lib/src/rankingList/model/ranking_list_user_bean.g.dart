// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_list_user_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingListUserItem _$RankingListUserItemFromJson(Map<String, dynamic> json) {
  return RankingListUserItem(
    Util.parseInt(json['uid']),
    Util.parseInt(json['rank']),
    Util.parseStr(json['user_name']) ?? '',
    Util.parseStr(json['user_icon']) ?? '',
    Util.parseInt(json['score']),
    Util.parseInt(json['before_diff']),
  );
}

RankingUserListData _$RankingUserListDataFromJson(Map<String, dynamic> json) {
  return RankingUserListData(
    Util.parseList(json['list'],
        (e) => RankingListUserItem.fromJson(e as Map<String, dynamic>)),
    json['self'] == null
        ? null
        : RankingListUserItem.fromJson(json['self'] as Map<String, dynamic>),
    Util.parseInt(json['page']),
    Util.parseInt(json['more']),
  );
}

RankingUserListResponse _$RankingUserListResponseFromJson(
    Map<String, dynamic> json) {
  return RankingUserListResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : RankingUserListData.fromJson(json['data'] as Map<String, dynamic>),
  );
}
