// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/k.dart';
import 'package:shared/shared.dart';

///此类为一些无关业务的通用函数
class Util {
  static bool unityShowing = false;

  static int parseInt(dynamic value, [int defaultValue = 0]) {
    if (value == null) return defaultValue;
    if (value is String) {
      try {
        return int.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    if (value is int) return value;
    if (value is double) return value.toInt();
    return defaultValue;
  }

  static List<int> parseIntList(dynamic ids) {
    List<int> value = [];
    if (ids != null && ids is List) {
      for (var val in ids) {
        try {
          int id = Util.parseInt(val);
          value.add(id);
        } catch (e, s) {
          Log.e(e, stackTrace: s);
        }
      }
    }
    return value;
  }

  static List<T> parseList<T>(dynamic list, T Function(dynamic e) f) {
    if (list == null) return <T>[];
    if (list is List) {
      return list.map((e) => f(e)).toList();
    } else {
      return <T>[];
    }
  }

  static Map? parseMapNullable(dynamic value, [Map? defaultValue]) {
    if (value is Map) {
      return value;
    } else if (value is String) {
      try {
        dynamic map = json.decode(value);
        return map is Map ? map : defaultValue;
      } catch (e) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  static Map<String, dynamic> parseStrKeyMap(dynamic map) {
    Map<String, dynamic> value = {};
    if (map is Map) {
      for (var key in map.keys) {
        if (key is String) {
          value[key] = map[key];
        } else {
          value[notNullStr(key)] = map[key];
        }
      }
    }
    return value;
  }

  static Map<String, String> parseStrKeyValueMap(dynamic map) {
    Map<String, String> value = {};
    if (map is Map) {
      for (var key in map.keys) {
        String fixKey = '';
        String fixValue = '';
        if (key is String) {
          fixKey = key;
        } else {
          fixKey = notNullStr(key);
        }
        if (value is String) {
          fixValue = map[key];
        } else {
          fixValue = notNullStr(map[key]);
        }
        value[fixKey] = fixValue;
      }
    }
    return value;
  }

  static double parseDouble(dynamic value, [double defaultValue = 0.0]) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  static String? parseStr(dynamic value) {
    if (value == null) return null;
    return '$value';
  }

  static String notNullStr(dynamic value, {String? def}) {
    if (value == null) {
      return def ?? '';
    }
    return '$value';
  }

  static Map parseMap(dynamic value, {Map def = const {}}) {
    if (value is Map) {
      return value;
    }
    if (value is String) {
      try {
        Map? map = json.decode(value);
        return map ?? def;
      } catch (e) {
        return def;
      }
    }
    return def;
  }

  static String parseHelpUrl(int number) {
    var url = "${System.getWebDomain("help")}/help?q=k$number";
    url += "&package=${Constant.packageName}";
    url += "&lan=${Translations.getLan()}";
    url += "&ch=${Uri.encodeComponent(DeviceInfo.channel)}";

    return url;
  }

  static String parseActHelpUrl(String path) {
    var url = '${System.getWebDomain('page')}/act/act-center/help/$path?';
    url += 'package=${Constant.packageName}';
    url += '&lan=${Translations.getLan()}';
    url += '&ch=${Uri.encodeComponent(DeviceInfo.channel)}';

    return url;
  }

  static int strLen(String origin) {
    Runes runes = origin.runes;
    return runes.length;
  }

  static bool validStr(String? value) {
    return (value != null && value.isNotEmpty);
  }

  static bool validList(dynamic value) {
    return (value is List && value.isNotEmpty);
  }

  static String subString(String origin, int startIndex, [int? endIndex]) {
    Runes runes = origin.runes;
    if (endIndex == null || endIndex > runes.length) {
      endIndex = runes.length;
    }
    return String.fromCharCodes(runes, startIndex, endIndex);
  }

  static Color? parseColor(dynamic color, [Color? defColor]) {
    if (color is! String || color.length < 6) return defColor;
    String colorStr = color;
    String resultStr = '';

    if (colorStr.length >= 8) {
      resultStr = '0x${colorStr.substring(colorStr.length - 8)}';
    } else {
      resultStr = '0xff${colorStr.substring(colorStr.length - 6)}';
    }
    try {
      return Color(int.parse(resultStr));
    } catch (e) {
      return defColor;
    }
  }

  static List<Color> parseColors(dynamic colorData, [Color? defColor]) {
    List<Color> colors = [];
    List colorStrs = [];
    if (colorData is String) {
      colorStrs = colorData.split(',');
    } else if (colorData is List) {
      colorStrs = colorData;
    }

    for (var element in colorStrs) {
      if (parseColor(element, defColor) != null) {
        colors.add(parseColor(element, defColor)!);
      }
    }

    return colors;
  }

  static List<Color> parseColorJson(String? colorStr, [Color? defColor]) {
    if (colorStr == null || colorStr.isEmpty) return [];
    try {
      List<Color> colors = [];
      List colorStrList = jsonDecode(colorStr);
      for (var element in colorStrList) {
        if (parseColor(element, defColor) != null) {
          colors.add(parseColor(element, defColor)!);
        }
      }
      return colors;
    } catch (e) {
      return [];
    }
  }

  static bool parseBool(dynamic value, [bool? defValue]) {
    if (value == null) return defValue ?? false;

    if (value is bool) return value;
    if (value is int) return value > 0;
    if (value is String) {
      if (value == 'true') {
        return true;
      } else if (value == 'false') {
        return false;
      }
      return Util.parseInt(value) > 0;
    }

    return false;
  }

  static String parsePhoneNum(String? phoneNum) {
    if (phoneNum == null) {
      return '';
    }
    RegExp regExp = RegExp(r'[0-9]');
    Iterable<Match> regMatchs = regExp.allMatches(phoneNum);
    String phoneStr = '';
    for (var element in regMatchs) {
      phoneStr = phoneStr + (element.group(0) ?? '');
    }
    if (phoneStr.length > 11) {
      phoneStr = phoneStr.substring(phoneStr.length - 11);
    }
    if (phoneStr.length == 11 && phoneStr[0] == '1') {
      return phoneStr;
    }
    return '';
  }

  static String parseIcon(dynamic url) {
    if (url is! String) return '';
    if (url.trim().isNotEmpty) {
      if (!url.startsWith(RegExp(r'http(s?):\/\/'))) {
        url = System.imageDomain + url;
      }
    }
    return url;
  }

  static String getDistanceStr(dynamic distance) {
    int value = parseInt(distance);
    if (value < 100) {
      return '0.10km';
    }
    return '${(value / 1000).toStringAsFixed(2)}km';
  }

  ///验证是否是有效的日期格式
  static bool verifyDate(String date) {
    RegExp regExp = RegExp(
        r'(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)');
    return regExp.hasMatch(date);
  }

  static bool verifyIcon(String icon) {
    RegExp regExp1 = RegExp(r'^[\d]{6}\/[\d]{2}\/[a-z0-9_\.]');
    RegExp regExp2 = RegExp(r'^public\/static\/icon\/.');

    return regExp1.hasMatch(icon) || regExp2.hasMatch(icon);
  }

  static String removeDecimalZeroFormat(double? num) {
    if (num == null) {
      return '';
    } else if (num.truncateToDouble() == num) {
      return '${num.floor()}';
    } else {
      return '$num';
    }
  }

  static String getRouteName(BuildContext context) {
    if (ModalRoute.of(context) != null) {
      return ModalRoute.of(context)!.settings.name!;
    }
    return '';
  }

  static List<List<dynamic>> groupItems(List<dynamic> data, int limit) {
    if (isCollectionEmpty(data)) {
      return [];
    }

    List<List<dynamic>> groupItems = [];
    while (data.length > limit) {
      groupItems.add(data.sublist(0, limit));
      data = data.sublist(limit);
    }

    if (data.isNotEmpty) {
      groupItems.add(data);
    }
    return groupItems;
  }

  static get isAndroid {
    return Platform.isAndroid;
  }

  static get isIOS {
    return Platform.isIOS;
  }

  static get isIOSSimulator {
    return Platform.isIOS && DeviceInfo.isRealSimulator;
  }

  static get isAndroidSimulator {
    return Platform.isAndroid && DeviceInfo.isRealSimulator;
  }

  static bool get isOnlyIphoneX {
    const X_WIDTH = 1125;
    const X_HEIGHT = 2436;

    if (!Platform.isIOS) return false;

    if ((window.physicalSize.width == X_WIDTH && window.physicalSize.height == X_HEIGHT) ||
        (window.physicalSize.width == X_HEIGHT && window.physicalSize.height == X_WIDTH)) {
      return true;
    }

    return false;
  }

  static bool get isIphoneX {
    Set<Size> iphone = {
      const Size(1125, 2436), //iPhone X跟iphone 12 mini的渲染分辨率一致
      const Size(2436, 1125),
      const Size(1242, 2688), // xs max
      const Size(2688, 1242),
      const Size(828, 1792), // XR
      const Size(1792, 828),
      const Size(750, 1624), // 11
      const Size(1624, 750), // 11 land
      const Size(1170, 2532), // 12
      const Size(2532, 1170), // 12 land
      const Size(1284, 2778), // 12 max
      const Size(2778, 1284), // 12 max land
      const Size(1179, 2556), // iphone_14
      const Size(2556, 1179), // iphone_14 land
      const Size(1290, 2796), // iphone_14 max
      const Size(2796, 1290), // iphone_14 max land
    };

    if (Platform.isIOS && iphone.contains(window.physicalSize)) {
      return true;
    }

    return false;
  }

  static EdgeInsets get screenPadding {
    return MediaQueryData.fromView(window).padding;
  }

  static double get statusHeight => safeEdge.top;

  /// 安全区域，键盘弹起不变化
  static EdgeInsets get safeEdge => MediaQueryData.fromView(flutterView).viewPadding;

  /// 全面屏底部安全区域高度，键盘弹起不变化
  static double get iphoneXBottom => safeEdge.bottom;

  static FlutterView get flutterView => WidgetsBinding.instance.platformDispatcher.views.single;

  static double get bottomMargin {
    return isIphoneX ? 34.0 : 20.0;
  }

  static double get width {
    double ratio = window.physicalSize.width / window.physicalSize.height;
    if (ratio >= 0.8 && ratio < 1.2) {
      /// 简单适配下宽屏手机上的问题
      return height * 9 / 16;
    }
    return window.physicalSize.width / window.devicePixelRatio;
  }

  static double get height {
    return window.physicalSize.height / window.devicePixelRatio;
  }

  static double get devicePixelRatio {
    return window.devicePixelRatio;
  }

  static double get shortScreenRatio {
    double shortRatio = 0.86;
    return width / height >= 0.5622 ? shortRatio : 1;
  }

  ///设计以iPhone6为标准设计基准，宽度的虚拟像素为375，ratio为换算比例
  static double get ratio {
    if (width > height) {
      return Util.height / 375;
    } else {
      return Util.width / 375;
    }
  }

  /// 以高度811为标准设计换算
  static double get hRatio {
    if (width > height) {
      return Util.width / 811;
    } else {
      return Util.height / 811;
    }
  }

  static double? _diagonalRatio;

  /// 以 375*811 设计图标准对角线比例计算的dp
  static double get diagonalRatio {
    if (_diagonalRatio == null) {
      double logicDiagonalLen = sqrt(375 * 375 + 811 * 811);
      double sysDiagonalLen = sqrt(Util.width * Util.width + Util.height * Util.height);
      _diagonalRatio = sysDiagonalLen / logicDiagonalLen;
    }
    return _diagonalRatio!;
  }

  ///高度小于等于iPhone6
  static bool get smallHeightScreen {
    return Util.height <= 667;
  }

  static Brightness _brightness = R.color.statusBarTheme;

  static Brightness get brightness {
    return _brightness;
  }

  static bool get isDark {
    return brightness == Brightness.dark;
  }

  static set brightness(Brightness value) {
    _brightness = value;
    if (Util.brightness == Brightness.light) {
      eventCenter.emit(EventConstant.BrightnessEvent, Brightness.light);
    } else {
      eventCenter.emit(EventConstant.BrightnessEvent, Brightness.dark);
    }
  }

  static Size physicalSize = window.physicalSize;

  static bool get isLandscape => MediaQuery.of(System.context).orientation == Orientation.landscape;

  static const String _fontFamilyIos = 'PingFang SC';

  static String get fontFamily {
    return _fontFamilyIos;
  }

  static String get numFontFamily {
    return 'D-DINExp';
  }

  static AppLifecycleState _appState = AppLifecycleState.resumed;

  static AppLifecycleState get appState {
    return _appState;
  }

  static set appState(AppLifecycleState value) {
    _appState = value;
    eventCenter.emit(EventConstant.SystemAppLifecycleState);
  }

  static bool get isAppActive {
    return _appState == AppLifecycleState.resumed;
  }

  static bool _showPerformanceOverlay = false;

  static bool get showPerformanceOverlay {
    return _showPerformanceOverlay;
  }

  static set showPerformanceOverlay(bool value) {
    _showPerformanceOverlay = value;
    eventCenter.emit(EventConstant.ShowPerformanceOverlay, value);
  }

  /// 开发者模式入口开关。 ps: 入口仅在登陆后才显示，故而不做持久化。
  static bool _showDevEntrance = true;

  static bool get showDevEntrance {
    return _showDevEntrance;
  }

  static set showDevEntrance(bool value) {
    _showDevEntrance = value;
    eventCenter.emit('System.Need.Refresh'); // 通知 application.dart => build()
  }

  static unverifiedSkill(dynamic skillId) {
    if (Util.isVerify == false) return false;
    const map = {
      17: true,
      32: true,
      34: true,
      25: true,
      23: true,
      38: true,
      42: true,
    };
    var key = parseInt(skillId);
    return map[key] ?? false;
  }

  static MaterialColor primarySwatch = Colors.blue;

  static bool _isVerify = false;

  // static bool _isAndroidVerify = true;

  //是否是国际化版本
  static bool _isLocale = false;

  static bool get isVerify {
    return Platform.isIOS && _isVerify;
  }

  static set isVerify(bool value) {
    bool old = isVerify;
    _isVerify = value;
    if (Platform.isIOS && old != isVerify) eventCenter.emit("System.Verify.Changed");
  }

  static bool get isLocale => _isLocale;

  static set isLocale(bool value) {
    _isLocale = value;
  }

  static bool needHideAllTitle() {
    return Util.isSleeplessPlanetVerify;
  }

  /// 快乐星球审核屏蔽，默认不屏蔽
  static bool isSleeplessPlanetVerify = false;

  /// 不启用AndroidVerify，目前暂时没有Android过审屏蔽的需求，防止服务端在某些场景下发true（挂代理）
  static bool get isAndroidVerify {
    // if (Platform.isAndroid && _isAndroidVerify == true) return true;
    return false;
  }

  static set isAndroidVerify(bool value) {
    // bool old = _isAndroidVerify;
    // _isAndroidVerify = value;
    // if (Platform.isAndroid && old != isAndroidVerify) eventCenter.emit("System.Verify.Changed");
  }

  static String _appName = '';
  static String happyxq.ccLinkUrl = 'https://www.happyxq.cc.cn';

  static String get appName {
    if (Platform.isIOS) {
      return _appName;
    } else if (Platform.isAndroid) {
      return _appName;
    } else {
      return K.base_app_name;
    }
  }

  static set appName(String name) {
    _appName = name;
  }

  // static String get coin {
  //   if (Platform.isIOS || Util.isLocale) {
  //     return K.base_coin;
  //   } else {
  //     return K.base_yuan;
  //   }
  // }
  //
  // // 货币icon  ios展示虚拟币  android展示人民币
  // static String get moneyIcon {
  //   if (Platform.isIOS || Util.isLocale) {
  //     return R.imagePath('ic_money_ios.png', package: ComponentManager.MANAGER_SETTINGS);
  //   }
  //   return R.imagePath('ic_money.png', package: ComponentManager.MANAGER_SETTINGS);
  // }

  static String md5Encryption(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toLowerCase();
  }

  static bool _isLoginBeforeBoot = true;

  /// 是否需要先登录再到首页
  static bool isLoginBeforeBoot() => _isLoginBeforeBoot;

  static setLoginBeforeBoot(bool value) {
    _isLoginBeforeBoot = value;
  }

  static bool _isMatchBackground = false;

  /// 是否需要后台继续匹配
  static bool isMatchBackground() => _isMatchBackground;

  static setMatchBackground(bool value) {
    _isMatchBackground = value;
  }

  static bool _useAnimTabBar = true;

  static bool isUseAnimTabBar() => _useAnimTabBar;

  static setUseAnimTabBar(bool value) {
    _useAnimTabBar = value;
  }

  static bool _useNewOrder = false;

  static bool userNewOrder() {
    return _useNewOrder;
  }

  static void setUserNewOrder(bool value) {
    _useNewOrder = value;
  }

  /// 是否监听首次收到某个target发送过来的消息
  static bool _listenImFirstReceiveMsg = false;

  static bool listenImFirstReceiveMsg() {
    return _listenImFirstReceiveMsg;
  }

  static void setListenImFirstReceiveMsg(bool value) {
    _listenImFirstReceiveMsg = value;
  }

  /// 皮队友进房需实名认证校验
  static Future<bool> teammateHandleVerify(BuildContext context, String roomType, VoidCallback? failCallback) async {
    return true;
  }

  ///
  /// 下载指定的url为指定的名字和位置,如果旧文件md5同预期的md5值一致,则不重新下载；否则每次都会清理旧文件,如果成功则返回完整的文件路径,否则返回空
  /// url 要下载的文件url
  /// filePath 要下载的文件存的文件夹
  /// fileName 要下载的文件存的文件名
  ///
  static Future<String> downloadFile(String url, String filePath, String fileName, {String? checkMd5}) async {
    String str = '';

    String urlPath = url;
    String localDir = filePath;

    try {
      final dir = Directory(localDir);
      await dir.create(recursive: true);

      if (dir.existsSync() == true) {
        String savePath = '$localDir/$fileName';

        bool needDownload = true;
        File savePathFile = File(savePath);
        if (savePathFile.existsSync()) {
          if (checkMd5 != null && checkMd5.isNotEmpty) {
            String fileMd5 = md5.convert(savePathFile.readAsBytesSync()).toString();
            if (checkMd5.toLowerCase() != fileMd5.toLowerCase()) {
              savePathFile.deleteSync();
            } else {
              needDownload = false;
            }
          } else {
            savePathFile.deleteSync();
          }
        }

        if (needDownload) {
          var dio = Dio();
          await dio.download(
            urlPath,
            savePath,
          );
          File zipFile = File(savePath);
          if (zipFile.existsSync() && zipFile.lengthSync() > 0) {
            str = savePath;
          }
        } else {
          str = savePath;
        }
      }
    } catch (e) {}

    Log.d('startDownLoad  downloadFile $url $checkMd5 $str');

    return str;
  }

  ///
  /// 判断指定文件是否存在：判断filePath文件下fileName文件是否存在,如果checkMd5有值,则对比该文件的md5,md5不相同则需要额外删除该文件
  /// filePath 文件夹路径
  /// fileName 文件名
  /// checkMd5 要对比的md5
  ///
  static Future<bool> isFileExist(String filePath, String fileName, {String? checkMd5 = ''}) async {
    bool isExist = false;
    try {
      if ((filePath.isNotEmpty) && (fileName.isNotEmpty)) {
        String fileUrl = '$filePath/$fileName';
        Log.d("isFileExist fileUrl=$fileUrl");
        File file1 = File(fileUrl);
        if (file1.existsSync()) {
          Log.d("isFileExist file1.existsSync()=${file1.existsSync()}");
          if (checkMd5 != null && checkMd5.isNotEmpty) {
            //需要checkMd5
            String fileMd5 = md5.convert(file1.readAsBytesSync()).toString();
            Log.d("isFileExist checkMd5=$checkMd5 fileMd5=$fileMd5");
            if (checkMd5.toLowerCase() != fileMd5.toLowerCase()) {
              file1.deleteSync();
            } else {
              isExist = true;
            }
          } else {
            isExist = true;
          }
        }
      }
    } catch (e) {}
    return isExist;
  }

  ///
  /// 根据url路径下载资源到指定目录指定名,并返回下载进度
  ///
  static Future<String> downloadFileReal(String url, String filePath, String fileName, ProgressCallback onProgress) async {
    String str = '';

    String urlPath = url;
    String localDir = filePath;

    try {
      final dir = Directory(localDir);
      await dir.create(recursive: true);

      if (dir.existsSync() == true) {
        String savePath = '$localDir/$fileName';

        var dio = Dio();
        await dio.download(
          urlPath,
          savePath,
          onReceiveProgress: onProgress,
        );
        File zipFile = File(savePath);
        if (zipFile.existsSync() && zipFile.lengthSync() > 0) {
          str = savePath;
        }
      }
    } catch (e) {}

    Log.d('startDownLoad  downloadFile $url $filePath $fileName $str');

    return str;
  }

  /// 是否已经身份认证
  /// 海外版本，不需要身份认证
  static bool isIdAuthenticated({int? idCard}) {
    if (isLocale) return true;
    if (idCard == null) {
      return Session.idAuthenticated;
    } else {
      return idCard >= 3;
    }
  }

  /// 是否已经绑定手机号，主播认证
  /// 海外版本，不需要身份认证
  static bool isGodPhoneBind(int mobile) {
    if (isLocale) return true;
    return mobile > 0;
  }

  static String generateImageUrl(String subPath, {bool supportMultipleLan = false}) {
    if (supportMultipleLan) {
      List<String> split = subPath.split("/");
      if (split.length > 1) {
        String lan = Translations.getLan();
        String index = split[split.length - 2];
        String result = subPath.replaceFirst(index, "${index}_${lan.toLowerCase()}");
        return "${System.imageDomain}$result";
      }
      return "${System.imageDomain}$subPath";
    } else {
      return "${System.imageDomain}$subPath";
    }
  }

  // 计算两点（经纬度）距离
  static double getDistance(double lat1, double lng1, double lat2, double lng2) {
    double radLat1 = rad(lat1);
    double radLat2 = rad(lat2);
    double a = radLat1 - radLat2;
    double b = rad(lng1) - rad(lng2);
    double s = 2 * asin(sqrt(pow(sin(a / 2), 2) + cos(radLat1) * cos(radLat2) * pow(sin(b / 2), 2)));
    return s * 6367000.0;
  }

  static double rad(double d) {
    return d * pi / 180.0;
  }

  static String licenseUrl(LicenseType type) {
    String path = 'protocol';
    switch (type) {
      case LicenseType.USER_AGREEMENT1:
        path = 'agreement1';
        break;
      case LicenseType.USER_AGREEMENT2:
        path = 'agreement2';
        break;
      case LicenseType.USER_AGREEMENT3:
        path = 'agreement3';
        break;
      case LicenseType.USER_AGREEMENT4:
        path = 'agreement4';
        break;
      case LicenseType.CREATE_FLEET:
        path = 'protocol5';
        break;
      case LicenseType.GOD_AUTH:
        path = 'protocol6';
        break;
      case LicenseType.PRIVACY_AGREEMENT:
        path = 'privacyagreement';
        break;
      case LicenseType.APPS_PERMISSIONS:
        path = 'permissions';
        break;
      case LicenseType.INFORMATION_COLLECTION:
        path = 'informationcollectionlist';
        break;
      case LicenseType.THIRD_SDK:
        path = 'thirdsdklist';
        break;
    }
    String ch = Uri.encodeComponent(DeviceInfo.channel);
    String domain = System.getWebDomain("help");
    return addDiamondParam('$domain/help/$path?package=${Constant.packageName}&lan=${Translations.getLan()}&ch=$ch');
  }

  static String getWebUrl(String path, {Map<String, String>? params, bool useDebugUrl = false, bool forceDebugUrl = false}) {
    String ch = Uri.encodeComponent(DeviceInfo.channel);
    String domain = System.getWebDomain("page");
    String url = addDiamondParam('$domain/tools/$path?package=${Constant.packageName}&lan=${Translations.getLan()}&ch=$ch');
    if (params?.isNotEmpty ?? false) {
      url = '$url&${params!.entries.map((e) => '${e.key}=${e.value}').join('&')}';
    }
    return url;
  }

  static String getHelpUrlWithQStr(String str) {
    String ch = Uri.encodeComponent(DeviceInfo.channel);
    String domain = System.getWebDomain("help");
    return addDiamondParam("$domain/help?q=$str&package=${Constant.packageName}&lan=${Translations.getLan()}&ch=$ch");
  }

  static String getPageUrlQA(String url) {
    String ch = Uri.encodeComponent(DeviceInfo.channel);
    String domain = System.getWebDomain("page");
    return addDiamondParam('$domain/tools/image-page/appQA/$url.html?lan=${Translations.getLan()}&ch=$ch');
  }

  static String getNobilityQA() {
    String ch = Uri.encodeComponent(DeviceInfo.channel);
    String domain = System.getWebDomain("page");
    if (NobilityUtil.useNewNobilitySystem) {
      return addDiamondParam('$domain/document/k5.html?lan=${Translations.getLan()}&ch=$ch');
    }
    return addDiamondParam('$domain/document/k5.html?lan=${Translations.getLan()}&ch=$ch');
  }

  static String getPuzzleQA() {
    return '${System.getWebDomain("page")}/tools/statical2021/?clientScreenMode=1#/situation-puzzle';
  }

  static String getHelpUrl(String qa) {
    String tag = '';
    if (qa == 'popularityQA') {
      tag = 'k192';
    } else if (qa == 'vipQA') {
      tag = 'k193';
    }
    return tag.isEmpty ? '' : '${System.imageProxyDomain}/document/$tag.html';
  }

  /// 产品用工具生成的帮助链接
  static String getProductHelpUrl(String key) {
    return 'https://proxyimg.${System.mainDomain}/document/$key.html';
  }

  static String addDiamondParam(String url) {
    return '$url&isDiamond=${MoneyConfig.isDiamond() ? '1' : '0'}&version=2';
  }

  static bool isOVPhone() {
    String phoneBrand = DeviceInfo.brand;
    if (phoneBrand.contains("vivo") ||
        phoneBrand.contains("oppo") ||
        phoneBrand.contains("Vivo") ||
        phoneBrand.contains("Oppo") ||
        phoneBrand.contains("VIVO") ||
        phoneBrand.contains("OPPO")) {
      return true;
    }
    return false;
  }

  static bool isHuaWeiPhone() {
    String phoneBrand = DeviceInfo.brand;
    if (phoneBrand.toLowerCase().contains("huawei") || phoneBrand.toLowerCase().contains("honor")) {
      return true;
    }
    return false;
  }

  static bool isBbxq() {
    return 'com.yjtd.peini' == Constant.packageName;
  }

  /// 华为机器暂时不启用HybridComposition，避免崩溃
  static bool cantHybridComposition() {
    /// 只处理鸿蒙系统，鸿蒙系统Android为29（Android 10）
    return Platform.isAndroid && DeviceInfo.androidSdkInt < 30 && isHuaWeiPhone() && !isBbxq();
  }

  /// 是否使用 币
  static get useCoin {
    if (Platform.isIOS || isLocale) {
      return true;
    }
    return false;
  }

  static Future<String> getImageSrc({String path = '/who/share'}) async {
    String filePath = '';
    try {
      Directory? docDir; //getTemporaryDirectory  getExternalStorageDirectory
      if (Platform.isAndroid) {
        docDir = await getExternalStorageDirectory();
      } else {
        docDir = await getTemporaryDirectory();
      }
      String docPath = docDir?.path ?? '';

      filePath = docPath + path;
    } catch (e) {}
    return filePath;
  }

  static Future<String> base64ToFile(String src, bool withPrefix) async {
    String prefix = "data:image/png;base64,";
    String bStr = withPrefix ? src.substring(prefix.length) : src;
    bStr = bStr.replaceAll(" ", "+");
    String fileName = 'result_share.png';
    String filePath = "${await getImageSrc()}/$fileName";
    File file = File(filePath);
    file.createSync(recursive: true);
    file.writeAsBytesSync(const Base64Codec().decode(bStr));
    return filePath;
  }

  static ConnectivityResult? connectivityResult;

  static int waitNetworkPermissionDuration = 0;

  static Future checkNetworkPermissionIfNeeded() async {
    if (Platform.isIOS) {
      // Android没有网络权限弹窗，不需要检查
      bool didCheck = Config.getBool('PermissionNetworkDidCheck', false);
      if (!didCheck) {
        // app安装后没有通过网络权限检查
        Log.d('Launch: 网络权限开始首次检查');
        ConnectivityResult result = await (Connectivity().checkConnectivity());
        if (result == ConnectivityResult.none) {
          // 无网络
          String appState = await SharedAppPlugin.getAppState();
          if (appState == 'active') {
            // app在前台
            waitNetworkPermissionDuration++;
            if (waitNetworkPermissionDuration > 3) {
              // 在前台，检查超时直接弹toast
              Log.d('Launch: App在前台，等待超时，网络权限检查失败');
              // 延迟一秒让app初始化root context
              Future.delayed(const Duration(seconds: 1), () {
                Fluttertoast.showToast(
                    msg: K.alert_launch_network_error, duration: const Duration(seconds: 5), gravity: ToastGravity.CENTER);
              });
              return;
            } else {
              // 继续等待网络恢复
              Log.d('Launch: App在前台，等待未超时，继续等待网络连接');
              await Future.delayed(const Duration(seconds: 1));
              await checkNetworkPermissionIfNeeded();
            }
          } else {
            Log.d('Launch: 应用当前不在前台，继续等待网络连接');
            // 程序不在前台，可能正在被权限弹窗挡住，继续等待
            await Future.delayed(const Duration(seconds: 1));
            await checkNetworkPermissionIfNeeded();
          }
        } else {
          Log.d('Launch: 网络权限检查成功');
          Config.setBool('PermissionNetworkDidCheck', true);
        }
      }
    }
    Log.d('Launch: 网络权限检查通过');
  }

  static Future<bool> isNetworkConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  static dynamic jsonDecode(String jsonStr) {
    return json.decode(jsonStr);
  }

  ///object is List or Map
  static String jsonEncode(Object object) {
    return json.encode(object);
  }

  ///删除Unicode控制字符
  static String? removeUnsupportedCharacters(String? originText) {
    if (originText == null) return null;
    return originText.replaceAll('\u202a', '').replaceAll('\u202b', '').replaceAll('\u202d', '').replaceAll('\u202e', '');
  }

  static String emulatorInfo = '';
  static bool isRooted = false;

  static Future judgeBootBeforeLogin() async {
    bool preLogin = true;
    // 强制前置登陆
    // String url = System.domain + "home/prelogin";
    // try {
    //   XhrResponse response = await Xhr.postJson(url, {
    //     'mac': DeviceInfo.mac.replaceAll(":", "").toLowerCase(),
    //   },throwOnError: true);
    //   Map res = response.response;
    //   Log.d('_judgeBootBeforeLogin response = ${res.toString()}');
    //   if (res['success'] == true && res['data'] != null) {
    //     preLogin = res['data']['preLogin'];
    //
    //   }
    // } catch (e) {
    //   Log.d('_judgeBootBeforeLogin error = ${e.toString()}');
    // }
    _isLoginBeforeBoot = preLogin;
  }

  static Size _userUploadImageMinSize = const Size(200, 200);

  /// 用户上传形象照时，裁剪后的图片最小尺寸
  static Size getUserUploadImageMinSize() {
    return _userUploadImageMinSize;
  }

  //设置 用户上传形象照时裁剪后的图片最小尺寸
  static setUserUploadImageMinSize(Size size) {
    _userUploadImageMinSize = size;
  }

  static Size _userUploadAvatarMinSize = const Size(200, 200);

  /// 用户上传头像时，裁剪后的图片最小尺寸
  static Size getUserUploadAvatarMinSize() {
    return _userUploadAvatarMinSize;
  }

  //设置 用户上传头像时裁剪后的图片最小尺寸
  static setUerUploadAvatarMinSize(Size size) {
    _userUploadAvatarMinSize = size;
  }

  static bool isCollectionEmpty(Iterable? it) {
    return it == null || it.isEmpty;
  }

  static bool isStringEmpty(String? str, {bool? trim}) {
    bool retVal = (str == null || str.isEmpty);
    if (true == trim) {
      retVal = retVal || str.trim().isEmpty;
    }
    return retVal;
  }

  static bool _isShowXiaomiLogin = false;
  static bool _isOnlyXiaomiZf = false;

  static bool isShowXiaomiLogin() {
    return _isShowXiaomiLogin;
  }

  static void setIsShowXiaomiLogin(bool show) {
    _isShowXiaomiLogin = show;
  }

  static bool isOnlyXiaomiZf() {
    return _isOnlyXiaomiZf;
  }

  static void setIsOnlyXiaomiZf(bool value) {
    _isOnlyXiaomiZf = value;
  }

  /// 向下舍去的方式 格式化
  static String numberToWStringByFloor(int number, {int fix = 1}) {
    if (number < 10000) {
      return number.toString();
    }
    int fac = pow(10, fix).toInt();
    double temp = ((number / 10000) * fac).floorToDouble() / fac;
    return '${temp}w';
  }

  static String numberToShortString(int number, {int fix = 1}) {
    String unit = '';
    double temp = 0;
    if (number < 1000) {
      temp = number.ceilToDouble();
    } else if (number < 10000) {
      temp = number / 1000;
      unit = 'k';
    } else {
      temp = number / 10000;
      unit = 'w';
    }
    return temp.toStringAsFixed(fix) + unit;
  }

  static String numberToWString(int number, {int fix = 1}) {
    if (number < 10000) {
      return number.toString();
    }
    double temp = number / 10000;
    return '${temp.toStringAsFixed(fix)}w';
  }

  static String numberToKString(int number, {int fix = 2}) {
    if (number < 1000) {
      return number.toString();
    }
    double temp = number / 1000;
    String str = 'k';
    if (temp >= 1000) {
      temp = temp / 1000;
      str = 'b';
    }
    return temp.toStringAsFixed(fix) + str;
  }

  static String numberToSizeString(int number, {int fix = 1}) {
    if (number < 1000) {
      return '$number';
    } else if (number >= 1000 && number < 1000 * 1000) {
      return '${(number / 1000).toStringAsFixed(fix)}K';
    } else if (number >= 1000 * 1000) {
      return '${(number / (1000 * 1000)).toStringAsFixed(fix)}M';
    }
    return '$number';
  }

  static String getUserSmallIcon(String icon) {
    return '${System.imageDomain}$icon!head150';
  }

  static String imageFullUrl(String? url) {
    if (url is! String || url.isEmpty) return '';
    if (!url.startsWith(RegExp(r'http(s?)://'))) {
      url = System.imageDomain + url;
    }
    return url;
  }

  static String getRemoteImgUrl(String? url, {bool useProxy = true}) {
    if (isStringEmpty(url)) {
      return "";
    }

    if (url!.startsWith(RegExp(r'http(s?):\/\/'))) {
      return url;
    }

    // 服务端下发url，可能在开头增加斜杠，移除url开始的一个或多个斜杠
    url = url.replaceFirst(RegExp(r'^/+'), '');

    return '${useProxy ? System.imageDomain : System.imageOriginDomain}$url';
  }

  /// 心动速配服务端下发帽子，统一路径，增加最后VAP牵手动画预加载成功率
  static String getCpHatImgUrl(String? url) {
    if (!validStr(url)) {
      return '';
    }

    return Util.imageFullUrl('${url!}?x-oss-process=image/resize,m_fill,w_200,h_200,limit_1');
  }

  static String? getUserIconUrl(String? icon) {
    if (icon == null || icon.isEmpty) {
      return icon;
    }
    String url = Util.imageFullUrl(icon);
    if (!url.contains(RegExp(r'!head(\d+)')) && !url.contains('x-oss-process=image/resize')) {
      url = url + defaultSuffixByAvatar(url);
    }
    return url;
  }

  static String? cover375(String? url) {
    if (url == null || url.isEmpty) {
      return url;
    }

    if (!url.startsWith(RegExp(r'http(s?):\/\/'))) {
      url = System.imageDomain + url;
    }

    if (!url.contains(RegExp(r'!cover(\d+)')) && !url.contains(RegExp(r'!head(\d+)'))) {
      url = '$url!cover375';
    }

    return url;
  }

  /// vip/人气等级icon迁移到oss地址
  static String getRemoteLevelIcon(String url) {
    String levelPrefix = 'static/core/';
    if (!url.contains(levelPrefix)) {
      RegExp regExp = RegExp(r'^(vip/vip_|vip_gray/vip_|popularity/popularity_)\d+\.webp$');
      if (regExp.hasMatch(url)) {
        url = url.replaceFirstMapped(
          regExp,
          (m) => '$levelPrefix${m[0]}',
        );
      }
    }
    return getRemoteImgUrl(url);
  }

  ///
  static String resizeUrl(String? url, {OssScaleMode? rm, int? rw, int? rh}) {
    if (isStringEmpty(url)) {
      return "";
    }

    url = getRemoteImgUrl(url);
    if (url.contains(RegExp(r'!head(\d+)'))) {
      url = url.replaceFirst(RegExp(r'!head(\d+)'), '');
    }
    if (url.contains(RegExp(r'!cover(\d+)'))) {
      url = url.replaceFirst(RegExp(r'!cover(\d+)'), '');
    }
    String suffix = resizeSuffix(rm: rm, rw: rw, rh: rh);
    return '$url$suffix';
  }

  static String resizeSuffix({OssScaleMode? rm, int? rw, int? rh}) {
    String mode = rm == null ? '' : ',m_${rm.name}';
    String width = rw == null ? '' : ',w_$rw';
    String height = rh == null ? '' : ',h_$rh';
    return '?x-oss-process=image/resize$mode$width$height';
  }

  /// 缩放图片url,长宽尺寸相等,头像使用这个
  static String squareResize(String url, int size) {
    return resizeUrl(url, rm: OssScaleMode.fill, rw: size, rh: size);
  }

  /// 获取缩放图片的后缀
  static String squareResizeSuffix(int size) {
    return '?x-oss-process=image/resize,m_fill,w_$size,h_$size';
  }

  static String recombineUrl(String url) {
    if (isStringEmpty(url)) {
      return url;
    }
    if ((url.contains('.gif') || url.contains('.GIF')) && url.contains(RegExp(r'!head(\d+)'))) {
      /// gif格式 且 需要裁切；=> 将 !head150 改为 ?x-oss-process=image/resize,m_fill,w_150,h_150,limit_0
      int suffixIndex = url.indexOf(RegExp(r'!head(\d+)'));
      String suffixSize = url.safeSubstring(suffixIndex + 5, suffixIndex + 8);
      url = url.replaceFirst(RegExp(r'!head(\d+)'), '?x-oss-process=image/resize,m_fill,w_$suffixSize,h_$suffixSize,limit_0');
    }
    if ((url.contains('.gif') || url.contains('.GIF')) && url.contains(RegExp(r'!cover(\d+)'))) {
      /// gif格式 且 需要裁切；=> 将 !cover750 改为 ?x-oss-process=image/resize,m_lfit,w_750,limit_0
      int suffixIndex = url.indexOf(RegExp(r'!cover(\d+)'));
      String suffixSize = url.safeSubstring(suffixIndex + 6, suffixIndex + 9);
      url = url.replaceFirst(RegExp(r'!cover(\d+)'), '?x-oss-process=image/resize,m_lfit,w_$suffixSize,limit_1');
    }

    if (url.contains('.webp') && url.contains(RegExp(r'!head(\d+)'))) {
      /// 变脸礼物，webp动图，需要更换图片缩放参数
      int suffixIndex = url.indexOf(RegExp(r'!head(\d+)'));
      String suffixSize = url.safeSubstring(suffixIndex + 5, suffixIndex + 8);
      url = url.replaceFirst(RegExp(r'!head(\d+)'), '?x-oss-process=image/resize,m_fill,w_$suffixSize,h_$suffixSize,limit_0');
    }

    return url;
  }

  /// 分割有像素的url
  static String splitPx(String url) {
    String result = url;

    // 分割宽高
    List<String> strs = result.split('?');
    if (strs.length == 2) {
      result = strs[0];
    }

    return result;
  }

  static String? cover750(String? url) {
    if (url == null || url.isEmpty) {
      return null;
    }

    if (!url.startsWith(RegExp(r'http(s?):\/\/'))) {
      url = System.imageDomain + url;
    }

    if (!url.contains(RegExp(r'!cover(\d+)')) && !url.contains(RegExp(r'!head(\d+)'))) {
      url = '$url!cover750';
    }

    return url;
  }

  static String formatTimeToMinute(int second) {
    int m;
    int s;
    if (second <= 60) {
      s = second;
      m = 0;
    } else {
      m = second ~/ 60;
      s = second % 60;
    }
    return "${_withZero(m)}:${_withZero(s)}";
  }

  static String _withZero(int value) {
    return value < 10 ? "0$value" : value.toString();
  }

  static bool isNullOrEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  static int getListSizeSafely<T>(List<T>? list) {
    return list == null ? 0 : list.length;
  }

  static T? getListElementSafely<T>(List<T>? list, int? index) {
    if (index == null || index < 0) return null;
    if (index >= (list?.length ?? 0)) return null;
    return list![index];
  }

  static String getSexDesc(int sex) {
    return sex == 1 ? K.common_he : K.common_she;
  }

  static String giftImgUrl(int giftId) {
    return '${System.imageDomain}static/$giftSubDir/$giftId.png';
  }

  static String giftWebpImgUrl(int giftId) {
    return '${System.imageDomain}static/$giftSubDir/$giftId.webp';
  }

  static String giftStartImgUrl(int giftId) {
    return '${System.imageDomain}static/$giftSubDir/$giftId.s.png';
  }

  static String giftEndImgUrl(int giftId) {
    return '${System.imageDomain}static/$giftSubDir/$giftId.e.png';
  }

  /// 字符串连接
  static String concat(List<String>? array) {
    if (array?.isEmpty ?? true) return '';
    StringBuffer sb = StringBuffer();
    for (var element in array!) {
      sb.write(element);
    }
    return sb.toString();
  }

  // 系统版本与targetVersion比较，
  // -1：系统版本比targetVersion小
  // 0: 相等
  // 1：系统版本比targetVersion大
  static int compareSystemVersion(String? targetVersion) {
    if (targetVersion == null || targetVersion.isEmpty) {
      return 1;
    }

    String? systemVersion = DeviceInfo.systemVersion;

    if (systemVersion.isEmpty) {
      return -1;
    }
    if (targetVersion == systemVersion) {
      return 0;
    }

    List<String> systemArray = systemVersion.split('.');
    List<String> targetArray = targetVersion.split('.');

    int systemLength = systemArray.length;
    int targetLength = targetArray.length;

    for (int i = 0; i < min(systemLength, targetLength); i++) {
      int system = parseInt(systemArray[i], 0);
      int target = parseInt(targetArray[i], 0);
      if (system > target) {
        return 1;
      } else if (system < target) {
        return -1;
      }
    }

    if (systemLength > targetLength) {
      for (int i = min(systemLength, targetLength); i < systemLength; i++) {
        if (parseInt(systemArray[i]) > 0) {
          return 1;
        }
      }
    } else if (systemLength < targetLength) {
      for (int i = min(systemLength, targetLength); i < targetLength; i++) {
        if (parseInt(targetArray[i]) > 0) {
          return -1;
        }
      }
    }

    return 0;
  }

  /// 根据frame返回完整的头像框地址
  static String getFullFramePath(String? frame) {
    if (frame == null || frame.isEmpty) {
      return '';
    }

    if (frame.startsWith('http://') || frame.startsWith('https://')) {
      return frame;
    }

    if (frame.endsWith('.png')) {
      return '${System.imageDomain}${frame.contains('static/effect') ? frame : ('static/effect/$frame')}';
    }

    if (frame.endsWith('.webp')) {
      return '${System.imageDomain}static/effect/$frame';
    }

    return '${System.imageDomain}static/effect/$frame.png';
  }

  static String getImgUrl(String name, {String? package, bool multiLan = false}) {
    String lan = Translations.getLan();
    // 中文或者不区分语言的图片不加语言路径
    if (multiLan == false || lan == 'zh_CN') {
      lan = '';
    } else {
      lan = '$lan/';
    }
    return '${System.imageDomain}${(package?.isEmpty ?? true) ? '' : '$package/'}$lan$name';
  }

  static String defaultSuffixByAvatar(String? url) {
    String suffix = '!head150';
    if (url != null && (url.endsWith('.gif') || url.endsWith('.GIF'))) {
      /// gif图 使用 !head150 就变为静图了
      suffix = '?x-oss-process=image/resize,m_fill,w_150,h_150,limit_0';
    }
    return suffix;
  }

  static bool equalIgnoreCase(String? s1, String? s2) {
    return s1?.toLowerCase() == s2?.toLowerCase();
  }

  static double getIconSize(String type) {
    Map<String, double> res = {
      'exp': 35.0,
      'box': 55.0,
      'header': 50.0,
      'mounts': 60.0,
      'title': 60.0,
      'defend': 60.0,
      'gift': 55.0,
      'key': 55.0,
      'radio-defend': 45.0,
      'coupon': 45,
      'piece': 75,
      'bubble': 50,
    };

    return res.containsKey(type) ? res[type]! : 50.0;
  }

  /// xhr throwOnError: true
  static String getApiErrorMsg(e, {String? fixMsg, bool userDefault = true}) {
    if (Util.isStringEmpty(fixMsg) && userDefault) {
      fixMsg = K.base_please_retry;
    }

    String errorMsg = '';
    if (e != null && e is XhrError) {
      errorMsg = e.toString();
    } else {
      /// 服务器返回数据异常， 返回200，但是数据格式解析不符合，主要针对返回pb
      errorMsg = R.array('xhr_error_type_array')[6];
    }

    if (isStringEmpty(fixMsg)) {
      return errorMsg;
    }
    return '$errorMsg，$fixMsg';
  }

  ///图片通用缓存size
  static int? getCommonCacheSize(double? size) {
    if (size == null) return null;
    return (size * Util.devicePixelRatio).toInt();
  }

  ///礼物icon 目前只有礼物采用的自定义size，其他情况使用!head100形势
  static String getGiftUrlSuffix() {
    if (AppConfig.isLowSideDevice) {
      return '?x-oss-process=image/resize,w_60,h_60';
    } else if (AppConfig.isMidSideDevice) {
      return '?x-oss-process=image/resize,w_120,h_120';
    } else {
      return '?x-oss-process=image/resize,w_180,h_180';
    }
  }

  ///礼物墙礼物图片
  static String giftIcon(String icon) {
    String url = Util.parseIcon(icon);
    String tail = Util.getGiftUrlSuffix();
    if (url.contains('?')) {
      url += tail.replaceRange(0, 1, '&');
    } else {
      url += tail;
    }
    return url;
  }

  ///礼物图鉴等级图片
  static String handBookLevelIcon(String icon) {
    return "assets/images/handbook_level/$icon.webp";
  }

  static String parseSongUrl(String? url) {
    if (Util.isStringEmpty(url)) {
      return "";
    }

    if (url!.startsWith("http")) {
      return url;
    }
    return '${System.songDomain}$url';
  }

  /// 获取Uri的path的后缀名
  static String parseUriExt(Uri? uri) {
    if (uri == null) {
      return '';
    }
    if (uri.path.isEmpty) {
      return '';
    }
    int index = uri.path.lastIndexOf('.');
    if (index < 0 || index + 1 > uri.path.length) {
      return '';
    }
    try {
      return uri.path.substring(index + 1);
    } catch (e) {
      Log.d('Util.parseUriExt uri->$uri,error->$e');
      return '';
    }
  }

  /// 上传单张图片
  static Future<String?> uploadSingleImage(File image) async {
    Completer<Map?> completer = Completer<Map>();

    await ImageUploadState.uploadImage(
        imageFile: image,
        uploadUrl: '${System.domain}upload/image/',
        onComplete: (Map data) {
          completer.complete(data);
        },
        onError: (String error) {
          Fluttertoast.showToast(msg: error, gravity: ToastGravity.CENTER);
          completer.complete(null);
        });
    Map? snapshot = await completer.future;
    if (snapshot != null) {
      String url = Util.notNullStr(snapshot['name']);
      var width = snapshot['width'];
      var height = snapshot['height'];

      url = '$url?$width*$height';
      return url;
    } else {
      return null;
    }
  }

  /// 处理 文本+数字 的text在TextOverflow.ellipsis时候缩略...显示异常问题
  static String getEllipsisStr(String? str) {
    if (Util.isStringEmpty(str)) {
      return '';
    }
    return Characters(str!).join('\u200B');
  }

  static TextStyle youSheBiaoTiYuan = const TextStyle(fontFamily: 'YouSheBiaoTiYuan', package: ComponentManager.MANAGER_BASE_CORE);

  static TextStyle pingFangSC = const TextStyle(fontFamily: _fontFamilyIos);

  /// 数字用此字体
  static TextStyle numStyle = const TextStyle(fontFamily: 'D-DINExp', package: ComponentManager.MANAGER_BASE_CORE);

  /// 7日内新用户，非GS
  static bool get is7DayNewNormalUser {
    return is7DayNew && !Session.joinBroker;
  }

  /// 7日内新用户
  static bool get is7DayNew {
    int now = DateTime.now().secondsSinceEpoch;
    return (now - Session.dateline) < 7 * 24 * 60 * 60;
  }

  /// 新安装后首次启动
  static bool? _isFirstLaunch;

  static bool get isFirstLaunch {
    if (_isFirstLaunch == null) {
      _isFirstLaunch = !Config.getBool('launched', false);
      if (_isFirstLaunch == true) {
        Config.setBool('launched', true);
      }
    }
    return _isFirstLaunch!;
  }

  /// 简化整数值，防止越界
  static String matrixIntValue(int value) {
    if (value > 99999999) {
      return (value / 100000000).toStringAsFixed(1) + K.hundred_million;
    } else if (value > 99999) {
      return numberToWString(value);
    } else {
      return value.toString();
    }
  }

  /// 30日内新用户
  static bool get is30DayNew {
    int now = DateTime.now().secondsSinceEpoch;
    return (now - Session.dateline) < 30 * 24 * 60 * 60;
  }

  /// for bb_attr_report（归因SDK）， 供SDK初始化时使用
  static Future<Map<String, dynamic>> getAttrReportParams() async {
    return {
      'mac': DeviceInfo.mac,
      'uid': Session.uid.toString(),
      'channel': DeviceInfo.channel,
      'package': Constant.packageName,
      'mt': Xhr.getMt(),
      'syv': DeviceInfo.systemVersion,
      'version': Constant.appVersion,
      'jversion': Config.get('report.user.jv', ''),
      'idfa': DeviceInfo.idfa,
      'imei': DeviceInfo.deviceId,
      'oaid': DeviceInfo.oaid,
      'uagent': DeviceInfo.userAgent,
      'simulator': DeviceInfo.isSimulator,
      'root': DeviceInfo.isRoot,
    };
  }

  static Future<Map?> getEmulatorInfo() async {
    if (Platform.isAndroid) {
      return SharedAppPlugin.getEmulatorInfo();
    } else if (Platform.isIOS) {
      return {'isIOSSimulator': DeviceInfo.isSimulator ? '1' : '0'};
    }
    return null;
  }

  /// String - 驼峰转下划线
  static String humpToUnderLineString(String str) {
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
    String result = str.replaceAllMapped(exp, (Match m) => ('_${m.group(0) ?? ''}')).toLowerCase();
    return result;
  }

  /// Map - 驼峰转下划线
  static Map<String, dynamic> humpToUnderLineMap(Map<String, dynamic> map) {
    var result = <String, dynamic>{};

    for (var element in map.keys) {
      final key = humpToUnderLineString(element);
      result[key] = map[element];
    }
    return result;
  }

  /// 是否中文
  static bool isChineseStr(String? str) {
    if (str?.isNotEmpty == true) {
      for (var rune in str!.runes) {
        if (rune < 0x4e00 || rune > 0x9fff) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  static bool containTrie(String? name) {
    if (!Util.validStr(name)) {
      return false;
    }
    List<String> musicTrie = AppConfig.musicTrie;
    if (!Util.validList(musicTrie)) {
      return false;
    }
    for (int i = 0; i < musicTrie.length; i++) {
      if (Util.validStr(musicTrie[i]) && name!.contains(musicTrie[i])) {
        return true;
      }
    }
    return false;
  }

  static String? prettyJson(dynamic json) {
    if (json != null) {
      try {
        const encoder = JsonEncoder.withIndent('  ');
        return encoder.convert(json);
      } catch (_) {}
    }

    return null;
  }

  static bool get hasLocation {
    double longitude = Util.parseDouble(Config.get('location.longitude'));
    double latitude = Util.parseDouble(Config.get('location.latitude'));
    return longitude != 0.0 && latitude != 0.0;
  }

  static bool get hasOriginLocation {
    double longitude = Util.parseDouble(Config.get('location.longitude.origin'));
    double latitude = Util.parseDouble(Config.get('location.latitude.origin'));
    return longitude != 0.0 && latitude != 0.0;
  }

  /// 灰阶函数
  static ColorFilter get greyFilter => const ColorFilter.matrix(<double>[
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
      ]);

  ///阿拉伯数字转罗马数字
  static String getRomanNum(int arabNum) {
    switch (arabNum) {
      case 0:
        return "";
      case 1:
        return "Ⅰ";
      case 2:
        return "Ⅱ";
      case 3:
        return "Ⅲ";
      case 4:
        return "Ⅳ";
      case 5:
        return "Ⅴ";
      case 6:
        return "Ⅵ";
      case 7:
        return "Ⅶ";
      case 8:
        return "Ⅷ";
      case 9:
        return "Ⅸ";
    }
    return "$arabNum";
  }

  //读取 assets 中的图片
  static Future<ui.Image> loadImageFromAssets(String path) async {
    ByteData data = await otaResourceBundle.load(path);
    Uint8List bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    return decodeImageFromList(bytes);
  }
}

enum OssScaleMode {
  lfit, // 等比缩放，缩放图限制为指定w与h的矩形内的最大图片
  mfit, // 等比缩放，缩放图为延伸出指定w与h的矩形框外的最小图片
  fill, // 将原图等比缩放为延伸出指定w与h的矩形框外的最小图片，然后将超出的部分进行居中裁剪
  pad, // 将原图缩放为指定w与h的矩形内的最大图片，然后使用指定颜色居中填充空白部分
  fixed, // 固定宽高，强制缩放
}

enum LicenseType {
  USER_AGREEMENT1,
  USER_AGREEMENT2,
  USER_AGREEMENT3,
  USER_AGREEMENT4,
  CREATE_FLEET,
  GOD_AUTH,
  PRIVACY_AGREEMENT,

  /// 隐私协议 - 简明版
  APPS_PERMISSIONS,

  /// 应用权限
  INFORMATION_COLLECTION,

  /// 个人信息收集列表
  THIRD_SDK,

  /// APP接入第三方库目录
}

String describeEnum(Object? enumEntry) {
  if (enumEntry == null) return '';
  return Foundation.describeEnum(enumEntry);
}

/// String转Enum
T? stringToEnum<T extends Enum>(String type, {required List<T> enumValues}) {
  if (Util.isNullOrEmpty(type)) return null;

  final enumStrList = enumValues.map((e) => describeEnum(e)).toList();

  var index = -1;
  enumStrList.forEachIndexed((i, e) {
    if (e == type) {
      index = i;
    }
  });

  if (index >= 0) {
    return enumValues[index];
  }

  return null;
}
