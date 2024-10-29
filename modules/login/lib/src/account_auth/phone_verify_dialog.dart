import 'dart:async';
import 'package:flutter/services.dart';
import 'package:login/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/src/onekey/bean.dart';
import 'package:login/src/onekey/login.dart';
import 'package:login/src/onekey/result.dart';
import 'package:login/src/onekey/ui_config.dart';

// 认证-手机认证
enum PhoneVerifyType {
  OneKeyOnly, // 本机
  OneKeyAndCode, // 本机或短信
}

class PhoneVerifyDialog extends StatefulWidget {
  final PhoneVerifyType type;
  final String? title;
  final VoidCallback? onProblem;

  const PhoneVerifyDialog(
      {Key? key,
      this.type = PhoneVerifyType.OneKeyOnly,
      this.title,
      this.onProblem})
      : super(key: key);

  @override
  PhoneVerifyDialogState createState() {
    return PhoneVerifyDialogState();
  }
}

enum PhoneVerifyState {
  OneKey, // 一键认证
  PhoneNum, // 输入手机号
  VerifyCode, // 输入验证码
}

class PhoneVerifyDialogState extends State<PhoneVerifyDialog> {
  PhoneVerifyState? _state;

  final DialogLoadingController _controller = DialogLoadingController();
  GlobalKey<PhoneInputWidgetState>? _phoneInputKey;
  final TextEditingController _phoneTextController =
      TextEditingController(text: '');
  String? areaCode;
  String? mobile;
  final FocusNode _focusNode = FocusNode();
  String? _token; // 调服务器发送验证同时返回token
  String _captcha = ''; // 用户输入验证码
  Timer? _timer;
  int _countDown = 0; // 倒计时
  bool _isAgain = false;

  @override
  void initState() {
    super.initState();
    _state = PhoneVerifyState.OneKey;
    _phoneInputKey = GlobalKey<PhoneInputWidgetState>();
    _preLogin();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneTextController.dispose();
    _focusNode.dispose();
    _cancelTimer();
  }

  // 预取号码
  void _preLogin() async {
    bool canPhoneAuth = await OneKeyLogin.checkEnvAvailable();
    if (canPhoneAuth == true) {
      await OneKeyLogin.preLogin();
    } else {
      goInputPhoneNum();
    }
  }

  // 跳转手机号输入
  void goInputPhoneNum() {
    if (widget.type == PhoneVerifyType.OneKeyAndCode) {
      // 仅本机，不能跳手机号输入
      if (mounted) {
        setState(() {
          isBind = false;
          isSendVerify = false;
          _state = PhoneVerifyState.PhoneNum;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width - 40,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 20),
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [getCardBoxShadow()],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: Util.width - 40,
      height: 48,
      padding: const EdgeInsetsDirectional.only(start: 16),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: R.color.mainBrandColor.withOpacity(0.08),
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
      child: Text(
        widget.title ?? '',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: R.color.mainTextColor,
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_state == PhoneVerifyState.OneKey) {
      return _buildOneKey();
    } else if (_state == PhoneVerifyState.PhoneNum) {
      return _buildPhoneNum();
    } else if (_state == PhoneVerifyState.VerifyCode) {
      return _buildVerifyCode();
    }

    return _buildOneKey();
  }

  // 一键认证样式
  Widget _buildOneKey() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onkeyVerify,
          child: Container(
            margin: const EdgeInsetsDirectional.only(
                start: 16, end: 16, top: 32, bottom: 14),
            height: 48,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              gradient: LinearGradient(
                colors: R.color.mainBrandGradientColors,
              ),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.login_one_key_verify,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (widget.type == PhoneVerifyType.OneKeyAndCode)
          GestureDetector(
            onTap: goInputPhoneNum,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 32),
              child: Text(
                K.login_other_phone_verify,
                style: TextStyle(
                  fontSize: 13,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          ),
        if (widget.type != PhoneVerifyType.OneKeyAndCode)
          GestureDetector(
            onTap: () async {
              if (widget.onProblem != null) {
                widget.onProblem!();
              }
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 32),
              child: Text(
                K.login_encounter_a_problem,
                style: TextStyle(
                  fontSize: 13,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          ),
      ],
    );
  }

  void onkeyVerify() async {
    OneKeyLoginResult? result = await OneKeyLogin.getLoginToken(
        uiConfig: OneKeyLoginUiConfig.auto()
          ..loginBtnText = K.login_one_key_verify,
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

    if (!(result?.success == true)) {
      Fluttertoast.showToast(
          msg: K.bind_failed_try_later, gravity: ToastGravity.CENTER);
    }
  }

  /// 使用token一键绑定
  _oneKeyBind(String token) async {
    _controller.show(context: System.context);
    OneKeyLoginBean bean =
        await OneKeyLogin.verifyToken(token: token, type: 'bind');
    _controller.close();
    if (!(bean.success == true)) {
      Fluttertoast.showToast(msg: bean.msg ?? R.string('commom_bind_failed'));
      return false;
    }

    await Session.setValues(bean.data);
    Fluttertoast.showToast(msg: R.string('common_bind_succ'));
    Navigator.of(context).pop(true);
    Tracker.instance.track(TrackEvent.identity_finish, properties: {
      'refer': '1',
    });
  }

  // 输入手机号样式
  Widget _buildPhoneNum() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 16, bottom: 24, start: 16, end: 16),
          child: PhoneInputWidget(
            key: _phoneInputKey,
            enabled: true,
            autoFocus: false,
            onChanged: (value) => setState(() {}),
            onSubmitted: _onEndTypedPhone,
            controller: _phoneTextController,
            focusNode: _focusNode,
          ),
        ),
        Submit(
          margin:
              const EdgeInsetsDirectional.only(bottom: 28, start: 16, end: 16),
          disabled: !_canGotoNextPage(),
          label: R.string('setting_receive_vcode'),
          btnCircular: 25,
          needGradientColors: true,
          onSubmit: _sendVerifyCode,
        ),
      ],
    );
  }

  bool _canGotoNextPage() {
    String mobile = _phoneTextController.text.trim();
    if (!Utility.isMobile(mobile)) {
      return false;
    }

    return true;
  }

  bool isSendVerify = false;

  void _sendVerifyCode() async {
    if (isSendVerify) {
      return;
    }

    mobile = _phoneTextController.text.trim();
    if (_phoneInputKey != null && _phoneInputKey?.currentState != null) {
      areaCode = _phoneInputKey?.currentState?.areaCode;
    }
    if (!Utility.isMobile(mobile!, areaCode: areaCode)) {
      Fluttertoast.showToast(
          msg: K.wrong_phone_num, gravity: ToastGravity.CENTER);
      return;
    }

    isSendVerify = true;
    //发送验证码
    String url = "${System.domain}account/sendVerifyCode";
    Map<String, String> post = {
      'mobile': mobile ?? '',
      'area': areaCode ?? '',
      'type': 'safe_bind'
    };
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      await Future.delayed(const Duration(milliseconds: 500));
      Map res = response.response as Map;

      _token = res['data'];
      if (!mounted) return;
      if (res['success'] == true) {
        success = true;
      }
      setState(() {
        _state = PhoneVerifyState.VerifyCode;
        _initTimer();
      });
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    isSendVerify = false;
    Tracker.instance.track(TrackEvent.getVerificationCode,
        properties: {'is_again': _isAgain, 'is_success': success});
    _isAgain = true;
  }

  void _onEndTypedPhone(String mobile) {}

  // 输入验证码样式
  Widget _buildVerifyCode() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 18),
            Text(
              '${K.have_send_vertify_code_to} ${_phoneTextController.text.trim()}',
              style: TextStyle(
                fontSize: 14,
                color: R.color.thirdTextColor,
              ),
            ),
            GestureDetector(
              onTap: goInputPhoneNum,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 2, end: 2, top: 5, bottom: 5),
                child: Text(
                  K.login_modify_verify_phone_num,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: R.color.mainBrandColor,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: goInputPhoneNum,
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(end: 5, top: 5, bottom: 5),
                child: R.img(
                  'icon_next_fq.svg',
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_BASE_CORE,
                  color: R.color.mainBrandColor.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Visibility(
          visible: false,
          maintainState: true,
          child: SizedBox.shrink(
            child: TextField(
              autofocus: false,
              autocorrect: false,
              maxLines: 1,
              maxLength: 4,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: null,
              cursorWidth: 0,
              keyboardType: TextInputType.number,
              enableInteractiveSelection: false,
              focusNode: _focusNode,
              onChanged: _onChanged,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            _focusNode.unfocus();
            //WorkAround 直接执行requestFocus并不能马上唤起软键盘
            Future.delayed(const Duration(microseconds: 100),
                () => _focusNode.requestFocus());
          },
          child: Row(
            children: <Widget>[
              const SizedBox(width: 20),
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _captcha.isNotEmpty ? _captcha[0] : '',
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 17,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _captcha.length > 1 ? _captcha[1] : '',
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 17,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _captcha.length > 2 ? _captcha[2] : '',
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 17,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _captcha.length > 3 ? _captcha[3] : '',
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
        _renderBtn(),
      ],
    );
  }

  Widget _renderBtn() {
    String text = K.login_resend;
    if (_timer != null && _timer?.isActive == true) {
      text = '$text（${_countDown}s）';
    }

    return Submit(
      margin: const EdgeInsetsDirectional.only(
          top: 24, start: 16, end: 16, bottom: 28),
      disabled: _timer != null,
      label: text,
      btnCircular: 25,
      needGradientColors: true,
      onSubmit: _sendVerifyCode,
    );
  }

  _initTimer() {
    _cancelTimer();
    _countDown = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _countDown--;
      });
      if (_countDown < 1) {
        _cancelTimer();
      }
    });
  }

  _cancelTimer() {
    if (_timer != null && _timer?.isActive == true) {
      _timer!.cancel();
      _timer = null;
    }
  }

  _onChanged(String value) {
    Log.d('_PwdDialogState._onChanged: $value');
    if (_captcha == value) return;
    setState(() {
      _captcha = value;
    });
    if (value.length == 4) {
      _focusNode.unfocus();
      if (_token != null && _token?.isNotEmpty == true) {
        _onBind();
      }
    }
  }

  bool isBind = false;

  void _onBind() async {
    if (!Utility.isVerifyCode(_captcha)) {
      Fluttertoast.showToast(
          msg: R.string('setting_error_vcode'), gravity: ToastGravity.CENTER);
      return;
    }

    String dtoken = Session.getString('dtoken', '');
    // 绑定
    String method = "account/login?v=1";
    String url = System.domain + method;
    Map<String, String> post = {
      'mobile': mobile ?? '',
      'code': _captcha,
      'type': 'safe_bind',
      'token': _token ?? '',
      'dtoken': dtoken,
      'area': areaCode ?? '',
    };

    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);

      if (response.error != null) {
        Fluttertoast.toastException(
            exp: response.error, gravity: ToastGravity.CENTER);
        return;
      }

      Map res = response.response as Map;
      bool success = res['success'];

      Log.d(res);

      await Session.setValues(res['data']);

      if (success == true) {
        Fluttertoast.showToast(msg: R.string('setting_bind_success'));
        Config.set('_is_auth', '1');

        _timer?.cancel();
        // 绑定手机号
        Fluttertoast.showToast(
            msg: R.string('bind_succ_go_bind_other_account'),
            gravity: ToastGravity.CENTER);

        isBind = false;
        Navigator.of(context).pop(true);
        Tracker.instance.track(TrackEvent.identity_finish, properties: {
          'refer': '1',
        });
        return;
      } else {
        Fluttertoast.showToast(
            msg: res['msg'] ?? R.string('setting_network_error_retry'),
            gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    isBind = false;
  }
}
