import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/k.dart';
import 'package:settings/k.dart' as settings;
import 'package:shake_animation_widget/shake_animation_widget.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/k.dart' as base;
import 'package:shared/shared.dart';

import '../../assets.dart';
import 'phone_login_confirm_dialog.dart';

/// 登录界面
class LoginPhonePage extends StatefulWidget {
  final bool isFromBoot;
  final String type;

  const LoginPhonePage({super.key, this.isFromBoot = false, this.type = 'login'});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginPhonePage> {
  final TextEditingController _textController = TextEditingController(text: '');

  final List<Widget> _thirdItems = [];
  GestureDetector? checkboxGesture;

  bool isLongScreen = true;
  final GlobalKey<PhoneInputWidgetState> _phoneInputKey = GlobalKey();
  final FocusNode _focusNode = FocusNode();
  final ShakeAnimationController _shakeController = ShakeAnimationController();
  bool hasAgreePrivacy = false;

  @override
  void initState() {
    super.initState();
    _initThirdLogin();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _initThirdLogin() async {
    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    List<IThirdPlatform> validPlatforms = await loginManager.getValidPlatform();
    Log.d('validPlatforms: $validPlatforms');
    Log.d('validPlatforms len: ${validPlatforms.length}');
    double width = validPlatforms.length > 2 ? 50 : 99;
    for (IThirdPlatform platform in validPlatforms) {
      _thirdItems.add(
        GestureDetector(
          child: platform.getIcon(width: 48, height: 48),
          onTap: () {
            _checkAgreeAndThen(() {
              platform.onLoginTap(context, widget.type, (result) {
                // 新用户首次启动用到，首页tab展示顺序
                Constant.newRegisterUserTabs = List<String>.from(result['data']?['new_register_user_tabs']?.whereType<String>() ?? []);
                if (widget.type == 'small_account') {
                  Navigator.of(context).pop(true);
                }
              }, (msg) {});
            });
          },
        ),
      );
      _thirdItems.add(SizedBox(width: width));
    }
    Log.d('_thirdItems: $_thirdItems');
    Log.d('_thirdItems len: ${_thirdItems.length}');
    if (_thirdItems.isNotEmpty) _thirdItems.removeLast();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Util.isLoginBeforeBoot() && Platform.isAndroid && widget.type == 'login') {
          eventCenter.emit(EventConstant.EventCancelLogin);
          return false;
        }
        return true;
      },
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        R.img(
          Assets.login$login_bg_webp,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          package: ComponentManager.MANAGER_BASE_CORE,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.only(top: Util.statusHeight + 80.dp, left: 20),
          child: R.img(
            Assets.login$login_top_text,
            width: 260,
            height: 103,
            fit: BoxFit.fill,
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     text16('WELCOME TO THE STAR', textColor: const Color(0xFFF7FF56)),
          //     const SizedBox(height: 4,),
          //     (text30('欢迎来到快乐星球', textColor: Colors.black) as Text).toStandardMBrandStyleContain(mWidth:0,mHeight: 48,radius: 6,
          //         padding: const EdgeInsets.only(left: 6,right: 6,top: 2,bottom: 2)),
          //   ],
          // ),
        ),
        if (widget.type == 'small_account')
          PositionedDirectional(
            start: 10,
            top: Util.statusHeight,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              iconSize: 38,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40, top: 350 * Util.height / 812),
          child: Column(
            children: <Widget>[
              PhoneInputWidget(
                key: _phoneInputKey,
                enabled: true,
                autoFocus: false,
                onChanged: (value) => setState(() {}),
                onSubmitted: _onEndTypedPhone,
                controller: _textController,
                focusNode: _focusNode,
                bgColor: Colors.white.withOpacity(0.07),
                hintTextColor: Colors.white.withOpacity(0.5),
                textColor: Colors.white,
                cursorColor: R.colors.custorInputColor,
              ),
              Submit(
                margin: const EdgeInsetsDirectional.only(top: 20),
                disabled: !_canGotoNextPage(),
                label: settings.K.setting_receive_vcode,
                btnCircular: 25,
                needGradientColors: true,
                showNewStyle: false,
                onSubmit: _onNext,
              ),

              /// 暂时屏蔽 - 登录遇到问题
              // TextButton(
              //   child: Text(
              //     K.encounter_problems_when_login,
              //     style: R.textStyle.body2,
              //   ),
              //   onPressed: () async {
              //     if (!_agreePrivacy(true)) {
              //       return;
              //     }
              //     ILoginManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
              //     manager.showLoginHelp(context);
              //   },
              // ),
              SizedBox(height: 20.dp),
              _buildPrivacy(),
            ],
          ),
        ),
        _buildThirdItem(dividerColor: Colors.white.withOpacity(0.2), textColor: Colors.white.withOpacity(0.5)),
      ],
    );
  }

  Widget _buildThirdItem({Color? dividerColor, Color? textColor}) {
    return Positioned(
      bottom: Util.iphoneXBottom + 52.dp,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 1,
                      width: 92,
                      color: dividerColor ?? R.color.dividerColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      K.login_third_sdk_login,
                      style: R.textStyle.caption.copyWith(color: textColor ?? R.color.thirdTextColor),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 1,
                      width: 92,
                      color: dividerColor ?? R.color.dividerColor,
                    ),
                  ],
                ).toVisible(show: _thirdItems.isNotEmpty),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 20),
                  child: Row(
                    children: _thirdItems,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacy() {
    return Padding(
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom + 6.dp),
      child: ShakeAnimationWidget(
        shakeRange: 0.3,
        shakeCount: 3,
        isForward: false,
        shakeAnimationController: _shakeController,
        shakeAnimationType: ShakeAnimationType.LeftRightShake,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPrivacyCheckBox(),
            _buildPrivacyText(),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyCheckBox() {
    checkboxGesture = GestureDetector(
      onTap: () {
        setState(() {
          hasAgreePrivacy = !hasAgreePrivacy;
          Config.setBool(BBConfigKey.loginAgreeUserLicense, hasAgreePrivacy);
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8, bottom: 13),
        child: Row(
          children: [
            hasAgreePrivacy
                ? CheckBoxChecked(
                    width: 13,
                    height: 15,
                    backgroundColor: R.color.checkSelectedColor,
                    color: Colors.black,
                  )
                : CheckBoxUnchecked(color: R.color.checkUnSelectedColor, width: 15, height: 15),
            const SizedBox(width: 3),
            Text(
              K.login_agree_user_license,
              style: TextStyle(fontSize: 13, fontFamily: Util.fontFamily, color: Colors.white.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
    return checkboxGesture!;
  }

  Widget _buildPrivacyText() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 15),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: base.K.base_and,
              style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.5)),
            ),
            TextSpan(
              text: base.K.base_privacy_policy,
              style: const TextStyle(fontSize: 11, color: Colors.white),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  String url = Util.licenseUrl(LicenseType.USER_AGREEMENT3);
                  BaseWebviewScreen.show(context, url: url, title: base.K.setting_user_protcol_agreement3);
                },
            ),
          ],
          text: base.K.base_user_service_protcol,
          style: const TextStyle(fontSize: 11, color: Colors.white),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              String url = Util.licenseUrl(LicenseType.USER_AGREEMENT2);
              BaseWebviewScreen.show(context, url: url, title: base.K.setting_user_protcol_agreement2);
            },
        ),
      ),
    );
  }

  void _onEndTypedPhone(String mobile) {}

  bool _canGotoNextPage() {
    String mobile = _textController.text.trim();
    if (!Utility.isMobile(mobile)) {
      return false;
    }

    return true;
  }

  void _onNext() async {
    String mobile = _textController.text.trim();
    String? areaCode = _phoneInputKey.currentState?.areaCode;
    if (!Utility.isMobile(mobile, areaCode: areaCode)) {
      Fluttertoast.showToast(msg: K.wrong_phone_num, gravity: ToastGravity.CENTER);
      return;
    }

    _checkAgreeAndThen(() async {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      dynamic result = await loginManager.showPhoneLoginVerify(context, mobile, areaCode ?? '86', type: widget.type);
      if (result is String && result.toString() == 'loginSuccess') {
        Navigator.of(context).pop(true);
      }
    });
  }

  bool _agreePrivacy(bool noticeIfUnselect) {
    if (hasAgreePrivacy == false) {
      if (noticeIfUnselect) {
        Fluttertoast.showToast(msg: K.login_please_agree_privacy_first, gravity: ToastGravity.CENTER);
        _shakeController.start();
      }
      return false;
    }
    return true;
  }

  void _checkAgreeAndThen(Function() operation) {
    if (!_agreePrivacy(Platform.isAndroid)) {
      if (!Platform.isAndroid) {
        LoginConfirmDialog.show(
          context,
          () {
            checkboxGesture?.onTap?.call();
            Navigator.pop(context);
            operation();
          },
        );
      }
      return;
    }
    operation();
  }
}
