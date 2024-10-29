import 'package:shared/shared.dart';

import 'pb/generated/banner_info.pb.dart';

/// 钱包信息网络接口
class WalletRequest {
  bool _loading = false;
  String? _errorMsg;

  /// 接口是否正在加载
  bool get loading => _loading;
  // 接口错误信息
  String? get errorMessage => _errorMsg;

  /// 从网络接口，加载钱包信息
  Future<Wallet?> loadWalletInfo() async {
    Wallet? wallet;
    _loading = true;
    try {
      String url = "${System.domain}account/money/?type=all";
      Map<String, String> post = {
        'v': '10',
      };
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      Map res = response.response as Map;
      _errorMsg = null;
      wallet = Wallet.fromMap(res);
    } catch (e) {
      _errorMsg = e.toString();
      Log.d(e);
    }
    _loading = false;
    return wallet;
  }

  /// 首冲信息
  Future<SettingChargeGiftResp> loadFirstRechargeBanner() async {
    _loading = true;
    try {
      XhrResponse response = await Xhr.get(
          "${System.domain}go/games/firstcharge/bannerDetail",
          throwOnError: false,
          pb: true);
      _loading = false;
      return SettingChargeGiftResp.fromBuffer(response.bodyBytes);
    } catch (e) {
      _loading = false;
      return SettingChargeGiftResp(msg: e.toString(), success: false);
    }
  }
}

/// 钱包信息实体
class Wallet {
  int _moneyOrder = 0; // 下单币
  int _money = 0; // 余额
  int _moneyIncome = 0; // 金额收益
  int _goldCoinIncome = 0; // 金币收益
  int _moneyCharm = 0; // 魅力值收益
  int _goldBeanIncome = 0; // 金豆收益
  int _moneyDebts = 0; // 欠款
  int _parentUid = 0;
  String _parentName = '';
  int _needVerify = 0;
  int _needVerifyNew = 0;
  bool _hideIncome = true; // 是否隐藏金额收益

  Wallet();

  /// 可用的钱，有欠款时，显示欠款
  int get available => _moneyDebts != 0 ? -_moneyDebts.abs() : _money;

  int get moneyOrder => _moneyOrder;

  bool get isNeedVerify => Utility.isNeedVerify(_needVerify, _needVerifyNew);

  int get needVerify => _needVerify;
  int get needVerifyNew => _needVerifyNew;
  int get moneyCharm => _moneyCharm;
  bool get hideIncome => _hideIncome;
  int get goldCoinIncome => _goldCoinIncome;
  int get parentUid => _parentUid;
  String get parentName => _parentName;
  int get moneyIncome => _moneyIncome;
  int get goldBeanIncome => _goldBeanIncome;

  void resetNeedVerify() {
    _needVerify = 0;
    _needVerifyNew = 0;
  }

  /// 解析钱包信息
  Wallet.fromMap(Map map) {
    _moneyOrder = Util.parseInt(map['money_order']);
    _money = Util.parseInt(map['money']);
    _moneyIncome = Util.parseInt(map['m_c']);
    _goldCoinIncome = Util.parseInt(map['gold_coin']);
    _goldBeanIncome = Util.parseInt(map['money_coupon']);
    _moneyCharm = Util.parseInt(map['m_c_b']);
    _moneyDebts = Util.parseInt(map['money_debts']);
    if (map['parent'] != null) {
      _parentUid = Util.parseInt(map['parent']['uid']);
      _parentName = map['parent'] != null ? map['parent']['name'] : '';
    }
    _needVerify = Util.parseInt(map['need_verify'], 0);
    _needVerifyNew = Util.parseInt(map['need_verify_new'], 0);
    _hideIncome = Util.parseInt(map['hide_money_income'], 0) == 1;
  }
}
