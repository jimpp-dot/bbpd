import 'dart:async';
import 'dart:io';  
import 'package:bbcore/bbcore.dart';
import 'package:bbcore/localStorage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application.dart'; 

void main() async {
  Util.setBanban(true); 
  WidgetsFlutterBinding.ensureInitialized(); 
 
  Util.setListenImFirstReceiveMsg(true);
  await LocalStorage.init();
  await Config.init();
  await TagConfigDb.init();

  Map<String, String> channelDisplay = {
  };
  await DeviceInfo.init(channelDisplay);

  await Constant.init();
  Constant.amapKEY = "16a8bc4c6d753f23aa2e9ee602b3bb2d";

  Constant.creditExitRoom = false;

  if (Platform.isAndroid) {
    Util.appName = Constant.androidAppName;
    System.mainDomain = await SharedAppPlugin.getMetadata('MAIN_DOMAIN');
    String result = await SharedAppPlugin.getMetadata('USE_CUSTOM_PORT');
    System.useCustomPort = result == 'true';
    await SharedAppPlugin.getBuildConfig();
  } else {
    Util.appName = '伴伴';
    System.mainDomain = 'yinjietd.com';
  } 

  DeveloperOptions.initServer();

  List<String> safeDomains = [
    'yinjietd.com',
    'yinjieim.com',
    'olaola.chat',
    'iambanban.com',
    'qmecms.me',
    'byteaudio.live',
    'byteaudio.life',
    'yinjieapp.com',
    'hotplay8.com',
    'imbb.cc',
    'ourydc.com', //2019-07-26 新增
    'bytevoice.me',
    'bytevoice.live',
    'bytevoice.life',
    'bytevoice.xyz',
    'bytelive.me',
    'bytelive.life',
    'bytelive.live',
    'bytelive.xyz',
    'ilangrensha.com',
  ];
  BaseConfig.config(BanbanConfig());
  Xhr.init(safeDomains);


  Im.init();
  // 埋点SDK
  await _initTracker();

  // AMapLocationClient.setApiKey("912f401480d6a8e0fde28a0805fbe704");
  // BCWebSocket.instance();
  CachedNames.instance();
  AudioPlayHelper.instance();

  // initComponents();
  await Translations.initMain();

  // initGlobalListeners();

  if(kDebugMode){
    print("====kDebugMode=$kDebugMode");
    initMain();
  }else{
    runZoned<Future<void>>(() async {
      initMain();
    },
        zoneSpecification:
        ZoneSpecification(print: (self, parent, zone, message) {
          // if (Bugly.isInDebugMode) {
          //   if (parent != null) {
          //     parent.print(zone, message);
          //   }
          // }
          // Ignore message.
        })

        , onError: (error, stackTrace) async {
          print(stackTrace);
          if (Platform.isIOS) {
            // if (Bugly.isInDebugMode) {
            //   print('In dev mode. Not sending report ');
            //   return;
            // }

            // Bugly.reportError(error, stackTrace);
          } else if (Platform.isAndroid) {
            // Bugly.reportError(error, stackTrace);
          }
        });


  }



  // imageCache.maximumSize = 1000;
  // imageCache.maximumSizeBytes = 1024 * 1024 * 100;
}



initMain(){
  ///只有在debug模式才在此重新初始化theme，目的是hot reload时主题修改能即时生效
  if (!System.isDevMode) {
    // initCurrentTheme();
  }

  //前置登录AB测试
  await Util.judgeBootBeforeLogin();

  SharedAppPlugin.cancelOngoingNotification();

  runApp(App());

  if (Platform.isAndroid && DeviceInfo.androidSdkInt >= 23) { //only for after android M
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    try {
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    } on PlatformException {
      print('setSystemUIOverlayStyle failed');
    }
  }

}




Future<void> _initTracker() async {
  await Tracker.init(appId: BaseConfig.instance.trackerAppId, serverUrl: System.dataDomain);
  Map<String, dynamic> superProperties = {'package_name': DeviceInfo.packageInfo.packageName, 'channel': DeviceInfo.channel, 'mac': DeviceInfo.mac, 'did': DeviceInfo.did};
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
    String startFrom = await SharedAppPlugin.getApplicationStartFrom().catchError((e) {
      Log.d('Init Tracker super properties, getApplicationStartFrom error: $e');
    });
    superProperties['refer'] = startFrom ?? '';

    int num = 0;

    /// 未登录不要调用，没有意义，还会引起IOS弹不出数据跟踪弹窗的bug，导致拒审
    if (Session.isLogined) {
      if (Platform.isIOS) {
        /// 这行代码会让IOS打开申请通知栏权限弹窗
        num = await Badge.getBadge();
      } else if (Platform.isAndroid) {
        num = await Im.getTotalUnreadCount().catchError((e) {
          Log.d('Init Tracker super properties, getTotalUnreadCount error: $e');
        });
      }
    }

    superProperties['icon_number'] = num ?? 0;

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
  } catch (e) {
    Log.d('Init Tracker super properties with error: $e');
  }

  Log.d('Tracker super properties: $superProperties');

  await Tracker.instance.setSuperProperties(superProperties);
  Tracker.instance.enableAutoTrack();
  if (System.isDevMode) {
    bool trackLogEnabled = Util.parseBool(Config.getInt('track_log_enabled', 0));
    Tracker.enableTrackLog(trackLogEnabled);
  }
}

  

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key); 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar( 
        title: Text(widget.title),
      ),
      body: const Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is a example',
            ), 
          ],
        ),
      ),  
    );
  }
}
