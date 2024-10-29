// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rush_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RushMomentPage _$RushMomentPageFromJson(Map<String, dynamic> json) {
  return RushMomentPage(
    Util.parseInt(json['page']),
    Util.parseInt(json['more']),
    Util.parseList(
        json['topics'], (e) => Moment.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$RushMomentPageToJson(RushMomentPage instance) =>
    <String, dynamic>{
      'page': instance.page,
      'more': instance.more,
      'topics': instance.topics,
    };
