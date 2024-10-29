// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_pk_invite_friend_model_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivePkInviteFriendModelV3 _$LivePkInviteFriendModelV3FromJson(
    Map<String, dynamic> json) {
  return LivePkInviteFriendModelV3(
    success: Util.parseBool(json['success']),
    msg: json['msg'],
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LivePkInviteFriendModelV3ToJson(
        LivePkInviteFriendModelV3 instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    Util.parseList(json['data'],
        (e) => LivePKInviteFriendItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.data,
    };

LivePKInviteFriendItem _$LivePKInviteFriendItemFromJson(
    Map<String, dynamic> json) {
  return LivePKInviteFriendItem(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['online_num']),
    Util.parseInt(json['real']),
    getLivePKStatus(json['status']),
    Util.parseInt(json['rid']),
  );
}

Map<String, dynamic> _$LivePKInviteFriendItemToJson(
        LivePKInviteFriendItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'rid': instance.rid,
      'name': instance.name,
      'icon': instance.icon,
      'sex': instance.sex,
      'online_num': instance.onlineNum,
      'real': instance.charm,
      'status': _$LivePKStatusEnumMap[instance.pkStatus],
    };

const _$LivePKStatusEnumMap = {
  LivePKStatus.NoBroadcast: 'NoBroadcast',
  LivePKStatus.CanPK: 'CanPK',
  LivePKStatus.PKing: 'PKing',
  LivePKStatus.NoPK: 'NoPK',
};
