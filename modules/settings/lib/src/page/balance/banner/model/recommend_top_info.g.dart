// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_top_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendTopInfo _$RecommendTopInfoFromJson(Map<String, dynamic> json) {
  return RecommendTopInfo(
    Util.parseBool(json['had_recommend']),
    Util.parseInt(json['charge_num']),
    Util.parseInt(json['recommend_limit']),
    Util.parseStr(json['min_limit_text']) ?? '',
    Util.parseStr(json['recommend_day_text']) ?? '',
  );
}
