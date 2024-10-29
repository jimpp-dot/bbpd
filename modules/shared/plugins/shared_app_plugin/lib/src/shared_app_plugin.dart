import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///app默认channel,处理些简单的与android层或ios层的交互事件
class SharedAppPlugin {
  static BuildConfig? buildConfig;

  static const MethodChannel methodChannel =
      MethodChannel('ly.plugins.shared_app_plugin');

  static Future exitApplication() async {
    return await methodChannel.invokeMethod('exitApplication');
  }

  static Future backToHome() async {
    return await methodChannel.invokeMethod('backToHome');
  }

  static Future memoryUsage() async {
    return await methodChannel.invokeMethod('memoryUsage');
  }

  static Future finishActivity() async {
    return await methodChannel.invokeMethod('finishActivity');
  }

  static void showOngoingNotification(
      String? iconCacheFilePath, String? ownerName) {
    if (!Platform.isAndroid) {
      return;
    }

    if (iconCacheFilePath == null || ownerName == null) {
      return;
    }

    Map map = {};
    map['iconCacheFilePath'] = iconCacheFilePath;
    map['ownerName'] = ownerName;
    methodChannel.invokeMethod('showOngoingNotification', map);
  }

  static void cancelOngoingNotification() {
    if (Platform.isAndroid) {
      methodChannel.invokeMethod('cancelOngoingNotification');
    }
  }

  static Future<String> getMetadata(String name) async {
    String? data = await methodChannel.invokeMethod('getMetadata', name);
    return data ?? '';
  }

  static Future<BuildConfig> getBuildConfig() async {
    if (buildConfig == null) {
      buildConfig = BuildConfig();

      Map map = await methodChannel.invokeMapMethod("getBuildConfig") ?? {};
      buildConfig!.DEBUG = map['DEBUG'];
      buildConfig!.APPLICATION_ID = map['APPLICATION_ID'];
      buildConfig!.BUILD_TYPE = map['BUILD_TYPE'];
      buildConfig!.FLAVOR = map['FLAVOR'];
      buildConfig!.VERSION_CODE = map['VERSION_CODE'];
      buildConfig!.VERSION_NAME = map['VERSION_NAME'];
    }

    return buildConfig!;
  }

  static int TYPE_VOICE_CALL = 0;
  static int TYPE_MUSIC = 3;

  static Future<String> getFileMD5(String filePath) async {
    String? fileMD5 = await methodChannel.invokeMethod('getFileMD5', filePath);
    return fileMD5 ?? '';
  }

  static Future<String> getMacAddress() async {
    String? mac = await methodChannel.invokeMethod('getMacAddress');
    return mac ?? '';
  }

  static Future<String> getWalleChannel() async {
    String channel = Platform.isAndroid
        ? await methodChannel.invokeMethod('getWalleChannel')
        : '';
    return channel;
  }

  static Future<String> getDeviceId() async {
    String? id = await methodChannel.invokeMethod('getDeviceId');
    return id ?? '';
  }

  static Future<String> getOaid() async {
    String? id = await methodChannel.invokeMethod('getOaid');
    return id ?? '';
  }

  static Future<String> getIdfa() async {
    String? idfa = await methodChannel.invokeMethod('getIdfa');
    return idfa ?? '';
  }

  static Future<String> getAppState() async {
    String? appState = await methodChannel.invokeMethod('getAppState');
    return appState ?? '';
  }

  static Future<String?> getExternalFilesDir(String type) async {
    //获取放apk文件的路径
    try {
      String dirPath =
          await methodChannel.invokeMethod('getExternalFilesDir', type);
      return dirPath;
    } on PlatformException {
      // ignore: avoid_print
      print("getExternalFilesDir error");
    }
    return null;
  }

  static Future<bool> goToAppMarket(String packageName) async {
    bool? success =
        await methodChannel.invokeMethod('goToAppMarket', packageName);
    return success ?? false;
  }

  static Future<void> gotoAppStoreDetailPage(String appId) async {
    if (!Platform.isAndroid) {
      await methodChannel.invokeMethod('gotoAppStoreDetailPage', appId);
    }
  }

  static Future<void> installApk(File apkFile) async {
    var exists = await apkFile.exists();
    if (exists) {
      methodChannel.invokeMethod('installApk', apkFile.path);
    }
  }

  static void showUpgradeWebsite(String url) async {
    //去官网
    try {
      await methodChannel.invokeMethod('android_view_url', url);
    } on PlatformException {
      Log.d("android_view_url error");
    }
  }

  static Future<String?> getWifiIpAddress() async {
    try {
      String ip = await methodChannel.invokeMethod('getWifiIpAddress');
      return ip;
    } on PlatformException {
      Log.d("getWifiIpAddress error");
    }

    return null;
  }

  static Future<Map?> getEmulatorInfo() async {
    if (!Platform.isAndroid) return null;
    try {
      return await methodChannel.invokeMethod('getEmulatorInfo');
    } on PlatformException {
      Log.d("getEmulatorInfo error");
    }

    return null;
  }

  static Future<bool> isRooted() async {
    try {
      bool isRooted = false;
      if (Platform.isAndroid) {
        isRooted = await methodChannel.invokeMethod('isRooted');
      } else if (Platform.isIOS) {
        isRooted = false;
      }
      return isRooted;
    } on PlatformException {
      Log.d('isRooted error');
    }

    return false;
  }

  static Future<String?> hFunc(String text) async {
    Map map = {};
    map['text'] = text;
    try {
      return await methodChannel.invokeMethod('hFunc', map);
    } on PlatformException {
      Log.d("hFunc error");
    }

    return null;
  }

  static Future<String?> decrypt(String text) async {
    Map map = {};
    map['text'] = text;
    try {
      return await methodChannel.invokeMethod('decrypt', map);
    } on PlatformException {
      Log.d("decrypt error");
    }

    return null;
  }

  static Future<String> getIOSWxAppId() async {
    try {
      return await methodChannel.invokeMethod("getAppId");
    } on PlatformException {
      Log.d("get wx appid error");
    }

    return '';
  }

  static void setBadgeNumber(int number) async {
    if (!Platform.isAndroid) return;

    Map map = {};
    map['number'] = number;
    try {
      await methodChannel.invokeMethod('setBadgeNumber', map);
    } on PlatformException {
      Log.d("setBadgeNumber error");
    }
  }

  static Future<bool> areNotificationEnabled() async {
    bool? result = await methodChannel.invokeMethod('areNotificationEnabled');
    return result ?? false;
  }

  static void openNotificationSettings() async {
    await methodChannel.invokeMethod('openNotificationSettings');
  }

  static void createAndroidNotificationChannels() async {
    if (!Platform.isAndroid) return;
    await methodChannel.invokeMethod('createAndroidNotificationChannels');
  }

  static Future<String> getApplicationStartFrom() async {
    String? result = await methodChannel
        .invokeMethod('getApplicationStartFrom')
        .catchError((e) {
      Log.d(e.toString());
    });
    return result ?? '';
  }

  static Future<bool> is64bitCPU() async {
    if (!Platform.isAndroid) return true;
    bool? result = await methodChannel.invokeMethod('is64bitCPU');
    return result ?? false;
  }

  static Future<String> getTTChannel() async {
    String? channel = await methodChannel.invokeMethod('getTTChannel');
    return channel ?? '';
  }

  static Future<String> getUserAgent() async {
    String? userAgent = await methodChannel.invokeMethod('getUserAgent');
    return userAgent ?? '';
  }

  static Future<String> getIosASAToken() async {
    String? result = await methodChannel.invokeMethod('getIosASAToken');
    return result ?? '';
  }

  static Future<Locale> get locale async {
    Map message = await methodChannel.invokeMethod('getLocale');
    Log.d("get locale======>>>>$message");
    Locale local = Locale(message['languageCode'], message['countryCode']);
    return local;
  }

  /// 只支持获取安卓系统内存大小，返回的单位是多少G的运行内存，返回的结果 > 0，则说明正确获取到了；如果返回-1，则代表失败了
  static Future<double> get totalMemorySize async {
    if (!Platform.isAndroid) return -1;
    double? total =
        await methodChannel.invokeMethod('getSystemTotalMemorySize');
    Log.d("get total memory size======>>>>：$total");
    return total ?? -1;
  }

  /// 拷贝文件到download目录，iOS不能保存文件到非自身app文件夹下的路径
  static Future<bool> copyFileToDownload(String? filePath,
      {String? destRelativePath, String? displayName}) async {
    if (filePath == null || filePath.isEmpty) {
      return false;
    }

    if (Platform.isAndroid) {
      bool? result = await methodChannel.invokeMethod('copyFileToDownload', {
        'srcFilePath': filePath,
        'destRelativePath': destRelativePath,
        'displayName': displayName
      });
      return result ?? false;
    } else {
      return false;
    }
  }
}

class BuildConfig {
  bool? DEBUG;
  String? APPLICATION_ID;
  String? BUILD_TYPE;
  String? FLAVOR;
  int? VERSION_CODE;
  String? VERSION_NAME;
}
