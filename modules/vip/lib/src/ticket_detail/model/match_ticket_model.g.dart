// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDetailTab _$TicketDetailTabFromJson(Map<String, dynamic> json) {
  return TicketDetailTab(
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['use_state']),
  );
}

Map<String, dynamic> _$TicketDetailTabToJson(TicketDetailTab instance) =>
    <String, dynamic>{
      'name': instance.name,
      'use_state': instance.useState,
    };

TicketDetailItem _$TicketDetailItemFromJson(Map<String, dynamic> json) {
  return TicketDetailItem(
    Util.getRemoteImgUrl(Util.parseStr(json['image_bg']) ?? ''),
    Util.getRemoteImgUrl(Util.parseStr(json['image']) ?? ''),
    Util.parseStr(json['period_end_desc']) ?? '',
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['source_type_desc']) ?? '',
    Util.parseStr(json['show_time_desc']) ?? '',
    Util.parseInt(json['num']),
  );
}

Map<String, dynamic> _$TicketDetailItemToJson(TicketDetailItem instance) =>
    <String, dynamic>{
      'image_bg': instance.imageBg,
      'image': instance.image,
      'period_end_desc': instance.periodDesc,
      'name': instance.name,
      'source_type_desc': instance.sourceDesc,
      'show_time_desc': instance.timeDesc,
      'num': instance.num,
    };
