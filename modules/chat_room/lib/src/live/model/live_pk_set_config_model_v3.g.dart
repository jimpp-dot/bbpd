// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_pk_set_config_model_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivePKSetConfigModelV3 _$LivePKSetConfigModelV3FromJson(
    Map<String, dynamic> json) {
  return LivePKSetConfigModelV3(
    success: Util.parseBool(json['success']),
    msg: json['msg'],
    data: json['data'] == null
        ? null
        : LivePKInfo.fromJson(json['data'] as Map<String, dynamic>),
    systemPunishList: json['system_punish'],
  );
}

Map<String, dynamic> _$LivePKSetConfigModelV3ToJson(
        LivePKSetConfigModelV3 instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
      'system_punish': instance.systemPunishList,
    };

LivePKInfo _$LivePKInfoFromJson(Map<String, dynamic> json) {
  return LivePKInfo(
    Util.parseInt(json['id']),
    Util.parseInt(json['rid']),
    getAcceptPKInvitation(json['pk_status']),
    getAcceptFriendsPKInvitation(json['host_invite']),
    getEnableCoinGift(json['coin_enable']),
    Util.notNullStr(json['punish_content']),
    Util.notNullStr(json['create_time']),
    Util.parseInt(json['punish_id']),
    Util.notNullStr(json['pk_type']),
    Util.notNullStr(json['pk_time']),
  );
}

Map<String, dynamic> _$LivePKInfoToJson(LivePKInfo instance) =>
    <String, dynamic>{
      'id': instance.configId,
      'rid': instance.rid,
      'pk_status': _$AcceptPKInvitationEnumMap[instance.acceptPKInvitation],
      'host_invite':
          _$AcceptFriendsPKInvitationEnumMap[instance.acceptPKHostInvitation],
      'coin_enable': _$EnableCoinGiftEnumMap[instance.enableCoinGift],
      'pk_type': instance.punishType,
      'punish_id': instance.punishId,
      'punish_content': instance.punishContent,
      'create_time': instance.createTime,
      'pk_time': instance.pkTime,
    };

const _$AcceptPKInvitationEnumMap = {
  AcceptPKInvitation.Accept: 'Accept',
  AcceptPKInvitation.NoAccept: 'NoAccept',
};

const _$AcceptFriendsPKInvitationEnumMap = {
  AcceptFriendsPKInvitation.Accept: 'Accept',
  AcceptFriendsPKInvitation.NoAccept: 'NoAccept',
  AcceptFriendsPKInvitation.Disable: 'Disable',
};

const _$EnableCoinGiftEnumMap = {
  EnableCoinGift.Enable: 'Enable',
  EnableCoinGift.NoEnable: 'NoEnable',
};

SystemPunish _$SystemPunishFromJson(Map<String, dynamic> json) {
  return SystemPunish(
    Util.notNullStr(json['name']),
    Util.parseInt(json['icon']),
    Util.notNullStr(json['type']),
    Util.notNullStr(json['time']),
    Util.parseList(json['content'], (e) => Util.notNullStr(e)),
    Util.notNullStr(json['create_time']),
    Util.parseInt(json['id']),
  );
}

Map<String, dynamic> _$SystemPunishToJson(SystemPunish instance) =>
    <String, dynamic>{
      'id': instance.punishId,
      'name': instance.name,
      'icon': instance.icon,
      'content': instance.punishContent,
      'create_time': instance.createTime,
      'time': instance.time,
      'type': instance.type,
    };
