// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_week_star_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingWeekStarItem _$RankingWeekStarItemFromJson(Map<String, dynamic> json) {
  return RankingWeekStarItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['user_name']) ?? '',
    Util.parseStr(json['user_icon']) ?? '',
    Util.parseInt(json['rank']),
    Util.parseInt(json['score']),
    Util.parseStr(json['top_sender_name']) ?? '',
  );
}

RankingWeekStarGift _$RankingWeekStarGiftFromJson(Map<String, dynamic> json) {
  return RankingWeekStarGift(
    Util.parseInt(json['gift_id']),
    Util.parseStr(json['gift_name']) ?? '',
    Util.parseInt(json['fresh']),
  );
}

RankingWeekStarLastWeekTop _$RankingWeekStarLastWeekTopFromJson(
    Map<String, dynamic> json) {
  return RankingWeekStarLastWeekTop(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['type']) ?? '',
    Util.parseInt(json['gift_id']),
  );
}

RankingWeekStarData _$RankingWeekStarDataFromJson(Map<String, dynamic> json) {
  return RankingWeekStarData(
    Util.parseList(
        json['last_week_top'],
        (e) => Util.parseList(
            e,
            (ee) => RankingWeekStarLastWeekTop.fromJson(
                ee as Map<String, dynamic>))),
    Util.parseList(json['list'],
        (e) => RankingWeekStarItem.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['gifts'],
        (e) => RankingWeekStarGift.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['page']),
    Util.parseInt(json['more']),
  );
}

RankingWeekStarResponse _$RankingWeekStarResponseFromJson(
    Map<String, dynamic> json) {
  return RankingWeekStarResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : RankingWeekStarData.fromJson(json['data'] as Map<String, dynamic>),
  );
}
