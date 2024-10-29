// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_anchor_rank_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubAnchorRankItem _$ClubAnchorRankItemFromJson(Map<String, dynamic> json) {
  return ClubAnchorRankItem(
    Util.parseInt(json['uid']),
    Util.parseInt(json['rank']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['text']),
    Util.parseInt(json['title_new']),
    Util.parseInt(json['vip_level']),
  );
}

Map<String, dynamic> _$ClubAnchorRankItemToJson(ClubAnchorRankItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'rank': instance.rank,
      'name': instance.name,
      'icon': instance.icon,
      'text': instance.text,
      'title_new': instance.titleNew,
      'vip_level': instance.vipLevel,
    };

ClubAnchorRankResponse _$ClubAnchorRankResponseFromJson(
    Map<String, dynamic> json) {
  return ClubAnchorRankResponse(
    items: Util.parseList(json['items'],
        (e) => ClubAnchorRankItem.fromJson(e as Map<String, dynamic>)),
    me: json['me'] == null
        ? null
        : ClubAnchorRankItem.fromJson(json['me'] as Map<String, dynamic>),
    help: Util.parseStr(json['help']),
  );
}

Map<String, dynamic> _$ClubAnchorRankResponseToJson(
        ClubAnchorRankResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'me': instance.me,
      'help': instance.help,
    };
