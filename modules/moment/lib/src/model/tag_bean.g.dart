// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagCate _$TagCateFromJson(Map<String, dynamic> json) {
  return TagCate(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']),
    Util.parseList(
        json['sub'], (e) => TagCate.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$TagCateToJson(TagCate instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sub': instance.sub,
    };

TagDetail _$TagDetailFromJson(Map<String, dynamic> json) {
  return TagDetail(
      Util.parseList(json['tags'], (e) => Util.parseStr(e) ?? ''),
      Util.parseBool(json['is_circle_white_list']),
      Util.parseBool(json['is_circle_at_account_white_list']),
      Util.parseInt(json['need_verify_new']));
}

Map<String, dynamic> _$TagDetailToJson(TagDetail instance) => <String, dynamic>{
      'tags': instance.tags,
      'is_circle_white_list': instance.isCircleWhiteList,
      'is_circle_at_account_white_list': instance.isCircleAtAccountWhiteList,
    };

MomentTags _$MomentTagsFromJson(Map<String, dynamic> json) {
  return MomentTags(
    tags: Util.parseList(json['tags'], (e) => Util.parseStr(e) ?? ''),
  );
}

Map<String, dynamic> _$MomentTagsToJson(MomentTags instance) =>
    <String, dynamic>{
      'tags': instance.tags,
    };

TagInfo _$TagInfoFromJson(Map<String, dynamic> json) {
  return TagInfo(
      Util.parseInt(json['id']),
      Util.parseStr(json['name']),
      Util.parseStr(json['bgimg']),
      Util.parseInt(json['user_num']),
      Util.parseList(json['icons'], (e) => Util.parseStr(e) ?? ''),
      Util.parseInt(json['isFollow']),
      Util.parseStr(json['rcmd_name']));
}

Map<String, dynamic> _$TagInfoToJson(TagInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bgimg': instance.bgImg,
      'user_num': instance.userNum,
      'icons': instance.avatarUrls,
      'isFollow': instance.isFollow,
      'rcmd_name': instance.desc
    };

PlayTag _$PlayTagFromJson(Map<String, dynamic> json) {
  return PlayTag(
    Util.parseStr(json['name']),
    Util.parseStr(json['mode']),
    Util.parseStr(json['srv']),
    Util.parseStr(json['level']),
    Util.parseStr(json['type']),
    Util.parseInt(json['id']),
  );
}

Map<String, dynamic> _$PlayTagToJson(PlayTag instance) => <String, dynamic>{
      'name': instance.name,
      'mode': instance.mode,
      'srv': instance.srv,
      'level': instance.level,
      'type': instance.type,
      'id': instance.id,
    };

NormalTag _$NormalTagFromJson(Map<String, dynamic> json) {
  return NormalTag(
    Util.parseInt(json['id']),
    Util.parseStr(json['tag']),
  );
}

Map<String, dynamic> _$NormalTagToJson(NormalTag instance) => <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
    };

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
    Util.parseStr(json['gname']),
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['certify']),
    Util.parseStr(json['bgicon']),
  );
}

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'gname': instance.gname,
      'name': instance.name,
      'icon': instance.icon,
      'certify': instance.certify,
      'bgicon': instance.bgicon,
    };

AppraiserTag _$AppraiserTagFromJson(Map<String, dynamic> json) {
  return AppraiserTag(
    Util.parseInt(json['id']),
    Util.parseStr(json['tag']),
  );
}

Map<String, dynamic> _$AppraiserTagToJson(AppraiserTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
    };

BroadcastTag _$BroadcastTagFromJson(Map<String, dynamic> json) {
  return BroadcastTag(
    Util.parseInt(json['tag_id']),
    Util.parseStr(json['tag_name']),
  );
}

Map<String, dynamic> _$BroadcastTagToJson(BroadcastTag instance) =>
    <String, dynamic>{
      'tag_id': instance.id,
      'tag_name': instance.tag,
    };

WeddingTag _$WeddingTagFromJson(Map<String, dynamic> json) {
  return WeddingTag(
    Util.parseInt(json['id']),
    json['card'] == null
        ? null
        : WeddingCard.fromJson(json['card'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeddingTagToJson(WeddingTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card': instance.card,
    };

WeddingCard _$WeddingCardFromJson(Map<String, dynamic> json) {
  return WeddingCard(
    Util.parseInt(json['wid']),
    Util.parseInt(json['time']),
    Util.parseStr(json['man_uid']),
    Util.parseStr(json['man_icon']),
    Util.parseStr(json['man_name']),
    Util.parseStr(json['woman_uid']),
    Util.parseStr(json['woman_icon']),
    Util.parseStr(json['woman_name']),
    Util.parseStr(json['tag_name']),
  );
}

Map<String, dynamic> _$WeddingCardToJson(WeddingCard instance) =>
    <String, dynamic>{
      'wid': instance.wid,
      'time': instance.time,
      'man_uid': instance.manUid,
      'man_icon': instance.manIcon,
      'man_name': instance.manName,
      'woman_uid': instance.womanUid,
      'woman_icon': instance.womanIcon,
      'woman_name': instance.womanName,
      'tag_name': instance.tagName,
    };

TagsCase _$TagsCaseFromJson(Map<String, dynamic> json) {
  return TagsCase(
    Util.parseInt(json['id']),
    Util.parseStr(json['tag']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['user_count']),
    Util.parseInt(json['comment_count']),
  );
}

Map<String, dynamic> _$TagsCaseToJson(TagsCase instance) => <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'icon': instance.icon,
      'user_count': instance.userCount,
      'comment_count': instance.commentCount,
    };

GoodVoiceTag _$GoodVoiceTagFromJson(Map<String, dynamic> json) {
  return GoodVoiceTag(
    Util.parseInt(json['id']),
    json['card'] == null
        ? null
        : TagsGoodVoice.fromJson(json['card'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GoodVoiceTagToJson(GoodVoiceTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card': instance.card,
    };

TagsGoodVoice _$TagsGoodVoiceFromJson(Map<String, dynamic> json) {
  return TagsGoodVoice(
    vid: Util.parseInt(json['vid']),
    name: Util.parseStr(json['name']),
    info: Util.parseStr(json['info']),
    icon: Util.parseStr(json['icon']),
    vUrl: Util.parseStr(json['v_url']),
    userName: Util.parseStr(json['tag_name']),
  );
}

Map<String, dynamic> _$TagsGoodVoiceToJson(TagsGoodVoice instance) =>
    <String, dynamic>{
      'vid': instance.vid,
      'name': instance.name,
      'info': instance.info,
      'icon': instance.icon,
      'v_url': instance.vUrl,
      'tag_name': instance.userName,
    };
