import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';
import 'package:settings/src/widget/textButton.dart';

/// 安全手机号输入/验证码界面
///
class SafeMobileCheckScreen extends StatefulWidget {
  final String? type;
  final String? uid;
  final String? phone;
  final String? icon;

  const SafeMobileCheckScreen(
      {Key? key, this.type, this.uid, this.phone, this.icon})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SafeMobileCheckState();
  }

  static void show(BuildContext context,
      {String? type, String? uid, String? phone, String? icon}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SafeMobileCheckScreen(
        type: type,
        uid: uid,
        phone: phone,
        icon: icon,
      ),
      settings: const RouteSettings(name: '/safeMobileCheck'),
    ));
  }
}

class _SafeMobileCheckState extends State<SafeMobileCheckScreen> {
  final String _type = 'safe_bind';
  String _token = '';
  String _mobile = '';
  String _code = '';
  String _areaCode = '+86';

  Timer? _timer;
  int _from = 60;
  String _sendCodeText = K.setting_send_vcode;
  Color _sendCodeColor = R.color.mainBrandColor;
  bool _sendCodeEnabled = true;

  final FocusNode _codeFocus = FocusNode();

  final DialogLoadingController _controller = DialogLoadingController();

  final TextEditingController _codeController = TextEditingController(text: '');

  final bool _sendingCode = false;
  bool _isAgain = false;

  @override
  void initState() {
    super.initState();
    _areaCode = Config.get('area_code', '86');
    _mobile = widget.phone ?? '';
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
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
      appBar: BaseAppBar(K.safe_mobile_check_code),
      body: SizedBox.expand(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            padding: const EdgeInsetsDirectional.only(
                top: 30.0, start: 40.0, end: 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildAvatar(),
                const SizedBox(height: 20),
                _buildPhone(),
                const SizedBox(height: 40),
                _buildCode(),
                const SizedBox(height: 20),
                _buildBottom(),
                const SizedBox(height: 10),
                if (BaseConfig.instance.showVoiceCode) _renderVoiceBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 语音验证码
  Widget _renderVoiceBtn() {
    ILoginManager? manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    return manager?.getVoiceCodeButton(() => _sendVerifyCode(sendType: 2)) ??
        const SizedBox.shrink();
  }

  Widget _buildAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEAEDF4),
            offset: Offset(0, 12),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: CommonAvatar(
        path: widget.icon,
        size: 100,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildPhone() {
    return Text(
      _checkMobile(showToast: false) ? _mobile.replaceRange(3, 7, '****') : '',
      style: TextStyle(
        color: R.color.mainTextColor,
        fontSize: 26,
      ),
    );
  }

  Widget _buildCode() {
    return Container(
      height: 52.0,
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsetsDirectional.only(start: 18.0, end: 18.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: R.color.secondBgColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(27.0)),
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
                contentPadding: const EdgeInsets.only(bottom: 0.0, top: 0.0),
                isDense: false,
                filled: false,
                errorMaxLines: 1,
                border: InputBorder.none,
                counterText: '',
              ),
              keyboardType: TextInputType.number,
              autocorrect: false,
              autofocus: true,
              maxLength: 4,
              onSubmitted: _onEndTypeCode,
            ),
          ),
          const SizedBox(
            width: 1,
            height: 12,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Color(0x51202020)),
            ),
          ),
          SettingTextButton(
            title: _sendCodeText,
            state:
                _sendingCode ? TextButtonState.disable : TextButtonState.normal,
            color: _sendCodeColor,
            onPressed: _sendCodeEnabled ? _sendVerifyCode : null,
          )
        ],
      ),
    );
  }

  //构建底部
  Widget _buildBottom() {
    return SizedBox(
      width: double.infinity,
      height: 52.0,
      child: GestureDetector(
        onTap: () {
          _getSafeMobileUserList(System.context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: R.color.mainBrandColor,
            borderRadius: const BorderRadius.all(Radius.circular(26.0)),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            K.setting_login,
            textScaleFactor: 1.0,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
      ),
    );
  }

  void _onEndTypeCode(String code) {
    _checkCode();
  }

  bool _checkMobile({bool showToast = true}) {
    bool flag = true;
    if (!Utility.isMobile(_mobile, areaCode: _areaCode)) {
      if (showToast) {
        Fluttertoast.showToast(
            msg: K.setting_error_phone, gravity: ToastGravity.CENTER);
      }
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
  /// sendType  1-短信验证码；2-语音验证码
  void _sendVerifyCode({int sendType = 1}) async {
    if (!_checkMobile()) {
      return;
    }

    _controller.show(
        context: System.context, message: K.setting_reciveing_vcode);

    //发送验证码
    String url = "${System.domain}account/sendVerifyCode";
    Map<String, String> post = {
      'mobile': _mobile,
      'area': _areaCode,
      'service': '$sendType'
    };
    post['type'] = _type;

    String? token;
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      await Future.delayed(const Duration(milliseconds: 500));
      Map res = response.response as Map;
      token = res['data'];

      _token = Uri.encodeComponent(token ?? '');

      _startTimer();
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
    _checkLogin();
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
      'area': _areaCode,
    };

    try {
      XhrResponse response = await Xhr.postJson(url, post);

      Map res = response.response as Map;
      bool success = res['success'];

      _controller.close();
      if (success && res['data'] != null && res['data'] != false) {
        //记录用户信息
        int origin = Session.uid;
        await Session.setValues(res['data']);
        eventCenter.emit(EventConstant.EventLogin,
            {'origin': origin, 'now': Session.uid, 'login_type': 'switch'});
        Tracker.instance.track(TrackEvent.add_small_account, properties: {
          'uid': Session.uid,
        });

        if (Session.role == UserRole.REG) {
          ILoginManager loginManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_LOGIN);
          loginManager.openLoginProfile(context, replace: true);
        }

        Fluttertoast.showToast(
            msg: K.setting_change_account_success,
            gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      _controller.close();
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
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
          _sendCodeColor = R.color.mainBrandColor;
        } else {
          _from = _from - 1;
          _sendCodeEnabled = false;
          _sendCodeText = '${_from}s';
          _sendCodeColor = R.color.thirdTextColor;
        }
      }),
    );
  }
}
