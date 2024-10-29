import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'balance_info.g.dart';

@JsonSerializable()
class BalanceInfo {
  // 余额，包含魅力值
  @JsonKey(fromJson: Util.parseInt)
  int available;

  // 可用于下单的余额，不包含魅力值
  @JsonKey(name: 'available_order', fromJson: Util.parseInt)
  int availableOrder;

  //金豆/金币余额
  @JsonKey(name: 'gold_coin', fromJson: Util.parseInt)
  int goldCoin;

  // 成功充值的次数
  @JsonKey(name: 'order_num', fromJson: Util.parseInt)
  int orderNum;

  @JsonKey(name: 'p_types')
  List<String> pTypes;

  @JsonKey(name: 'ka')
  String aliKa;

  @JsonKey(name: 'mini_id')
  String miniId;

  ///show_time_limit_product=1，表示可以显示充值商品列表
  @JsonKey(name: 'show_time_limit_product')
  int showTimeLimitProduct;

  BalanceInfo(
      this.available, this.availableOrder, this.goldCoin, this.orderNum, this.pTypes, this.aliKa, this.miniId, this.showTimeLimitProduct);

  factory BalanceInfo.fromJson(Map<String, dynamic> json) => _$BalanceInfoFromJson(json);

  static Future<BalanceInfo?> loadBalanceInfo() async {
    BalanceInfoRsp? rsp;
    try {
      XhrResponse response = await Xhr.postJson('${System.domain}account/available?version=11', {}, throwOnError: true);
      rsp = BalanceInfoRsp.fromJson(response.value() as Map<String, dynamic>);
    } catch (e) {
      Log.d(e);
      Fluttertoast.toastException(exp: e);
    }

    if (rsp?.success == true && rsp?.data != null) return rsp!.data!;
    return null;
  }
}

@JsonSerializable()
class BalanceInfoRsp {
  bool success;
  String msg;
  BalanceInfo? data;

  BalanceInfoRsp(this.success, this.msg, this.data);

  factory BalanceInfoRsp.fromJson(Map<String, dynamic> json) => _$BalanceInfoRspFromJson(json);
}
