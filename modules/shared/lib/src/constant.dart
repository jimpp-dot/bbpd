import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/shared.dart';

//一些通用的全局变量
class Constant {
  static String? proxy;

  static String appVersion = ''; // 传给服务端的version。根据versionName组合而成，规则详见 app_version.properties
  static String packageName = ''; // 应用唯一ID
  static String versionName = ''; // 外显版本号。如：5.0.10
  static String versionCode = ''; // 内部版本号。iOS无，Android => versionCode

  static late BuildContext context;

  static late Directory documentsDirectory;
  static late Directory temporaryDirectory;
  static Directory? externalStorageDirectory;

  static const String testSign = 'banban';

  static String? androidAppName;

  static String? logoPath;

  static String iosAppInfoAppId = '1599063568';

  static bool creditExitRoom = true; //退房扣信誉分

  static int defaultDropDownAlertSec = 3;

  static String? defaultAvatarPath;

  static String? roomTabCurrentKey;

  /// 是否使用protobuf，方便测试
  static bool proxyShowPb = true;

  // app当前tab选中的名称，用来埋点，目前仅嗨歌实现了
  static String currentTabName = '';

  /// 是否开启调试模式
  static bool isDevMode = false;

  /// debug模式下，是否跳过所有验证、弹窗等
  static bool debugPassAll = false;

  /// 是否Release包
  static bool inProduction = true;

  /// 调试模式下是否开启bugly
  static bool buglyInDevMode = false;

  /// 意见反馈地址
  static String feedbackUrl = '${System.getWebDomain("page")}/tools/back-stage/cs/feedBackList';

  /// 新注册用户的tabbar布局，该数据通过注册接口返回
  static List<String> newRegisterUserTabs = [];

  static String pMC = Constant.iKeyM + Constant.iW1 + Constant.iapPTy + Constant.iap0 + Constant.iKeyC + Constant.iS + Constant.iKeyH;

  static String pMCB = Constant.iKeyM +
      Constant.iW1 +
      Constant.iapPTy +
      Constant.iap0 +
      Constant.iKeyC +
      Constant.iS +
      Constant.iKeyH +
      Constant.iap0 +
      Constant.iKeyB;

  static List<String> awakenedGifts = [];

  static bool useVscode = const bool.fromEnvironment('VSCODE', defaultValue: false);

  static init() async {
    inProduction = const bool.fromEnvironment('dart.vm.product', defaultValue: true);
    isDevMode = const bool.fromEnvironment('DEBUG_MODE', defaultValue: false);
    debugPassAll = isDevMode && const bool.fromEnvironment('DEBUG_PASS_ALL', defaultValue: false);
    if (kDebugMode) {
      isDevMode = true;
    }
    temporaryDirectory = await getTemporaryDirectory();
    documentsDirectory = await getApplicationDocumentsDirectory();
    if (Platform.isAndroid) {
      externalStorageDirectory = await getExternalStorageDirectory();
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    packageName = packageInfo.packageName;
    versionName = packageInfo.version;
    versionCode = packageInfo.buildNumber;
    androidAppName = packageInfo.appName;
    appVersion = '$versionName.0';

    /// Android和iOS已统一使用3位显示，故而此处传给服务端需要补0（IP的方式解析 x.x.x.x）。

    logoPath = 'logo.png';
    defaultAvatarPath = 'ic_user_none_one.png';

    //initialize the proxy in DevMode
    if (Constant.isDevMode) {
      bool isOpen = Config.getBool(PROXY_SWITCH_KEY);
      String proxy = Config.get(PROXY_KEY);
      if (isOpen && !Util.isStringEmpty(proxy)) {
        Constant.proxy = proxy;
      }
    }
    awakenedGifts = AppConfig.awakenedGifts;
  }

  static String iapPT1 = 'pa';
  static String iapPTy = 'y';
  static String iap0 = '_';
  static String iapPTT = 'ty';
  static String iapPT4 = 'pe';

  static String iKeyM = 'm';
  static String iW1 = 'one';

  static String iKeyC = 'c';
  static String iS = 'as';
  static String iKeyH = 'h';
  static String iKeyB = 'b';
}
