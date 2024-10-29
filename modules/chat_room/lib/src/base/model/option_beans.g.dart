// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionsResp _$OptionsRespFromJson(Map<String, dynamic> json) {
  return OptionsResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : Options.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Options _$OptionsFromJson(Map<String, dynamic> json) {
  return Options(
    Util.parseBool(json['is_member']),
    Util.notNullStr(json['switch_name']),
    Util.parseList(json['switch_type_option'],
        (e) => OptionItem.fromJson(e as Map<String, dynamic>)),
    Util.notNullStr(json['second_name']),
    Util.parseList(json['room_second_option'],
        (e) => OptionItem.fromJson(e as Map<String, dynamic>)),
    Util.notNullStr(json['third_name']),
    Util.parseList(json['room_third_option'],
        (e) => OptionItem.fromJson(e as Map<String, dynamic>)),
  );
}

OptionItem _$OptionItemFromJson(Map<String, dynamic> json) {
  return OptionItem(
    Util.notNullStr(json['type']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['val_type']),
    json['value'],
    Util.parseList(json['sub_items'],
        (e) => OptionItem.fromJson(e as Map<String, dynamic>)),
    Util.parseBool(json['lock']),
    Util.notNullStr(json['home_icon']),
    Util.notNullStr(json['room_cover']),
    Util.notNullStr(json['room_cover_status']),
  );
}

Map<String, dynamic> _$OptionItemToJson(OptionItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'icon': instance.icon,
      'val_type': instance.valueType,
      'home_icon': instance.homeIcon,
      'room_cover': instance.roomCover,
      'room_cover_status': instance.roomCoverStatus,
      'value': instance.value,
      'lock': instance.lock,
      'sub_items': instance.subItems,
    };
