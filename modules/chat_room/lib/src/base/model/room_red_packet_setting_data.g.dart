// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_red_packet_setting_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomRedPacketSettingData _$RoomRedPacketSettingDataFromJson(
    Map<String, dynamic> json) {
  return RoomRedPacketSettingData(
    Util.parseBool(json['success']),
    Util.parseInt(json['money']),
    json['config'] == null
        ? null
        : _SettingConfig.fromJson(json['config'] as Map<String, dynamic>),
    json['data'] == null
        ? null
        : _RedPacketData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

_SettingConfig _$_SettingConfigFromJson(Map<String, dynamic> json) {
  return _SettingConfig(
      Util.parseList(json['total'], (e) => Util.parseInt(e)),
      Util.parseList(json['per'], (e) => Util.parseInt(e)),
      Util.parseList(json['period'], (e) => Util.parseInt(e)),
      Util.parseList(json['stay'], (e) => Util.parseInt(e)));
}

_RedPacketData _$_RedPacketDataFromJson(Map<String, dynamic> json) {
  return _RedPacketData(
    Util.parseInt(json['id']),
    Util.parseInt(json['sender']),
    Util.parseInt(json['money']),
    Util.parseInt(json['money_send']),
    Util.parseInt(json['total']),
    Util.parseInt(json['num']),
    Util.parseInt(json['period_end']),
  );
}
