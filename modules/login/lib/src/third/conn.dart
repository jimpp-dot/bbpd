// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:login/k.dart';
import 'package:login/login.dart';
import 'package:login/src/api/api.dart';
import 'package:login/src/profile/tag_set.dart';

enum ConnType {
  QQ,
  Wechat,
  Line,
  Facebook,
  Apple,
  Xiaomi,
  Douyin,
//	Biometrics,
}

typedef OnError = void Function(String message, ConnType type);
typedef OnComplete = void Function(Object result, ConnType type);

class Conn with WidgetsBindingObserver {
  Conn({
    this.context,
    this.type,
    this.loginType,
    this.onComplete,
    this.onError,
  });

  BuildContext? context;
  ConnType? type;
  String? loginType;
  OnError? onError;
  OnComplete? onComplete;

  bool _loginError = false;
  bool hasCallback = false;
  bool logining = false;
  String? _lastError;
  AppLifecycleState _appState = AppLifecycleState.resumed;
  DialogLoadingController? _loading;

  bool _disposed = false;

  StreamSubscription? stream;

  ValueChanged<Map>? onPlatformSuccess;
  ValueChanged<String>? onPlatformError;

  void init() {
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    _disposed = true;
    if (stream != null) {
      stream!.cancel();
      stream = null;
    }
    hideLoading();
    SchedulerBinding.instance.scheduleFrameCallback((Duration timer) {
      WidgetsBinding.instance.removeObserver(this);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appState = state;
    if (state == AppLifecycleState.resumed && logining) {
      if (_lastError != null || !hasCallback) {
        displayError(_lastError!);
      }
    }
  }

  void onConnError(String msg, [String? loginType]) {
    if (_appState == AppLifecycleState.resumed) {
      displayError(msg);
    } else {
      _lastError = msg;
      _loginError = true;
    }
    if (onPlatformError != null) {
      onPlatformError!(msg);
    }

    Tracker.instance.track(TrackEvent.login, properties: {
      'login_type': loginType,
      'is_success': false,
    });
    dispose();
  }

  void onConnComplete(Object result, ConnType type) {
    _loginError = false;
    hasCallback = false;
    logining = false;
    _lastError = null;
    hideLoading();

    if (onComplete != null) onComplete!(result, type);
    if (onPlatformSuccess != null) {
      if (onPlatformSuccess != null) {
        onPlatformSuccess!({'data': result, 'type': type.toString()});
      }
    }

    dispose();
    _onLoggedIn(result as Map, type);
  }

  void _onLoggedIn(Map result, ConnType type) async {
    if (context == null) return;
    int origin = Session.uid;
    await Session.setValues(result);

    //针对归因上报，如果是新用户，在上报登录事件前，上报一条注册事件
    if (Session.role == UserRole.REG) {
      eventCenter.emit(EventConstant.EventRegister);
    }

    Log.d("_onLoggedIn" +
        result.toString() +
        type.toString() +
        'isLoginBeforeBoot:' +
        (Util.isLoginBeforeBoot() ? "true" : 'false'));
    String loginType = _getLoginType(type);
    if (this.loginType == 'small_account') {
      eventCenter.emit(EventConstant.EventLogin,
          {'origin': origin, 'now': Session.uid, 'login_type': 'switch'});
      Tracker.instance.track(TrackEvent.add_small_account, properties: {
        'uid': Session.uid,
      });
    } else {
      eventCenter.emit(EventConstant.EventLogin,
          {'origin': origin, 'now': Session.uid, 'login_type': loginType});
    }

    //0-不显示绑定手机号页面，1-显示绑定手机号页面，显示跳过，2-显示绑定手机号页面，不显示跳过
    int skipValue = Util.parseInt(result['skip_bind_mobile']);
    bool showSkip = (skipValue == 1); //绑定手机号页面是否显示跳过按钮
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    if (Session.role == UserRole.REG) {
      bool skipNickWrite =
          Util.parseInt(result['skip']) == 1; // 是否跳过昵称填写（审核时apple登录需要）
      if (skipNickWrite) {
        ProfileData.nickName = result['nick_name'] ?? '';
        _doAppleVerifyLogin();
      } else {
        if (skipValue == 0) {
          loginManager.openLoginProfile(System.context);
        } else {
          //第三方新注册提示绑定手机号
          loginManager
              .bindPhone(context!, isAutoBind: true, canSkip: showSkip)
              .then((value) {
            if (Util.parseBool(value)) {
              Tracker.instance.track(TrackEvent.mobileBind, properties: {
                'is_safety_mobile': !Session.hasUserMobile,
                'is_new': true
              });
            }
            loginManager.openLoginProfile(System.context);
          });
        }
      }
    } else {
      if (Util.isLoginBeforeBoot()) {
        if (Session.hasMobile || Util.isVerify || skipValue == 0) {
          if (this.loginType == 'small_account') {
            // 添加小号
            Fluttertoast.showToast(
                msg: R.string('setting_change_account_success'),
                gravity: ToastGravity.CENTER);
          } else {
            eventCenter.emit(EventConstant.EventLoginBeforeBoot, context);
          }
        } else {
          loginManager
              .bindPhone(context!, isAutoBind: true, canSkip: showSkip)
              .then((value) {
            if (Util.parseBool(value)) {
              Tracker.instance.track(TrackEvent.mobileBind, properties: {
                'is_safety_mobile': !Session.hasUserMobile,
                'is_new': false
              });
            }
            if (this.loginType == 'small_account') {
              // 添加小号
              Fluttertoast.showToast(
                  msg: R.string('setting_change_account_success'),
                  gravity: ToastGravity.CENTER);
            } else {
              eventCenter.emit(EventConstant.EventLoginBeforeBoot, context);
            }
          });
        }
      } else {
        if (Session.hasMobile || Util.isVerify || skipValue == 0) {
          //已经绑定过手机号
          if (this.loginType == 'small_account') {
            // 添加小号
            Fluttertoast.showToast(
                msg: R.string('setting_change_account_success'),
                gravity: ToastGravity.CENTER);
          } else {
            Navigator.popUntil(
                context ?? System.context, ModalRoute.withName('/'));
            Fluttertoast.showToast(
                msg: K.has_login_succ, gravity: ToastGravity.CENTER);
          }
        } else {
          loginManager
              .bindPhone(context!, isAutoBind: true, canSkip: showSkip)
              .then((value) {
            if (Util.parseBool(value)) {
              Tracker.instance.track(TrackEvent.mobileBind, properties: {
                'is_safety_mobile': !Session.hasUserMobile,
                'is_new': false
              });
            }
            if (this.loginType == 'small_account') {
              // 添加小号
              Fluttertoast.showToast(
                  msg: R.string('setting_change_account_success'),
                  gravity: ToastGravity.CENTER);
            } else {
              Navigator.popUntil(
                  context ?? System.context, ModalRoute.withName('/'));
              Fluttertoast.showToast(
                  msg: K.has_login_succ, gravity: ToastGravity.CENTER);
            }
          });
        }
      }
    }
  }

  void displayError(String msg) {
    _loginError = false;
    hasCallback = false;
    logining = false;
    _lastError = null;
    hideLoading();
    if (msg.isNotEmpty) {
      Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
    }
    if (onError != null && type != null) onError!(msg, type!);
  }

  void prepareLogin(String message) {
    _loginError = false;
    _disposed = false;
    logining = true;
    hasCallback = false;
    _lastError = null;

    showLoading(message ?? '');
  }

  void login() async {}

  void hideLoading() {
    if (_loading != null) {
      _loading!.close();
      _loading = null;
    }
  }

  void showLoading(String message) async {
    if (_disposed) {
      return;
    }

    if (_loading != null) {
      _loading!.setLabel(message);
      return;
    }

    _loading = DialogLoadingController();
    await _loading?.show(context: context ?? System.context, message: message);
  }

  String _getLoginType(ConnType type) {
    switch (type) {
      case ConnType.QQ:
        return 'qq';
      case ConnType.Wechat:
        return 'wechat';
      case ConnType.Line:
        return 'line';
      case ConnType.Facebook:
        return 'facebook';
      case ConnType.Apple:
        return 'apple';
      case ConnType.Xiaomi:
        return 'xiaomi';
      case ConnType.Douyin:
        return 'douyin';
    }
  }

  Future<void> _doAppleVerifyLogin() async {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    DialogLoadingController dialogController = DialogLoadingController();
    dialogController.show(
        context: context ?? System.context, message: K.login_loading);
    BaseResponse response = await Api.postAccountProfile(ProfileData.nickName,
        '0', ProfileData.birthDay, ProfileData.icon, ProfileData.inviteCode);
    dialogController.close();
    if (!(response.success == true)) {
      Fluttertoast.showToast(
          msg: response.msg ?? '', gravity: ToastGravity.CENTER);
      return;
    }
    Tracker.instance.user_set({
      'uname': Session.name,
      'gender': Session.sex,
      'birthday': '',
      'mac': DeviceInfo.mac,
      'channel_id': DeviceInfo.channel,
    });
    Tracker.instance.track(TrackEvent.register, properties: {'step': 'finish'});

    if (loginManager.showInterestSetPage == true) {
      PageRoute route = MaterialPageRoute(
        builder: (context) => const TagSet(
          isSkipNicknameWrite: true,
        ),
        fullscreenDialog: true,
        settings: const RouteSettings(name: '/tagSet'),
      );
      Navigator.of(context ?? System.context)
          .pushAndRemoveUntil(route, ModalRoute.withName('/'));
    } else {
      Navigator.popUntil(context ?? System.context, ModalRoute.withName('/'));
      if (Util.isLoginBeforeBoot()) {
        eventCenter.emit(EventConstant.EventLoginBeforeBoot, context);
        await Future.delayed(const Duration(milliseconds: 100));
      }
      // 弹新用户礼包
      if (loginManager.isNoviceGuide) {
        eventCenter.emit(EventConstant.ShowNewUserGuide);
      } else {
        eventCenter.emit(EventConstant.ShowNewUserPackage);
      }
    }

    /// 上报注册成功事件
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    mainManager.trackEvent(AppsFlyerEvent.COMPLETE_REGISTRATION, eventValue: {
      AppsFlyerParameter.REGSITRATION_METHOD: Session.uid.toString()
    });
  }
}
