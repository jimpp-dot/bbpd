// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defend_garden_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefendGardenBean _$DefendGardenBeanFromJson(Map<String, dynamic> json) {
  return DefendGardenBean(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : DefendGardenData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

DefendGardenData _$DefendGardenDataFromJson(Map<String, dynamic> json) {
  return DefendGardenData(
    Util.parseInt(json['capacity']),
    Util.parseList(json['hidden_list'],
            (e) => DefendRelationModel.fromJson(e as Map<String, dynamic>)) ??
        [],
    Util.parseList(json['show_list'],
            (e) => DefendRelationModel.fromJson(e as Map<String, dynamic>)) ??
        [],
    Util.parseInt(json['can_unlock_num']),
    Util.parseInt(json['unlock_money']),
    Util.parseStr(json['unlock_tips']) ?? '',
  )
    ..success = Util.parseBool(json['success'])
    ..msg = Util.parseStr(json['msg']);
}
