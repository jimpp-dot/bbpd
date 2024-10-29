// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atmosphere_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AtmosphereResp _$AtmosphereRespFromJson(Map<String, dynamic> json) {
  return AtmosphereResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : AtmosphereData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AtmosphereRespToJson(AtmosphereResp instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

AtmosphereData _$AtmosphereDataFromJson(Map<String, dynamic> json) {
  return AtmosphereData(
    atmosphereList: Util.parseList(json['atmosphere_list'],
        (e) => AtmosphereListItem.fromJson(e as Map<String, dynamic>)),
    atmosphereInfo: json['room_atmosphere_info'] == null
        ? null
        : AtmosphereInfo.fromJson(
            json['room_atmosphere_info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AtmosphereDataToJson(AtmosphereData instance) =>
    <String, dynamic>{
      'atmosphere_list': instance.atmosphereList,
      'room_atmosphere_info': instance.atmosphereInfo,
    };

AtmosphereListItem _$AtmosphereListItemFromJson(Map<String, dynamic> json) {
  return AtmosphereListItem(
    id: Util.parseInt(json['id']),
    name: Util.notNullStr(json['name']),
    cover: Util.notNullStr(json['cover']),
    music: Util.notNullStr(json['music']),
  );
}

Map<String, dynamic> _$AtmosphereListItemToJson(AtmosphereListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover': instance.cover,
      'music': instance.music,
    };

AtmosphereInfo _$AtmosphereInfoFromJson(Map<String, dynamic> json) {
  return AtmosphereInfo(
    atmId: Util.parseInt(json['atm_id']),
    isUseBg: Util.parseInt(json['is_use_bg']),
    isUseMusic: Util.parseInt(json['is_use_music']),
  );
}

Map<String, dynamic> _$AtmosphereInfoToJson(AtmosphereInfo instance) =>
    <String, dynamic>{
      'atm_id': instance.atmId,
      'is_use_bg': instance.isUseBg,
      'is_use_music': instance.isUseMusic,
    };
