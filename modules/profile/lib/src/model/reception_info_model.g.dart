// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reception_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelInfoModel _$ChannelInfoModelFromJson(Map<String, dynamic> json) {
  return ChannelInfoModel(
    Util.notNullStr(json['label']),
    Util.notNullStr(json['val']),
    Util.parseColor(json['color']) ?? Colors.transparent,
    Util.notNullStr(json['bg_img']),
    Util.parseInt(json['verify']),
    Util.parseInt(json['id']),
  );
}

ReceptionConfig _$ReceptionConfigFromJson(Map<String, dynamic> json) {
  return ReceptionConfig(
    Util.parseList(json['channel'],
        (e) => ChannelInfoModel.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['bname']),
    Util.parseInt(json['fail_num']),
    Util.notNullStr(json['rules']),
  );
}
