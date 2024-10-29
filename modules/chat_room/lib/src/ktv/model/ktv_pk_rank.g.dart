// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ktv_pk_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KtvPkRankConfig _$KtvPkRankConfigFromJson(Map<String, dynamic> json) {
  return KtvPkRankConfig(
    Util.parseInt(json['pk_mode']),
    Util.parseInt(json['on_mic_uid']),
    Util.parseInt(json['before_score']),
    Util.parseInt(json['current_score']),
    Util.parseInt(json['chorus_uid']),
    Util.parseInt(json['chorus_before_score']),
    Util.parseInt(json['chorus_current_score']),
  );
}

KtvPkRankEventData _$KtvPkRankEventDataFromJson(Map<String, dynamic> json) {
  return KtvPkRankEventData(
    Util.notNullStr(json['anim_img']),
    Util.parseList(json['list'],
        (e) => KtvPkRankEventItem.fromJson(e as Map<String, dynamic>)),
  );
}

KtvPkRankEventItem _$KtvPkRankEventItemFromJson(Map<String, dynamic> json) {
  return KtvPkRankEventItem(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.parseInt(json['rank']),
    Util.parseInt(json['score']),
  );
}

KtvPkScoreEventData _$KtvPkScoreEventDataFromJson(Map<String, dynamic> json) {
  return KtvPkScoreEventData(
    Util.parseInt(json['on_mic_uid']),
    Util.parseInt(json['before_score']),
    Util.parseInt(json['current_score']),
  );
}
