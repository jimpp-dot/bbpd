import 'dart:io';
import 'dart:math';
import 'dart:ui' as sys;
import 'dart:ui';
import 'dart:async';
import 'package:shared/shared.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trusted_id/trusted_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

Map<String, dynamic> _data = {};
const Map<String, String> _ANDROID_CHANNEL = {'com.ly.bbpd.android': 'android_bbpd'};
const Map<String, String> _IOS_PID_CHANNEL = {'com.ly.bbpd.ios': 'apple_bbpd'};

class DeviceInfo {
  static int publicIP = 0;
  static bool isDidFetching = false;
  static Future<String> get appState async {
    String state = await SharedAppPlugin.getAppState();
    return state;
  }

  static Map<String, dynamic> get data => _data;

  static bool useSp = false;

  static init() async {
    try {
      DeviceInfoPlugin device = DeviceInfoPlugin();
      _packageInfo = await PackageInfo.fromPlatform();
      String packageName = _packageInfo.packageName;

      if (Platform.isAndroid) {
        AndroidDeviceInfo info = await device.androidInfo;
        String channel = await SharedAppPlugin.getWalleChannel();

        if ('tt' == channel) {
          // 头条渠道需要获取头条的分包渠道
          String ttChannel = await SharedAppPlugin.getTTChannel();
          Log.d('deviceInfo init, ttChannel: $ttChannel');
          if (ttChannel.isNotEmpty) {
            channel = '${channel}_$ttChannel';
          }
        }

        if (_ANDROID_CHANNEL.containsKey(packageName)) {
          channel = '${_ANDROID_CHANNEL[packageName]!}_$channel';
        }
        _data['channel'] = channel;
        String spDid = Config.get('deviceInfo_did');
        if (Util.validStr(spDid)) {
          _data['did'] = spDid;
          useSp = true;
        }
        _data['idfa'] = '';
        _data['model'] = info.model;
        _data['brand'] = info.brand;
        _data['manufacturer'] = info.manufacturer;
        _data['systemVersion'] = info.version;
        _data['mac'] = await SharedAppPlugin.getMacAddress();
        _data['deviceId'] = await SharedAppPlugin.getDeviceId();
        _data['oaid'] = await SharedAppPlugin.getOaid();
        _data['isSimulator'] = !info.isPhysicalDevice;
        _data['locale'] = await SharedAppPlugin.locale;

        int spIsRoot = Config.getInt('deviceInfo_isRoot', -1);
        if (spIsRoot >= 0) {
          _data['isRoot'] = Util.parseBool(spIsRoot);
          useSp = true;
        } else {
          _data['isRoot'] = await FlutterJailbreakDetection.jailbroken;
          Config.set('deviceInfo_isRoot', _data['isRoot'] == true ? '1' : '0');
        }

        String spUserAgent = Config.get('deviceInfo_userAgent');
        if (Util.validStr(spUserAgent)) {
          _data['userAgent'] = spUserAgent;
          useSp = true;
        } else {
          _data['userAgent'] = await SharedAppPlugin.getUserAgent();
          Config.set('deviceInfo_userAgent', _data['userAgent']);
        }
        _data['machine'] = info.model;
        await _generalMac();
      } else if (Platform.isIOS) {
        String channel = _IOS_PID_CHANNEL[packageName] ?? packageName;

        _data['channel'] = channel;
        IosDeviceInfo info = await device.iosInfo;
        _data['did'] = '';
        _data['idfa'] = await SharedAppPlugin.getIdfa();
        _data['model'] = info.model;
        _data['brand'] = 'Apple';
        _data['manufacturer'] = 'Apple';
        _data['systemVersion'] = info.systemVersion;
        _data['mac'] = await SharedAppPlugin.getMacAddress();
        _data['deviceId'] = null;
        _data['userAgent'] = await SharedAppPlugin.getUserAgent();
        _data['isSimulator'] = !info.isPhysicalDevice;
        _data['locale'] = await SharedAppPlugin.locale;
        _data['isRoot'] = await FlutterJailbreakDetection.jailbroken;
        _data['machine'] = info.utsname.machine;
        // if (caidMap != null) {
        // 	_data['bootTimeInSec'] = caidMap['bootTimeInSec'];
        // 	_data['countryCode'] = caidMap['countryCode'];
        // 	_data['language'] = caidMap['language'];
        // 	_data['deviceName'] = caidMap['deviceName'];
        // 	_data['machine'] = caidMap['machine'];
        // 	_data['carrierInfo'] = caidMap['carrierInfo'];
        // 	_data['memory'] = caidMap['memory'];
        // 	_data['disk'] = caidMap['disk'];
        // 	_data['sysFileTime'] = caidMap['sysFileTime'];
        // 	_data['caidModel'] = caidMap['model'];
        // 	_data['timeZone'] = caidMap['timeZone'];
        // }
      }
      fetchDidIfNeeded();
    } catch (e) {
      Log.d('DeviceInfo init error: $e');
    }
  }

  /// 获取did
  static Future fetchDidIfNeeded() async {
    Log.d('Digitalunion: try fetchDid');
    if (did.isNotEmpty) {
      Log.d('Digitalunion: fetch return with id: $did');
      return;
    }
    if (Util.connectivityResult == null || Util.connectivityResult == ConnectivityResult.none) {
      Log.d('Digitalunion: fetch return with ConnectivityResult.none');
      return;
    }
    if (isDidFetching) {
      Log.d('Digitalunion: fetch return with repeat request');
      return;
    }

    Log.d('Digitalunion: begin fetch');
    isDidFetching = true;
    final t1 = DateTime.now().millisecondsSinceEpoch;
    final id = await TrustedID.getQueryID(channel);
    final t2 = DateTime.now().millisecondsSinceEpoch;
    Log.d('Digitalunion: did get channel: $channel, cost ${t2 - t1} ms, id: $id');
    if (id.isNotEmpty) {
      _data['did'] = id;
      Config.set('deviceInfo_did', _data['did']);
      Tracker.instance.setSuperProperties({'did': id});
    }
    isDidFetching = false;
  }

  static late PackageInfo _packageInfo;

  static initDelay() async {
    if (useSp) {
      try {
        await fetchDidIfNeeded();

        _data['isRoot'] = await FlutterJailbreakDetection.jailbroken;
        Config.set('deviceInfo_isRoot', _data['isRoot'] == true ? '1' : '0');

        _data['userAgent'] = await SharedAppPlugin.getUserAgent();
        Config.set('deviceInfo_userAgent', _data['userAgent']);
      } catch (e) {
        Log.d('deviceInfo initDelay, error: $e');
      }

      useSp = false;
    }
  }

  /// 部分机型取不到AndroidId，用did(32位md5)/oaid(32位md5)/自生成(32位)方式替代
  static Future<void> _generalMac() async {
    if (!Platform.isAndroid || _validData(DeviceInfo.mac)) {
      return;
    }

    if (_validData(DeviceInfo.did)) {
      _data['mac'] = Util.md5Encryption(DeviceInfo.did);
      Log.d('_generalMac did');
      return;
    } else if (_validData(DeviceInfo.oaid)) {
      _data['mac'] = Util.md5Encryption(DeviceInfo.oaid);
      Log.d('_generalMac oaid');
      return;
    } else {
      String localMac = Config.get('local_mac_ad');
      if (Util.validStr(localMac)) {
        _data['mac'] = localMac;
      } else {
        String generalMac = _generateRandomString(32);
        _data['mac'] = generalMac;
        Config.set('local_mac_ad', generalMac);
      }
      Log.d('_generalMac local');
      return;
    }
  }

  static String _generateRandomString(int length) {
    final random = Random();
    const availableChars = 'abcdefghijklmnopqrstuvwxyz1234567890';
    final randomString = List.generate(length, (index) => availableChars[random.nextInt(availableChars.length)]).join();

    return randomString;
  }

  /// 暂时以空字符串/00000000开头的为无效Mac
  static bool _validData(String data) {
    if (!Util.validStr(data)) {
      return false;
    }
    if (data.trim().startsWith('00000000')) {
      return false;
    }
    return true;
  }

  static PackageInfo get packageInfo => _packageInfo;

  static String get deviceId {
    return _data['deviceId'] ?? '';
  }

  static Future resetDeviceId() async {
    if (Platform.isAndroid) {
      // 国内Android市场要求在所有的权限申请在用户同意隐私协议申请，Android获取IMEI需要先申请电话权限
      // 初次调DeviceInfo.init时没有电话权限获取不了IMEI，等用户同意隐私协议之后再重新获取一次
      await PermissionUtil.checkAndRequestPermissions(Constant.context, Permission.phone);
      _data['deviceId'] = await SharedAppPlugin.getDeviceId();
    }
  }

  static String get oaid {
    return _data['oaid'] ?? '';
  }

  static String get mac {
    return _data['mac'] ?? '';
  }

  static String get channel {
    return _data['channel'] ?? '';
  }

  static set channel(String? value) {
    if (value != null && value.isNotEmpty) {
      _data['channel'] = value;
    }
  }

  static String get systemVersion {
    if (Platform.isIOS) {
      return _data['systemVersion'] ?? '';
    } else if (Platform.isAndroid) {
      if (_data.containsKey("systemVersion")) {
        AndroidBuildVersion androidBuildVersion = _data['systemVersion'];
        return androidBuildVersion.release;
      }
    }
    return '';
  }

  static int get androidSdkInt {
    AndroidBuildVersion androidBuildVersion = _data['systemVersion'];
    int androidSdkInt = androidBuildVersion.sdkInt;
    return androidSdkInt;
  }

  static String get userAgent {
    return _data['userAgent'] ?? '';
  }

  static String get idfa {
    return _data['idfa'] ?? '';
  }

  static String get model {
    return _data['model'] ?? '';
  }

  static String get brand {
    return _data['brand'] ?? '';
  }

  static String get manufacturer {
    return _data['manufacturer'] ?? '';
  }

  static String get did {
    return _data['did'] ?? '';
  }

  static bool get isSimulator {
    if (Constant.isDevMode) {
      return false;
    }
    return _data['isSimulator'] ?? false;
  }

  static bool get isRealSimulator {
    return _data['isSimulator'] ?? false;
  }

  static bool get isOversea {
    Locale locale = _data['locale'];
    Log.d("isOversea======>>$locale");
    if ((locale.languageCode).startsWith('zh') && locale.countryCode == 'CN') {
      return false;
    }
    return true;
  }

  ///获取系统当前语言与地区设置
  static sys.Locale? get systemLocale {
    Locale locale = _data['locale'];
    return sys.Locale(locale.languageCode, locale.countryCode);
  }

  static bool get isRoot {
    return _data['isRoot'] ?? false;
  }

  static String get bootTimeInSec {
    return _data['bootTimeInSec'] ?? '';
  }

  static String get countryCode {
    return _data['countryCode'] ?? '';
  }

  static String get language {
    return _data['language'] ?? '';
  }

  static String get deviceName {
    return _data['deviceName'] ?? '';
  }

  static String get machine {
    return _data['machine'] ?? '';
  }

  static String get carrierInfo {
    return _data['carrierInfo'] ?? '';
  }

  static String get memory {
    return _data['memory'] ?? '';
  }

  static String get disk {
    return _data['disk'] ?? '';
  }

  static String get sysFileTime {
    return _data['sysFileTime'] ?? '';
  }

  // static String get caidModel {
  // 	return _data['caidModel'] ?? '';
  // }

  static String get timeZone {
    return _data['timeZone'] ?? '';
  }

  static printData() {
    Log.d(_data);
  }

  static Future<void> updateIdfa() async {
    _data['idfa'] = await SharedAppPlugin.getIdfa();
  }

  static Map<String, dynamic> getDeviceInfo() {
    return _data;
  }

  static Future<int> getPublicIP(bool forceRefresh) async {
    if (forceRefresh || publicIP == 0) {
      DataRsp<int?> ipRes = await BaseApi.getDevicePublicIP();
      if (ipRes.success == true) {
        publicIP = ipRes.data ?? 0;
      }
    }
    return publicIP;
  }
}
