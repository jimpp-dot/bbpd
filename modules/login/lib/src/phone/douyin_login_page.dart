import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/k.dart';

import '../../assets.dart';
import '../../login.dart';

/// 快乐星球抖音渠道用户登录界面
class DouyinLoginPage extends StatefulWidget {
  final bool douyinOnly;

  const DouyinLoginPage({Key? key, this.douyinOnly = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DouyinLoginState();
  }
}

class DouyinLoginState extends State<DouyinLoginPage> {
  final List<Widget> _thirdItems = [];
  bool isLongScreen = false;
  bool _canPhoneAuth = false;

  @override
  void initState() {
    super.initState();
    _buildThirdLogin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isLongScreen =
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height <
            0.51;
    return _buildSlpBody();
  }

  Widget _buildSlpBody() {
    double defaultWidth = 375 * Util.height / 812;
    double defaultHeight = 302 * Util.height / 812;
    double logoWidth = defaultWidth > Util.width ? Util.width : defaultWidth;
    double logoHeight = defaultWidth > Util.width
        ? defaultHeight * Util.width / defaultWidth
        : defaultHeight;
    double logoOffsetY = defaultHeight -
        (defaultWidth > Util.width
            ? defaultHeight * Util.width / defaultWidth
            : defaultHeight);

    return WillPopScope(
        onWillPop: () async {
          if (Util.isLoginBeforeBoot() && Platform.isAndroid) {
            eventCenter.emit(EventConstant.EventCancelLogin);
            return false;
          }

          return true;
        },
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  R.img(
                    'login_bg.webp',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    package: ComponentManager.MANAGER_BASE_CORE,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      top: logoOffsetY,
                      child: R.img(
                        'login_logo.webp',
                        width: logoWidth,
                        height: logoHeight,
                        package: ComponentManager.MANAGER_BASE_CORE,
                        fit: BoxFit.fill,
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40, right: 40, top: 350 * Util.height / 812 + 50),
                    child: Column(
                      children: <Widget>[
                        // R.img('ic_douyin_channel_login.webp', width: 80, height: 80, package: ComponentManager.MANAGER_LOGIN),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () async {
                            ILoginManager loginManager = ComponentManager
                                .instance
                                .getManager(ComponentManager.MANAGER_LOGIN);
                            List<IThirdPlatform> validPlatforms =
                                await loginManager.getValidPlatform();

                            IThirdPlatform? douyinPlatform = validPlatforms
                                .firstWhereOrNull((e) => e.tag() == 'douyin');
                            if (douyinPlatform != null) {
                              douyinPlatform.onLoginTap(
                                  context, 'login', (value) {}, (value) {});
                            } else {
                              Fluttertoast.showCenter(
                                  msg: K.you_need_install_douyin_first);
                            }
                          },
                          child: Container(
                            height: 52,
                            margin: const EdgeInsetsDirectional.only(top: 20),
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(26.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                R.img(Assets.login$douyin_channel_btn_logo_webp,
                                    width: 22,
                                    height: 26,
                                    package: ComponentManager.MANAGER_LOGIN),
                                const SizedBox(width: 10),
                                Text(
                                  K.login_use_douyin_account,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.douyinOnly
                      ? const SizedBox.shrink()
                      : _buildThirdItem(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildThirdItem({Color? dividerColor, Color? textColor}) {
    return Positioned(
      bottom: Util.iphoneXBottom + 40 * Util.ratio,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                height: 1,
                width: 92,
                child: Container(
                  height: 1,
                  color: dividerColor ?? R.color.dividerColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                K.login_third_sdk_login,
                style: R.textStyle.caption
                    .copyWith(color: textColor ?? R.color.thirdTextColor),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 1,
                width: 92,
                child: Container(
                  height: 1,
                  color: dividerColor ?? R.color.dividerColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 20),
            child: Row(
              children: _thirdItems,
            ),
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

  Future<void> _buildThirdLogin() async {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    List<IThirdPlatform> validPlatforms = await loginManager.getValidPlatform();
    validPlatforms.removeWhere((e) => e.tag() == 'douyin');

    // 抖音渠道的最前面放手机登录按钮
    double width = (validPlatforms.length + 1) > 2 ? 50 : 99;
    _thirdItems.add(GestureDetector(
        child: R.img(Assets.login$douyin_login_phone_webp,
            width: 48, height: 48, package: ComponentManager.MANAGER_LOGIN),
        onTap: () async {
          await _checkEnvAvailable();

          if (!_canPhoneAuth) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginPhonePage(
                  isFromBoot: false,
                ),
                settings: const RouteSettings(name: '/login'),
              ),
            );
          } else {
            Navigator.popUntil(System.context, ModalRoute.withName('/'));
            loginManager.openOneKeyLogin(context);
          }
        }));
    _thirdItems.add(SizedBox(width: width));

    for (IThirdPlatform platform in validPlatforms) {
      _thirdItems.add(GestureDetector(
          child: platform.getIcon(width: 48, height: 48),
          onTap: () {
            platform.onLoginTap(context, "login", (result) {}, (msg) {});
          }));
      _thirdItems.add(SizedBox(width: width));
    }
    if (_thirdItems.isNotEmpty) _thirdItems.removeLast();
    if (mounted) setState(() {});
  }
}
