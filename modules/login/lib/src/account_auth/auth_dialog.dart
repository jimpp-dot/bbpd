import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/k.dart';
import 'package:login/src/account_auth/verify_page.dart';
import 'package:login/src/onekey/bean.dart';
import 'package:login/src/onekey/login.dart';
import 'package:login/src/onekey/result.dart';
import 'package:login/src/onekey/ui_config.dart';

import '../../assets.dart';

/// 暂时兼容新旧两种认证方案，允许后台回退到老的方案
/// 认证弹窗（新）
class NewAuthDialog extends StatelessWidget {
  /// 认证类型：
  /// 1.本机-不能预取号走人脸
  // 2.人脸
  // 3.本机或短信
  // 4.身份证
  // 5.（本机或短信）+身份证
  // 6.本机+身份证
  final int type;

  const NewAuthDialog({Key? key, this.type = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: R.color.dialogBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: _renderBody(context),
      ),
    );
  }

  Widget _renderBody(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                bottom: 20,
              ),
              child: R.img(
                Assets.verify_dialog_icon_png,
                width: 180,
                height: 144,
                fit: BoxFit.contain,
                package: ComponentManager.MANAGER_LOGIN,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 24,
                end: 24,
                bottom: 25,
              ),
              child: Text(
                K.login_account_need_verify,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: R.color.secondTextColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => goVerify(context),
              child: Container(
                width: 264,
                height: 48,
                margin: const EdgeInsetsDirectional.only(start: 24, end: 24),
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Text(
                  K.login_go_verify,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 16),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text(
                  K.login_no_verify_now,
                  style: TextStyle(
                    fontSize: 13,
                    color: R.color.thirdTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        PositionedDirectional(
          top: 11,
          end: 12,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.close,
                size: 24,
                color: Color(0xFFD8D8D8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void goVerify(BuildContext context) async {
    bool? suc = await VerifyPage.show(context: context, type: type);
    if (suc == true) {
      Navigator.of(context).pop(true);
    }
  }
}

/// 认证弹窗(旧)
class AuthDialog extends StatelessWidget {
  // 1: 本机号码认证  2: 身份认证   3: 本机号码认证或者手机号+验证码认证
  final int type;

  const AuthDialog({Key? key, this.type = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == 1 || type == 2 || type == 3) {
      return PhoneAuthDialog(type);
    }
    return const SizedBox.shrink();
  }
}

/// 本机号码一键绑定
class PhoneAuthDialog extends StatefulWidget {
  final int type;

  const PhoneAuthDialog(this.type, {Key? key}) : super(key: key);

  @override
  _PhoneAuthDialogState createState() {
    return _PhoneAuthDialogState();
  }
}

class _PhoneAuthDialogState extends State<PhoneAuthDialog> {
  final DialogLoadingController _controller = DialogLoadingController();
  bool _canPhoneAuth = false;
  int? authType;

  @override
  void initState() {
    super.initState();
    authType = widget.type;
    if (authType == 1) {
      // 限制只能使用本机号码一键绑定
      Future.delayed(Duration.zero, _init);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: _renderBody(),
      ),
    );
  }

  Widget _renderBody() {
    if (authType == 1 || authType == 3) {
      // 手机号认证
      return _renderPhoneAuth();
    } else {
      // 实人认证
      return _renderIdAuth();
    }
  }

  Widget _renderPhoneAuth() {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 23,
                bottom: 23,
              ),
              child: R.img(
                Assets.login$phone_verify_webp,
                width: 157,
                height: 122,
                package: ComponentManager.MANAGER_LOGIN,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 27,
                end: 27,
                bottom: 30,
              ),
              child: Text(
                K.login_need_bind_phone_first,
                style: const TextStyle(
                  color: Color(0xFF242528),
                ),
              ),
            ),
            GestureDetector(
              onTap: _onBind,
              child: Container(
                width: 258,
                height: 40,
                margin: const EdgeInsetsDirectional.only(start: 27, end: 27),
                decoration: BoxDecoration(
                  color: R.color.mainBrandColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  authType == 1 ? K.login_onekey_bind : K.login_go_bind,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            authType == 1
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 16,
                    ),
                    child: GestureDetector(
                      onTap: _onProblem,
                      child: Text(
                        K.login_encounter_a_problem,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9B9B9B),
                        ),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                  ),
          ],
        ),
        PositionedDirectional(
          top: 11,
          end: 12,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.close,
                size: 24,
                color: Color(0xFFD8D8D8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderIdAuth() {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 23,
                bottom: 23,
              ),
              child: R.img(
                Assets.login$phone_verify_webp,
                width: 157,
                height: 122,
                fit: BoxFit.contain,
                package: ComponentManager.MANAGER_LOGIN,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 27,
                end: 27,
                bottom: 30,
              ),
              child: Text(
                K.login_account_has_risk,
                style: const TextStyle(
                  color: Color(0xFF242528),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _onAuth(context),
              child: Container(
                width: 258,
                height: 40,
                margin: const EdgeInsetsDirectional.only(start: 27, end: 27),
                decoration: BoxDecoration(
                  color: R.color.mainBrandColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  K.login_identity_authentication,
                  style: const TextStyle(
                    color: Color(0xFFFEFEFE),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 16,
              ),
              child: GestureDetector(
                onTap: () => _contactKeFu(context),
                child: Text(
                  K.login_contact_service,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9B9B9B),
                  ),
                ),
              ),
            ),
          ],
        ),
        PositionedDirectional(
          top: 11,
          end: 12,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.close,
                size: 24,
                color: Color(0xFFD8D8D8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _init() async {
    _controller.show(context: System.context, barrierDismissible: true);
    Future.delayed(const Duration(seconds: 5), () {
      _controller.close();
    });
    // 判断当前手机是否支持本机号码认证
    _canPhoneAuth = await OneKeyLogin.checkEnvAvailable();
    if (_canPhoneAuth == true) {
      await OneKeyLogin.preLogin();
      _controller.close();
    } else {
      _controller.close();
      _onProblem(); // 不能一键绑定，跳转到身份认证
    }
  }

  _onProblem() async {
    if (mounted) {
      setState(() {
        authType = 2;
      });
    }
  }

  _onBind() async {
    if (authType == 1) {
      // 仅限使用本机号码绑定
      if (_canPhoneAuth == true) {
        _controller.show(context: System.context, barrierDismissible: true);
        OneKeyLoginResult? result = await OneKeyLogin.getLoginToken(
            uiConfig: OneKeyLoginUiConfig.auto()..showChangeBtn = false,
            oneKeyLoginListener: (result) {
              if (result.success) {
                // 获取登录授权码成功
                _oneKeyBind(result.token ?? '');
              } else if (result.shouldSwitch) {
                // 用户切换登录方式
              } else if (result.cancel) {
                // 用户取消
              } else {
                Fluttertoast.showToast(
                    msg: K.bind_failed_try_later, gravity: ToastGravity.CENTER);
              }
            });
        _controller.close();
        if (!(result?.success == true)) {
          Fluttertoast.showToast(
              msg: K.bind_failed_try_later, gravity: ToastGravity.CENTER);
        }
      }
    } else {
      // 优先使用本机号码，其次用手机号+验证码方式
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool? suc = await loginManager.bindPhone(context, isSafeBind: true);

      if (suc == true) {
        Navigator.of(context).pop(true);
      }
    }
  }

  /// 使用token一键绑定
  _oneKeyBind(String token) async {
    _controller.show(context: System.context);
    OneKeyLoginBean bean =
        await OneKeyLogin.verifyToken(token: token, type: 'bind');
    _controller.close();
    if (!(bean.success == true)) {
      Toast.show(context, bean.msg ?? R.string('commom_bind_failed'));
      return false;
    }

    await Session.setValues(bean.data);
    Fluttertoast.showToast(msg: R.string('common_bind_succ'));

    Navigator.of(context).pop(true);
  }

  _contactKeFu(BuildContext context) async {
    IChatManager chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(
      context,
      type: 'private',
      targetId: 100000016,
      title: R.string('advisory_service'),
    );
  }

  _onAuth(BuildContext context) async {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    bool suc = await settingManager.openIdAuth(context);
    if (suc == true) {
      // 身份认证成功，退出dialog，返回true
      Navigator.of(context).pop(true);
    }
  }
}
