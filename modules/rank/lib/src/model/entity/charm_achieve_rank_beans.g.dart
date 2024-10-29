// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charm_achieve_rank_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharmAchieveRankItem _$CharmAchieveRankItemFromJson(Map<String, dynamic> json) {
  return CharmAchieveRankItem(
    Util.parseInt(json['uid']),
    Util.parseInt(json['rank']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['score']),
    Util.parseInt(json['title']),
    Util.parseInt(json['title_new']),
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['popularity_level']),
  );
}

Map<String, dynamic> _$CharmAchieveRankItemToJson(
        CharmAchieveRankItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'rank': instance.rank,
      'name': instance.name,
      'icon': instance.icon,
      'score': instance.score,
      'title': instance.title,
      'title_new': instance.titleNew,
      'vip_level': instance.vipLevel,
      'popularity_level': instance.popularityLevel,
    };

CharmAchieveMyRankItem _$CharmAchieveMyRankItemFromJson(
    Map<String, dynamic> json) {
  return CharmAchieveMyRankItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['score']),
    Util.parseInt(json['title']),
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['popularity_level']),
    Util.parseInt(json['before_diff']),
    Util.parseStr(json['rank']) ?? '',
  );
}

Map<String, dynamic> _$CharmAchieveMyRankItemToJson(
        CharmAchieveMyRankItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'rank': instance.rank,
      'name': instance.name,
      'icon': instance.icon,
      'score': instance.score,
      'title': instance.title,
      'vip_level': instance.vipLevel,
      'popularity_level': instance.popularityLevel,
      'before_diff': instance.beforeDiff,
    };

CharmAchieveRankTopItem _$CharmAchieveRankTopItemFromJson(
    Map<String, dynamic> json) {
  return CharmAchieveRankTopItem(
    Util.parseInt(json['uid']),
    Util.parseInt(json['rank']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['score']),
    Util.parseInt(json['title']),
    Util.parseInt(json['title_new']),
    Util.parseInt(json['vip_level']),
    Util.parseInt(json['popularity_level']),
    Util.parseInt(json['number1_times']),
  );
}

Map<String, dynamic> _$CharmAchieveRankTopItemToJson(
        CharmAchieveRankTopItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'rank': instance.rank,
      'name': instance.name,
      'icon': instance.icon,
      'score': instance.score,
      'title': instance.title,
      'title_new': instance.titleNew,
      'vip_level': instance.vipLevel,
      'popularity_level': instance.popularityLevel,
      'number1_times': instance.topDays,
    };

CharmAchieveRankPrizeItem _$CharmAchieveRankPrizeItemFromJson(
    Map<String, dynamic> json) {
  return CharmAchieveRankPrizeItem(
    Util.parseInt(json['cid']),
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['image']) ?? '',
  );
}

Map<String, dynamic> _$CharmAchieveRankPrizeItemToJson(
        CharmAchieveRankPrizeItem instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'type': instance.type,
      'image': instance.image,
    };

CharmAchieveRankResponse _$CharmAchieveRankResponseFromJson(
    Map<String, dynamic> json) {
  return CharmAchieveRankResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    topItem: json['number1'] == null
        ? null
        : CharmAchieveRankTopItem.fromJson(
            json['number1'] as Map<String, dynamic>),
    items: Util.parseList(json['list'],
        (e) => CharmAchieveRankItem.fromJson(e as Map<String, dynamic>)),
    my: json['my'] == null
        ? null
        : CharmAchieveMyRankItem.fromJson(json['my'] as Map<String, dynamic>),
    awards: (json['awards'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k,
          Util.parseList(
              e,
              (ee) => CharmAchieveRankPrizeItem.fromJson(
                  ee as Map<String, dynamic>))),
    ),
  );
}

Map<String, dynamic> _$CharmAchieveRankResponseToJson(
        CharmAchieveRankResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'number1': instance.topItem,
      'list': instance.items,
      'my': instance.my,
      'awards': instance.awards,
    };

RankFameHallItem _$RankFameHallItemFromJson(Map<String, dynamic> json) {
  return RankFameHallItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['date']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
  );
}

Map<String, dynamic> _$RankFameHallItemToJson(RankFameHallItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'date': instance.date,
      'name': instance.name,
      'icon': instance.icon,
    };

RankFameHallResponse _$RankFameHallResponseFromJson(Map<String, dynamic> json) {
  return RankFameHallResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    items: Util.parseList(json['list'],
        (e) => RankFameHallItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$RankFameHallResponseToJson(
        RankFameHallResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'list': instance.items,
    };
