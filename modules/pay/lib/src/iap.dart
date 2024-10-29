import '../k.dart';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:pulse_log/pulse_log.dart';

//const IAP_Error = [
//  '未知错误，请重试',
//  '你无权购买',
//  '购买凭证错误，请重试',
//  '当前支付对象不存在，请联系客服',
//  '用户没有被允许访问云服务信息', // ???
//  '网络连接错误，请重试'
//];

typedef OnPayErrorMessage = void Function(String message);
typedef OnComplete = void Function();

class IAP {
  IAP({this.onComplete, this.onError, required this.context});

  static Future<bool> canRestoreIAP() async {
    String? receiptData = await FlutterInappPurchase.getReceiptData();
    return receiptData != null;
  }

  static void init() {
    eventCenter.addListener(EventConstant.EventLogin, _onSlpLogin);

    FlutterInappPurchase.onMessageReceived.listen((dynamic object) async {
      Log.d('IAP: FlutterInappPurchase:$object');
      if (object is! Map) {
        return;
      }
      Map data = object;
      if (!data.containsKey('type') || !data.containsKey('data')) return;
      dynamic result = data['data'] ?? {};
      switch (data['type']) {
        case 'TransactionFailed':
          try {
            await Xhr.postPb(
                "${System.domain}go/yy/iap/aiap",
                {
                  'code': result['code'] ?? '0',
                  'receipt': result['message'] ?? ''
                },
                throwOnError: false);
          } catch (e) {
            Log.d('IAP: TransactionFailed上报异常 $e');
          }
          break;
        //上报服务器验证交易
        case 'verifyReceiptData':
          if (Platform.isIOS) {
            Map<String, String> params = {
              'receipt': result is String ? result : ''
            };
            if (!Session.isLogined) {
              //iOS未登录状态不验证交易，直接抛掉，等到下次原生客户端补单时再验证
              Log.d('IAP: auto_verify_cancel —— not_login');
              return;
            }

            requestToVerifyAppleReceipt(params,
                (bool success, String errorMsg) async {
              Log.d('IAP: Buy result：$success');
              if (success) {
                FlutterInappPurchase.finishAllTransaction();
              }
            });
          } else {
            PurchasedItem item = PurchasedItem.fromJSON(result);
            Map<String, String> params = {};
            params['receipt'] = item.transactionReceipt;
            await requestToVerifyGoogleReceipt(params);
            FlutterInappPurchase.finishTransaction();
          }
          break;
      }
    }, onError: (dynamic error) {
      Log.d('IAP: $error');
    });
  }

  static _onSlpLogin(String type, dynamic data) async {
    //登录成功后检查未完成订单并上报
    if (Platform.isIOS) {
      bool? shouldRestore = await FlutterInappPurchase.shouldRestore();
      if (shouldRestore ?? false) {
        restoreIAP(false, true);
      }
    } else {
      restoreIAP(false, true);
    }
  }

  static bool _isRestoringIAP = false;

  static Future<bool> restoreIAP(bool force, [bool noToast = false]) async {
    //iOS未登录状态不验证交易，直接抛掉，等到下次原生客户端补单时再验证
    if (Platform.isIOS && !Session.isLogined) {
      Log.d('IAP: restore_cancel —— not_login');
      return false;
    }

    if (_isRestoringIAP) return false;

    _isRestoringIAP = true;

    bool result = false;
    dynamic receiptData;
    if (force) {
      Log.d('IAP: restore_all');
      receiptData = await FlutterInappPurchase.restoreCompletedTransactions();
    } else {
      Log.d('IAP: restore_unfinished');
      receiptData = await FlutterInappPurchase.getReceiptData();
    }

    if (receiptData is String) {
      DialogLoadingController? loading;
      loading = DialogLoadingController();
      if (!noToast) {
        loading.show(message: K.string_loading, context: System.context);
      }

      try {
        XhrResponse response = await Xhr.postPb(
            "${System.domain}go/yy/iap/aiap",
            {
              'receipt': receiptData,
            },
            throwOnError: false);
        NormalNull res = NormalNull.fromBuffer(response.bodyBytes);
        bool success = (res.success) ? true : false;
        if (success) {
          Log.d("IAP: restoreIap:$res");
          result = true;
          Log.d('IAP: restore_finished_all');
          await FlutterInappPurchase.finishAllTransaction();
          if (!noToast) {
            Toast.showCenter(System.context, K.pay_iap_restore_success);
          }
        } else {
          if (!noToast) {
            Toast.showCenter(System.context, response.error ?? res.msg);
          }
        }
      } catch (e) {
        Log.d('IAP: $e');
        if (!noToast) {
          Toast.showCenter(System.context, e.toString());
        }
      }

      loading.close();
      loading = null;
    } else {
      if (!noToast && receiptData is PlatformException) {
        Toast.showCenter(System.context, K.pay_iap_restore_failed);
      }
      Log.d("IAP: getReceiptData return empty");
    }

    _isRestoringIAP = false;
    return result;
  }

  final int _checkTimer = 0;
  final BuildContext context;
  final OnPayErrorMessage? onError;
  final OnComplete? onComplete;
  DialogLoadingController? _loading;

  void buyProduct(String productId, {Map? args}) async {
    if (Constant.isDevMode) {
      if (Platform.isIOS) {
        // 开发环境下弹出密码框前复制沙盒密码，简化测试操作
        if (!Util.isNullOrEmpty(DeveloperUtil.iapPassword)) {
          Clipboard.setData(ClipboardData(text: DeveloperUtil.iapPassword));
        }
      }
    }

    await showLoading(K.string_loading);
    try {
      await prepareProducts([productId]);

      if (Platform.isIOS) {
        bool? shouldRestore = await FlutterInappPurchase.shouldRestore();
        if (shouldRestore == true) {
          Log.d('IAP: 购买前检查到有未完成订单，需要先恢复购买');
          await showLoading(K.recovering_buy);
          // 检查交易队列是否还有没关闭的，先完成这些交易
          bool success = await IAP.restoreIAP(false);
          await hideLoading();
          if (success) {
            PulseLog.instance.log(PayBody(PayAction.goIapNext, {}, true,
                reason: 'shouldRestore in ios'));
            if (onComplete != null) onComplete!();
          }
          return;
        }
      }

      Log.d("IAP: 开始购买-$productId");
      PurchasedItem item =
          await FlutterInappPurchase.buyProductWithoutFinishTransaction(
              productId);

      //iOS端，未登录状态下不验证交易数据，等用户登录走补单时再次验证
      if (item.transactionReceipt.isNotEmpty &&
          (Session.isLogined || !Platform.isIOS)) {
        await showLoading(K.is_exchanging);

        Map<String, String> params = {};
        if (args != null) {
          args.forEach((key, value) {
            params[key] = value;
          });
        }
        params['receipt'] = item.transactionReceipt;
        if (Platform.isIOS) {
          IAP.requestToVerifyAppleReceipt(params,
              (bool success, String errorMsg) async {
            Log.d('IAP: 内购API调用结束 | result-$success');
            if (success) {
              await FlutterInappPurchase.finishAllTransaction();
              PulseLog.instance.log(PayBody(PayAction.goIapNext, {}, true,
                  reason: 'ios finishTransaction:all'));
              if (onComplete != null) onComplete!();
            } else if (Util.validStr(errorMsg)) {
              Fluttertoast.showToast(
                  msg: errorMsg, gravity: ToastGravity.CENTER);
            }
          });
        } else {
          Map? res = await IAP.requestToVerifyGoogleReceipt(params);
          if (res != null && res['success'] == true) {
            await FlutterInappPurchase.finishTransaction();
            PulseLog.instance.log(PayBody(PayAction.goIapNext, {}, true,
                reason: 'no-ios finishTransaction'));
            if (onComplete != null) onComplete!();
          } else {
            if (res != null && res['msg'] != null && res['msg'] is String) {
              Fluttertoast.showToast(
                  msg: res['msg'], gravity: ToastGravity.CENTER);
            }
          }
        }
      }
    } on Exception catch (e) {
      Log.d("IAP: 购买过程异常-$productId-$e");
      if (e is PlatformException) {
        Fluttertoast.showToast(
            msg: e.message ?? K.pay_unknown_error,
            gravity: ToastGravity.CENTER);
      }
    } finally {
      if (Platform.isAndroid) {
        //google内购，消耗之后，才可以继续购买
        await FlutterInappPurchase.consumeAllItems;
      }
      await hideLoading();
    }
  }

  Future<bool> prepareProducts(List<String> pids) async {
    try {
      if (Platform.isAndroid) {
        await FlutterInappPurchase.initConnection;
      } else {
        await FlutterInappPurchase.getProducts(pids);
      }
      return true;
    } catch (e) {
      PulseLog.instance
          .log(PayBody(PayAction.goIapNext, {}, false, reason: e.toString()));
      if (onError != null) onError!(e.toString());
      return false;
    }
  }

  static void requestToVerifyAppleReceipt(Map<String, String>? params,
      void Function(bool success, String errorMsg) func) async {
    if (params == null) {
      return null;
    }

    try {
      String url = "${System.domain}go/yy/iap/aiap";
      XhrResponse response = await Xhr.postPb(url, params, throwOnError: false);
      NormalNull res = NormalNull.fromBuffer(response.bodyBytes);
      if (Platform.isIOS) {
        bool success = (res.success) ? true : false;
        // // 0 订单验证通过
        // // 1001	用户ID错误
        // // 1002	沙盒环境不被支持
        // // 1003	请求苹果服务器验证数据失败
        // // 1004	iOS包名校验失败
        // // 1005	原始交易ID有误
        // // 1006	商品信息校验失败
        // // 1007	订单信息有误
        // // 1008	购买类型不存在
        // int code = res['errcode'];
        // if ([1001, 1003].contains(code)) {
        //   shouldFinishi = false;
        // }
        func(success, response.error?.toString() ?? res.msg);
      }
    } catch (e) {
      func(false, e.toString());
      Log.d('IAP: $e');
    }
    return null;
  }

  static Future<Map?> requestToVerifyGoogleReceipt(
      Map<String, String>? params) async {
    if (params == null) {
      return null;
    }

    try {
      String url = "${System.payDomain}pay/giap";
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: false);
      Map res = response.value();
      return res;
    } catch (e) {
      Log.d('IAP: $e');
    }
    return null;
  }

  void dispose() {
    JsTimer.clearTimeout(_checkTimer);
//    FlutterInappPurchase.endConnection;
  }

  Future hideLoading() async {
    if (_loading != null) {
      _loading!.close();
      _loading = null;
    }
    await Future.delayed(const Duration(milliseconds: 100));
  }

  Future showLoading(String message) async {
    if (_loading != null) {
      _loading!.setLabel(message);
      return;
    }

    _loading = DialogLoadingController();
    _loading!.show(message: message, context: context);
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
