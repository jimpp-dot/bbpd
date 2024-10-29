// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceInfo _$BalanceInfoFromJson(Map<String, dynamic> json) {
  return BalanceInfo(
    Util.parseInt(json['available']),
    Util.parseInt(json['available_order']),
    Util.parseInt(json['gold_coin']),
    Util.parseInt(json['order_num']),
    Util.parseList(json['p_types'], (e) => Util.parseStr(e) ?? ''),
    Util.parseStr(json['ka']) ?? '',
    Util.parseStr(json['mini_id']) ?? '',
    Util.parseInt(json['show_time_limit_product']),
  );
}

BalanceInfoRsp _$BalanceInfoRspFromJson(Map<String, dynamic> json) {
  return BalanceInfoRsp(
    Util.parseBool(json['success']),
    Util.parseStr(json['msg']) ?? '',
    json['data'] == null
        ? null
        : BalanceInfo.fromJson(json['data'] as Map<String, dynamic>),
  );
}
