import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/services.dart';
import 'package:login/login.dart';
import 'package:shared/k.dart' as BaseK;

/// 服务提供商
enum OneKeyLoginVendor {
  ali,
  // shanyan,
}

/// 授权页回调（一键登录点击/sdk自带返回）
typedef OneKeyLoginListener = void Function(OneKeyLoginResult result);

/// 本机号码一键登录
class OneKeyLogin {
  static const MethodChannel _aliChannel =
      MethodChannel('ly.plugins.oneclick_auth');

  static OneKeyLoginListener? _oneKeyLoginListener;

  static final DialogLoadingController _controller = DialogLoadingController();

  OneKeyLogin._();

  static OneKeyLoginVendor get vendor => OneKeyLoginVendor.ali;

  /// 初始化
  static Future<dynamic> init(String appId) async {
    if (appId.trim().isEmpty) {
      return;
    }

    try {
      _aliChannel.setMethodCallHandler(_handlerMethod);
      return _aliChannel.invokeMethod('init', appId);
    } on PlatformException catch (e) {
      Log.d(e);
    }
  }

  /// 预取号
  static Future<dynamic> preLogin() async {
    try {
      return _aliChannel.invokeMethod('preLogin'); // return 运营商名字
    } on PlatformException catch (e) {
      Log.d(e);
    }
  }

  /// 设置SDK是否debug模式运行
  static Future<void> setDebugMode(bool isDebug) async {
    try {
      await _aliChannel.invokeMethod('setDebugMode', isDebug);
    } on PlatformException catch (e) {
      Log.d(e);
    }
  }

  /// 检测用户环境
  static Future<bool> checkEnvAvailable() async {
    try {
      bool result = await _aliChannel.invokeMethod('checkEnvAvailable');
      Log.d('checkEnvAvailable: $result');
      return result;
    } on PlatformException catch (e) {
      Log.d(e);
    }
    return false;
  }

  /// 设置授权页一键登录回调（“一键登录按钮”、返回按钮（包括物理返回键））
  static void setOneKeyLoginListener(OneKeyLoginListener callback) {
    _oneKeyLoginListener = callback;
  }

  /// 拉起授权页
  /// [return] 拉起授权页是否成功
  static Future<OneKeyLoginResult?> getLoginToken({
    OneKeyLoginListener? oneKeyLoginListener,
    OneKeyLoginUiConfig? uiConfig,
  }) async {
    if (oneKeyLoginListener != null) {
      setOneKeyLoginListener(oneKeyLoginListener);
    }

    try {
      if (Platform.isAndroid) {
        String ret = await _aliChannel.invokeMethod('getLoginToken',
            (uiConfig ?? OneKeyLoginUiConfig.auto()).toAliJson());
        Log.d('getLoginToken:\n$ret');
        Map<String, dynamic> map = jsonDecode(ret);
        return OneKeyLoginResult.fromJson(map);
      } else {
        Map<String, dynamic>? result = await _aliChannel.invokeMapMethod(
            'getLoginToken',
            (uiConfig ?? OneKeyLoginUiConfig.auto()).toAliJson());
        Log.d('getLoginToken: $result');
        return OneKeyLoginResult.fromJson(result ?? {});
      }
    } on PlatformException catch (e) {
      // 获取授权码失败
      Log.d(e);
    }
    return null;
  }

  /// 主动销毁授权页
  static Future<void> quitAuthPage() async {
    try {
      return _aliChannel.invokeMethod('quitAuthPage');
    } on PlatformException catch (e) {
      Log.d(e);
    }
  }

  static Future<void> _handlerMethod(MethodCall call) async {
    Log.d('one key method call:${call.method} ');
    switch (call.method) {
      case 'onReceiveAuthPageEvent':
        Map<String, dynamic> map = Map<String, dynamic>.from(call.arguments);
        OneKeyLoginResult result = OneKeyLoginResult.fromJson(map);
        if (_oneKeyLoginListener != null) {
          _oneKeyLoginListener!(result);
        }
        break;

      default:
        return;
    }
  }

  /// 发起一键登录
  /// 展示第三方登录
  static Future<void> request(
      {String type = 'login', OneKeyLoginUiConfig? uiConfig}) async {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    try {
      uiConfig ??= OneKeyLoginUiConfig.auto();

      await uiConfig.initPlatformShowState();

      /// 一键登录后, android手机勾选框一直展示 ios不再展示隐私协议勾选框
      uiConfig.setCheckBoxHidden = false;
      uiConfig.privacyState =
          false; //Config.getBool(BBConfigKey.loginAgreeUserLicense, false);  /// Android 闪验
      uiConfig.checkBoxIsChecked =
          false; //Config.getBool(BBConfigKey.loginAgreeUserLicense, false); /// iOS 阿里
      uiConfig.privacyOneName = BaseK.K.base_user_service_protcol_2;
      if (Platform.isIOS) {
        uiConfig.privacyOneName = '《${uiConfig.privacyOneName}》';
      }
      uiConfig.privacyOneUrl = Util.licenseUrl(LicenseType.USER_AGREEMENT2);
      uiConfig.privacyTwoName = BaseK.K.base_privacy_policy_2;
      if (Platform.isIOS) {
        uiConfig.privacyTwoName = '《${uiConfig.privacyTwoName}》';
      }
      uiConfig.privacyTwoUrl = Util.licenseUrl(LicenseType.USER_AGREEMENT3);

      if (type == 'small_account') {
        uiConfig.hideBackBtnFromSmallAccount = false;
      }
      OneKeyLoginResult? result = await getLoginToken(
          oneKeyLoginListener: (res) {
            if (res.success) {
              // 获取登录授权码成功
              DataReporter.reportEvent(LoginEvent(LoginEvent.way_onekey,
                  status: LoginEvent.status_token));
              _oneKeyLogin(res.token ?? '', type: type);
            } else if (res.shouldSwitch) {
              // 用户切换登录方式
              DataReporter.reportEvent(LoginEvent(LoginEvent.way_onekey,
                  status: LoginEvent.status_switch));
              loginManager.openPhoneLogin(System.context, type: type);
            } else if (res.switchWechatLogin) {
              DataReporter.reportEvent(LoginEvent(LoginEvent.way_wx,
                  status: LoginEvent.way_wx, msg: res.code.toString()));

              doThirdPartyLogin(res, 'wechat', type: type);
            } else if (res.switchQQLogin) {
              DataReporter.reportEvent(LoginEvent(LoginEvent.way_qq,
                  status: LoginEvent.way_qq, msg: res.code.toString()));

              doThirdPartyLogin(res, 'qq', type: type);
            } else if (res.switchAppleLogin) {
              DataReporter.reportEvent(LoginEvent(LoginEvent.way_apple,
                  status: LoginEvent.way_apple, msg: res.code.toString()));

              doThirdPartyLogin(res, 'apple', type: type);
            } else if (res.switchXiaomiLogin) {
              DataReporter.reportEvent(LoginEvent(LoginEvent.way_xiaomi,
                  status: LoginEvent.way_xiaomi, msg: res.code.toString()));

              doThirdPartyLogin(res, 'xiaomi', type: type);
            } else if (res.switchDouyinLogin) {
              DataReporter.reportEvent(LoginEvent(LoginEvent.way_douyin,
                  status: LoginEvent.way_douyin, msg: res.code.toString()));

              doThirdPartyLogin(res, 'douyin', type: type);
            } else if (res.cancel) {
              // 用户取消登录
              if (type == 'login' && Util.isLoginBeforeBoot()) {
                eventCenter.emit(EventConstant.EventCancelLogin);
              }
              DataReporter.reportEvent(LoginEvent(LoginEvent.way_onekey,
                  status: LoginEvent.status_cancel));
            } else {
              DataReporter.reportEvent(LoginEvent(LoginEvent.way_onekey,
                  status: LoginEvent.status_error, msg: res.code.toString()));
              loginManager.openPhoneLogin(System.context, type: type);
            }
          },
          uiConfig: uiConfig);
      // 拉起授权页回调
      if (result?.success ?? false) {
        DataReporter.reportEvent(
            LoginEvent(LoginEvent.way_onekey, status: LoginEvent.status_show));
      } else {
        DataReporter.reportEvent(LoginEvent(LoginEvent.way_onekey,
            status: LoginEvent.status_error, msg: result?.getMessage()));
        loginManager.openPhoneLogin(System.context, type: type);
      }
    } catch (e) {
      Log.d(e.toString());
      DataReporter.reportEvent(
          LoginEvent(LoginEvent.way_onekey, status: LoginEvent.status_error));
      loginManager.openPhoneLogin(System.context, type: type);
      return;
    }
  }

  /// 通过服务器校验获取到的token
  /// [type] login/bind/safe_bind/mobile_bind
  static Future<OneKeyLoginBean> verifyToken(
      {String? type, String? token}) async {
    //获取设备token，用于小号切换
    String dtoken = Session.getString('dtoken', '');
    String url = "${System.domain}account/onekeylogin";
    int publicIp = await DeviceInfo.getPublicIP(false);
    Map<String, String> post = {
      'token': token ?? '',
      'type': type ?? '',
      'dtoken': dtoken,
      'channel': 'ali',
      'ip': publicIp.toString()
    };
    XhrResponse response = await Xhr.postJson(url, post);
    if (response.error != null) {
      return OneKeyLoginBean(success: false, msg: response.error.toString());
    }
    Map<String, dynamic> res = response.value() as Map<String, dynamic>;
    OneKeyLoginBean bean = OneKeyLoginBean.fromJson(res);
    if (bean.success == true && bean.data != null && bean.data is Map) {
      await Session.setValues(bean.data);
    }

    return bean;
  }

  static Future doThirdPartyLogin(OneKeyLoginResult result, String platformTag,
      {String type = 'login'}) async {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    List<IThirdPlatform> validPlatforms = await loginManager.getValidPlatform();
    for (IThirdPlatform platform in validPlatforms) {
      if (platform.tag() == platformTag) {
        platform.onLoginTap(System.context, type, (result) {}, (msg) {
          // 防止在跳转第三方登录后，未完成登录切回到app时卡在登录Loading界面，因此跳转手机号登录界面
          loginManager.openPhoneLogin(System.context, type: type);
        });
      }
    }
  }

  /// 使用token一键登录
  static _oneKeyLogin(String token, {String type = 'login'}) async {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    _controller.show(
        context: System.context, message: R.string('login_logining'));
    OneKeyLoginBean bean = await verifyToken(token: token, type: type);
    _controller.close();
    if (!(bean.success == true)) {
      Fluttertoast.showToast(msg: bean.msg, gravity: ToastGravity.CENTER);
      Tracker.instance.track(TrackEvent.login, properties: {
        'login_type': 'tel',
        'is_success': false,
      });

      loginManager.openPhoneLogin(System.context, type: type);
      return;
    }

    DataReporter.reportEvent(
        LoginEvent(LoginEvent.way_onekey, status: LoginEvent.status_success));

    int origin = Session.uid;
    // 记录用户信息
    await Session.setValues(bean.data);

    //针对归因上报，如果是新用户，在上报登录事件前，上报一条注册事件
    if (Session.role == UserRole.REG) {
      eventCenter.emit(EventConstant.EventRegister);
    }

    if (type == 'small_account') {
      eventCenter.emit(EventConstant.EventLogin,
          {'origin': origin, 'now': Session.uid, 'login_type': 'switch'});
      Tracker.instance.track(TrackEvent.add_small_account, properties: {
        'uid': Session.uid,
      });
    } else {
      eventCenter.emit(EventConstant.EventLogin, {
        'origin': origin,
        'now': Session.uid,
        'login_type': 'tel',
        'is_auto': true
      });
    }

    if (Session.role == UserRole.REG) {
      // 完善资料
      loginManager.openLoginProfile(System.context);
    } else {
      if (type == 'small_account') {
        // 添加小号
        Fluttertoast.showToast(
            msg: R.string('setting_change_account_success'),
            gravity: ToastGravity.CENTER);
      } else {
        if (Util.isLoginBeforeBoot()) {
          eventCenter.emit(EventConstant.EventLoginBeforeBoot, System.context);
        } else {
          Fluttertoast.showToast(msg: R.string('login_succ'));
        }
      }
    }
  }
}
