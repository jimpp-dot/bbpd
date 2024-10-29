import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';
import 'package:settings/src/widget/textButton.dart';
import 'id_auth.dart';

/// 绑定安全手机号 or 修改
enum BindType {
  SAFE_BIND, // safe_bind 安全绑定
  BIND, // 绑定手机号
}

class BindChangeScreen extends StatefulWidget {
  final String? phone;
  final String? areaCode;
  final BindType? type;
  // 安全手机号先实人认证成功拿到token再进该页面更新手机号
  final String? token;

  static void showBindChangeScreen(BuildContext context,
      {String? areaCode, String? phone, BindType? type, String? token}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BindChangeScreen(
        phone: phone,
        type: type,
        areaCode: areaCode,
        token: token,
      ),
      settings: const RouteSettings(name: '/bindChange'),
    ));
  }

  BindChangeScreen({Key? key, this.areaCode, this.phone, this.type, this.token})
      : super(key: key) {
    Log.d("BindChangeScreen new");
  }

  @override
  _BindChangeScreenState createState() => _BindChangeScreenState();
}

class _BindChangeScreenState extends State<BindChangeScreen> {
  String _title = R.string('bind_change_title');
  String? _phone;
  BindPhase _phase = BindPhase.verify;
  String? _token;
  String? _areaCode;

  @override
  void initState() {
    super.initState();
    _phone = widget.phone;
    _areaCode = widget.areaCode;

    _title = widget.type == BindType.SAFE_BIND
        ? R.string('safe_bind_change_title')
        : R.string('bind_change_title');

    if (widget.type == BindType.SAFE_BIND &&
        widget.token != null &&
        widget.token!.isNotEmpty) {
      // 修改安全手机，已经通过实人认证取到token，直接进入输入新手机号步骤
      _phase = BindPhase.change;
      _token = widget.token;
    }
  }

  void goAuth() async {
    Log.d('BindChangeScreen go Auth');
    dynamic map = await IdAuth.show(context,
        certifyType: CertifyType.modify,
        bindType: (widget.type == BindType.SAFE_BIND ? 'safe_bind' : 'bind'));
    if (map is Map) {
      String? token = map['token'];
      List? accounts = map['users'];
      if (token != null && token.isNotEmpty) {
        if (widget.type == BindType.SAFE_BIND) {
          // 展示实人认证下的所有账号列表
          if (accounts == null || accounts.isEmpty) {
            Fluttertoast.showToast(msg: K.settings_no_account_found);
            return;
          }
          List<AccountItem> items = [];
          try {
            for (var json in accounts) {
              items.add(AccountItem.fromJson(json));
            }
          } catch (e) {
            Log.d(e);
          }
          ILoginManager loginManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_LOGIN);
          bool suc = await loginManager.openAccountList(items);
          if (suc == false) {
            return;
          }
        }

        // 实人认证成功返回token
        if (!mounted) return;

        setState(() {
          _token = token;
          _phase = BindPhase.change;
        });
      }
    }
  }

  // 通过实人验证修改
  Widget _renderAuthTips() {
    if ((Util.isLocale)) {
      // 海外版本不展示实人认证tips
      return Container();
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: goAuth,
        child: Text(
          K.settings_modify_phone_by_auth,
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 12.0,
              color: R.color.secondTextColor),
        ),
      ),
    );
  }

  Widget _renderVertify() {
    return Column(
      children: <Widget>[
        BindWidget(
          key: const Key('BindPhase.verify'),
          phone: _phone,
          areaCode: _areaCode,
          phase: _phase,
          type: widget.type,
          onSubmit: (String? token) {
            setState(() {
              _token = token;
              _phase = BindPhase.change;
            });
          },
        ),
        _renderAuthTips()
      ],
    );
  }

  Widget _renderChange() {
    return BindWidget(
      key: const Key('BindPhase.change'),
      token: _token,
      phase: _phase,
      type: widget.type,
      onSubmit: (String? token) {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(_title),
      resizeToAvoidBottomInset: false,
      body: _phase == BindPhase.verify ? _renderVertify() : _renderChange(),
    );
  }
}

enum BindPhase { verify, change }

typedef OnBindSubmit = void Function(String? token);

class BindWidget extends StatefulWidget {
  final String? token;
  final String? phone;
  final String? areaCode;
  final BindPhase? phase;
  final BindType? type;
  final VoidCallback? onSendVerifyCode;
  final OnBindSubmit? onSubmit;

  const BindWidget(
      {Key? key,
      this.token,
      this.areaCode = '86',
      this.phone,
      this.type,
      this.phase,
      this.onSendVerifyCode,
      this.onSubmit})
      : super(key: key);

  @override
  _BindWidgetState createState() => _BindWidgetState();
}

class _BindWidgetState extends State<BindWidget> {
  final FocusNode _focusNode = FocusNode();
  final FocusNode _codeFocus = FocusNode();

  String? _token;
  String? _phone;
  String? _areaCode;
  final TextEditingController _textController = TextEditingController(text: '');
  final TextEditingController _codeController = TextEditingController(text: '');
  DialogLoadingController? _controller;

  Timer? _timer;
  int _from = 60;
  String _sendCodeText = K.setting_send_vcode;
  bool _sendCodeEnabled = true;
  GlobalKey<PhoneInputWidgetState>? _phoneInputKey;
  bool _isAgain = false;

  @override
  void initState() {
    super.initState();
    _token = widget.token;
    _phone = widget.phone;
    _areaCode = widget.areaCode;
    _phoneInputKey = GlobalKey();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
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

  /// 发送验证码
  void _sendVerifyCode() async {
    String mobile = widget.phase == BindPhase.change
        ? _textController.text.trim()
        : _phone ?? _textController.text.trim();
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
      'type': widget.type == BindType.SAFE_BIND ? 'safe_bind' : 'bind',
      'area': areaCode ?? ''
    };

    String token;
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      await Future.delayed(const Duration(milliseconds: 500));
      Map res = response.response as Map;
      token = res['data'];

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

  void _onSave() async {
    String mobile = widget.phase == BindPhase.change
        ? _textController.text.trim()
        : _phone ?? _textController.text.trim();
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

    showLoading(K.setting_requesting);
    //发送验证码
    String method = widget.phase == BindPhase.verify
        ? 'account/setvalidcode'
        : "account/setvalidbind";
    String url = System.domain + method;
    Map<String, String> post = {
      'mobile': mobile,
      'code': code,
      'token': widget.token ?? '',
      'area': _phoneInputKey?.currentState?.areaCode ?? '',
      'type': widget.type == BindType.SAFE_BIND ? "safe_bind" : 'bind',
      if (widget.type == BindType.SAFE_BIND) 'idcard': '1'
    };

    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      await Future.delayed(const Duration(milliseconds: 500));
      Map res = response.response as Map;
      bool? success = res['success'];
      Map? data = res['data'];
      if (success == true) {
        if (widget.phase == BindPhase.verify &&
            widget.type == BindType.SAFE_BIND) {
          // 展示安全手机号下的所有账号列表
          List? accounts = data?['users'];
          if (accounts == null || accounts.isEmpty) {
            Fluttertoast.showToast(msg: K.settings_no_account_found);
            hideLoading();
            return;
          }
          List<AccountItem> items = [];
          try {
            for (var json in accounts) {
              items.add(AccountItem.fromJson(json));
            }
          } catch (e) {
            Log.d(e);
          }
          ILoginManager loginManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_LOGIN);
          bool suc = await loginManager.openAccountList(items);
          if (suc == false) {
            hideLoading();
            return;
          }
        }
        Fluttertoast.showToast(
            msg: widget.phase == BindPhase.verify
                ? K.setting_check_success_input_phone
                : K.setting_bind_success,
            gravity: ToastGravity.CENTER);
        if (widget.phase == BindPhase.verify) {
          FocusScope.of(context).requestFocus(_focusNode);
        }
        _timer?.cancel();
        setState(() {
          _codeController.text = '';
          _sendCodeEnabled = true;
          _sendCodeText = K.setting_send_vcode;
        });
        if (widget.onSubmit != null)
          widget.onSubmit!(data != null ? data['token'] : null);
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

  _onClear() {
    setState(() {
      _textController.text = '';
    });
  }

  Widget _buildClear() {
    return GestureDetector(
      onTap: _onClear,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 20.0),
        child: Icon(
          Icons.clear,
          color: R.color.secondTextColor,
          size: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 54),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 6, top: 40, bottom: 10),
            alignment: AlignmentDirectional.topStart,
            child: Text(
              widget.phase == BindPhase.verify
                  ? K.setting_ori_cellphone
                  : K.setting_new_cellphone,
              style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
            ),
          ),
          PhoneInputWidget(
            key: _phoneInputKey,
            hintText: widget.phase == BindPhase.verify
                ? _phone
                : K.setting_please_input_phone,
            areaCode: _areaCode,
            enabled: widget.phase == BindPhase.change,
            autoFocus: widget.phase == BindPhase.change,
            onChanged: (value) => setState(() {}),
            onSubmitted: _onEndTypedPhone,
            controller: _textController,
            focusNode: _focusNode,
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 15.0),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: R.color.secondBgColor,
                borderRadius: const BorderRadius.all(Radius.circular(25))),
            alignment: AlignmentDirectional.centerStart,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                  autofocus: widget.phase == BindPhase.verify,
                  onSubmitted: _onEndTypeCode,
                ),
              ),
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
            ]),
          ),
          Submit(
            label: K.setting_next_step,
            margin: const EdgeInsetsDirectional.only(top: 60),
            needGradientColors: true,
            onSubmit: _onSave,
          )
        ],
      ),
    );
  }
}
