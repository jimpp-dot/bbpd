import 'dart:io';

import 'package:geolocator/geolocator.dart' hide ServiceStatus;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/report.pb.dart';

/// location_system库 方法暂留，使用 geolocator库 完成定位
class Location {
  /// 定位模式（默认 1） => 0-高德，1-原生
  static void setLocationMode(int mode) {
    // LocationSystem.locationMode = mode;
  }

  static int getLocationMode() {
    // return LocationSystem.locationMode;
    return 1;
  }

  /// 定位模式为0 时 才有效果
  /// 是否可用GoogleService（默认 false） => 国内APP false； 国外APP true;
  static Future<bool> canUseGoogleService(bool canUse) async {
    // return await LocationSystem.canUseGoogleService(canUse);
    return true;
  }

  /// 定位模式为1 时 才有效果
  /// 高德定位 apiKey
  static Future<bool> setApiKey(String key) async {
    // return await LocationSystem.setApiKey(key);
    return true;
  }

  /// 定位模式为1 时 才有效果
  /// 高德定位 停止
  static Future<bool> shutdown() async {
    // return await LocationSystem.shutdown();
    return true;
  }

  /// 检查是否有定位权限
  static Future<bool> checkPermission({bool needPermissionDialog = false}) async {
    ServiceStatus serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    if (serviceStatus == ServiceStatus.enabled) {
      PermissionStatus permissionStatus = await Permission.locationWhenInUse.status;
      if (permissionStatus == PermissionStatus.granted) {
        return true;
      }
      if (needPermissionDialog) {
        permissionStatus = await PermissionUtil.checkAndRequestPermissions(System.context, Permission.locationWhenInUse);
        if (permissionStatus == PermissionStatus.granted) {
          return true;
        }
      }
    }
    return false;
  }

  /// 更新位置信息
  /// needPermissionDialog 权限申请dialog
  static Future<BBLocationData?> updateLocation({bool needPermissionDialog = false}) async {
    bool granted = await checkPermission(needPermissionDialog: needPermissionDialog);
    if (!granted) {
      return null;
    }

    double longitude = Util.parseDouble(Config.get('location.longitude'));
    double latitude = Util.parseDouble(Config.get('location.latitude'));

    LocationSettings locationSettings;
    if (longitude > 0 && latitude > 0) {
      // 本地已经存在缓存了，则精度选最高
      if (Platform.isIOS) {
        locationSettings = AppleSettings(accuracy: LocationAccuracy.best, timeLimit: const Duration(seconds: 15));
      } else {
        locationSettings =
            AndroidSettings(forceLocationManager: true, accuracy: LocationAccuracy.best, timeLimit: const Duration(seconds: 15));
      }
    } else {
      // 第一次请求定位，则精度选最低
      if (Platform.isIOS) {
        locationSettings = AppleSettings(accuracy: LocationAccuracy.lowest, timeLimit: const Duration(seconds: 15));
      } else {
        locationSettings =
            AndroidSettings(forceLocationManager: true, accuracy: LocationAccuracy.lowest, timeLimit: const Duration(seconds: 15));
      }
    }
    Position? pos;
    try {
      pos = await GeolocatorPlatform.instance.getCurrentPosition(locationSettings: locationSettings);
    } catch (e) {
      Log.d("updateLocation => first error: ${e.toString()}");
    }

    /// 获取定位后，格式化成外部使用的数据结构
    BBLocationData loc = _formatData(pos);
    if (loc._success) {
      Log.d('updateLocation - client: ${loc.citycode}, ${loc.city} === ${loc.longitude}, ${loc.latitude}');
      if ((loc.longitude) != 0 && (loc.latitude) != 0) {
        double oldLongitude = Util.parseDouble(Config.get('location.longitude.origin'));
        double oldLatitude = Util.parseDouble(Config.get('location.latitude.origin'));

        Config.set('location.longitude.origin', loc.longitude.toString());
        Config.set('location.latitude.origin', loc.latitude.toString());

        RespLocationData? serverLoc = await _updateTServer(loc.longitude, loc.latitude, oldLongitude, oldLatitude);
        if (serverLoc != null) {
          loc.longitude = serverLoc.longitude;
          loc.latitude = serverLoc.latitude;
          if (Util.isStringEmpty(loc.citycode) && !Util.isStringEmpty(serverLoc.cityCode)) {
            loc.citycode = serverLoc.cityCode;
            loc.city = serverLoc.city;
          }
        } else {
          /// 服务端数据为空；1 接口错误；2 位置相同无需上报
          /// 使用上次服务端返回的数据
          double longitude = Util.parseDouble(Config.get('location.longitude'));
          double latitude = Util.parseDouble(Config.get('location.latitude'));
          String cityCode = Config.get('location.cityCode');
          String city = Config.get('location.cityName');
          if (longitude > 0) loc.longitude = longitude;
          if (latitude > 0) loc.latitude = latitude;
          if (Util.isStringEmpty(loc.citycode) && !Util.isStringEmpty(cityCode)) {
            loc.citycode = cityCode;
            loc.city = city;
          }
        }
        Log.d('updateLocation - client check: ${loc.citycode}, ${loc.city} === ${loc.longitude}, ${loc.latitude}');

        /// 保存 服务端校准后的信息
        Config.set('location.longitude', loc.longitude.toString());
        Config.set('location.latitude', loc.latitude.toString());
        if (loc.citycode?.isNotEmpty == true) {
          Config.set('location.cityCode', loc.citycode);
          Config.set('location.cityName', loc.city);
        }

        eventCenter.emit(EventConstant.EventLocationUpdated);
      }
    } else {
      /// 使用上次服务端返回的数据
      double longitude = Util.parseDouble(Config.get('location.longitude'));
      double latitude = Util.parseDouble(Config.get('location.latitude'));
      String cityCode = Config.get('location.cityCode');
      String city = Config.get('location.cityName');
      if (longitude > 0) loc.longitude = longitude;
      if (latitude > 0) loc.latitude = latitude;
      if (Util.isStringEmpty(loc.citycode) && !Util.isStringEmpty(cityCode)) {
        loc.citycode = cityCode;
        loc.city = city;
      }
    }
    return loc;
  }

  //1.用户登录  2.经纬度有变化 或 经纬度未变化但是没成功报过(如先不登录在登录)
  static Future<RespLocationData?> _updateTServer(double longitude, double latitude, double oldLongitude, double oldLatitude) async {
    bool upFlag = false;
    if (Session.uid != 0) {
      if (oldLongitude != longitude || oldLatitude != latitude) {
        //经纬度有变化
        upFlag = true;
      } else {
        //经纬度未变化
        if (Util.parseInt(Config.get('location.report.success')) != 1) {
          //没成功报过
          upFlag = true;
        }
      }
    }
    Log.d('_updateTServer upFlag:$upFlag');
    if (upFlag) {
      try {
        String url = '${System.domain}go/yy/report/location';
        XhrResponse response =
            await Xhr.postPb(url, {'longitude': longitude.toString(), 'latitude': latitude.toString(), 'type': '${getLocationMode()}'});
        RespLocation resp = RespLocation.fromBuffer(response.bodyBytes);
        if (resp.success) {
          Config.set('location.report.success', '1');
          if (resp.hasData()) {
            Log.d('updateLocation - server: ${resp.data.cityCode}, ${resp.data.city} === ${resp.data.longitude}, ${resp.data.latitude}');
            return resp.data;
          }
        }
      } catch (e) {}
    }
    return null;
  }

  static BBLocationData _formatData(Position? loc) {
    BBLocationData data = BBLocationData();
    if (loc != null && loc.longitude > 0 && loc.latitude > 0) {
      data._success = true;
      data.latitude = loc.latitude;
      data.longitude = loc.longitude;
    } else {
      data._success = false;
    }
    return data;
  }
}

class BBLocationData {
  bool _success = false;
  double latitude = 0;
  double longitude = 0;
  String? country;
  String? province;
  String? city;
  String? citycode;

  bool isValid() => (latitude) != 0 && (longitude) != 0;

  @override
  String toString() {
    return 'BBLocationData{success: $_success, latitude: $latitude, longitude: $longitude, country: $country, province: $province, city: $city, citycode: $citycode}';
  }
}
