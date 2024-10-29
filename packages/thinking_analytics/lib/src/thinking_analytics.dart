import 'dart:async';
import 'dart:io';
import 'reporter.dart';
import 'package:flutter/services.dart';

/// 数据埋点SDK
/// 目前仅支持单实例上报
class ThinkingAnalytics {
  static const int BIZ = 0;
  static const int MONITOR = 1;

  static const MethodChannel _channel = MethodChannel('ly.plugins.thinking_analytics');

  /// 获取SDK版本号
  /// Android提供了自动获取的方法，iOS需要手动更新
  static Future<String> get version async {
    final String version = await _channel.invokeMethod('version');
    return version;
  }

  /// 初始化。
  /// [appId] App Id
  /// [serverUrl] 数据上传的url
  static Future<bool> init(
      {required String appId,
      required String serverUrl,
      String? uid, //for windows
      String? monitorAppId,
      String? monitorServerUrl,
      int debug = 0}) async {
    if (Platform.isWindows) {
      Reporter().init(appId: appId, serverUrl: serverUrl, uid: uid);
      if (monitorAppId != null && monitorServerUrl != null) {
        Reporter.monitor().init(appId: monitorAppId, serverUrl: monitorServerUrl, uid: uid);
      }
      return true;
    }

    bool result = await _channel.invokeMethod('init', {
      'appId': appId,
      'serverUrl': serverUrl,
      'monitorAppId': monitorAppId,
      'monitorServerUrl': monitorServerUrl ?? serverUrl,
      'debug': debug
    });
    if (result != true) {
      print('Error! init Tracker failed.');
    }
    return result;
  }

  /// [appId] App Id
  /// [serverUrl] 数据上传的url
  static Future<bool> initMonitor(
      {required String monitorAppId, required String monitorServerUrl, int debug = 0}) async {
    if (Platform.isWindows) {
      return Reporter.monitor().init(appId: monitorAppId, serverUrl: monitorServerUrl);
    }
    bool result = await _channel.invokeMethod(
        'initMonitor', {'monitorAppId': monitorAppId, 'monitorServerUrl': monitorServerUrl, 'debug': debug});
    if (result != true) {
      print('Error! init monitorTracker failed.');
    }
    return result;
  }

  // ignore: non_constant_identifier_names

  // 事件相关

  /// 上报一条事件数据
  /// [name] 事件的名称，需要以字母开头，可以包括数字、字母及“_”，最大为50个字符
  /// [properties] 事件的属性，是一个Map对象，每个元素代表一个属性，
  ///              key值为属性名，类型为String，value值为属性值，类型为String、Number、Boolean
  /// [time] 设置事件的触发时间，格式：yyyy-MM-dd HH:mm:ss.SSS
  /// [timeZone] 设置事件的触发时区，格式zoneId，GMT、UTC
  /// [trackerType] 业务采集 BIZ， 性能监控  MONITOR
  static Future<bool> track(String name,
      {Map<String, dynamic>? properties, String? time, String? timeZone, int trackerType = BIZ}) async {
    if (Platform.isWindows) {
      if (trackerType == BIZ) {
        return Reporter().track(name, properties: properties);
      } else {
        return Reporter.monitor().track(name, properties: properties);
      }
    }
    return await _channel.invokeMethod('track',
        {'eventName': name, 'properties': properties, 'time': time, 'timeZone': timeZone, 'trackerType': trackerType});
  }

  /// 开始记录某个事件的时长，直到用户上传该事件为止，
  /// 该事件中将会带有#duration这一预置属性，用以表示记录的时长，
  /// 多次开始记录同一事件的时长将会以最后一次调用作为计时起点
  /// [name] 需要计时的事件，当使用[track]上传该事件名的事件时，计时停止，并上传计时数据。
  static Future<bool> timeEvent(String name, {int trackerType = BIZ}) async {
    if (Platform.isWindows) {
      if (trackerType == BIZ) {
        return Reporter().timeEvent(name);
      } else {
        return Reporter.monitor().timeEvent(name);
      }
    }
    return await _channel.invokeMethod('timeEvent', {'name': name, 'trackerType': trackerType});
  }

  /// 设置公共事件属性
  /// 添加事件公共属性，设置后上传的事件都会带有这些事件公共属性。
  /// 每次设置会将新的属性添加进公共属性中，之前设置的也将保留，
  /// 如果多次设置同一属性，则取最后一次的设置值，事件公共属性的配置将会被保存，无需多次调用
  static Future setSuperProperties(
    Map<String, dynamic> properties, {
    Map<String, dynamic>? superConfig, // for windows,传需要#前缀的字段,譬如lib/version等
    int trackerType = BIZ,
  }) async {
    if (Platform.isWindows) {
      if (trackerType == BIZ) {
        return Reporter().setSuperProperties(properties, superConfig: superConfig);
      } else {
        return Reporter.monitor().setSuperProperties(properties, superConfig: superConfig);
      }
    }
    return await _channel.invokeMethod('setSuperProperties', {
      'properties': properties,
      'trackerType': trackerType,
    });
  }

  /// 返回所有已设置的事件公共属性
  static Future<Map<String, dynamic>?> getSuperProperties({int trackerType = BIZ}) async {
    if (Platform.isWindows) {
      if (trackerType == BIZ) {
        return Reporter().superProperties;
      } else {
        return Reporter.monitor().superProperties;
      }
    }
    return await _channel.invokeMapMethod('getSuperProperties', {'trackerType': trackerType});
  }

  /// 删除已设置的事件公共属性
  static Future<bool> unsetSuperProperty(String propertyName, {int trackerType = BIZ}) async {
    if (Platform.isWindows) {
      if (trackerType == BIZ) {
        return Reporter().superProperties.remove(propertyName);
      } else {
        return Reporter.monitor().superProperties.remove(propertyName);
      }
    }
    return await _channel
        .invokeMethod('unsetSuperProperty', {'propertyName': propertyName, 'trackerType': trackerType});
  }

  /// 清空所有已设置的事件公共属性
  static Future clearSuperProperties({int trackerType = BIZ}) async {
    if (Platform.isWindows) {
      if (trackerType == BIZ) {
        return Reporter().superProperties.clear();
      } else {
        return Reporter.monitor().superProperties.clear();
      }
    }
    return await _channel.invokeMethod('clearSuperProperties', {'trackerType': trackerType});
  }

  /// 设置动态公共属性，即公共属性可以上报时获取当时的值
  static Future<bool> setDynamicSuperProperties(Map<String, dynamic> properties, {int trackerType = BIZ}) async {
    if (Platform.isWindows) {
      return false;
    }
    return await _channel.invokeMethod('setDynamicSuperProperties', {
      'properties': properties,
      'trackerType': trackerType,
    });
  }

  // 用户相关

  /// 设置访客ID（可选）
  /// 在使用SDK之后，SDK会使用UUID作为每个用户的默认访客ID，该ID将会作为用户在未登录状态下身份识别ID，
  /// 如果App对每个用户有自己的访客ID管理体系，则可以调用identify来设置访客ID，
  /// 如果您需要替换访客ID，则应当在初始化SDK结束之后立即进行调用，请勿多次调用，以免产生无用的账号，
  /// 需要注意的是，UUID在用户重新安装APP以及更换设备时将会变更。
  static Future<bool> identify(String id) async {
    if (Platform.isWindows) {
      return false;
    }
    return await _channel.invokeMethod('identify', id);
  }

  /// 获取访客ID
  static Future<String> getDistinctId() async {
    if (Platform.isWindows) {
      return '';
    }
    String distinctId = await _channel.invokeMethod('getDistinctId');
    return distinctId;
  }

  /// 设置账号ID，一般为uid
  /// 在用户进行登录时，可调用[login]来设置用户的账号ID，
  /// 在设置完账号ID后，将会以账号ID作为身份识别ID，并且设置的账号ID将会在调用[logout]之前一直保留，
  /// [login]可以多次调用，每次调用会判断传入的账号ID与先前保存的ID是否一致，一致则忽略调用，不一致则会覆盖先前的ID。
  static Future<bool> login(String accountId) async {
    if (Platform.isWindows) {
      Reporter().login(accountId);
      return Reporter.monitor().login(accountId);
    }
    return await _channel.invokeMethod('login', accountId);
  }

  /// 在用户产生登出行为之后，可调用logout来清除账号ID，在下次调用login之前，将会以访客ID作为身份识别ID
  static Future logout() async {
    if (Platform.isWindows) {
      Reporter().logout();
      Reporter.monitor().logout();
      return;
    }
    return await _channel.invokeMethod('logout');
  }

  /// 用户属性：使用该接口上传的属性将会覆盖原有的属性值，如果之前不存在该用户属性，则会新建该用户属性
  static Future<bool> user_set(Map<String, dynamic> properties) async {
    if (Platform.isWindows) {
      Reporter().userSet(properties);
      Reporter.monitor().userSet(properties);
      return true;
    }
    return await _channel.invokeMethod('user_set', properties);
  }

  /// 用户属性：当该属性之前已经有值的时候，将会忽略这条信息
  static Future<bool> user_setOnce(Map<String, dynamic> properties) async {
    if (Platform.isWindows) {
      return false;
    }
    return await _channel.invokeMethod('user_setOnce', properties);
  }

  /// 用户属性：上传数值型的属性，如果该属性还未被设置，则会赋值0后再进行计算，可传入负值，等同于相减操作
  static Future<bool> user_add(Map<String, num> properties) async {
    if (Platform.isWindows) {
      return false;
    }
    return await _channel.invokeMethod('user_add', properties);
  }

  /// 用户属性：对指定属性进行清空操作，如果该属性还未在集群中被创建，则user_unset不会创建该属性
  static Future<bool> user_unset(String key) async {
    if (Platform.isWindows) {
      return false;
    }
    return await _channel.invokeMethod('user_unset', key);
  }

  // 其他

//  /// 设置在哪些网络环境下可以上报数据  0: DEFAULT  1: WIFI  2:ALL
//   Future<bool> setNetworkType(int networkType, {int trackerType = BIZ}) async {
//     return await _channel.invokeMethod('setNetworkType',
//         {'networkType': networkType, 'trackerType': trackerType});
//   }

  /// 是否打印Log，默认关闭
  static Future<bool> enableTrackLog(bool enable) async {
    if (Platform.isWindows) {
      return false;
    }
    return await _channel.invokeMethod('enableTrackLog', enable);
  }

  /// 是否暂停上报
  static Future<bool> enableTracking(bool enable, {int trackerType = BIZ}) async {
    if (Platform.isWindows) {
      return false;
    }
    return await _channel.invokeMethod('enableTracking', {
      'enable': enable,
      'trackerType': trackerType,
    });
  }

  /// 开启自动采集
  /// 目前包括 APP_INSTALL、APP_START、APP_END 三个事件
  /// 如需设置公共事件属性或设置自定义访客ID，请务必确保在开启自动采集之前调用[setSuperProperties]或[identify]
  static Future enableAutoTrack() async {
    if (Platform.isWindows) {
      return false;
    }
    return await _channel.invokeMethod('enableAutoTrack');
  }

  /// 主动上报
  static Future flush({int trackerType = BIZ}) async {
    if (Platform.isWindows) {
      return false;
    }
    return await _channel.invokeMethod('flush', trackerType);
  }
}
