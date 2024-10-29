// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatOrderData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataInfo _$DataInfoFromJson(Map<String, dynamic> json) {
  return DataInfo(
    Util.parseInt(json['vote']),
    Util.parseBool(json['godsr']),
    Util.parseStr(json['address']),
    Util.parseStr(json['addressId']),
    Util.parseStr(json['begin_time']),
    Util.parseStr(json['cid']),
    Util.parseStr(json['dateline']),
    Util.parseStr(json['deleted']),
    Util.parseStr(json['desc']),
    Util.parseStr(json['id']),
    Util.parseStr(json['is_new']),
    Util.parseStr(json['isappeal']),
    Util.parseStr(json['iscomplete']),
    Util.parseStr(json['ispay']),
    Util.parseStr(json['isvote']),
    Util.parseStr(json['money']),
    Util.parseStr(json['money_subsidy']),
    Util.parseStr(json['num']),
    Util.parseStr(json['pay_id']),
    Util.parseStr(json['pay_time']),
    Util.parseStr(json['price']),
    Util.parseStr(json['price_origin']),
    Util.parseStr(json['rate']),
    Util.parseStr(json['sid']),
    Util.parseStr(json['state']),
    Util.parseStr(json['to']),
    Util.parseStr(json['uid']),
    Util.parseStr(json['uint']),
    Util.parseStr(json['update_time']),
    Util.parseStr(json['version']),
    Util.parseList(
        json['_gift'], (e) => GiftInfo.fromJson(e as Map<String, dynamic>)),
    json['skill'] == null
        ? null
        : SkillInfo.fromJson(json['skill'] as Map<String, dynamic>),
    Util.parseInt(json['cancelTime']),
  );
}

Map<String, dynamic> _$DataInfoToJson(DataInfo instance) => <String, dynamic>{
      'vote': instance.vote,
      'godsr': instance.godsr,
      'address': instance.address,
      'addressId': instance.addressId,
      'begin_time': instance.begin_time,
      'cid': instance.cid,
      'dateline': instance.dateline,
      'deleted': instance.deleted,
      'desc': instance.desc,
      'id': instance.id,
      'is_new': instance.is_new,
      'isappeal': instance.isappeal,
      'iscomplete': instance.iscomplete,
      'ispay': instance.ispay,
      'isvote': instance.isvote,
      'money': instance.money,
      'money_subsidy': instance.money_subsidy,
      'num': instance.num,
      'pay_id': instance.pay_id,
      'pay_time': instance.pay_time,
      'price': instance.price,
      'price_origin': instance.price_origin,
      'rate': instance.rate,
      'sid': instance.sid,
      'state': instance.state,
      'to': instance.to,
      'uid': instance.uid,
      'uint': instance.uint,
      'update_time': instance.update_time,
      'version': instance.version,
      '_gift': instance.gift,
      'skill': instance.skill,
      'cancelTime': instance.cancelTime,
    };

SkillInfo _$SkillInfoFromJson(Map<String, dynamic> json) {
  return SkillInfo(
    Util.parseStr(json['_display']),
    Util.parseStr(json['_name']),
    Util.parseStr(json['audio_description']),
    Util.parseStr(json['audio_need']),
    Util.parseStr(json['auth']),
    Util.parseStr(json['cid']),
    Util.parseStr(json['cond']),
    Util.parseStr(json['cover_description']),
    Util.parseStr(json['deleted']),
    Util.parseStr(json['description']),
    Util.parseStr(json['dpath']),
    Util.parseStr(json['duration']),
    Util.parseStr(json['example']),
    Util.parseStr(json['free']),
    Util.parseStr(json['game_id_need']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['level']),
    Util.parseStr(json['name']),
    Util.parseStr(json['ordering']),
    Util.parseStr(json['pid']),
    Util.parseStr(json['pname']),
    Util.parseStr(json['price']),
    Util.parseStr(json['rate']),
    Util.parseStr(json['rid']),
    Util.parseStr(json['service_uid']),
    Util.parseStr(json['type']),
    Util.parseStr(json['types']),
    Util.parseStr(json['uint']),
    Util.parseStr(json['use_skill_cover']),
    Util.parseStr(json['video_description']),
    Util.parseStr(json['video_id']),
    Util.parseStr(json['video_need']),
  );
}

Map<String, dynamic> _$SkillInfoToJson(SkillInfo instance) => <String, dynamic>{
      '_display': instance.display,
      '_name': instance.orgname,
      'audio_description': instance.audio_description,
      'audio_need': instance.audio_need,
      'auth': instance.auth,
      'cid': instance.cid,
      'cond': instance.cond,
      'cover_description': instance.cover_description,
      'deleted': instance.deleted,
      'description': instance.description,
      'dpath': instance.dpath,
      'duration': instance.duration,
      'example': instance.example,
      'free': instance.free,
      'game_id_need': instance.game_id_need,
      'icon': instance.icon,
      'level': instance.level,
      'name': instance.name,
      'ordering': instance.ordering,
      'pid': instance.pid,
      'pname': instance.pname,
      'price': instance.price,
      'rate': instance.rate,
      'rid': instance.rid,
      'service_uid': instance.service_uid,
      'type': instance.type,
      'types': instance.types,
      'uint': instance.uint,
      'use_skill_cover': instance.use_skill_cover,
      'video_description': instance.video_description,
      'video_id': instance.video_id,
      'video_need': instance.video_need,
    };

GiftInfo _$GiftInfoFromJson(Map<String, dynamic> json) {
  return GiftInfo(
    Util.parseInt(json['gid']),
    Util.parseInt(json['num']),
    Util.parseInt(json['price']),
    Util.parseStr(json['name']),
  );
}

Map<String, dynamic> _$GiftInfoToJson(GiftInfo instance) => <String, dynamic>{
      'gid': instance.gid,
      'num': instance.num,
      'price': instance.price,
      'name': instance.name,
    };
