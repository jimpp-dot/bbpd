import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/widget/licenseDiaLogV2.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';

/// 登录loading页，在这里初始化一键登录，根据成功与否决定展示一键登录UI / 手机验证码登录UI
class LoginLoadingPage extends StatefulWidget {
  final bool isFromBoot;

  @override
  State createState() => _State();

  const LoginLoadingPage({Key? key, this.isFromBoot = false})
      : super(key: key); // 是否是启动后展示的第一个界面
}

class _State extends State<LoginLoadingPage> {
  bool _canPhoneAuth = false;
  int _tryReportNum = 0;

  @override
  initState() {
    super.initState();
    eventCenter.addListeners(['System.Need.Login'], _onEvent);
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      _load();
    });
  }

  _onEvent(String type, Object? data) async {
    switch (type) {
      case 'System.Need.Login':
        _load();
        break;
    }
  }

  @override
  void dispose() {
    eventCenter.removeListeners(['System.Need.Login'], _onEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            R.imagePath('splash.webp', package: ComponentManager.MANAGER_LOGIN),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Future _checkEnvAvailable() async {
    /// 海外版不支持 本机号码认证
    if (Util.isLocale) {
      return false;
    }
    // 判断当前手机是否支持本机号码认证
    _canPhoneAuth = await OneKeyLogin.checkEnvAvailable();
  }

  bool isLoading = false;

  Future<void> _load() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    //TODO android 两个弹窗问题
    // Platform.isAndroid
    //     ? await LicenseDialogV2.show(context, fromLogin: true)
    //     : await LicenseDialogV2.show(context, fromLogin: true);
    await _checkEnvAvailable();
    Tracker.instance.track(TrackEvent.loginPageView,
        properties: {'is_auto': _canPhoneAuth});

    int isBootReportFirst = Config.getInt('boot.report.first', 0);
    if (isBootReportFirst > 0) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      if (_canPhoneAuth) {
        loginManager.openOneKeyLogin(context);
      } else {
        loginManager.openPhoneLogin(context);
      }
      _reportBootIfNeed();
    } else {
      /// 首次启动，先展示非一键登录，获取权限，上报。
      /// 如果能一键登录，弹一键登录
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.openPhoneLogin(context);

      if (Platform.isAndroid && DeviceInfo.androidSdkInt < 29) {
        /// 初次启动应用，需要在用户同意隐私协议之后，申请电话权限，并获取DeviceId
        /// Android10及以上获取不到IMEI，不获取电话权限
        await DeviceInfo.resetDeviceId();
      }

      _reportBootIfNeed();

      if (_canPhoneAuth) {
        Navigator.popUntil(System.context, ModalRoute.withName('/'));
        loginManager.openOneKeyLogin(context);
      }
    }
    isLoading = false;
  }

  Future<void> _reportBootIfNeed() async {
    if (widget.isFromBoot) {
      _tryReportNum++;
      if (_tryReportNum > 50) return;

      Xhr.reportVersion();
      Config.set('boot.report.first', '1');
      IMainManager? mainManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
      if (mainManager != null) mainManager.trackEvent(AppsFlyerEvent.RE_ENGAGE);
    }
  }
}
