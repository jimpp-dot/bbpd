import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/k.dart';

import 'high_risk_users_cannot_receive_code_reminder_dialog.dart';

class HighRiskUsersVoiceVerifyCodeDialog extends StatefulWidget {
  const HighRiskUsersVoiceVerifyCodeDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: const HighRiskUsersVoiceVerifyCodeDialog(),
        );
      },
    );
  }

  @override
  State<HighRiskUsersVoiceVerifyCodeDialog> createState() =>
      _HighRiskUsersVoiceVerifyCodeDialogState();
}

class _HighRiskUsersVoiceVerifyCodeDialogState
    extends State<HighRiskUsersVoiceVerifyCodeDialog> {
  final FocusNode _focusNode = FocusNode();
  String _captcha = '';
  String _token = '';
  String _notice = '';
  Timer? _timer;
  int _countDown = 0;
  String mobile = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadData();
    });
  }

  void _loadData() async {
    String url = "${System.domain}account/setinfo?v=9";
    XhrResponse response = await Xhr.getJson(url);
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        Map data = res['data'];
        if (data['mobile'] != null && data['mobile'] is String) {
          mobile = data['mobile'];
        }
        if (mobile.isEmpty &&
            data['safe_mobile'] != null &&
            data['safe_mobile'] is String) {
          mobile = data['safe_mobile'];
        }
        _sendCode();
      }
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _cancelTimer();
    super.dispose();
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
      _timer?.cancel();
      _timer = null;
    }
  }

  void showLoading({String status = ''}) {
    CommonLoading.show(status: status, maskType: EasyLoadingMaskType.clear);
  }

  _onChanged(String value) {
    Log.d('_PwdDialogState._onChanged: $value');
    if (_captcha == value) return;
    setState(() {
      _captcha = value;
    });
    if (value.length == 4) {
      _focusNode.unfocus();
      if (_token.isNotEmpty) {
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
    showLoading(status: K.login_loading);

    String url = '${System.domain}account/sendVerifyCode';
    Map<String, String> post = {
      'mobile': mobile,
      'area': '86',
      'service': '$sendType',
      'type': 'login'
    };
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      CommonLoading.dismiss();
      if (!mounted) return;
      Map res = response.value();
      if (res['success'] == true) {
        success = true;
        _token = res['data'];
        _notice = '${K.have_send_vertify_code_to} $mobile';
        if (sendType == 2) {
          _notice = '${K.have_send_voice_vertify_code_to} $mobile';
        }
        _initTimer();
        _focusNode.requestFocus();
      }
    } catch (e) {
      CommonLoading.dismiss();
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      return;
    }
  }

  // 重新发送验证码
  void _onResend() {
    _token = '';
    _sendCode();
  }

  void _onNext() async {
    if (_captcha.length != 4) {
      Fluttertoast.showToast(
          msg: K.wrong_vertify_code_retry, gravity: ToastGravity.CENTER);
      return;
    }

    showLoading(status: K.login_loading);

    //获取设备token，用于小号切换
    String dtoken = Session.getString('dtoken', '');

    String url = "${System.domain}account/login?v=1";
    Map<String, String> post = {
      'mobile': mobile,
      'type': 'safe_verify',
      'code': _captcha,
      'token': _token,
      'dtoken': dtoken,
      'area': '86'
    };
    XhrResponse response = await Xhr.postJson(url, post);

    CommonLoading.dismiss();

    if (!mounted) return;

    if (response.error != null) {
      Fluttertoast.toastException(
          exp: response.error, gravity: ToastGravity.CENTER);
      return;
    }

    Map res = response.value();
    if (res['success'] == false) {
      setState(() {
        _notice = K.vertify_code_is_wrong;
      });
      Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      return;
    }

    try {
      if (res['data']['token'] == null) {
        Fluttertoast.showToast(msg: 'token异常');
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }

    //记录用户信息
    int origin = Session.uid;
    await Session.setValues(res['data']);
    if (Session.token.isEmpty) {
      Fluttertoast.showToast(msg: 'token读取失败');
      return;
    }
    eventCenter.emit(EventConstant.EventLogin, {
      'origin': origin,
      'now': Session.uid,
      'login_type': 'tel',
      'is_auto': false
    });
    // 登录
    // if (Util.isLoginBeforeBoot()) {
    //    eventCenter.emit(EventConstant.EventLoginBeforeBoot, context);
    // } else {
    Session.sync();
    eventCenter.emit('event.high.risk.user.voice.safe.verify.accomplish',
        {'type': 'voice_verify'});
    Navigator.of(context).pop();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Text(
                K.please_input_vertify_code,
                style: const TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  _notice,
                  style: TextStyle(
                    color: R.color.mainTextColor,
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap: () async {
                    _focusNode.unfocus();
                    //WorkAround 直接执行requestFocus并不能马上唤起软键盘
                    Future.delayed(const Duration(microseconds: 100),
                        () => _focusNode.requestFocus());
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 58,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: R.color.secondBgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _captcha.isNotEmpty ? _captcha[0] : '',
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 58,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: R.color.secondBgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _captcha.length > 1 ? _captcha[1] : '',
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 58,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: R.color.secondBgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _captcha.length > 2 ? _captcha[2] : '',
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 58,
                        height: 58,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: R.color.secondBgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _captcha.length > 3 ? _captcha[3] : '',
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _renderBtn(),
              GestureDetector(
                onTap: () async {
                  HighRiskUsersCannotReceiveCodeReminderDialog.show(context);
                },
                child: Container(
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    K.login_dont_receive_code,
                    style: TextStyle(
                      color: R.color.mainBrandColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.close,
                size: 24,
                color: R.color.thirdTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderBtn() {
    String text = K.login_resend_voice;
    if (_timer != null && _timer?.isActive == true) {
      text = '$text（${_countDown}s）';
    }
    return Submit(
      margin: const EdgeInsetsDirectional.only(top: 26, start: 56, end: 56),
      disabled: _timer != null,
      label: text,
      btnCircular: 25,
      needGradientColors: true,
      onSubmit: _onResend,
    );
  }
}
