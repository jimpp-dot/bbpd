// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'union_box_detail_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnionBoxDetailBean _$UnionBoxDetailBeanFromJson(Map<String, dynamic> json) {
  return UnionBoxDetailBean(
    data: json['data'] == null
        ? null
        : UnionBoxDetailData.fromJson(json['data'] as Map<String, dynamic>),
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
  );
}

Map<String, dynamic> _$UnionBoxDetailBeanToJson(UnionBoxDetailBean instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

UnionBoxDetailData _$UnionBoxDetailDataFromJson(Map<String, dynamic> json) {
  return UnionBoxDetailData(
    commodity: json['commodity'] == null
        ? null
        : BagGoods.fromJson(json['commodity'] as Map<String, dynamic>),
    gift: json['gift'] == null
        ? null
        : ShopMailCommodity.fromJson(json['gift'] as Map<String, dynamic>),
    poolid: Util.parseInt(json['poolid']),
  );
}

Map<String, dynamic> _$UnionBoxDetailDataToJson(UnionBoxDetailData instance) =>
    <String, dynamic>{
      'commodity': instance.commodity,
      'gift': instance.gift,
      'poolid': instance.poolid,
    };
