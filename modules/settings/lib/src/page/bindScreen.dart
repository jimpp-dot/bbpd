import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';
import 'package:settings/src/widget/textButton.dart';

// 手机号或者安全手机号绑定
// 在同一个页面输入手机号和验证码
class BindScreen extends StatefulWidget {
  // 绑定类型：手机号/安全手机号
  final String type;
  final bool hiddenBack;

  static Future show(BuildContext context,
      {String type = 'bind', bool hiddenBack = false}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BindScreen(
        type: type,
        hiddenBack: hiddenBack,
      ),
      settings: const RouteSettings(name: '/bind'),
    ));
  }

  const BindScreen({Key? key, this.type = 'bind', this.hiddenBack = false})
      : super(key: key);

  @override
  _BindScreenState createState() => _BindScreenState();
}

class _BindScreenState extends State<BindScreen> {
  final FocusNode _focusNode = FocusNode();
  final FocusNode _codeFocus = FocusNode();
  final TextEditingController _textController = TextEditingController(text: '');
  final TextEditingController _codeController = TextEditingController(text: '');
  DialogLoadingController? _controller;
  Timer? _timer;
  int _from = 60;
  String _sendCodeText = K.setting_send_vcode;
  bool _sendCodeEnabled = true;
  String? _token;
  String? _appBarTitle;

  GlobalKey<PhoneInputWidgetState>? _phoneInputKey;
  BuildContext? mContext;
  bool _isAgain = false;

  @override
  void initState() {
    super.initState();
    _phoneInputKey = GlobalKey();
    if ('safe_bind' == widget.type) {
      _appBarTitle = K.settings_bind_safe_phone;
    } else {
      _appBarTitle = K.settings_bind_phone;
    }

    _codeFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _textController.dispose();
    _codeController.dispose();
    _focusNode.dispose();
    _codeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BaseAppBar appBar = BaseAppBar(
      '',
      statusBrightness: darkMode ? Brightness.dark : Brightness.light,
      backgroundColor: Colors.transparent,
      backColor: R.colors.mainTextColor,
      titleColor: R.colors.mainTextColor,
      showBack: !Util.parseBool(widget.hiddenBack),
    );

    mContext = context;
    return WillPopScope(
      onWillPop: () async {
        return !Util.parseBool(widget.hiddenBack);
      },
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: _renderBody(context),
      ).withCommonBg(),
    );
  }

  void showLoading(String message) {
    if (_controller != null) {
      _controller!.setLabel(message);
      return;
    }

    _controller = DialogLoadingController();
    _controller!.show(context: context, message: message);
  }

  void hideLoading() {
    _controller?.close();
    _controller = null;
  }

  void _onEndTypedPhone(String mobile) {}

  void _onEndTypeCode(String code) {}

  void _sendVerifyCode() async {
    String mobile = _textController.text.trim();
    String? areaCode = _phoneInputKey?.currentState?.areaCode;
    if (!Utility.isMobile(mobile, areaCode: areaCode)) {
      Fluttertoast.showToast(
          msg: K.setting_error_phone, gravity: ToastGravity.CENTER);
      return;
    }

    showLoading(K.setting_requesting);
    //发送验证码
    String url = "${System.domain}account/sendVerifyCode";
    Map<String, String> post = {
      'mobile': mobile,
      'area': areaCode ?? '',
      'type': widget.type
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
        _sendCodeEnabled = false;
        _startTimer();
      });
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    Tracker.instance.track(TrackEvent.getVerificationCode,
        properties: {'is_again': _isAgain, 'is_success': success});
    _isAgain = true;
    hideLoading();
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
          _sendCodeText = K.setting_resend_vcode;
        } else {
          _from = _from - 1;
          _sendCodeEnabled = false;
          _sendCodeText = '${_from}s';
        }
      }),
    );
  }

  void _onSave() async {
    String mobile = _textController.text.trim();
    if (!Utility.isMobile(mobile)) {
      Fluttertoast.showToast(
          msg: K.setting_error_phone, gravity: ToastGravity.CENTER);
      return;
    }
    String code = _codeController.text.trim();
    if (!Utility.isVerifyCode(code)) {
      Fluttertoast.showToast(
          msg: K.setting_error_vcode, gravity: ToastGravity.CENTER);
      return;
    }

    if (widget.type == 'auto_bind') {
      Tracker.instance.track(TrackEvent.mobileBindConfirm,
          properties: {'is_auto': false}); //is_auto 是否是第三方一建绑定
    }

    showLoading(K.setting_requesting);

    String dtoken = Session.getString('dtoken', '');
    // 绑定
    String method = "account/login?v=1";
    String url = System.domain + method;
    Map<String, String> post = {
      'mobile': mobile,
      'code': code,
      'type': widget.type,
      'token': _token ?? '',
      'dtoken': dtoken,
      'area': _phoneInputKey?.currentState?.areaCode ?? ''
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
        Fluttertoast.showToast(msg: K.setting_bind_success);
        Config.set('_is_auth', '1');

        _timer?.cancel();
        setState(() {
          _codeController.text = '';
          _sendCodeEnabled = true;
          _sendCodeText = K.setting_send_vcode;
        });
        // 绑定手机号
        if (widget.type == 'safe_bind') {
          Fluttertoast.showToast(
              msg: R.string('bind_succ_go_bind_other_account'),
              gravity: ToastGravity.CENTER);
        }
        hideLoading();
        if (mContext != null) {
          Navigator.pop(mContext!, true);
        }
        return;
      } else {
        Fluttertoast.showToast(
            msg: res['msg'] ?? K.setting_network_error_retry,
            gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    hideLoading();
  }

  Widget _renderBody(BuildContext context) {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _appBarTitle ?? '',
              style: TextStyle(
                fontSize: 26,
                color: R.color.mainTextColor,
                fontWeight:
                    loginManager.bold ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            PhoneInputWidget(
              key: _phoneInputKey,
              enabled: true,
              autoFocus: true,
              onChanged: (value) => setState(() {}),
              onSubmitted: _onEndTypedPhone,
              controller: _textController,
              focusNode: _focusNode,
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: R.color.secondBgColor,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              alignment: AlignmentDirectional.centerStart,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: R.color.mainTextColor,
                      ),
                      focusNode: _codeFocus,
                      controller: _codeController,
                      decoration: InputDecoration(
                        hintText: K.setting_please_input_vcode,
                        counterText: '',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: R.color.thirdTextColor,
                        ),
                      ),
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      autofocus: false,
                      onSubmitted: _onEndTypeCode,
                      onChanged: (value) => setState(() {}),
                    ),
                  ),
                  if (_codeController.text.isNotEmpty && _codeFocus.hasFocus)
                    _buildClear(),
                  SizedBox(
                    width: 1,
                    height: 12,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: R.color.thirdTextColor),
                    ),
                  ),
                  SettingTextButton(
                    title: _sendCodeText,
                    state: _sendCodeEnabled
                        ? TextButtonState.normal
                        : TextButtonState.disable,
                    onPressed: _sendCodeEnabled ? _sendVerifyCode : null,
                  )
                ],
              ),
            ),
            Submit(
              margin: const EdgeInsetsDirectional.only(top: 120),
              disabled: !_canGotoNextPage(),
              label: K.setting_next_step,
              needGradientColors: true,
              onSubmit: _onSave,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildClear() {
    return GestureDetector(
      onTap: _onClear,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 10.0),
        child: Icon(
          Icons.clear,
          color: R.color.secondTextColor,
          size: 16,
        ),
      ),
    );
  }

  _onClear() {
    setState(() {
      _codeController.text = '';
    });
  }

  bool _canGotoNextPage() {
    String mobile = _textController.text.trim();
    if (!Utility.isMobile(mobile)) {
      return false;
    }
    String code = _codeController.text.trim();
    if (!Utility.isVerifyCode(code)) {
      return false;
    }

    return true;
  }
}
