// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'love_letter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoveLetterListResponse _$LoveLetterListResponseFromJson(
    Map<String, dynamic> json) {
  return LoveLetterListResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    items: Util.parseList(json['list'],
            (e) => LoveLetterListItem.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

Map<String, dynamic> _$LoveLetterListResponseToJson(
        LoveLetterListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'list': instance.items,
    };

LoveLetterListItem _$LoveLetterListItemFromJson(Map<String, dynamic> json) {
  return LoveLetterListItem(
    Util.parseInt(json['uid']),
    Util.parseInt(json['cid']),
    Util.parseInt(json['letter_id']),
    Util.parseInt(json['propose_id']),
    Util.parseInt(json['create_time']),
    Util.parseBool(json['is_read']),
    Util.parseInt(json['status']),
    json['profile'] == null
        ? null
        : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    json['commodity'] == null
        ? null
        : Commodity.fromJson(json['commodity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoveLetterListItemToJson(LoveLetterListItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'cid': instance.cid,
      'letter_id': instance.letterId,
      'propose_id': instance.proposeId,
      'create_time': instance.sendTime,
      'is_read': instance.read,
      'status': instance.status,
      'profile': instance.profile,
      'commodity': instance.commodity,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'icon': instance.icon,
    };

Commodity _$CommodityFromJson(Map<String, dynamic> json) {
  return Commodity(
    Util.parseInt(json['id']),
    Util.parseInt(json['cid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['avatar']) ?? '',
    Util.parseStr(json['image']) ?? '',
  );
}

Map<String, dynamic> _$CommodityToJson(Commodity instance) => <String, dynamic>{
      'id': instance.id,
      'cid': instance.cid,
      'name': instance.name,
      'avatar': instance.avatar,
      'image': instance.image,
    };

Letter _$LetterFromJson(Map<String, dynamic> json) {
  return Letter(
    Util.parseInt(json['id']),
    Util.parseInt(json['propose_id']),
    Util.parseInt(json['uid']),
    Util.parseInt(json['to_uid']),
    Util.parseStr(json['content']) ?? '',
  );
}

Map<String, dynamic> _$LetterToJson(Letter instance) => <String, dynamic>{
      'id': instance.id,
      'propose_id': instance.proposeId,
      'uid': instance.uid,
      'to_uid': instance.toUid,
      'content': instance.content,
    };
