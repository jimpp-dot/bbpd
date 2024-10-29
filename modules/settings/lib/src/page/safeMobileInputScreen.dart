import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';
import 'package:settings/src/widget/textButton.dart';

import 'safeMobileSelectUidScreen.dart';

//安全手机号输入/验证码界面
class SafeMobileInputScreen extends StatefulWidget {
  final String? type; //1.select  根据安全手机号查询对应uid列表  2.check  根据安全手机号验证uid登录
  final String? uid;

  const SafeMobileInputScreen({Key? key, this.type, this.uid})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SafeMobileInputState();
  }

  static void show(BuildContext context, {String? type, String? uid}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SafeMobileInputScreen(
        type: type,
        uid: uid,
      ),
      settings: const RouteSettings(name: '/safeMobileInput'),
    ));
  }
}

class _SafeMobileInputState extends State<SafeMobileInputScreen> {
  final BindPhase _phase = BindPhase.change;

  final String _type = 'safe_bind';
  String _token = '';
  String _mobile = '';
  String _code = '';
  String? _areaCode;

  Timer? _timer;
  int _from = 60;
  String _sendCodeText = K.setting_send_vcode;
  bool _sendCodeEnabled = true;

  final FocusNode _focusNode = FocusNode();
  final FocusNode _codeFocus = FocusNode();

  final DialogLoadingController _controller = DialogLoadingController();

  final TextEditingController _textController = TextEditingController(text: '');
  final TextEditingController _codeController = TextEditingController(text: '');

  final bool _sendingCode = false;
  bool _isAgain = false;

  @override
  void initState() {
    super.initState();
    _areaCode = Config.get('area_code', '86');
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
    }
    super.dispose();
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
  }

  //登录成功,需要退出该界面
  _onLogin(String type, dynamic data) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(widget.type == 'rebind'
          ? K.reset_safe_mobile_input_title
          : K.safe_mobile_input_title),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 54.0,
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.only(left: 29.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: R.color.secondBgColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(27.0)),
                  color: R.color.secondBgColor,
                ),
                child: Row(
                  children: <Widget>[
                    if (Util.isLocale)
                      GestureDetector(
                        onTap: _selectPhoneAreaCode,
                        child: Row(
                          children: <Widget>[
                            Text(
                              '＋$_areaCode',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: R.color.mainTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: R.color.mainTextColor,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    Expanded(
                      child: TextField(
                        enabled: _phase == BindPhase.change,
                        textAlign: TextAlign.start,
                        focusNode: _focusNode,
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: K.setting_please_input_phone,
                          contentPadding:
                              const EdgeInsets.only(bottom: 0.0, top: 0.0),
                          isDense: false,
                          filled: false,
                          errorMaxLines: 1,
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        keyboardType: TextInputType.phone,
                        autocorrect: false,
                        autofocus: _phase == BindPhase.change,
                        maxLength: 11,
                        onSubmitted: _onEndTypedPhone,
                      ),
                    ),
                  ],
                )),
            Container(
                height: 54.0,
                alignment: AlignmentDirectional.centerStart,
                margin: const EdgeInsets.only(top: 14.0),
                padding: const EdgeInsets.only(left: 29.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: R.color.secondBgColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(29.0)),
                  color: R.color.secondBgColor,
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: TextField(
                        textAlign: TextAlign.start,
                        focusNode: _codeFocus,
                        controller: _codeController,
                        decoration: InputDecoration(
                          hintText: K.setting_please_input_vcode,
                          contentPadding:
                              const EdgeInsets.only(bottom: 0.0, top: 0.0),
                          isDense: false,
                          filled: false,
                          errorMaxLines: 1,
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        autofocus: _phase == BindPhase.verify,
                        maxLength: 4,
                        onSubmitted: _onEndTypeCode,
                      )),
                      SizedBox(
                        width: 1,
                        height: 12,
                        child: DecoratedBox(
                          decoration:
                              BoxDecoration(color: R.color.thirdTextColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 18.0),
                        child: SettingTextButton(
                          title: _sendCodeText,
                          state: _sendingCode
                              ? TextButtonState.disable
                              : TextButtonState.normal,
                          color: R.color.mainTextColor,
                          onPressed: _sendCodeEnabled ? _sendVerifyCode : null,
                        ),
                      )
                    ])),
            _buildBottom(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48.0,
      margin: const EdgeInsets.only(top: 28.0),
      child: GestureDetector(
        onTap: () {
          _getSafeMobileUserList(System.context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: R.color.mainBrandColor,
            borderRadius: const BorderRadius.all(Radius.circular(27.0)),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.type == "select" || widget.type == "rebind"
                ? K.setting_next_step
                : K.setting_login,
            textScaleFactor: 1.0,
            style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _onEndTypedPhone(String mobile) {
    _checkMobile();
  }

  void _onEndTypeCode(String code) {
    _checkCode();
  }

  bool _checkMobile() {
    bool flag = true;
    _mobile = _textController.text.trim();
    if (!Utility.isMobile(_mobile, areaCode: _areaCode)) {
      Fluttertoast.showToast(
          msg: K.setting_error_phone, gravity: ToastGravity.CENTER);
      flag = false;
    }
    return flag;
  }

  bool _checkCode() {
    bool flag = true;
    _code = _codeController.text.trim();
    if (_code.length != 4) {
      Fluttertoast.showToast(
          msg: K.setting_error_vcode, gravity: ToastGravity.CENTER);
      flag = false;
    }
    return flag;
  }

  //获取验证码
  void _sendVerifyCode() async {
    if (!_checkMobile()) {
      return;
    }

    _controller.show(
        context: System.context, message: K.setting_reciveing_vcode);

    //发送验证码
    String url = "${System.domain}account/sendVerifyCode";
    Map<String, String> post = {'mobile': _mobile, 'area': _areaCode ?? ''};
    post['type'] = _type;

    String? token;
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      await Future.delayed(const Duration(milliseconds: 500));
      Map res = response.response as Map;
      token = res['data'];

      _token = Uri.encodeComponent(token ?? '');

      if (_token.isNotEmpty) {
        _startTimer();
      }
      if (res['success'] == true) {
        success = true;
      }
    } catch (e) {
      _controller.close();
      Fluttertoast.showToast(msg: "$e", gravity: ToastGravity.CENTER);
      return;
    }
    _controller.close();
    Tracker.instance.track(TrackEvent.getVerificationCode,
        properties: {'is_again': _isAgain, 'is_success': success});
    _isAgain = true;
  }

  //根据安全手机号和验证码，获取该安全手机号对应的绑定账号列表
  void _getSafeMobileUserList(context) async {
    if (!_checkMobile()) {
      return;
    }
    if (!_checkCode()) {
      return;
    }
    if (widget.type == "select") {
      //手机号/验证码格式正确，进入下一个页面（获取列表/异常回退）
      SafeMobileSelectUidScreen.show(context,
          safeMobile: _mobile,
          areaCode: _areaCode,
          code: _code,
          uid: widget.uid);
    } else if (widget.type == "rebind") {
      SafeMobileSelectUidScreen.show(context,
          safeMobile: _mobile,
          areaCode: _areaCode,
          code: _code,
          uid: widget.uid,
          type: widget.type);
    } else if (widget.type == "check") {
      _checkLogin();
    }
  }

  //根据安全手机号/uid/验证码，登录到指定uid
  void _checkLogin() async {
    _controller.show(context: System.context, message: K.setting_logining);

    String dtoken = Session.getString('dtoken', '');

    String method = "account/safelogin";
    String url = System.domain + method;
    Map<String, String> post = {
      'mobile': _mobile,
      'code': _code,
      'uid': widget.uid ?? '',
      'dtoken': dtoken,
      'area': _areaCode ?? '',
    };

    try {
      XhrResponse response = await Xhr.postJson(url, post);

      Map res = response.response as Map;
      bool success = res['success'];
      if (success && res['data'] != null && res['data'] != false) {
        //记录用户信息
        int origin = Session.uid;
        await Session.setValues(res['data']);
        eventCenter.emit(EventConstant.EventLogin, {
          'origin': origin,
          'now': Session.uid,
          'login_type': 'tel',
          'is_auto': false
        });

        if (Session.role == UserRole.REG) {
          ILoginManager loginManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_LOGIN);
          loginManager.openLoginProfile(context, replace: true);
        }

        Fluttertoast.showToast(
            msg: K.setting_change_account_success,
            gravity: ToastGravity.CENTER);

        //退出当前页面
        Navigator.pop(context);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }

    _controller.close();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _from = 60;
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(() {
        if (_from < 1) {
          timer.cancel();
          _sendCodeEnabled = true;
          _sendCodeText = K.setting_send_vcode;
        } else {
          _from = _from - 1;
          _sendCodeEnabled = false;
          _sendCodeText = '${_from}s';
        }
      }),
    );
  }

  void _selectPhoneAreaCode() async {
    if (_phase == BindPhase.change) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      String? code = await loginManager.selectPhoneAreaCode(context);
      if (code != null && code != _areaCode) {
        setState(() {
          _areaCode = code;
        });
      }
    }
  }
}

enum BindPhase { verify, change }
