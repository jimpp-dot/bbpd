// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pk_rank_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PkDailyRankResponse _$PkDailyRankResponseFromJson(Map<String, dynamic> json) {
  return PkDailyRankResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    topItem: json['prevNo1'] == null
        ? null
        : PkDailyRankTopItem.fromJson(json['prevNo1'] as Map<String, dynamic>),
    items: Util.parseList(json['list'],
        (e) => PkDailyRankItem.fromJson(e as Map<String, dynamic>)),
    total: Util.parseInt(json['total']),
    headerFrame: json['icons'] == null
        ? null
        : HeaderFrame.fromJson(json['icons'] as Map<String, dynamic>),
    anchorInfoItem: json['my'] == null
        ? null
        : PkAnchorInfoItem.fromJson(json['my'] as Map<String, dynamic>),
    hasMore: Util.parseBool(json['more'], true),
  );
}

Map<String, dynamic> _$PkDailyRankResponseToJson(
        PkDailyRankResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'prevNo1': instance.topItem,
      'my': instance.anchorInfoItem,
      'list': instance.items,
      'total': instance.total,
      'icons': instance.headerFrame,
      'more': instance.hasMore,
    };

PkDailyRankItem _$PkDailyRankItemFromJson(Map<String, dynamic> json) {
  return PkDailyRankItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['score']),
    Util.parseInt(json['con_win']),
  );
}

Map<String, dynamic> _$PkDailyRankItemToJson(PkDailyRankItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'score': instance.score,
      'con_win': instance.winStreak,
    };

HeaderFrame _$HeaderFrameFromJson(Map<String, dynamic> json) {
  return HeaderFrame(
    Util.parseStr(json['1']) ?? '',
    Util.parseStr(json['2']) ?? '',
    Util.parseStr(json['3']) ?? '',
    Util.parseStr(json['4']) ?? '',
  );
}

Map<String, dynamic> _$HeaderFrameToJson(HeaderFrame instance) =>
    <String, dynamic>{
      '1': instance.firstFrame,
      '2': instance.secondFrame,
      '3': instance.thirdFrame,
      '4': instance.famousFrame,
    };

PkAnchorInfoItem _$PkAnchorInfoItemFromJson(Map<String, dynamic> json) {
  return PkAnchorInfoItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['order']),
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['con_win']),
    Util.parseInt(json['score']),
    Util.parseInt(json['win']),
    Util.parseInt(json['total']),
  );
}

Map<String, dynamic> _$PkAnchorInfoItemToJson(PkAnchorInfoItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'order': instance.order,
      'name': instance.name,
      'icon': instance.icon,
      'con_win': instance.winStreak,
      'score': instance.score,
      'win': instance.winNumber,
      'total': instance.total,
    };

PkDailyRankTopItem _$PkDailyRankTopItemFromJson(Map<String, dynamic> json) {
  return PkDailyRankTopItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseInt(json['score']),
    Util.parseInt(json['con_win']),
    Util.parseInt(json['max(id)']),
  );
}

Map<String, dynamic> _$PkDailyRankTopItemToJson(PkDailyRankTopItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
      'score': instance.score,
      'con_win': instance.winStreak,
      'max(id)': instance.topDays,
    };

PkDailyStarItem _$PkDailyStarItemFromJson(Map<String, dynamic> json) {
  return PkDailyStarItem(
    Util.parseInt(json['uid']),
    Util.parseStr(json['daily']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
  );
}

Map<String, dynamic> _$PkDailyStarItemToJson(PkDailyStarItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'daily': instance.date,
      'name': instance.name,
      'icon': instance.icon,
    };

PkDailyStarResponse _$PkDailyStarResponseFromJson(Map<String, dynamic> json) {
  return PkDailyStarResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    items: Util.parseList(json['data'],
        (e) => PkDailyStarItem.fromJson(e as Map<String, dynamic>)),
    hasMore: Util.parseBool(json['more'], true),
  );
}

Map<String, dynamic> _$PkDailyStarResponseToJson(
        PkDailyStarResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.items,
      'more': instance.hasMore,
    };

PkHistoryMyInfo _$PkHistoryMyInfoFromJson(Map<String, dynamic> json) {
  return PkHistoryMyInfo(
    Util.parseInt(json['total']),
    Util.parseInt(json['win']),
  );
}

Map<String, dynamic> _$PkHistoryMyInfoToJson(PkHistoryMyInfo instance) =>
    <String, dynamic>{
      'total': instance.total,
      'win': instance.winRate,
    };

PkHistoryItem _$PkHistoryItemFromJson(Map<String, dynamic> json) {
  return PkHistoryItem(
    Util.parseInt(json['uid']),
    Util.parseInt(json['compete_uid']),
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['compete_icon']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['compete_name']) ?? '',
    Util.parseInt(json['score']),
    Util.parseInt(json['compete_score']),
    Util.parseStr(json['punish_content']) ?? '',
    Util.parseInt(json['pk_time']),
    Util.parseInt(json['win']),
  );
}

Map<String, dynamic> _$PkHistoryItemToJson(PkHistoryItem instance) =>
    <String, dynamic>{
      'uid': instance.anchorUid,
      'compete_uid': instance.competeUid,
      'icon': instance.anchorIcon,
      'compete_icon': instance.competeIcon,
      'name': instance.anchorName,
      'compete_name': instance.competeName,
      'score': instance.anchorScore,
      'compete_score': instance.competeScore,
      'punish_content': instance.punishContent,
      'pk_time': instance.pkTime,
      'win': instance.win,
    };

PkHistoryResponse _$PkHistoryResponseFromJson(Map<String, dynamic> json) {
  return PkHistoryResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    items: Util.parseList(
        json['list'], (e) => PkHistoryItem.fromJson(e as Map<String, dynamic>)),
    myInfo: json['my'] == null
        ? null
        : PkHistoryMyInfo.fromJson(json['my'] as Map<String, dynamic>),
    hasMore: Util.parseBool(json['more'], true),
  );
}

Map<String, dynamic> _$PkHistoryResponseToJson(PkHistoryResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'list': instance.items,
      'my': instance.myInfo,
      'more': instance.hasMore,
    };
