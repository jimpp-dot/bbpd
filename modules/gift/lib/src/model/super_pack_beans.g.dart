// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'super_pack_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuperPackResp _$SuperPackRespFromJson(Map<String, dynamic> json) {
  return SuperPackResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    data: json['data'] == null
        ? null
        : SuperPackList.fromJson(json['data'] as Map<String, dynamic>),
  );
}

SuperPackList _$SuperPackListFromJson(Map<String, dynamic> json) {
  return SuperPackList(
    Util.parseList(json['packages'],
        (e) => SuperPackItem.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['left_days']),
    introduction: Util.parseStr(json['introduction']) ?? '',
  );
}

SuperPackItem _$SuperPackItemFromJson(Map<String, dynamic> json) {
  return SuperPackItem(
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['recharge']),
    Util.parseList(json['gifts'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
    Util.parseBool(json['send']),
    Util.parseInt(json['more_pay']),
    Util.parseInt(json['pay']),
  );
}
