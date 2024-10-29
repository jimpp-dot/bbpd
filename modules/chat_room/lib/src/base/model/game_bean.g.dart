// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudGameData _$CloudGameDataFromJson(Map<String, dynamic> json) {
  return CloudGameData(
    CloudGameData.parseState(json['state']),
    json['game_info'] == null
        ? null
        : CloudGameBean.fromJson(json['game_info'] as Map<String, dynamic>),
    json['queue_info'] == null
        ? null
        : CloudGameQueueInfo.fromJson(
            json['queue_info'] as Map<String, dynamic>),
  );
}

CloudGameBean _$CloudGameBeanFromJson(Map<String, dynamic> json) {
  return CloudGameBean(
    Util.notNullStr(json['id']),
    Util.parseInt(json['cgi_id']),
    Util.notNullStr(json['name']),
    Util.getRemoteImgUrl(Util.parseStr(json['icon'])),
    Util.getRemoteImgUrl(Util.parseStr(json['landscape_icon'])),
    Util.notNullStr(json['live_url']),
    Util.parseList(json['tag'], (e) => Util.notNullStr(e)),
    Util.parseList(
        json['user_list'], (e) => GameUser.fromJson(e as Map<String, dynamic>)),
    Util.parseBool(json['archive_support']),
    Util.parseBool(json['hide_mouse']),
    _$enumDecodeNullable(_$CloudGameTypeEnumMap, json['game_type'],
        unknownValue: CloudGameType.single),
    _$enumDecodeNullable(_$GameVendorEnumMap, json['vendor'],
        unknownValue: GameVendor.tencent),
    json['authentication'] == null
        ? null
        : HaimaConfig.fromJson(json['authentication'] as Map<String, dynamic>),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  required T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value =
      enumValues.entries.firstWhereOrNull((e) => e.value == source)?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  required T unknownValue,
}) {
  if (source == null) {
    return unknownValue;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$CloudGameTypeEnumMap = {
  CloudGameType.single: 'single',
  CloudGameType.multi: 'multi',
};

const _$GameVendorEnumMap = {
  GameVendor.tencent: 'tencent',
  GameVendor.haima: 'haima',
};

GameUser _$GameUserFromJson(Map<String, dynamic> json) {
  return GameUser(
    Util.parseInt(json['uid']),
    Util.parseInt(json['role_index']),
    Util.parseBool(json['want_play_cloud_game']),
  );
}

CloudGameQueueInfo _$CloudGameQueueInfoFromJson(Map<String, dynamic> json) {
  return CloudGameQueueInfo(
    Util.parseInt(json['id']),
    Util.parseInt(json['rank']),
    Util.parseInt(json['time']),
    Util.parseInt(json['remain_duration']),
    Util.notNullStr(json['queue_type']),
    Util.parseInt(json['defeated']),
  );
}

DefeatedNum _$DefeatedNumFromJson(Map<String, dynamic> json) {
  return DefeatedNum(
    Util.parseInt(json['defeated']),
  );
}

HaimaConfig _$HaimaConfigFromJson(Map<String, dynamic> json) {
  return HaimaConfig(
    Util.notNullStr(json['bid']),
    Util.notNullStr(json['channel_id']),
    Util.notNullStr(json['c_token']),
    Util.notNullStr(json['game_channel']),
    Util.notNullStr(json['game_pkg']),
    Util.notNullStr(json['cid']),
    Util.notNullStr(json['pin_code']),
    Util.parseInt(json['stream_type']),
  );
}

Map<String, dynamic> _$HaimaConfigToJson(HaimaConfig instance) =>
    <String, dynamic>{
      'bid': instance.bid,
      'channel_id': instance.channelId,
      'c_token': instance.cToken,
      'game_channel': instance.gameChannel,
      'game_pkg': instance.gamePkg,
      'cid': instance.cid,
      'pin_code': instance.pinCode,
      'stream_type': instance.streamType,
    };

CloudGameRcmdRoomData _$CloudGameRcmdRoomDataFromJson(
    Map<String, dynamic> json) {
  return CloudGameRcmdRoomData(
    Util.parseInt(json['rid']),
    Util.notNullStr(json['type']),
  );
}
