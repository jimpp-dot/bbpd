import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings/k.dart';

/// 验证手机号验证码
class VerifyPhoneNum extends StatefulWidget {
  /// 页面标题
  String? title;
  final String? phone;
  final String? areaCode;

  VerifyPhoneNum(this.areaCode, this.phone, {Key? key, this.title}) : super(key: key) {
    title ??= K.setting_check_phone;
  }

  @override
  _VerifyPhoneNumState createState() {
    return _VerifyPhoneNumState();
  }

  static Future<dynamic> show(BuildContext context, String? areaCode, String? phone, {String? title}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => VerifyPhoneNum(
        areaCode,
        phone,
        title: title,
      ),
      settings: const RouteSettings(name: '/verifyPhone'),
    ));
  }
}

class _VerifyPhoneNumState extends State<VerifyPhoneNum> {
  final DialogLoadingController _loadingController = DialogLoadingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _captchaController = TextEditingController();

  bool _captchaEnabled = false;
  String _captchaBtnText = K.setting_receive_vcode;
  bool _nextBtnEnabled = false;

  String? _areaCode;

  Timer? _timer;
  int _from = 60;
  bool _isAgain = false;

  @override
  void initState() {
    super.initState();
    _phoneController.text = widget.phone ?? '';
    if (_phoneController.text.length == 11) {
      _captchaEnabled = true;
    }
    _areaCode = widget.areaCode ?? '86';
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            widget.title ?? '',
            style: const TextStyle(
              color: Color(0xFF313133),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
            child: TextField(
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF242528),
              ),
              controller: _phoneController,
              onChanged: _onPhoneTextChanged,
              decoration: InputDecoration(
                hintText: K.setting_please_input_phone,
                prefix: Util.isLocale ? _buildPhoneAreaWidget() : null,
                hintStyle: const TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFFCACACA),
                ),
                contentPadding: const EdgeInsets.only(
                  top: 14,
                  bottom: 14,
                  left: 29,
                ),
                errorMaxLines: 1,
                filled: true,
                fillColor: const Color(0xFFF7F7F7),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
              keyboardType: TextInputType.number,
              autocorrect: false,
              autofocus: false,
              maxLength: 11,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 30.0,
              right: 30.0,
            ),
            child: Stack(
              children: <Widget>[
                TextField(
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF242528),
                  ),
                  controller: _captchaController,
                  onChanged: _onCaptchaTextChanged,
                  decoration: InputDecoration(
                    helperText: K.setting_vcode_len_limit,
                    hintText: K.setting_please_input_vcode,
                    hintStyle: const TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFFCACACA),
                    ),
                    contentPadding: const EdgeInsets.only(
                      bottom: 14.0,
                      top: 14.0,
                      left: 29,
                    ),
                    errorMaxLines: 1,
                    filled: true,
                    fillColor: const Color(0xFFF7F7F7),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  autofocus: false,
                  maxLength: 4,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                ),
                PositionedDirectional(
                  top: 9,
                  end: 0,
                  child: GestureDetector(
                    onTap: _captchaEnabled ? _onGetCaptcha : null,
                    child: Container(
                      height: 36,
                      constraints: const BoxConstraints.tightFor(width: 90),
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(
                          color: R.color.mainBrandColor,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          _captchaBtnText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(
              left: 30,
              top: 40,
              right: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
            ),
            child: SizedBox(
              height: 48,
              child: GestureDetector(
                onTap: _nextBtnEnabled ? _onNext : null,
                child: Container(
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: R.color.mainBrandColor,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Text(
                    K.setting_next_step,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 手机号输入框的onChange回调
  void _onPhoneTextChanged(String text) {
    _captchaEnabled = text.length == 11;
  }

  /// 验证码输入框的onChange回调
  void _onCaptchaTextChanged(String text) {
    _nextBtnEnabled = text.length == 4;
  }

  /// 请求验证码
  void _onGetCaptcha() async {
    _loadingController.show(context: context, message: K.setting_requesting);
    String url = "${System.domain}account/sendVerifyCode";
    Map<String, String> post = {'mobile': widget.phone ?? '', 'type': 'login', 'area': _areaCode ?? ''};
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      await Future.delayed(const Duration(milliseconds: 500));
      Map res = response.response as Map;
      String? token = res['data'];
      _loadingController.close();
      if (token != null) {
        _startTimer();
      } else {
        Toast.showCenter(context, K.setting_retry_later);
      }
      if (res['success'] == true) {
        success = true;
      }
    } catch (e) {
      _loadingController.close();
      Toast.showCenter(context, e.toString());
      return;
    }
    Tracker.instance.track(TrackEvent.getVerificationCode, properties: {'is_again': _isAgain, 'is_success': success});
    _isAgain = true;
  }

  /// 申请注销
  void _onNext() async {
    _loadingController.show(context: context, message: K.setting_requesting);
    String url = "${System.domain}account/cancel";
    Map<String, String> post = {'mobile': _phoneController.text, 'code': _captchaController.text, 'area': _areaCode ?? ''};
    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      Log.d('_VerifyPhoneNumState._onNext: ${response.value()}');
      _loadingController.close();
      if (response.error == null) {
        Map res = response.value();
        if (res['success'] == true) {
          Toast.showCenter(context, K.setting_apply_success);
          Navigator.of(context).pop(true);
        } else {
          Toast.showCenter(context, K.setting_apply_check_failed);
        }
      } else {
        Toast.showCenter(context, response.error.toString());
      }
    } catch (e) {
      _loadingController.close();
      Toast.showCenter(context, e.toString());
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
          _captchaEnabled = true;
          _captchaBtnText = K.setting_re_send;
        } else {
          _from = _from - 1;
          _captchaEnabled = false;
          _captchaBtnText = '${_from}s';
        }
      }),
    );
  }

  Widget _buildPhoneAreaWidget() {
    return GestureDetector(
      onTap: () async {
        ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
        String? code = await loginManager.selectPhoneAreaCode(context);
        if (code != null && code != _areaCode) {
          setState(() {
            _areaCode = code;
          });
        }
      },
      child: Row(
        children: <Widget>[
          Text(
            '＋$_areaCode',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: R.color.mainTextColor, fontWeight: FontWeight.w500),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: R.color.mainTextColor,
            size: 18,
          ),
        ],
      ),
    );
  }
}
