import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/k.dart';
import 'package:login/src/phone/voice_code_button.dart';
import 'package:shared/shared.dart';

/// 手机号验证码
///
class PhoneLoginVerify extends StatefulWidget {
  final String mobile;
  final String? type;
  final String? path;
  final String areaCode;

  const PhoneLoginVerify({super.key, required this.mobile, this.type, this.path, this.areaCode = "86"});

  @override
  _PhoneLoginVerifyState createState() => _PhoneLoginVerifyState();
}

class _PhoneLoginVerifyState extends State<PhoneLoginVerify> {
  final FocusNode _focusNode = FocusNode();
  String _captcha = '';
  String? _token;
  String _notice = '';
  Timer? _timer;
  int _countDown = 0; // 倒计时
  bool _isAgain = false;

  /// iOS登录测试账号
  List<String> iOSTestNum = ['14099999999'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _sendCode();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _cancelTimer();
    super.dispose();
  }

  void showLoading({String? status}) {
    CommonLoading.show(status: status, maskType: EasyLoadingMaskType.clear);
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
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      _timer = null;
    }
  }

  _onChanged(String value) {
    if (_captcha == value) return;
    setState(() {
      _captcha = value;
    });
    if (value.length == 4) {
      _focusNode.unfocus();
      if (_token != null && _token!.isNotEmpty) {
        _onNext();
      }
    }
  }

  /// 发送验证码
  /// sendType  1-短信验证码；2-语音验证码
  void _sendCode({int? sendType}) async {
    sendType ??= BaseConfig.instance.showVoiceCode ? 2 : 1;
    _notice = '';
    refresh();
    showLoading(status: R.string('login_loading'));

    String url = "${System.domain}account/sendVerifyCode";
    Map<String, String> post = {'mobile': widget.mobile, 'area': widget.areaCode, 'service': '$sendType'};
    if (widget.type != null) {
      post['type'] = (widget.type == 'small_account') ? 'login' : (widget.type ?? 'login');
    }
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      CommonLoading.dismiss();
      if (!mounted) return;
      Map res = response.value();
      if (res['success'] == true) {
        success = true;
        _token = res['data'];
        _notice = '${K.have_send_vertify_code_to} ${widget.mobile}';
        if (sendType == 2) {
          _notice = '${K.have_send_voice_vertify_code_to} ${widget.mobile}';
        }
        _initTimer();
        _focusNode.requestFocus();
      }
    } catch (e) {
      CommonLoading.dismiss();
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      return;
    }
    Tracker.instance.track(TrackEvent.getVerificationCode, properties: {'is_again': _isAgain, 'is_success': success});
    _isAgain = true;
  }

  // 重新发送验证码
  void _onResend() {
    _token = null;
    _sendCode();
  }

  bool isIosTestNum() {
    if (iOSTestNum.contains(widget.mobile)) {
      return true;
    }
    return false;
  }

  void _onNext() async {
    if (_captcha.length != 4) {
      Fluttertoast.showToast(msg: R.string('wrong_vertify_code_retry'), gravity: ToastGravity.CENTER);
      return;
    }

    showLoading(status: R.string('login_loading'));

    //获取设备token，用于小号切换
    String dtoken = Session.getString('dtoken', '');

    String url = "${System.domain}account/login?v=1";
    Map<String, String> post = {
      'mobile': widget.mobile,
      'type': widget.type ?? 'login',
      'code': _captcha,
      'token': _token ?? '',
      'dtoken': dtoken,
      'area': widget.areaCode
    };
    XhrResponse response;

    if (isIosTestNum()) {
      /// iOS测试账号，防止网络问题，增加重试5次机制
      try {
        response = await Xhr.postJson(url, post, throwOnError: true, tryNum: 5);
      } catch (e) {
        CommonLoading.dismiss();
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
        reportLoginFail();
        return;
      }
    } else {
      response = await Xhr.postJson(url, post);
    }

    CommonLoading.dismiss();

    if (!mounted) return;

    if (response.error != null) {
      Fluttertoast.toastException(exp: response.error, gravity: ToastGravity.CENTER);
      reportLoginFail();
      return;
    }

    Map res = response.value();
    if (res['success'] == false) {
      setState(() {
        _notice = R.string('vertify_code_is_wrong');
      });
      Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      reportLoginFail();
      return;
    }
    try {
      if (res['data']['token'] == null && (widget.type == 'login' || widget.type == 'small_account')) {
        Fluttertoast.showToast(msg: 'token异常');
        reportLoginFail();
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
      reportLoginFail();
    }

    // 记录用户信息
    int origin = Session.uid;
    await Session.setValues(res['data']);
    // 新用户首次启动用到，首页tab展示顺序
    Constant.newRegisterUserTabs = List<String>.from(res['data']?['new_register_user_tabs']?.whereType<String>() ?? []);
    if (Session.token.isEmpty) {
      Fluttertoast.showToast(msg: 'token读取失败');
      reportLoginFail();
      return;
    }

    //针对归因上报，如果是新用户，在上报登录事件前，上报一条注册事件
    if (Session.role == UserRole.REG) {
      eventCenter.emit(EventConstant.EventRegister);
    }

    if (widget.type == 'small_account') {
      eventCenter.emit(EventConstant.EventLogin, {'origin': origin, 'now': Session.uid, 'login_type': 'switch'});
      Tracker.instance.track(TrackEvent.add_small_account, properties: {
        'uid': Session.uid,
      });
    } else {
      eventCenter.emit(EventConstant.EventLogin, {'origin': origin, 'now': Session.uid, 'login_type': 'tel', 'is_auto': false});
    }

    if (Session.role == UserRole.REG) {
      // 注册
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.openLoginProfile(System.context);
    } else {
      if (widget.type == 'bind' || widget.type == 'safe_bind') {
        // 绑定手机号
        if (widget.type == 'safe_bind') {
          Fluttertoast.showToast(msg: R.string('bind_succ_go_bind_other_account'), gravity: ToastGravity.CENTER);
        }
        if (widget.path == null) {
          Navigator.of(context).pop('loginSuccess');
        } else if (widget.path == 'setting') {
          Navigator.of(context).popUntil(ModalRoute.withName('/setting'));
        } else {
          Navigator.of(context).popUntil(ModalRoute.withName('/accountSetting'));
        }
      } else if (widget.type == 'small_account') {
        // 添加小号
        Fluttertoast.showToast(msg: R.string('setting_change_account_success'), gravity: ToastGravity.CENTER);
        Navigator.of(context).pop('loginSuccess');
      } else {
        // 登录
        if (Util.isLoginBeforeBoot()) {
          eventCenter.emit(EventConstant.EventLoginBeforeBoot, context);
        } else {
          Navigator.of(context).pop('loginSuccess');
        }
      }
    }
  }

  void reportLoginFail() {
    if (widget.type == 'login') {
      Tracker.instance.track(TrackEvent.login, properties: {
        'login_type': 'tel',
        'is_success': false,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(''),
      backgroundColor: R.color.mainBgColor,
      body: _renderBody(context),
    );
  }

  Widget _renderBody(BuildContext context) {
    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              R.string('please_input_vertify_code'),
              style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 26,
                fontWeight: loginManager.bold ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 40),
              child: Text(
                _notice,
                style: TextStyle(
                  color: _notice.contains(widget.mobile) ? R.color.secondTextColor : R.color.thirdBrightColor,
                  fontSize: 16,
                ),
              ),
            ),
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
                Future.delayed(const Duration(microseconds: 100), () => _focusNode.requestFocus());
              },
              child: Row(
                children: <Widget>[
                  Container(
                    width: 56,
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      _captcha.isNotEmpty ? _captcha[0] : '',
                      style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 56,
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      _captcha.length > 1 ? _captcha[1] : '',
                      style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 56,
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      _captcha.length > 2 ? _captcha[2] : '',
                      style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 56,
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
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
                ],
              ),
            ),
            _renderBtn(),
            const SizedBox(height: 10),
            if (BaseConfig.instance.showVoiceCode) _renderVoiceBtn(),
          ],
        ),
      ),
    );
  }

  Widget _renderBtn() {
    String text = R.string('login_resend');
    if (_timer != null && _timer!.isActive) {
      text = '$text（${_countDown}s）';
    }
    return Submit(
      margin: const EdgeInsetsDirectional.only(top: 70),
      disabled: _timer != null,
      label: text,
      btnCircular: 25,
      needGradientColors: true,
      onSubmit: _onResend,
    );
  }

  /// 语音验证码
  Widget _renderVoiceBtn() {
    return VoiceCodeButton(
      onTapSend: () {
        _sendCode(sendType: 2);
      },
    );
  }
}
