// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_rush_prize_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankRushPrizeResponse _$RankRushPrizeResponseFromJson(
    Map<String, dynamic> json) {
  return RankRushPrizeResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    awards: (json['awards'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k,
          Util.parseList(e,
              (ee) => ShopMailCommodity.fromJson(ee as Map<String, dynamic>))),
    ),
    newAwards: json['new_awards'] == null
        ? null
        : RankRushPrizeNewAwards.fromJson(
            json['new_awards'] as Map<String, dynamic>),
    top: Util.parseInt(json['top']),
  );
}

RankRushPrizeNewAwards _$RankRushPrizeNewAwardsFromJson(
    Map<String, dynamic> json) {
  return RankRushPrizeNewAwards(
    type: Util.parseStr(json['type']) ?? '',
    num: Util.parseInt(json['num']),
    desc: Util.parseStr(json['desc']) ?? '',
    image: Util.parseStr(json['image']) ?? '',
    imageBg: Util.parseStr(json['image_bg']) ?? '',
  );
}

Map<String, dynamic> _$RankRushPrizeResponseToJson(
        RankRushPrizeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'awards': instance.awards,
    };
