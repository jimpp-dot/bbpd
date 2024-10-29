import 'dart:io';
import 'dart:ui';

import 'package:pulse_log/pulse_log.dart';

import '../../shared.dart';

class CommonLogConfig extends LogConfig {
  /// event事件中的公共属性
  @override
  Map<String, dynamic> get superProperties => {
        'uid': Session.uid,
        'pkg': Constant.packageName,
        'version': Constant.appVersion,
        'platform': Platform.isAndroid ? 'android' : 'ios',
        'did': DeviceInfo.did,
        'brand': DeviceInfo.brand,
        'model': DeviceInfo.model,
        'channel': DeviceInfo.channel,
      };

  /// 唯一标识
  @override
  String get userIdentifier {
    if (Session.isLogined) return Session.uid.toString();
    return DeviceInfo.mac;
  }

  @override
  UploadConfig? get uploadConfig => UploadConfig(
      logDomain: AppConfig.bbLogDomain,
      uid: Session.uid.toString(),
      packageName: Constant.packageName);

  @override
  Map<String, dynamic> get deviceInfo {
    Map<String, dynamic> info = Map.from(DeviceInfo.getDeviceInfo());
    if (Platform.isAndroid && info.containsKey('systemVersion')) {
      info['systemVersion'] = DeviceInfo.systemVersion;
    }
    if (info.containsKey('locale')) {
      info['locale'] = (info['locale'] as Locale).toString();
    }
    return info;
  }
}
