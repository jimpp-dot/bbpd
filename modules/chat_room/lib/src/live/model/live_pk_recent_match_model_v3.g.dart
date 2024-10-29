// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_pk_recent_match_model_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivePKRecentMatchModelV3 _$LivePKRecentMatchModelV3FromJson(
    Map<String, dynamic> json) {
  return LivePKRecentMatchModelV3(
    success: Util.parseBool(json['success']),
    msg: json['msg'],
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LivePKRecentMatchModelV3ToJson(
        LivePKRecentMatchModelV3 instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    Util.parseList(json['data'],
        (e) => LivePKRecentItem.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.data,
    };

LivePKRecentItem _$LivePKRecentItemFromJson(Map<String, dynamic> json) {
  return LivePKRecentItem(
    uid: Util.parseInt(json['uid']),
    name: Util.notNullStr(json['name']),
    icon: Util.notNullStr(json['icon']),
    sex: Util.parseInt(json['sex']),
    mainScore: Util.parseInt(json['my_score']),
    competeScore: Util.parseInt(json['his_score']),
    lastMatchTime: Util.parseInt(json['create_time']),
    rid: Util.parseInt(json['rid']),
    pkStatus: getLivePKStatus(json['status']),
  );
}

Map<String, dynamic> _$LivePKRecentItemToJson(LivePKRecentItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'rid': instance.rid,
      'name': instance.name,
      'icon': instance.icon,
      'sex': instance.sex,
      'my_score': instance.mainScore,
      'his_score': instance.competeScore,
      'create_time': instance.lastMatchTime,
      'status': _$LivePKStatusEnumMap[instance.pkStatus],
    };

const _$LivePKStatusEnumMap = {
  LivePKStatus.NoBroadcast: 'NoBroadcast',
  LivePKStatus.CanPK: 'CanPK',
  LivePKStatus.PKing: 'PKing',
  LivePKStatus.NoPK: 'NoPK',
};
