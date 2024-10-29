import 'package:pay/k.dart';
import 'dart:convert';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'h5.dart';
import 'iap.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:fluwx/fluwx.dart' as FlutterWx;
/*
  * *
  * 示例：
  * -支付时调用
  * ```Pay payInstance = Pay.instance('userdefend',this.context, _onPayed, _onPayError);
    payInstance.pay('a'+'li', {
      'money': map[_type],
      'type': 'defend',
      'params': {
        'defend': _type,
        'to' : widget.uid,
      }
    });```
  *
  * --------------------------------------------------------------
  *
  * -销毁时调用：
  * @override
    void dispose() {
      Pay.dispose('userdefend');
      super.dispose();
    }
  *
  */

class Pay {
  static final Map<String, Pay> _instanceMap = {};

  // pay为多实例，lastPayKey记录最后一次调用pay接口的实例key，在_onSocketMessage回调中只处理key为lastPayKey的pay实例
  static String? lastPayKey;

  static Pay instance(String key, BuildContext context, bool? canUseCoin,
      [VoidCallback? onPayed, PayErrorCallback? onError, VoidCallback? onPayAppOpen]) {
    disposeAll();
    Pay instance =
        Pay(context: context, payKey: key, onError: onError, onPayed: onPayed, canUseCoin: canUseCoin, onPayAppOpen: onPayAppOpen);
    instance.addPayCompleteListener();
    _instanceMap[key] = instance;
    return instance;
  }

  /// _instanceMap仅维持当前pay实例，避免每个使用pay的地方都需要dispose
  static void disposeAll() {
    if (_instanceMap.isNotEmpty) {
      List<String> keys = _instanceMap.keys.toList();
      for (var element in keys) {
        dispose(element);
      }
    }
  }

  static void dispose(String key) {
    Pay? instance = _instanceMap[key];
    if (instance != null) {
      instance.disposed();
      instance = null;
    }

    _instanceMap.remove(key);
  }

  Pay({required this.context, required this.payKey, this.onPayed, this.onError, this.canUseCoin, this.onPayAppOpen});

  final BuildContext context;
  final VoidCallback? onPayed;
  final PayErrorCallback? onError;
  final VoidCallback? onPayAppOpen;
  final String payKey;
  int? _lastPayId;
  bool? _isWaiting;
  bool? canUseCoin;
  bool _disposed = false;
  int _reqWaitIndex = 0;
  int _timer = 0;
  IAP? _iap;
  H5? _h5;
  DialogLoadingController? _loading;

  H5 get h5Instance {
    if (_h5 != null) {
      _h5 = null;
    }

    _h5 = H5(
        context: System.context,
        onComplete: _onH5Complete,
        onError: _onError,
        onOpenApp: () {
          hideLoading();
          if (onPayAppOpen != null) {
            onPayAppOpen!();
          }
        });
    return _h5!;
  }

  void addPayCompleteListener() {
    eventCenter.addListener(EventConstant.WebsocketEventMessage, _onSocketMessage);
  }

  void payIap(String? productId, {Map? args}) {
    if (productId == null || productId.isEmpty) {
      _onError(K.goods_id_cant_be_null);
      return;
    }

    _iap ??= IAP(onComplete: _onIapComplete, onError: _onError, context: context);

    _iap!.buyProduct(productId, args: args);

    eventCenter.emit(EventConstant.EventIapRecharge, productId);
  }

  void pay(
    String key,
    String type,
    Map? args,
    String? refer, [
    String? productId,
    bool? showLoading,
  ]) async {
    lastPayKey = key;
    _disposed = false;
    Log.d("key:${key}");
    Log.d("type:${type}");
    Log.d("refer:${refer}");
    Log.d("productId:${productId}");

    if (type == 'iap-recharge') {
      ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
      settingManager.openRechargeScreen(context, refer: refer ?? '');
      return;
    }

    if (type == 'iap') {
      PulseLog.instance.log(PayBody(PayAction.goIap, {'key': key, 'type': type, 'args': args.toString()}, true));
      payIap(productId, args: args);
      return;
    }

    if (args == null) {
      return;
    }

    PulseLog.instance.log(PayBody(PayAction.goNormal, {'key': key, 'type': type, 'args': args.toString()}, true));

    if (_isWaiting == true) return;
    _isWaiting = true;

    bool isShowLoading = showLoading == true;
    bool isCycle = false; //是否周期订阅
    if ('wolf-role' == args['type'] || 'wechat' == type || Util.parseInt(args['hideLoading']) == 1) {
      isShowLoading = false;
    }
    if ('cycle' == args['type']) {
      if (args['params'] != null) {
        int cycleId = Util.parseInt(args['params']['cycle_id'], 0);
        if (cycleId > 0) {
          isCycle = true;
        }
      }
    }
    if (isShowLoading) {
      _showLoading(K.string_loading);
    }

    /// 小程序支付：SDK拉起微信小程序进行支付
    if (type == 'wechat') {
      String token = Session.token;
      Log.d("token:${token}");
      String path = '/pages/index/index?to=pay&uid= ${Session.uid}&money=${args['money'].toString()}&token=$token';
      String? miniId;
      if (args['extra'] is Map) {
        miniId = args['extra']['mini_id'];
      }

      /// 开通贵族，需要将额外参数传给小程序进行购买
      if ('cycle' == args['type']) {
        String extraParams = json.encode(args['params'] ?? '');
        String name = args['name'] ?? '';
        path = '$path&type=cycle&params=$extraParams&desc=$name';
      }
      Log.d("path:${path}");
      Log.d("miniId:${miniId}");
      FlutterWx.launchWeChatMiniProgram(
        username: miniId ?? AppConfig.getMiniId(),
        path: path,
        miniProgramType: FlutterWx.WXMiniProgramType.RELEASE,
      );
      hideLoading();
      _isWaiting = false;
    }

    if (type == 'wechat_sdk') {
      bool installed = false;
      try {
        installed = await FlutterWx.isWeChatInstalled;
      } catch (e) {
        Log.d("wechat isInstalled error:${e.toString()}");
      }
      if (!installed) {
        Fluttertoast.showToast(msg: R.string('need_install_wecaht_first'), gravity: ToastGravity.CENTER);
        Future.delayed(const Duration(milliseconds: 300), () {
          hideLoading();
          _isWaiting = false;
        });
        return;
      }
      try {
        XhrResponse response = await Xhr.postJson(
            '${System.domain}pay/create',
            {
              'platform': type,
              'type': args['type'].toString(),
              'money': args['money'].toString(),
              'params': jsonEncode(args['params'] ?? {})
            },
            throwOnError: false);
        Map res = response.value();
        if (Util.parseBool(res['success'])) {
          Map payParam = res['data']['res'];
          final bool result = await FlutterWx.payWithWeChat(
            appId: Util.notNullStr(payParam['appId']),
            partnerId: Util.notNullStr(payParam['partnerId']),
            prepayId: Util.notNullStr(payParam['prepayId']),
            packageValue: Util.notNullStr(payParam['package']),
            nonceStr: Util.notNullStr(payParam['nonceStr']),
            timeStamp: Util.parseInt(payParam['timeStamp']),
            sign: Util.notNullStr(payParam['sign']),
          );
          hideLoading();
          _isWaiting = false;
          if (!result) {
            PulseLog.instance
                .log(PayBody(PayAction.goNormal, {'key': key, 'type': type, 'args': args.toString()}, false, reason: 'wechat sdk unknown'));
            _isWaiting = false;
            _onError(K.pay_failed_retry, isErrorCatch: true);
          }
        } else {
          PulseLog.instance.log(
              PayBody(PayAction.goNormal, {'key': key, 'type': type, 'args': args.toString()}, false, reason: Util.notNullStr(res['msg'])));
          _onError(Util.parseStr(res['msg']), errorCode: Util.parseInt(res['code']));
          hideLoading();
          _isWaiting = false;
        }
      } catch (e) {
        Log.d('pay error: ' + e.toString());
        PulseLog.instance
            .log(PayBody(PayAction.goNormal, {'key': key, 'type': type, 'args': args.toString()}, false, reason: e.toString()));
        _isWaiting = false;
        _onError(K.pay_failed_retry, isErrorCatch: true);
      }
    }

    /// h5支付：通过h5拉起支付宝or微信客户端
    else if (type != 'available' && type != 'xiaomi' && !isCycle && type != 'aums.uac') {
      try {
        XhrResponse response = await Xhr.postJson(
            "${System.domain}pa" "y/h5Token",
            {
              'platform': type,
              'type': args['type'].toString(),
              'money': args['money'].toString(),
              'params': jsonEncode(args['params'] ?? {})
            },
            throwOnError: false);
        Map res = response.value();
        if (res['success'] == true) {
          _isWaiting = false;
          if (res['data'] != null && res['data'] is String) {
            h5Instance.start(res['data']);
            PulseLog.instance.log(PayBody(PayAction.loadH5Token, {'key': key, 'type': type, 'args': args.toString()}, true));
          } else {
            PulseLog.instance
                .log(PayBody(PayAction.loadH5Token, {'key': key, 'type': type, 'args': args.toString()}, false, reason: 'invalid token'));
            _onError(K.string_zhi + K.string_fu + K.pay_invalid_token);
          }
        } else {
          if (res['msg'] != null && res['msg'] is String) {
            PulseLog.instance
                .log(PayBody(PayAction.loadH5Token, {'key': key, 'type': type, 'args': args.toString()}, false, reason: res['msg']));
            _onError(res['msg'], errorCode: Util.parseInt(res['code']));
          }
          hideLoading();
          _isWaiting = false;
        }
      } catch (e) {
        Log.d('pay error: $e');
        PulseLog.instance
            .log(PayBody(PayAction.loadH5Token, {'key': key, 'type': type, 'args': args.toString()}, false, reason: e.toString()));
        _isWaiting = false;
        _onError(K.pay_failed_retry, isErrorCatch: true);
      }
    } else {
      try {
        XhrResponse response = await Xhr.postJson(
            "${System.domain}pay/create",
            {
              'platform': type,
              'type': args['type'].toString(),
              'money': args['money'].toString(),
              'params': jsonEncode(args['params'] ?? {})
            },
            throwOnError: false);
        Map res = response.value();
        Log.d("===========[pay.complete]===========");
        Log.d(res);
        hideLoading();
        if (res['success'] == true) {
          PulseLog.instance.log(PayBody(
            PayAction.loadPayCreate,
            {'key': key, 'type': type, 'args': args.toString()},
            true,
          ));
          if (isCycle) {
            //如果是周期订阅
            if (res['data'] is Map) {
              String? url = res['data']['url'];
              if (url != null && url.isNotEmpty) {
                if (await canLaunch(url)) {
                  bool launchResult = await launch(
                    url,
                    forceSafariVC: false,
                    forceWebView: false,
                  );
                  PulseLog.instance.log(PayBody(
                      PayAction.loadPayCreateNext, {'key': key, 'type': type, 'args': args.toString()}, launchResult,
                      reason: 'launch url result:$url'));
                } else {
                  // Fluttertoast.showToast(msg: '111');
                  PulseLog.instance.log(PayBody(PayAction.loadPayCreateNext, {'key': key, 'type': type, 'args': args.toString()}, false,
                      reason: 'cant launch url:$url'));
                }
              }
            } else {
              // Fluttertoast.showToast(msg: '111');
              Fluttertoast.showCenter(msg: K.pay_cycle_error([Util.appName]));
              PulseLog.instance.log(PayBody(PayAction.loadPayCreateNext, {'key': key, 'type': type, 'args': args.toString()}, false,
                  reason: 'server data error'));
            }
          } else if (res['paied'] == true) {
            //钱有变化，全局通知
            eventCenter.emit(EventConstant.EventUserMoneyChange);
            _isWaiting = false;
            PulseLog.instance
                .log(PayBody(PayAction.loadPayCreateNext, {'key': key, 'type': type, 'args': args.toString()}, true, reason: 'paied'));
            PulseLog.instance.log(PayBody(PayAction.payed, {}, true));
            if (onPayed != null) onPayed!();
          } else {
            hideLoading();
          }
        } else {
          if (res['msg'] != null && res['msg'] is String) {
            PulseLog.instance
                .log(PayBody(PayAction.loadPayCreateNext, {'key': key, 'type': type, 'args': args.toString()}, false, reason: res['msg']));
            _onError(res['msg'],
                errorCode: Util.parseInt(res['code']),
                hideToast: Util.parseInt(args['hideErrorToast']) == 1,
                key: key,
                type: type,
                args: args,
                refer: refer,
                productId: productId,
                showLoading: showLoading == true);
          }
          hideLoading();
          _isWaiting = false;
        }
      } catch (e) {
        Log.d('pay error: $e');
        _isWaiting = false;
        PulseLog.instance
            .log(PayBody(PayAction.loadPayCreateNext, {'key': key, 'type': type, 'args': args.toString()}, false, reason: e.toString()));
        _onError(K.pay_failed_retry,
            isErrorCatch: true, key: key, type: type, args: args, refer: refer, productId: productId, showLoading: showLoading == true);
      }
    }
  }

  Future _onError(String? errorMsg,
      {String? key,
      String? type,
      Map? args,
      String? refer,
      String? productId,
      int? errorCode,
      bool hideToast = false,
      bool isErrorCatch = false,
      bool showLoading = true}) async {
    _disposeH5();
    JsTimer.clearTimeout(_timer);
    hideLoading();
    if (!hideToast) Fluttertoast.showToast(msg: errorMsg ?? K.pay_failed_retry, gravity: ToastGravity.CENTER);
    if (onError != null) onError!(isErrorCatch);
  }

  void _onIapComplete() {
    //钱有变化，全局通知
    eventCenter.emit(EventConstant.EventUserMoneyChange);
    //钱有变化，全局通知
    PulseLog.instance.log(PayBody(PayAction.payed, {}, true));
    if (onPayed != null) onPayed!();
  }

  void _onH5Complete(int? pid) {
    eventCenter.emit(EventConstant.EventUserMoneyChange);
    _lastPayId = pid;
    _onComplete();
  }

  void _onComplete() {
    _disposeH5();
    JsTimer.clearTimeout(_timer);
    if (_disposed) return;
    if (Util.appState == AppLifecycleState.resumed) {
      _toCheckServer();
    } else {
      eventCenter.addListener("System.AppLifecycleState", _onAppLifecycleState);
    }
  }

  _onAppLifecycleState(String name, dynamic data) {
    if (Util.appState == AppLifecycleState.resumed) {
      _toCheckServer();
    }
  }

  void _toCheckServer() {
    _reqWaitIndex = 0;
    _showLoading(K.be_confirming);
    _checkServer();
  }

  void _checkServer() async {
    if (_lastPayId == null || _lastPayId! <= 0 || _disposed) return;

    _reqWaitIndex++;
    if (_reqWaitIndex > 3) {
      _onError(K.pay_would_delay_wait);
      return;
    }

    Log.d("checkserver $_lastPayId");

    try {
      XhrResponse response = await Xhr.postJson("${System.domain}pay/return", {'id': _lastPayId.toString()}, throwOnError: false);
      Map res = response.value();
      if (_disposed) return;

      if (res['success'] == true) {
        if (res['paied'] == true) {
          //钱有变化，全局通知
          eventCenter.emit(EventConstant.EventUserMoneyChange);
          //钱有变化，全局通知
          _isWaiting = false;
          hideLoading();
          PulseLog.instance.log(PayBody(PayAction.payed, {}, true));
          if (onPayed != null) onPayed!();

          /// 统计付款成功事件
          IMainManager mainManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
          mainManager.trackEvent(AppsFlyerEvent.PURCHASE, eventValue: {AppsFlyerParameter.VALIDATED: true});

          PulseLog.instance.log(PayBody(PayAction.loadPayReturn, {'payId': _lastPayId.toString()}, true));
        } else {
          _showLoading('${K.be_confirm}($_reqWaitIndex)...');

          JsTimer.clearTimeout(_timer);
          _timer = JsTimer.setTimeout(() {
            _checkServer();
          }, 2000);
        }
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          PulseLog.instance.log(PayBody(PayAction.loadPayReturn, {'payId': _lastPayId.toString()}, false, reason: res['msg']));
          _onError(res['msg'], errorCode: Util.parseInt(res['code']));
        } else {
          PulseLog.instance.log(PayBody(PayAction.loadPayReturn, {'payId': _lastPayId.toString()}, false, reason: 'vertify_failed'));
          _onError(K.pay_vertify_failed, isErrorCatch: true);
        }
        hideLoading();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: K.network_error_retry, gravity: ToastGravity.CENTER);

      JsTimer.clearTimeout(_timer);
      _timer = JsTimer.setTimeout(() {
        _checkServer();
      }, 2000);
    }
  }

  void _disposeH5() {
    hideLoading();

    if (_h5 != null) {
      _h5!.dispose();
      _h5 = null;
    }
  }

  void disposed() {
    eventCenter.removeListener("System.AppLifecycleState", _onAppLifecycleState);
    eventCenter.removeListener(EventConstant.WebsocketEventMessage, _onSocketMessage);
    _disposeH5();
    if (_iap != null) {
      _iap!.dispose();
      _iap = null;
    }
    _disposed = true;
  }

  void hideLoading() {
    if (_loading != null) {
      _loading!.close();
      _loading = null;
    }
  }

  void _showLoading(String message) async {
    if (_loading != null) {
      _loading!.setLabel(message);
      return;
    }

    _loading = DialogLoadingController();
    await _loading!.show(context: context, message: message, barrierDismissible: true);
  }

  dynamic _onSocketMessage(String name, dynamic data) {
    if (lastPayKey != payKey) {
      Log.d('_onSocketMessage ignore, lastPayKey: $lastPayKey, payKey: $payKey');
      return;
    }
    Map res = data as Map;
    if (name != EventConstant.WebsocketEventMessage) return;
    if (res['name'] == 'pa' 'y.complete' && res['data'] is Map) {
      Map map = res['data'];
      int? lastPid;
      if (map['pid'] != null && map['pid'] is int) {
        lastPid = map['pid'];
      }
      Log.d("_onSocketMessage lastPid=$lastPid");
      _onH5Complete(lastPid);
    }
  }

  bool isMoneyBean(Map? args) {
    return args != null && args['params'] != null && (args['params']['gift_type'] == 'bean' || args['params']['money_type'] == 'bean');
  }

  bool isMoneyGoldCoin(Map? args) {
    return args != null && args['params'] != null && (args['params']['gift_type'] == 'coin' || args['params']['money_type'] == 'coin');
  }
}
