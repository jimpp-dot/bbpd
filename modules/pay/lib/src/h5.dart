import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../k.dart';
import 'package:pulse_log/pulse_log.dart';

typedef OnPayErrorMessage = void Function(String message);
typedef OnComplete = void Function(int aId);
typedef OnOpenApp = void Function();

class H5 {
  H5(
      {this.onComplete,
      required this.onError,
      required this.context,
      this.onOpenApp});

  start(String? token) {
    if (token != null && token.isNotEmpty) {
      PulseLog.instance.log(PayBody(PayAction.willOpenH5, {}, true));
      String url = "${System.payDomain}pay/h5Pay/?token=$token";
      Log.d("H5PayScreen url: $url");
      Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, a1, a2) => _H5PayScreen(
          url: url,
          onComplete: onComplete,
          onError: onError,
          onOpenApp: onOpenApp,
        ),
        settings: const RouteSettings(name: '/h5PayScreen'),
      ));
    } else {
      PulseLog.instance.log(
          PayBody(PayAction.willOpenH5, {}, false, reason: 'invalid token'));
      onError(K.pay_invalid_token);
    }
  }

  final BuildContext context;
  final OnPayErrorMessage onError;
  final OnComplete? onComplete;
  final OnOpenApp? onOpenApp;

  void dispose() {
    //noting to do
  }
}

class _H5PayScreen extends StatefulWidget {
  final String? url;
  final OnPayErrorMessage? onError;
  final OnComplete? onComplete;
  final OnOpenApp? onOpenApp;

  const _H5PayScreen({this.url, this.onError, this.onComplete, this.onOpenApp});

  @override
  State<StatefulWidget> createState() {
    return _H5PayState();
  }
}

class _H5PayState extends State<_H5PayScreen> {
  int _checkTimer = 0;
  bool _luanchingApp = false;
  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        EventConstant.WebsocketEventMessage, _onSocketMessage);
    _checkTimer = JsTimer.setTimeout(_onCheckTimeout, 1000 * 20);
  }

  @override
  void dispose() {
    super.dispose();
    JsTimer.clearTimeout(_checkTimer);
    eventCenter.removeListener(
        EventConstant.WebsocketEventMessage, _onSocketMessage);
  }

  void _onCheckTimeout() {
    _displayErrorMessage(K.h5_socket_timeout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: 1,
          height: 1,
          color: Colors.transparent,
          child: WebView(
            initialUrl: widget.url,
            navigationDelegate: _navigationDecision,
            onWebErrorCallback: _onWebErrorCallback,
            onWebViewCreated: (webViewController) {
              _webViewController = webViewController;
            },
          ),
        ),
      ),
    );
  }

  String? _lastUrl;

  NavigationDecision _navigationDecision(NavigationRequest navigation) {
    String scheme = Uri.parse(navigation.url).scheme;
    String host = Uri.parse(navigation.url).host;
    String url = navigation.url;
    String g = K.string_bao;
    String a = 'al';
    String b = 'tt';
    String c = 'pa';
    String z = K.string_zhi;
    String d = 'i';
    String f = K.string_fu;
    String h = 'hello';
    String e = 'y';
    String n = 'bye';
    String s = 's';

    String m = a + d + c + e;
    String m1 = m + s;
    String zf = z + f;
    String zfb = zf + g;

    String wx = 'wx';
    String dot = '.';
    String ten = 'ten';
    String com = 'com';

    String wxHost = wx + dot + ten + c + e + dot + com;

    NavigationDecision decision = NavigationDecision.navigate;

    if ([m, m1, 'weixin'].contains(scheme)) {
      JsTimer.clearTimeout(_checkTimer);

      decision = NavigationDecision.prevent;

      Map names = {
        m: zfb,
        m1: zfb,
        'weixin': K.string_wechat,
      };
      String appName = names[scheme];

      void start(String appName, String scheme, String url) async {
        if (!_luanchingApp &&
            ((scheme == m || scheme == m1) ||
                (scheme == 'weixin' && await canLaunch(url)))) {
          try {
            _luanchingApp = true;

            /// 先pop WebView，等100ms再启动支付应用。防止部分vivo Android 9的机型WebView出现线程锁crash
            /// FORTIFY: pthread_mutex_lock called on a destroyed mutex（WebViewGoogle.apk）
            Navigator.of(context).pop();
            await Future.delayed(const Duration(milliseconds: 100));
            await launch(url);
            _luanchingApp = false;
            if (widget.onOpenApp != null) widget.onOpenApp!();
            PulseLog.instance.log(PayBody(PayAction.h5Jump,
                {'appName': appName, 'scheme': scheme, 'url': url}, true));
          } catch (e) {
            _luanchingApp = false;
            if (widget.onOpenApp != null) widget.onOpenApp!();
            Fluttertoast.showToast(msg: K.something_went_wrong);
          }
        } else {
          PulseLog.instance.log(PayBody(PayAction.h5Jump,
              {'appName': appName, 'scheme': scheme, 'url': url}, false,
              reason: 'failed_hasnt_install:$appName'));
          _displayErrorMessage(zf + K.failed_hasnt_install + appName);
        }
      }

      start(appName, scheme, url);
    }
    if (host == wxHost && _lastUrl != null && _lastUrl!.isNotEmpty) {
      decision = NavigationDecision.prevent;
      _webViewController?.loadUrl(url, headers: {'Referer': _lastUrl!});
      PulseLog.instance.log(PayBody(PayAction.h5Jump,
          {'host': host, 'url': url, 'Referer': _lastUrl}, true,
          reason: 'reload'));
    }

    _lastUrl = url;
    return decision;
  }

  void _onWebErrorCallback(WebError? webError) {
    if (webError != null && webError.code == -999) {
      _displayErrorMessage(webError.msg ?? '');
    }
  }

  void _onHttpErrorCallback(WebError httpError) {
    PulseLog.instance.log(PayBody(PayAction.openH5, {}, false,
        reason: 'HttpError: code=${httpError.code},msg=${httpError.msg}'));
    Log.d(
        '${httpError.code}------------------------------------------------${httpError.code}');
  }

  void _displayErrorMessage(String message) {
    PulseLog.instance.log(
        PayBody(PayAction.openH5, {}, false, reason: 'WebError: $message'));
    JsTimer.clearTimeout(_checkTimer);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: Text(K.something_went_wrong),
              content: Text(message),
              actions: <Widget>[
                CupertinoButton(
                    child: Text(K.h5_abandon),
                    onPressed: () {
                      Navigator.of(context).pop();

                      ///dialog销毁
                      if (widget.onError != null)
                        widget.onError!(
                            K.string_zhi + K.string_fu + K.has_cancel);
                      Navigator.of(context).pop();

                      ///h5页面销毁
                    }),
                CupertinoButton(
                    child: Text(K.try_again),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _webViewController?.reload();
                      _checkTimer =
                          JsTimer.setTimeout(_onCheckTimeout, 1000 * 6);
                    }),
              ]);
        });
  }

  /// 支付成功后页面销毁了，收不到消息
  dynamic _onSocketMessage(String name, dynamic data) {
    if (name != EventConstant.WebsocketEventMessage) return;
    Map res = data;
    if (res['name'] == 'pa' 'y.complete' && res['data'] is Map) {
      Map map = res['data'];
      int? lastPid;
      if (map['pid'] != null && map['pid'] is int) {
        lastPid = map['pid'];
      }
      JsTimer.clearTimeout(_checkTimer);
      if (widget.onComplete != null) widget.onComplete!(lastPid ?? 0);
    }
  }
}
