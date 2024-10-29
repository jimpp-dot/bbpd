// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welfare_replace_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WelfareReplaceBean _$WelfareReplaceBeanFromJson(Map<String, dynamic> json) {
  return WelfareReplaceBean(
    Util.parseBool(json['success']),
    Util.parseStr(json['card_type']) ?? '',
    Util.parseStr(json['msg']) ?? '',
    Util.parseList(json['list'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
  );
}

Map<String, dynamic> _$WelfareReplaceBeanToJson(WelfareReplaceBean instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'card_type': instance.cardType,
      'list': instance.list,
    };
