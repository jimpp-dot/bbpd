import 'package:shared/shared.dart';

class TradeResponse extends BaseResponse {
  List<TradeData>? dataList;

  TradeResponse({bool success = false, String? msg})
      : super(msg: msg, success: success);

  TradeResponse.fromJson(Map<String, dynamic> json) {
    success = Util.parseBool(json['success']);
    List data = json['data'];
    for (var element in data) {
      dataList ??= [];
      dataList?.add(TradeData.fromJson(element));
    }
  }
}

class TradeData {
  int dateline = 0;
  double money = 0.0;
  String? operation;
  String? subject;
  TradeReason? tradeReason;
  double coin = 0;

  TradeData.fromJson(Map<String, dynamic> json) {
    money = Util.parseDouble(json['money']);
    dateline = Util.parseInt(json['dateline']);
    operation = json['op'] ?? "";
    subject = json['subject'] ?? "";
    coin = Util.parseDouble(json['coin']);
    if (json['_reason'] != null) {
      tradeReason = TradeReason.fromJson(json['_reason']);
    }
  }
}

class TradeReason {
  String? type;
  int orderAccount = 0; // 下单账户
  int orderAppleAccount = 0; // 下单账户-苹果内购充值
  int giftAccount = 0; // 打赏账户
  int giftAppleAccount = 0; // 打赏账户-苹果内购充值
  int incomeAccount = 0; // 收入账户
  int charmAccount = 0; // 魅力值账户
  double coinPay = 0; // 金币消费
  double coinIncomePay = 0; // 金币收入

  int orderAccountIn = 0; // 下单账户
  int orderAppleAccountIn = 0; // 下单账户-苹果内购充值
  int giftAccountIn = 0; // 打赏账户
  int giftAccountAppleIn = 0; // 打赏账户-苹果内购充值
  int incomeAccountIn = 0; // 收入账户
  int charmAccountIn = 0; // 魅力值账户

  TradeReason.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? "";
    orderAccount = Util.parseInt(json['_use_o']);
    orderAppleAccount = Util.parseInt(json['_use_o_b']);
    giftAccount = Util.parseInt(json['_use_a']);
    giftAppleAccount = Util.parseInt(json['_use_b']);
    incomeAccount = Util.parseInt(json['_use_c']);
    charmAccount = Util.parseInt(json['_use_c_b']);
    coinPay = Util.parseDouble(json['_use_g']);
    coinIncomePay = Util.parseDouble(json['_gain_g']);

    orderAccountIn = Util.parseInt(json['_in_o']);
    orderAppleAccountIn = Util.parseInt(json['_in_o_b']);
    giftAccountIn = Util.parseInt(json['_in_a']);
    giftAccountAppleIn = Util.parseInt(json['_in_b']);
    incomeAccountIn = Util.parseInt(json['_in_c']);
    charmAccountIn = Util.parseInt(json['_in_c_b']);
  }
}
