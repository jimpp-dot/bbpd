// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digit_bomb_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DigitBombInfoResp _$DigitBombInfoRespFromJson(Map<String, dynamic> json) {
  return DigitBombInfoResp(
    success: Util.parseBool(json['success']),
    msg: json['msg'],
    data: json['data'] == null
        ? null
        : DigitBombInfoData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DigitBombInfoRespToJson(DigitBombInfoResp instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

DigitBombInfoData _$DigitBombInfoDataFromJson(Map<String, dynamic> json) {
  return DigitBombInfoData(
    Util.parseInt(json['id']),
    Util.parseInt(json['uid']),
    Util.parseInt(json['rid']),
    Util.parseInt(json['min']),
    Util.parseInt(json['max']),
    Util.parseInt(json['bomb']),
    Util.parseInt(json['cmin']),
    Util.parseInt(json['cmax']),
    Util.parseInt(json['lastdigit']),
    Util.parseInt(json['level']),
    Util.parseInt(json['position']),
    Util.parseInt(json['player']),
    Util.notNullStr(json['player_icon']),
    parseDigitBombStatus(json['status']),
    Util.notNullStr(json['player_name']),
  );
}

Map<String, dynamic> _$DigitBombInfoDataToJson(DigitBombInfoData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'rid': instance.rid,
      'min': instance.min,
      'max': instance.max,
      'bomb': instance.bomb,
      'cmin': instance.cmin,
      'cmax': instance.cmax,
      'lastdigit': instance.lastDigit,
      'level': instance.level,
      'position': instance.position,
      'player': instance.player,
      'player_icon': instance.playerIcon,
      'player_name': instance.playerName,
      'status': _$DigitBombStatusEnumMap[instance.status],
    };

const _$DigitBombStatusEnumMap = {
  DigitBombStatus.over: 'over',
  DigitBombStatus.wait: 'wait',
  DigitBombStatus.playing: 'playing',
  DigitBombStatus.bomb: 'bomb',
};
