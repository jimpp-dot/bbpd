import 'dart:async';
import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class BaseApp extends StatefulWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  BaseAppState createState() => BaseAppState();
}

class BaseAppState<T extends BaseApp> extends State<BaseApp>
    with WidgetsBindingObserver {
  bool isBootFromLogin = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  String _usage = '';
  Timer? _usageTimer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    eventCenter.addListeners([
      EventConstant.EventCancelLogin,
      EventConstant.EventLoginBeforeBoot,
      'System.Need.Login',
      'System.Need.Refresh',
    ], _onEvent);

    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener(EventConstant.EventLogout, _onLogout);
    appStateObserver.addListener(_onAppStateChange);

    Future.delayed(const Duration(milliseconds: 1000)).then((dynamic val) {
      initSensitiveWords();
      PushChannel.init();

      if (!Util.isLocale) {
        SharedAppPlugin.createAndroidNotificationChannels();
      }
      initConnectivity();

      if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
      Upgrade.checkUpgrade(context);
    });
  }

  _onEvent(String type, dynamic data) async {
    switch (type) {
      case 'System.Need.Refresh':
        break;
      case 'System.Need.Login':
        Navigator.popUntil(System.context, ModalRoute.withName('/'));
        break;
      case EventConstant.EventLoginBeforeBoot:
        isBootFromLogin = true;
        BuildContext navigatorContext = data;
        Navigator.popUntil(navigatorContext, ModalRoute.withName('/'));
        if (Session.isLogined) {
          try {
            Fluttertoast.showToast(
                msg: R.string('has_login_succ'), gravity: ToastGravity.CENTER);
          } catch (e) {}
        }
        break;
      case EventConstant.EventCancelLogin:
        cancelLogin();
        return;
        break;
      default:
        return;
    }
    rebuild();
  }

  void cancelLogin() {
    if (Platform.isAndroid) {
      SharedAppPlugin.finishActivity();
    }
  }

  void rebuild() {}

  @override
  void dispose() {
    appStateObserver.removeListener(_onAppStateChange);
    WidgetsBinding.instance.removeObserver(this);
    eventCenter.removeListeners([
      EventConstant.EventCancelLogin,
      EventConstant.EventLoginBeforeBoot,
      'System.Need.Login',
      'System.Need.Refresh',
    ], _onEvent);
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (appStateObserver.value != state) {
      appStateObserver.value = state;
      appStateObserver.notifyListeners();
    }
  }

  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    imageCache.clear();
  }

  _onLogin(String type, dynamic data) {
    PushChannel.pushReportOnLogin();
  }

  _onLogout(String type, dynamic data) {
    if (data is int) {
      int uid = data;
      PushChannel.pushReportOnLogout(uid);
    }
  }

  Future initConnectivity() async {
    Util.connectivityResult ??= await (Connectivity().checkConnectivity());

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      Util.connectivityResult = result;
      bool isNetworkConnected = result != ConnectivityResult.none;
      _onConnectivityChanged(isNetworkConnected);
      eventCenter.emit(
          EventConstant.EventConnectivityChanged, isNetworkConnected);
    });
  }

  /// 网络状态变化
  void _onConnectivityChanged(bool isNetworkConnected) {
    if (isNetworkConnected) {
      Log.d('_onConnectivityChanged: isNetworkConnected');
      DeviceInfo.fetchDidIfNeeded();
    }
  }

  void _onAppStateChange() {
    final isResumed = appStateObserver.value == AppLifecycleState.resumed;
    if (isResumed) {
      Log.d('AppLifecycleState.resumed');
      DeviceInfo.fetchDidIfNeeded();
    }
  }

  void initTimer() {
    _usageTimer?.cancel();
    _usageTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      SharedAppPlugin.memoryUsage().then((value) {
        if (mounted) {
          setState(() {
            _usage = value;
          });
        }
      });
    });
  }
}

GlobalKey<_LanState> freeLocalizationStateKey = GlobalKey<_LanState>(); // 1

class ChangeLanWidget extends StatefulWidget {
  final Widget? child;

  const ChangeLanWidget({Key? key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LanState();
  }
}

class _LanState extends State<ChangeLanWidget> {
  Locale? _locale;

  void changeLocale(Locale locale) async {
    await Translations.init(locale);
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: _locale ?? Localizations.localeOf(context),
      child: widget.child,
    );
  }
}
