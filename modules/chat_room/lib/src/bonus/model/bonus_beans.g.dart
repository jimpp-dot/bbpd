// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonusData _$BonusDataFromJson(Map<String, dynamic> json) {
  return BonusData(
    Util.parseInt(json['count']),
    json['packet'] == null
        ? null
        : BonusInfo.fromJson(json['packet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BonusDataToJson(BonusData instance) => <String, dynamic>{
      'count': instance.count,
      'packet': instance.curBonus,
    };

BonusInfo _$BonusInfoFromJson(Map<String, dynamic> json) {
  return BonusInfo(
    Util.parseInt(json['id']),
    Util.parseIcon(json['icon']),
    _$enumDecodeNullable(_$BonusStateEnumMap, json['state']),
    Util.parseInt(json['time']),
    Util.parseStr(json['sign']),
    Util.parseBool(json['grabbed']),
  );
}

Map<String, dynamic> _$BonusInfoToJson(BonusInfo instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'state': _$BonusStateEnumMap[instance.state],
      'time': instance.grabTime,
      'sign': instance.sign,
      'grabbed': instance.grabbed,
    };

T? _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  T? value;
  try {
    value = enumValues.entries.singleWhere((e) => e.value == source).key;
  } catch (e) {}

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T? _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BonusStateEnumMap = {
  BonusState.pending: 'pending',
  BonusState.grab: 'grab',
  BonusState.finish: 'finish',
  BonusState.expire: 'expire',
};

BonusPreview _$BonusPreviewFromJson(Map<String, dynamic> json) {
  return BonusPreview(
    Util.parseInt(json['id']),
    Util.parseIcon(json['icon']),
    _$enumDecodeNullable(_$BonusStateEnumMap, json['state']),
    Util.parseInt(json['time']),
    Util.parseStr(json['sign']),
    Util.parseBool(json['grabbed']),
    json['creator'] == null
        ? null
        : BonusUser.fromJson(json['creator'] as Map<String, dynamic>),
    json['cond'] == null
        ? null
        : BonusCondition.fromJson(json['cond'] as Map<String, dynamic>),
    Util.parseBool(json['match']),
    Util.parseStr(json['content']),
    Util.parseStr(json['desc']),
    Util.parseInt(json['gift_id']),
  );
}

Map<String, dynamic> _$BonusPreviewToJson(BonusPreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'state': _$BonusStateEnumMap[instance.state],
      'time': instance.grabTime,
      'sign': instance.sign,
      'grabbed': instance.grabbed,
      'creator': instance.creator,
      'cond': instance.condition,
      'match': instance.match,
      'content': instance.content,
      'desc': instance.desc,
      'gift_id': instance.giftId,
    };

BonusConfig _$BonusConfigFromJson(Map<String, dynamic> json) {
  return BonusConfig(
    Util.parseInt(json['float']),
    Util.parseInt(json['gift_id']),
    Util.parseList(json['config'],
        (e) => BonusCreateCondition.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['money']),
    Util.parseList(json['icons'],
        (e) => BonusIconType.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$BonusConfigToJson(BonusConfig instance) =>
    <String, dynamic>{
      'float': instance.notifyMoney,
      'gift_id': instance.giftId,
      'config': instance.conditions,
      'money': instance.availableMoney,
      'icons': instance.icons,
    };

BonusUser _$BonusUserFromJson(Map<String, dynamic> json) {
  return BonusUser(
    Util.parseInt(json['uid']),
    Util.parseIcon(json['icon']),
    Util.parseStr(json['name']),
  );
}

Map<String, dynamic> _$BonusUserToJson(BonusUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'icon': instance.icon,
      'name': instance.name,
    };

BonusCreateCondition _$BonusCreateConditionFromJson(Map<String, dynamic> json) {
  return BonusCreateCondition(
    Util.parseStr(json['name']),
    Util.parseStr(json['desc']),
    _$enumDecodeNullable(_$BonusConditionTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$BonusCreateConditionToJson(
        BonusCreateCondition instance) =>
    <String, dynamic>{
      'name': instance.name,
      'desc': instance.desc,
      'type': _$BonusConditionTypeEnumMap[instance.type],
    };

const _$BonusConditionTypeEnumMap = {
  BonusConditionType.none: 'none',
  BonusConditionType.follow: 'follow',
  BonusConditionType.fans: 'fans',
  BonusConditionType.share: 'share',
  BonusConditionType.sign: 'sign',
};

BonusGrabItem _$BonusGrabItemFromJson(Map<String, dynamic> json) {
  return BonusGrabItem(
    Util.parseInt(json['uid']),
    Util.parseIcon(json['icon']),
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['money']),
  );
}

Map<String, dynamic> _$BonusGrabItemToJson(BonusGrabItem instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'icon': instance.icon,
      'name': instance.name,
      'money': instance.money,
    };

BonusResult _$BonusResultFromJson(Map<String, dynamic> json) {
  return BonusResult(
    json['creator'] == null
        ? null
        : BonusUser.fromJson(json['creator'] as Map<String, dynamic>),
    Util.parseList(
        json['list'], (e) => BonusGrabItem.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['money']),
    Util.parseStr(json['cont']),
    Util.parseStr(json['desc']),
  );
}

Map<String, dynamic> _$BonusResultToJson(BonusResult instance) =>
    <String, dynamic>{
      'creator': instance.creator,
      'list': instance.list,
      'money': instance.money,
      'cont': instance.cont,
      'desc': instance.desc,
    };

BonusCondition _$BonusConditionFromJson(Map<String, dynamic> json) {
  return BonusCondition(
    Util.parseBool(json['matched']),
    Util.parseStr(json['cont']),
    _$enumDecodeNullable(_$BonusConditionTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$BonusConditionToJson(BonusCondition instance) =>
    <String, dynamic>{
      'matched': instance.matched,
      'cont': instance.content,
      'type': _$BonusConditionTypeEnumMap[instance.type],
    };

BonusIconType _$BonusIconTypeFromJson(Map<String, dynamic> json) {
  return BonusIconType(
    Util.parseInt(json['min']),
    Util.parseIcon(json['icon']),
  );
}

Map<String, dynamic> _$BonusIconTypeToJson(BonusIconType instance) =>
    <String, dynamic>{
      'min': instance.min,
      'icon': instance.icon,
    };
