import 'package:ali_id_auth/ali_id_auth.dart';
import 'package:pulse_log/pulse_log.dart';

import 'package:shared/shared.dart';
import 'package:permission_handler/permission_handler.dart';

/// 阿里实名认证结果
class AliCertifyResult {
  final String code;
  final String reason;

  AliCertifyResult(this.code, this.reason);

  bool get success => code == '1000';

  @override
  String toString() {
    return 'code=$code, reason=$reason';
  }
}

// 阿里云-实人认证
class AliCertify {
  static bool sHasInitAliCloud = false; // 是否初始化阿里云实人认证

  static init() async {
    if (!sHasInitAliCloud) {
      sHasInitAliCloud = true;
      Log.d('AliCertify init');
      try {
        await AliIdAuthPlugin.init();
      } catch (e) {
        Log.e('AliCertify init error $e');
      }
    }
  }

  /// 阿里云实名认证
  static Future<bool> verify(String verifyToken) async {
    String message;
    String? code;

    if (verifyToken.isNotEmpty) {
      // 开始实人认证
      AliCertifyResult? result = await startVerify(verifyToken);
      if (result == null) {
        return false;
      }

      code = result.code;
      PulseLog.instance.log(PlainBody({'code': code, 'reason': result.reason}));

      if ('1001' == code) {
        message = '系统错误';
      } else if ('1003' == code) {
        message = '已退出认证';
      } else if ('2002' == code) {
        message = '网络错误';
      } else if ('2003' == code) {
        message = '客户端设备时间错误';
      } else if ('2006' == code) {
        message = '刷脸失败';
      } else {
        message = '认证失败';
      }
    } else {
      message = '获取certify id失败';
    }
    bool success = code == '1000';
    if (!success) {
      Fluttertoast.showToast(msg: message, gravity: ToastGravity.CENTER);
    }
    return success;
  }

  static Future<AliCertifyResult?> startVerify(String verifyToken) async {
    if (!sHasInitAliCloud) return null;
    Log.w('AliCertify startVerify verifyToken=$verifyToken');

    // 申请Camera权限
    PermissionStatus permissionStatus =
        await PermissionUtil.checkAndRequestPermissions(
            Constant.context, Permission.camera);
    if (permissionStatus != PermissionStatus.granted) {
      return AliCertifyResult('', '权限申请失败');
    }

    try {
      String? resultStr =
          await AliIdAuthPlugin.verify('certifyId', verifyToken);

      List<String> resultList = resultStr?.split(',') ?? [];
      if (resultList.length == 2) {
        return AliCertifyResult(
            Util.notNullStr(resultList[0]), Util.notNullStr(resultList[1]));
      }
    } catch (e) {
      Log.w(e);
    }

    return AliCertifyResult('', 'Unknown reason');
  }

  static Future<String?> getMetaInfos() async {
    return AliIdAuthPlugin.getMetaInfos();
  }
}
