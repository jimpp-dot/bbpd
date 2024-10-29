import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:bbpd/application.dart';
import 'package:bbpd/init.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bugly/bugly.dart';
import 'package:pulse_log/pulse_log.dart';

import 'valid_build.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      initApp();
    },
    (error, stackTrace) async {
      Bugly.reportError(error, stackTrace);
      PulseLog.instance.flutterError(FlutterErrorDetails(exception: error, stack: stackTrace));
    },
    zoneSpecification: ZoneSpecification(print: (self, parent, zone, message) {
      if (kDebugMode) {
        parent.print(zone, message);
      }
    }),
  );

  imageCache.maximumSize = 1000;
  imageCache.maximumSizeBytes = 1024 * 1024 * 100;
}

initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Config.init();

  await HiveUtil.init();

  await Util.checkNetworkPermissionIfNeeded();

  await DeviceInfo.init();

  await Constant.init();

  validDebugBuild();

  Constant.creditExitRoom = false;

  Util.appName = '快乐星球';
  Constant.iosAppInfoAppId = '6505131271';

  System.mainDomain = BaseConfig.instance.mainDomain;

  if (Constant.isDevMode) {
    /// 正式包不做DeveloperOptions，不然域名有问题
    DeveloperOptions.initServer();
  }

  Xhr.init();

  // 日志采集
  PulseLog.config(CommonLogConfig());
  PulseLog.enablePrint = false;
  PulseLog.toggle(false);

  /// AppConfig.useBBlog

  // 埋点SDK
  initTracker();

  CachedNames.instance();

  initComponents();
  await Translations.initMain();

  initGlobalListeners();

  /// 提前加载广告
  await initOpenAd();
  setupLogging();

  initCurrentTheme();

  runApp(DefaultAssetBundle(bundle: otaResourceBundle, child: const App()));

  if (Platform.isAndroid && DeviceInfo.androidSdkInt >= 23) {
    //only for after android M
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    try {
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    } on PlatformException catch (e) {
      Log.e('setSystemUIOverlayStyle failed e:${e.message}');
    }
  }
}

Future<void> initTracker() async {
  await Tracker.init(appId: BaseConfig.instance.trackerAppId, serverUrl: System.dataDomain);
  Map<String, dynamic> superProperties = {
    'package_name': DeviceInfo.packageInfo.packageName,
    'channel': DeviceInfo.channel,
    'mac': DeviceInfo.mac,
    'did': DeviceInfo.did
  };
  if (Session.isLogined) {
    superProperties.addAll({'vip': Session.vipNew});

    //极光拉活需要userID可以通过这取到
    superProperties.addAll({'userId': Session.uid});

    String group = Session.getString("group", "");
    if (!Util.isStringEmpty(group)) {
      superProperties["group"] = group;
    }
  }

  try {
    String startFrom = await SharedAppPlugin.getApplicationStartFrom().catchError((e) {
      Log.e('getApplicationStartFrom failed: $e');
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
          Log.e('getTotalUnreadCount failed: $e');
        });
      }
    }

    superProperties['icon_number'] = num;

    DateTime now = DateTime.now();
    bool isFirstBootToday = true;

    int lastBootMilliseconds = Util.parseInt(Config.get('boot.time', '0'));
    if (lastBootMilliseconds > 0) {
      DateTime lastBootTime = DateTime.fromMillisecondsSinceEpoch(lastBootMilliseconds);
      if (now.year == lastBootTime.year && now.month == lastBootTime.month && now.day == lastBootTime.day) {
        isFirstBootToday = false;
      }
    }
    superProperties['is_first'] = isFirstBootToday;
  } catch (e, s) {
    Log.e(e, stackTrace: s);
  }

  Log.d('Tracker super properties: $superProperties');

  if (Platform.isAndroid) {
    /// oppo隐私检测，数数频繁获取设备信息（每隔30s）
    superProperties['#device_id'] = DeviceInfo.mac;
    superProperties['#manufacturer'] = DeviceInfo.manufacturer;
    superProperties['#device_model'] = DeviceInfo.model;
  }

  await Tracker.instance.setSuperProperties(superProperties);
  Tracker.instance.enableAutoTrack();
  if (System.debug) {
    bool trackLogEnabled = Util.parseBool(Config.getInt('track_log_enabled', 0));
    Tracker.enableTrackLog(trackLogEnabled);
  }
}

Future<void> initOpenAd() async {
  if (Session.isLogined) {
    await OpenScreenAd.prepareFirst();
  }
}

void setupLogging() {
  Log.init();

  final originalOnError = FlutterError.onError;
  if (Session.isLogined) {
    Bugly.setUserId('${Session.uid}');
  }
  final originalPlatformDispatchError = PlatformDispatcher.instance.onError;
  FlutterError.onError = (FlutterErrorDetails details) {
    originalOnError?.call(details);

    Log.e(details.exception, stackTrace: details.stack, tag: 'main', details: details);
    PulseLog.instance.flutterError(details);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    originalPlatformDispatchError?.call(error, stack);
    Bugly.reportError(error, stack);

    return true;
  };
}
