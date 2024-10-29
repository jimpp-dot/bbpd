import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pay/k.dart';
import 'package:pay/src/p_t_sheet.dart';
import 'package:pay/src/pay_bottom_sheet.dart';

import 'iap.dart';
import 'pay.dart';

class PayManager extends IPayManager {
  late IAPConfig _iapConfig;
  List<Map> _androidPayData = [];

  @override
  void pay(BuildContext context,
      {String key = '',
      required String type,
      Map? args,
      String? productId,
      VoidCallback? onPayed,
      PayErrorCallback? onError,
      bool canUseCoin = true,
      String? refer,
      bool showLoading = true,
      VoidCallback? onPayAppOpen}) {
    Pay instance = Pay.instance(key, context, canUseCoin, onPayed, onError, onPayAppOpen);
    Log.d("instance:${instance}");
    instance.pay(key, type, args, refer, productId, showLoading);
  }

  @override
  void dispose(String key) {
    Pay.dispose(key);
  }

  @override
  Future<List<SheetItem>> getPTypes({int accountType = 0}) async {
    bool display = false;
    bool useIap = Platform.isIOS || Util.isLocale;
    int money = 0;
    if (Util.isVerify == false && Platform.isIOS) {
      try {
        XhrResponse response = await Xhr.postJson('${System.domain}account/available?version=11', {}, throwOnError: true);
        Map res = response.value();
        if (accountType == 1) {
          money = Util.parseInt(res['data']['available']) + Util.parseInt(res['data']['money_order']);
        } else {
          money = Util.parseInt(res['data']['available']);
        }
        display = true;
      } catch (e) {
        display = false;
      }
    }
    List<SheetItem> res = [];
    if (display) {
      res.add(SheetItem("${K.account_balance}(${MoneyConfig.moneyNum(money)}${MoneyConfig.moneyName})", 'available'));
    } else {
      res.add(SheetItem(K.account_balance, 'available'));
    }

    if (Util.isVerify || useIap) {
//      res.add(new SheetItem(R.string('to_recharge'), 'iap-recharge'));
    } else {
      res.add(SheetItem(K.string_zhi + K.string_fu + K.string_bao, 'a' 'li'));
      res.add(SheetItem(K.string_wechat, 'wechat'));
    }
    return res;
  }

  /// 新版本支付弹窗去掉直充，调用showRechargeSheet
  @override
  Future<SheetCallback?> showPTSheet(
    BuildContext context,
    int price, {
    int accountType = 0,
    AsyncValueGetter<bool>? onInterceptClose,
    bool showBalance = true,
  }) {
    return displayModalBottomSheet(
      context: context,
      isBarrierDismissible: onInterceptClose == null ? true : false,
      builder: (BuildContext context) {
        return PTSheetWidget(
          price: price,
          accountType: accountType,
          showBalance: showBalance,
          onInterceptClose: onInterceptClose,
        );
      },
    );
  }

  @override
  Future<SheetCallback?> showRechargeSheet(
    BuildContext context,
    int price, {
    int accountType = 0,
    AsyncValueGetter<bool>? onInterceptClose,
    String? title,
    String? tips,
    bool onlyRecharge = false,
    bool showDiamondRecharge = false,
  }) {
    return PayBottomSheet.show(
      context,
      price: price,
      accountType: accountType,
      onInterceptClose: onInterceptClose,
      title: title,
      tips: tips,
      onlyRecharge: onlyRecharge,
      showDiamondRecharge: showDiamondRecharge,
    );
  }

  @override
  void initIAP() {
    IAP.init();
  }

  @override
  Future<bool> canRestoreIAP() {
    return IAP.canRestoreIAP();
  }

  @override
  Future<bool> restoreIAP(BuildContext context) {
    return IAP.restoreIAP(true);
  }

  @override
  void loadStrings() {
//    super.loadStrings();
//    R.putLangStringMap(strMap);
//    R.putLangArrayMap(strArray);
  }

  @override
  List<Map> getAndroidPayData() {
    return _androidPayData;
  }

  @override
  void setupAndroidPayData(List<Map>? data) {
    _androidPayData = data ?? [];
  }

  @override
  IAPConfig getIAPConfig() {
    return _iapConfig;
  }

  @override
  void setupIAPConfig(IAPConfig config) {
    _iapConfig = config;
  }

  @override
  void payAvatarGift(
      {required BuildContext context,
      required String key,
      required int money,
      required int rid,
      required List<int> uids,
      required int giftId,
      required int giftNum,
      VoidCallback? onPayed,
      PayErrorCallback? onPayError}) {
    pay(context,
        key: key,
        type: 'available',
        refer: 'gift',
        args: {
          'money': money,
          'type': 'game-gift',
          'params': {
            'gift_type': 'coin',
            'rid': rid,
            'uids': uids,
            'giftId': giftId,
            'giftNum': giftNum,
          }
        },
        onPayed: onPayed,
        onError: onPayError);
  }

  @override
  Future<NormalNull> matePayCreate(
    BuildContext context, {
    String platform = "available",
    required int money,
    required String type,
    int? rid,
    required Map params,
    String? refer,
  }) async {
    try {
      final args = {
        "platform": platform,
        "money": "$money",
        "type": type,
        if (rid != null) "rid": "$rid",
        // "params" : jsonEncode(params ?? []),
        "params": params.toString(),
      };

      /// 先校验钻石是否足够进行支付
      SheetCallback? result = await showRechargeSheet(System.context, money, showDiamondRecharge: true);
      if (result == null || result.reason == SheetCloseReason.Active) {
        return NormalNull(success: false);
      }

      final type0 = result.value?.key;
      Log.d('_type = $type0');

      if (type0 == 'iap-recharge' || (type != 'available' && type != 'xiaomi')) {
        /// 走旧的支付逻辑
        Pay instance = Pay.instance('', context, true, null, null, null);
        instance.pay('', type0 ?? '', args, refer, null, true);
        return NormalNull(success: false);
      }

      final url = '${System.domain}go/mate/pay/create';
      final response = await Xhr.postPb(url, args, headers: Xhr.globalHeaders);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
