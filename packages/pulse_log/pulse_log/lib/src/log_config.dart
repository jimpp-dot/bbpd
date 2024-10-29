import 'dart:convert';

import 'package:pulse_log/src/gatherInterface.dart';

///日志所需配置，继承此类，自定义实现
abstract class LogConfig {
  /// 唯一标识
  String get userIdentifier;

  /// 用户设备信息
  /// + 取 banban_base/bbcore/lib/src/deviceInfo.dart 中 _data 数据
  Map<String, dynamic> get deviceInfo;

  /// event事件中的公共属性
  Map<String, dynamic> get superProperties;

  UploadConfig? get uploadConfig => null;

  ///单个日志文件限制大小 3~6Mb, 默认3Mb
  int get logFileMaxSize => kDefaultLogSize;

  String get deviceInfoToString {
    deviceInfo.removeWhere((key, value) => value == null);

    return jsonEncode(deviceInfo, toEncodable: (obj) => obj.toString());
  }

  //是否开启deflate压缩
  bool isDeflate = true;

  //缓存大小
  int maxCacheFileLen = 100 * 1024; // 100kb

  //是否开启写入耗时统计
  bool isWriteAnalyse = false;
}

/// 日志文件上传配置
class UploadConfig {
  /// 日志域名地址，应从 AppConfig.bbLogDomain 取值；
  String logDomain;

  /// 包名，应从 Constant.packageName 取值；
  String packageName;

  /// uid，应从 Session.uid 取值；
  String uid;

  UploadConfig({required this.logDomain, required this.packageName, required this.uid});
}
