import 'dart:io';

import 'package:shared/shared.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flt_push/flt_push.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class PushChannel {
  static Database? _db;
  static StoreRef<String, Map>? _store;
  static const String _recordKey = 'token_info';
  static const String _logoutKey = 'logout';
  static bool _reportedOnBoot = false;

  static void init() async {
    await _reportLogoutIfNeed();
    _monitorNetworkConnectivityChanged();

    FlutterPush.init();

    FlutterPush.onPushTokenReceived = (PushTokenInfo tokenInfo) {
      tokenInfo.uid = Session.uid.toString();
      Log.d('PushChannel.onPushTokenReceived PushTokenInfo = $tokenInfo');

      if (!_reportedOnBoot) {
        _reportAndSave(tokenInfo);
      }
    };

    PushTokenInfo? tokenInfo = await getToken();
    Tracker.instance.track(TrackEvent.push_token_result,
        properties: {'success': tokenInfo != null});
    if (!_reportedOnBoot) {
      _reportAndSave(tokenInfo);
    }
  }

  static Future<PushTokenInfo?> getToken() async {
    PushTokenInfo? tokenInfo = await FlutterPush.getTokenInfo();
    tokenInfo?.uid = Session.uid.toString();
    Log.d('PushChannel.getToken tokenInfo = $tokenInfo');
    // if (tokenInfo == null) {
    //   tokenInfo = await _loadTokenFromDB();
    // }
    return tokenInfo;
  }

  static Future<bool> initOfflinePush() async {
    if (!Platform.isAndroid) {
      return false;
    }

    final bool success = await FlutterPush.initOfflinePush();
    return success;
  }

  static Future pushReportOnLogin() async {
    await _deleteLogoutInDB();
    PushTokenInfo? tokenInfo = await getToken();
    _reportAndSave(tokenInfo);
  }

  static Future pushReportOnLogout(int uid) async {
    await _deleteTokenInDB();
    _reportLogoutIfNeed(logoutUid: uid);
  }

  static bool reportLogin = false;
  static Future _reportAndSave(PushTokenInfo? tokenInfo) async {
    if (tokenInfo == null) return;

    if (reportLogin) {
      return;
    }
    reportLogin = true;
    _reportedOnBoot = true;

    PushTokenInfo? lastReportedToken = await _loadTokenFromDB();
    if (lastReportedToken?.token == tokenInfo.token &&
        lastReportedToken?.uid == tokenInfo.uid) {
      Log.d('PushChannel._reportAndSave already reported.');
      reportLogin = false;
      return; //曾经上报成功的token不再重复上报
    }

    Map? res = await _pushReport(info: tokenInfo);
    Log.d('PushChannel._reportAndSave res = $res');
    bool success = res != null ? res['success'] : false;
    if (success) {
      //上报成功就记下来不再重复上报
      _saveTokenToDB(tokenInfo);
    }
    reportLogin = false;
  }

  static Future _pushReport(
      {PushTokenInfo? info, bool isLogout = false, int? uid}) async {
    if (isLogout == false && !Session.isLogined) {
      /// 非登出上报，且当前非登录态，不上报
      return null;
    }

    String pushUid = _getPushUserId();
    Log.d(
        'PushChannel._pushReport info = $info, isLogout = $isLogout, uid = ${uid?.toString() ?? pushUid}');
    try {
      String url = "${System.domain}go/yy/push/report";
      Map<String, String> params = !isLogout
          ? {
              'uid': pushUid,
              'client_type': info?.clientType ?? '',
              'device_token': info?.token ?? '',
              'device_vendor': info?.vendor ?? '',
              'type': 'login'
            }
          : {'uid': uid.toString(), 'type': 'logout'};
      XhrResponse response = await Xhr.postJson(url, params,
          throwOnError: true, tryNum: 3, formatJson: true);
      Map res = response.value();
      Log.d('PushChannel._pushReport res = $res');
      return res;
    } catch (e, s) {
      Log.e(e, stackTrace: s);
      return null;
    }
  }

  static String _getPushUserId() {
    String pushUserId = '';
    if (Session.uid == 0) {
      pushUserId = Platform.isIOS ? DeviceInfo.idfa : DeviceInfo.deviceId;
    } else {
      pushUserId = Session.uid.toString();
    }
    return pushUserId;
  }

  static Future _initPushDB() async {
    String dbFilePath =
        join(Constant.documentsDirectory.path, 'sembast', 'push.db');
    _db = await databaseFactoryIo.openDatabase(dbFilePath);
    _store = stringMapStoreFactory.store('push_token');
  }

  static Future<PushTokenInfo?> _loadTokenFromDB() async {
    if (_db == null) {
      await _initPushDB();
    }

    Map? tokenInfo = await _store!.record(_recordKey).get(_db!);
    Log.d('PushChannel._loadTokenFromDB tokenInfo = $tokenInfo');
    if (Util.notNullStr(tokenInfo?['token']).isEmpty) {
      return null;
    }
    PushTokenInfo pushTokenInfo = PushTokenInfo.fromMap(tokenInfo!);
    return pushTokenInfo;
  }

  static void _saveTokenToDB(PushTokenInfo info) async {
    if (_db == null) {
      await _initPushDB();
    }

    Log.d('PushChannel._saveTokenToDB tokenInfo = $info');
    await _store!.record(_recordKey).put(_db!, info.toMap());
  }

  static Future _deleteTokenInDB() async {
    if (_db == null) {
      await _initPushDB();
    }

    Log.d('PushChannel._deleteTokenInDB');
    await _store!.record(_recordKey).delete(_db!);
  }

  static Future _saveLogoutToDB(int uid) async {
    if (_db == null) {
      await _initPushDB();
    }

    Log.d('PushChannel._saveLogoutToDB uid = $uid');
    await _store!.record(_logoutKey).put(_db!, {
      'uid': uid.toString(),
      'type': 'logout',
    });
  }

  static Future _deleteLogoutInDB() async {
    if (_db == null) {
      await _initPushDB();
    }

    Log.d('PushChannel._deleteLogoutInDB');
    await _store!.record(_logoutKey).delete(_db!);
  }

  static Future<int?> _loadSavedLogoutUid() async {
    if (_db == null) {
      await _initPushDB();
    }

    Map? savedLogout = await _store!.record(_logoutKey).get(_db!);
    Log.d('PushChannel._loadSavedLogoutUid savedLogout = $savedLogout');
    if (Util.notNullStr(savedLogout?['uid']).isEmpty) {
      return null;
    }
    int uid = Util.parseInt(savedLogout?['uid']);
    return uid;
  }

  static Connectivity? _connectivity;
  static void _monitorNetworkConnectivityChanged() async {
    if (_connectivity == null) {
      _connectivity = Connectivity();
      _connectivity?.onConnectivityChanged.listen((ConnectivityResult result) {
        bool isNetworkConnected = result != ConnectivityResult.none;
        Log.d(
            "PushChannel.onConnectivityChanged result = $result, _isNetworkConnected = $isNetworkConnected");
        if (isNetworkConnected) {
          _reportLogoutIfNeed();
        }
      });
    }
  }

  static bool reportLogout = false;
  static Future _reportLogoutIfNeed({int? logoutUid}) async {
    if (reportLogout) {
      return;
    }
    reportLogout = true;
    int? uid = logoutUid ?? await _loadSavedLogoutUid();
    if (uid == null) {
      reportLogout = false;
      return;
    }
    Map? res = await _pushReport(isLogout: true, uid: uid);
    bool success = res != null ? res['success'] : false;
    if (success) {
      _deleteLogoutInDB();
    } else {
      _saveLogoutToDB(uid);
    }
    reportLogout = false;
  }
}
