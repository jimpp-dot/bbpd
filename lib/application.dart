import 'dart:async';
import 'dart:io';

import 'package:bbpd/routes.dart';
import 'package:bbpd/page/boot.dart';
import 'package:bbpd/page/home/bio_block.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:shared/util/developer/guagua/guagua_overlay.dart';
import 'package:get/get.dart';
import 'package:pulse_log/pulse_log.dart';
import 'init.dart';
import 'package:base_attr_report/base_attr_report.dart';
import 'package:provider/provider.dart' hide Selector;

class App extends BaseApp {
  const App({Key? key}) : super(key: key);

  @override
  BaseAppState createState() => _AppState();
}

class _AppState extends BaseAppState<App> {
  bool _showPerformanceOverlay = Util.showPerformanceOverlay;
  bool _trackingAuthorizationDidRequest = false;
  int _enterBackgroundTime = 0;
  late ISettingManager _settingManager;

  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  @override
  void initState() {
    super.initState();
    eventCenter.addListeners([
      EventConstant.BrightnessEvent,
      'primarySwatch',
      EventConstant.ShowPerformanceOverlay,
      EventConstant.EventLogin,
      EventConstant.EventLogout,
      EventConstant.EventRegister,
      EventConstant.ChangeLan,
    ], onEvent);

    _requestTrackingAuthorization();

    Future.delayed(const Duration(seconds: 1), () {
      GuaguaOverlay.init(plugins: [DevOptionsPlugin()]);

      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.init(withEnterPreCheck: true);

      IWereWolfManager wereWolfManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_WERE_WOLF);
      wereWolfManager.init();

      /// 防止在initComponents时为登录状态，在这延时又变成未登录态（如：被其他设备挤下线），
      /// 在这里强制执行registerLogin，在registerLogin保证不重复调用
      registerLogin();

      BoxShowTool.init();
      BoxShowV2Tool.init();
      if (Util.appState == AppLifecycleState.resumed &&
          mounted &&
          Session.uid > 0 &&
          _settingManager.isUsed(Session.uid) &&
          BioBlock.isEmpty()) {
        BioBlock.show(_onSuccess);
      } else if (mounted && Session.isLogined) {
        _initUser();
        if (Platform.isIOS) {
          _payManager.initIAP();
        }
      }
    });

    _settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);

    /// 开屏广告
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      OpenScreenAd.launch(context, appLaunch: true);
    });
  }

  _onSuccess() {
    if (!mounted) return;
    if (Session.isLogined) {
      _initUser();
      if (Platform.isIOS) {
        _payManager.initIAP();
      }
    }
    UiView.init();
  }

  @override
  void dispose() {
    eventCenter.removeListeners([
      EventConstant.BrightnessEvent,
      'primarySwatch',
      EventConstant.ShowPerformanceOverlay,
      EventConstant.EventLogin,
      EventConstant.EventLogout,
      EventConstant.EventRegister,
      EventConstant.ChangeLan,
    ], onEvent);
    super.dispose();
  }

  /// 请求iOS ATT授权
  void _requestTrackingAuthorization() async {
    if (_trackingAuthorizationDidRequest) {
      return;
    }

    try {
      //这个方法在iOS16上会因为剪切板权限获取弹窗，导致被阻塞，操作弹窗后会，该方法立即返回，但此时appState瞬间处于inactive，导致跟踪权限弹窗无法展示，所以这里需要判断appState，如果inactive，需要等到下次active重试唤起弹窗
      // 以上方案也不能保证100%弹出，所以改为只要notDetermined,就重试

      if (Platform.isIOS && Util.compareSystemVersion('14.5') >= 0) {
        TrackingStatus status =
            await AppTrackingTransparency.requestTrackingAuthorization();
        if (status == TrackingStatus.notDetermined) {
          await Future.delayed(const Duration(seconds: 1));
          _requestTrackingAuthorization();
          return;
        }
      }

      _reportAfterCheckIdfa();
      _trackingAuthorizationDidRequest = true;
    } catch (e) {
      // Unexpected exception was thrown
    }
  }

  void _reportAfterCheckIdfa() async {
    if (Platform.isIOS) {
      await DeviceInfo.updateIdfa();
      // Android之前已经报过了，这里iOS请求idfa后再更新一遍
      Xhr.reportVersion(force: true);
    }

    // 第一次安装授权之后再次初始化
    Util.getAttrReportParams().then((value) {
      BASEAttrReport.instance.init(
          overseas: false, domain: System.mainDomain, regularParams: value);
      BASEAttrReport.instance.report(BASEAttrReportAction.start);
    });

    _requestASAToken();
  }

  _requestASAToken() async {
    bool result = Config.getBool(BBConfigKey.hasRequestIosASAToken);
    if (Platform.isIOS && !result) {
      String str = await SharedAppPlugin.getIosASAToken();
      String idfa = DeviceInfo.idfa;
      if (Util.validStr(str)) {
        BaseRequestManager.uploadASAToken(str, idfa);
      }
      Log.d('_requestASAToken:$str');
      Config.setBool(BBConfigKey.hasRequestIosASAToken, true);
    }
  }

  void _onSchemeUrlEvent(String? urlPath) {
    //Clear system clipboard first to avoid do the same thing twice
    Clipboard.setData(const ClipboardData(text: ''));

    String? path = urlPath;
    if (path == null || path.isEmpty) {
      return;
    }

    bool valid = Routes.checkOuterPathValid(path);
    int rid = Util.parseInt(
        path.substring(path.lastIndexOf('/') + 1, path.lastIndexOf('￥')), 0);
    if (valid && rid > 0) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(System.context, rid);
    }
  }

  // Future checkClipboardWhenResumed() async {
  //   if (!Session.isLogined) {
  //     return;
  //   }

  //   Future.delayed(const Duration(milliseconds: 100), () async {
  //     ClipboardData? clipboardData = await Clipboard.getData('text/plain');
  //     String? input = clipboardData?.text;
  //     if (input == null) {
  //       return;
  //     }
  //     RegExp regExp = RegExp(r"￥[^￥]{3,}￥");
  //     RegExpMatch? match = regExp.firstMatch(input);
  //     if (match != null) {
  //       String? path = match.group(0);
  //       _onSchemeUrlEvent(path);
  //     }
  //   });
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (Util.appState != state) {
      if (state == AppLifecycleState.resumed) {
        appNavigatorObserver.onResumed();
      } else if ((Platform.isIOS && state == AppLifecycleState.inactive) ||
          (Platform.isAndroid && state == AppLifecycleState.paused)) {
        appNavigatorObserver.onPaused();
      }

      if (state == AppLifecycleState.resumed) {
        BASEAttrReport.instance.report(BASEAttrReportAction.active);
      } else {
        BASEAttrReport.instance.report(BASEAttrReportAction.inactive);
      }
    }

    Util.appState = state;
    int now = DateTime.now().millisecondsSinceEpoch;
    Log.d(state);
    Log.d(now - _enterBackgroundTime);
    if (Util.appState == AppLifecycleState.paused) {
      _enterBackgroundTime = now;
    } else if (Util.appState == AppLifecycleState.resumed &&
        Session.uid > 0 &&
        _enterBackgroundTime > 0 &&
        now - _enterBackgroundTime > 1000 * 60 &&
        !Util.isAndroid &&
        _settingManager.isUsed(Session.uid) &&
        BioBlock.isEmpty()) {
      _enterBackgroundTime = 0;
      Log.d("display bio");
      BioBlock.show();
    }

    // if (Util.appState == AppLifecycleState.resumed) {
    //   checkClipboardWhenResumed();
    // }

    if (Util.appState == AppLifecycleState.resumed &&
        Session.getInt('deleted', 0) > 1 &&
        Session.uid > 0) {
      Session.sync({});
    }
  }

  _initUser() {
    Session.sync({
      'money': true,
      'auth': true,
    });
  }

  onEvent(String type, dynamic data) async {
    Log.d("onEvent $type");
    switch (type) {
      case EventConstant.BrightnessEvent:
        break;
      case 'primarySwatch':
        if (data is Map) {
          Map res = data;
          Util.brightness = Brightness.light;
          Config.set("config.primarySwatch", res['type']);
          return;
        }
        break;
      case EventConstant.ShowPerformanceOverlay:
        if (data is bool) {
          _showPerformanceOverlay = data;
        }
        break;
      case EventConstant.ChangeLan:
        if (data is Locale) {
          freeLocalizationStateKey.currentState?.changeLocale(data);
        }
        break;
      case EventConstant.EventLogin:
        PulseLog.instance.login(Session.uid.toString());
        // 数据上报:登录
        Tracker.instance.login(Session.uid.toString());
        _initTracker(); // 重新生成 数数上报的公共属性
        Map<String, dynamic> map = {'is_success': true};
        if (data is Map && data.containsKey('login_type')) {
          map['login_type'] = data['login_type'];
        }
        if (data is Map && data.containsKey('is_auto')) {
          map['is_auto'] = data['is_auto'];
        }
        Tracker.instance.track(TrackEvent.login, properties: map);
        Tracker.instance.user_set({
          'uname': Session.name,
          'gender': Session.sex,
          'birthday': Session.getString('birthday'),
          'latest_login_time': DateTime.now().toyyyyMMddHHmmss(),
          'mac': DeviceInfo.mac,
          'idfa': DeviceInfo.idfa,
          'oaid': DeviceInfo.oaid,
          'did': DeviceInfo.did,
        });
        Future.delayed(const Duration(seconds: 1), () {
          //避免注册登录上报近乎同时上报时，登录先完成上报
          BASEAttrReport.instance
              .report(BASEAttrReportAction.login, uid: '${Session.uid}');
        });

        return;
      case EventConstant.EventLogout:
        PulseLog.instance.logout();
        Tracker.instance.logout();
        Tracker.instance.track(TrackEvent.logout);
        break;
      case EventConstant.EventRegister:
        BASEAttrReport.instance
            .report(BASEAttrReportAction.reg, uid: '${Session.uid}');
        break;
      default:
        return;
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _initTracker() async {
    Map<String, dynamic> superProperties = {
      'package_name': DeviceInfo.packageInfo.packageName,
      'channel': DeviceInfo.channel,
      'mac': DeviceInfo.mac,
      'did': DeviceInfo.did
    };
    if (Session.isLogined) {
      superProperties.addAll({
        'vip': Session.vipNew,
      });

      //极光拉活需要userID可以通过这取到
      superProperties.addAll({
        'userId': Session.uid,
      });

      String group = Session.getString("group", "");
      if (!Util.isStringEmpty(group)) {
        superProperties["group"] = group;
      }
    }

    try {
      String startFrom =
          await SharedAppPlugin.getApplicationStartFrom().catchError((e) {
        Log.d(
            'Init Tracker super properties, getApplicationStartFrom error: $e');
      });
      superProperties['refer'] = startFrom;

      int num = 0;

      /// 未登录不要调用，没有意义，还会引起IOS弹不出数据跟踪弹窗的bug，导致拒审
      if (Session.isLogined) {
        if (Platform.isIOS) {
          /// 这行代码会让IOS打开申请通知栏权限弹窗
          num = await PushUtils.getBadge();
        } else if (Platform.isAndroid) {
          num = await Im.getTotalUnreadCount().catchError((e) {
            Log.d(
                'Init Tracker super properties, getTotalUnreadCount error: $e');
          });
        }
      }

      superProperties['icon_number'] = num;

      DateTime now = DateTime.now();
      bool isFirstBootToday = true;

      int lastBootMilliseconds = Util.parseInt(Config.get('boot.time', '0'));
      if (lastBootMilliseconds > 0) {
        DateTime lastBootTime =
            DateTime.fromMillisecondsSinceEpoch(lastBootMilliseconds);
        if (now.year == lastBootTime.year &&
            now.month == lastBootTime.month &&
            now.day == lastBootTime.day) {
          isFirstBootToday = false;
        }
      }
      superProperties['is_first'] = isFirstBootToday;
    } catch (e) {
      Log.d('Init Tracker super properties with error: $e');
    }

    Log.d('Tracker super properties: $superProperties');

    if (Platform.isAndroid) {
      /// oppo隐私检测，数数频繁获取设备信息（每隔30s）
      superProperties['#device_id'] = DeviceInfo.mac;
      superProperties['#manufacturer'] = DeviceInfo.manufacturer;
      superProperties['#device_model'] = DeviceInfo.model;
    }
    await Tracker.instance.setSuperProperties(superProperties);
  }

  @override
  void rebuild() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget? _renderHome(BuildContext context) {
    if (!Util.isLoginBeforeBoot()) return const Boot();
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      return loginManager.getLoginPage(true);
    }
    if (Session.role == UserRole.REG) {
      ILoginManager? loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      return loginManager?.getLoginProfile();
    }
    return Boot(isFromLogin: isBootFromLogin);
  }

  @override
  Widget build(BuildContext context) {
    final easyLoad = EasyLoading.init();
    Log.d("App Build");

    ///只有在debug模式才在此重新初始化theme，目的是hot reload时主题修改能即时生效
    if (System.debug) {
      initCurrentTheme();
    }

    Widget child = MultiProvider(
      providers: globalProviders,
      child: WillPopScope(
        onWillPop: () async {
          Log.d('back key pressed in application');
          return false;
        },
        child: GetMaterialApp(
          navigatorKey: navKey,
          title: Util.appName,
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: _showPerformanceOverlay,
          navigatorObservers: defaultNavigatorObservers,
          localeResolutionCallback: defaultLocaleResolutionCallback,
          supportedLocales: SupportLanguage.supports
              .map<Locale>((SupportLanguage code) => code.locale),
          builder: (BuildContext context, child) {
            child = easyLoad(context, child);
            return DefaultTextStyle(
              style: TextStyle(
                fontFamily: Util.fontFamily,
              ),
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: ChangeLanWidget(
                  key: freeLocalizationStateKey,
                  child: child,
                ),
              ),
            );
          },
          onGenerateRoute: (settings) => NamedRoutes.getRoutes(settings),
          localizationsDelegates: const [
            ChineseCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: getDefaultThemeData(),
          home: Builder(
            builder: (context) {
              Constant.context = context;
              System.context = context;
              return _renderHome(context) ?? const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
    return child;
  }
}
