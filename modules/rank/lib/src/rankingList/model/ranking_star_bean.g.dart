// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_star_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingStarTabItem _$RankingStarTabItemFromJson(Map<String, dynamic> json) {
  return RankingStarTabItem(
    userName: Util.parseStr(json['user_name']) ?? '',
    uid: Util.parseInt(json['uid']),
    rank: Util.parseInt(json['rank']),
    rid: Util.parseInt(json['rid']),
    starNum: Util.parseInt(json['star_num']),
    userIcon: Util.parseStr(json['user_icon']) ?? '',
    rankChange: Util.parseInt(json['rank_change']),
    rankChangeType: Util.parseStr(json['rank_change_type']) ?? '',
    stayHour: Util.parseInt(json['stay_hour']),
    roomName: Util.parseStr(json['room_name']) ?? '',
    diffNum: Util.parseInt(json['diff_num']),
  );
}
