import 'dart:io';

import 'package:shared/shared.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static LocalAuthentication localAuth = LocalAuthentication();

  static Future<bool> canCheckBiometrics() async {
    return localAuth.canCheckBiometrics;
  }

  static bool isUsed(int uid) {
    return Config.getInt('LocalAuth.$uid', 0) > 0;
  }

  static used(int uid) async {
    await Config.set(
        'LocalAuth.$uid', DateTime.now().millisecondsSinceEpoch.toString());
  }

  static Future removeBio(int uid) async {
    await Config.delete('LocalAuth.$uid');
  }

  static Future<List<BiometricType>> availableBiometrics() async {
    return localAuth.getAvailableBiometrics();
  }

  static Future<bool> canUseBioLogin() async {
    if (Platform.isAndroid) return false;
    bool canCheckBio = await localAuth.canCheckBiometrics;
    return canCheckBio;
  }

  static Future<bool> authBio() async {
    bool authenticated = false;
    try {
      String reason = R.string('setting_vaild_to_login');
      if (reason.isEmpty) reason = '请验证以进行登录';
      authenticated = await localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
            useErrorDialogs: true, stickyAuth: false),
      );
    } catch (e) {
      Log.d(e);
    }
    return authenticated;
  }

  static Future<String?> bioLoginTitle() async {
    if (Util.isAndroid) return null;
    String? title;
    List<BiometricType> types = await availableBiometrics();
    if (types.isNotEmpty) {
      if (types.contains(BiometricType.face)) {
        title = R.string('setting_face_id_login');
      } else {
        title = R.string('setting_fingerprint_login');
      }
    }

    return title;
  }
}
