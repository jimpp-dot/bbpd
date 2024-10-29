import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/src/third/conn.dart';

export 'package:login/src/third/conn.dart';

typedef OnError = void Function(String message);
typedef OnComplete = bool Function(Object result);

class ThirdLogin {
  static ThirdLogin? _instance;

  static ThirdLogin instance() {
    _instance ??= ThirdLogin();
    return _instance!;
  }

  OnComplete? onComplete;
  OnError? onError;

  ThirdLogin({this.onComplete, this.onError});

  BuildContext? _context;
  Conn? _conn;

  void login(
    BuildContext context,
    ConnType type, {
    IThirdPlatform? thirdPlatform,
    String loginType = 'login',
    OnComplete? onComplete,
    OnError? onError,
  }) {
    _context = context;
    _dispose();

    this.onComplete = onComplete;
    this.onError = onError;

    thirdPlatform?.onLoginTap(context, loginType, _onComplete, _onError);
  }

  void _onError(String message) {
    _dispose();

    if (onError != null) {
      onError!(message);
    }
    // 添加统计
  }

  void _onComplete(Map result) {
    _dispose();

    if (onComplete != null && onComplete!(result['data'])) return;

    _onLoggedIn(result['data']);
  }

  void _onLoggedIn(Map result) async {
    int origin = Session.uid;
    await Session.setValues(result);

    eventCenter
        .emit(EventConstant.EventLogin, {'origin': origin, 'now': Session.uid});
    if (Session.role == UserRole.REG) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.openLoginProfile(System.context);
    } else {
      if (Util.isLoginBeforeBoot()) {
        eventCenter.emit(EventConstant.EventLoginBeforeBoot, _context);
      } else {
        Navigator.pop(_context ?? System.context);
        Fluttertoast.showToast(
            msg: R.string('has_login_succ'), gravity: ToastGravity.CENTER);
      }
    }
  }

  void _dispose() {
    if (_conn != null) {
      _conn!.dispose();
      _conn = null;
    }
  }
}
