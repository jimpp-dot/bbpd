// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) {
  return BannerModel(
    Util.parseInt(json['id']),
    Util.parseStr(json['app_id']) ?? '',
    Util.parseStr(json['type']) ?? '',
    Util.parseStr(json['stype']) ?? '',
    Util.parseStr(json['position']) ?? '',
    Util.parseStr(json['title']) ?? '',
    Util.getRemoteImgUrl(Util.parseStr(json['image'])),
    Util.parseStr(json['url']) ?? '',
    Util.parseStr(json['data']) ?? '',
    Util.parseInt(json['ordering']),
    Util.parseInt(json['deleted']),
    Util.parseInt(json['begin_time']),
    Util.parseInt(json['end_time']),
    Util.parseInt(json['dateline']),
    Util.parseInt(json['role']),
    Util.parseInt(json['cid']),
    Util.parseInt(json['duration']),
    Util.parseInt(json['room_type']),
    Util.parseStr(json['room_ids']) ?? '',
    Util.parseStr(json['settlement_channel']) ?? '',
  );
}
