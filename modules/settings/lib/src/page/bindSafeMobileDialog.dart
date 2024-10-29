import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/login.dart';
import 'package:settings/k.dart';
import 'package:settings/src/widget/textButton.dart';

import '../../assets.dart';
import 'bindSafeMobileSuccessDialog.dart';
import 'bindScreen.dart';

//安全手机号绑定弹框界面
class BindSafeMobileDialog extends StatefulWidget {
  static Future openBindSafeMobileDialog(BuildContext context,
      {bool fastBind = true}) async {
    return await DialogQueue.root.enqueue(
        key: const Key('BindSafeMobileDialog'),
        context: context,
        barrierDismissible: true,
        builder: (context) => BindSafeMobileDialog(
              fastBind: fastBind,
            ));
//    return showDialog(context: context, barrierDismissible: true, builder: (context) => BindSafeMobileDialog(fastBind: fastBind,));
  }

  final bool fastBind;

  const BindSafeMobileDialog({Key? key, this.fastBind = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BindSafeMobileDialogState();
  }
}

class _BindSafeMobileDialogState extends State<BindSafeMobileDialog> {
  final BindPhase _phase = BindPhase.change;

  final String _type = 'safe_bind';
  String _token = '';
  String _mobile = '';
  String _code = '';
  String _areaCode = "86";

  final FocusNode _focusNode = FocusNode();
  final FocusNode _codeFocus = FocusNode();

  final DialogLoadingController _controller = DialogLoadingController();

  final TextEditingController _textController = TextEditingController(text: '');
  final TextEditingController _codeController = TextEditingController(text: '');

  final bool _sendingCode = false;
  bool _isAgain = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.fastBind) {
      Tracker.instance.track(TrackEvent.safePopup);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: R.color.mainBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 60.0,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 24.0),
                  child: Text(
                    K.setting_bind_safe_phone,
                    style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                PositionedDirectional(
                  end: 0,
                  child: InkWell(
                    onTap: () {
                      _onDisagree(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.close,
                        size: 24,
                        color: R.color.thirdTextColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: R.img(Assets.settings$img_bind_safe_mobile_webp,
                width: 180,
                height: 144,
                package: ComponentManager.MANAGER_SETTINGS),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 27.0),
            child: Text(
              K.setting_safe_phone_useful,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14.0, color: R.color.secondTextColor),
            ),
          ),
          widget.fastBind ? _renderFastBind() : _renderPhoneBind()
        ],
      ),
    );
  }

  /// 点击不同意
  _onDisagree(context) {
    Navigator.pop(context);
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
      Log.d("error mobile");
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

  void _sendVerifyCode() async {
    if (!_checkMobile()) {
      return;
    }

    _controller.show(
        context: System.context, message: K.setting_reciveing_vcode);

    bool success = false;
    //发送验证码
    String url = "${System.domain}account/sendVerifyCode";
    Map<String, String> post = {'mobile': _mobile, 'area': _areaCode};
    post['type'] = _type;

    String token;
    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      await Future.delayed(const Duration(milliseconds: 500));
      Map res = response.response as Map;
      token = res['data'];

      if (res['success'] == true) {
        success = true;
      }
      _token = Uri.encodeComponent(token);
    } catch (e) {
      _controller.close();
      Fluttertoast.showToast(
          msg: "${K.setting_server_return}0：$e", gravity: ToastGravity.CENTER);
      return;
    }
    _controller.close();
    Tracker.instance.track(TrackEvent.getVerificationCode,
        properties: {'is_again': _isAgain, 'is_success': success});
    _isAgain = true;
  }

  //绑定操作
  void _bindSafeMobile(context) async {
    Log.d("onsave");

    if (!_checkMobile()) {
      return;
    }
    if (!_checkCode()) {
      return;
    }

    _controller.show(
        context: System.context, message: K.setting_binding_safe_phone);

    //获取设备token，用于小号切换
    String dtoken = Session.getString('dtoken', '');

    String url = "${System.domain}account/login?v=1";
    Map<String, String> post = {
      'mobile': _mobile,
      'area': _areaCode,
      'type': _type,
      'code': _code,
      'token': _token,
      'dtoken': dtoken
    };
    XhrResponse response = await Xhr.postJson(url, post);

    _controller.close();

    if (response.error != null) {
      Fluttertoast.toastException(
          exp: response.error, gravity: ToastGravity.CENTER);
      return;
    }

    Map res = response.response as Map;
    if (res['success'] == false) {
      Fluttertoast.showToast(
          msg: res['msg'] ?? '', gravity: ToastGravity.CENTER);
      return;
    }

    //记录用户信息
    await Session.setValues(res['data']);

    //绑定成功，1.关闭绑定弹框 2.显示成功弹框
    if (_type == 'safe_bind') {
      _onDisagree(System.context);
      BindSafeMobileSuccessDialog.showBindSafeDialog();
    }
  }

  void _selectPhoneAreaCode() async {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    String? code = await loginManager.selectPhoneAreaCode(context);
    if (code != null && code != _areaCode) {
      setState(() {
        _areaCode = code;
      });
    }
  }

  _onBind() async {
//    _controller.show(context: System.context, barrierDismissible: true);
    OneKeyLoginResult? result = await OneKeyLogin.getLoginToken(
        uiConfig: OneKeyLoginUiConfig.auto(),
        oneKeyLoginListener: (result) {
          if (result.success) {
            // 获取登录授权码成功
            _oneKeyBind(result.token);
            Tracker.instance.track(TrackEvent.safePopupBinded);
          } else if (result.shouldSwitch) {
            // 用户切换登录方式
            Navigator.of(context).pop();
            BindScreen.show(System.context, type: 'safe_bind');
          } else if (result.cancel) {
            // 用户取消
          } else {
//            Toast.show(context, result.getMessage());
            BindScreen.show(context, type: 'safe_bind');
          }
        });

    if (!(result?.success ?? false)) {
      BindScreen.show(context, type: 'safe_bind');
    }
//    _controller.close();
  }

  /// 使用token一键绑定
  _oneKeyBind(String? token) async {
    _controller.show(context: System.context);
    OneKeyLoginBean bean =
        await OneKeyLogin.verifyToken(token: token, type: 'safe_bind');
    _controller.close();
    if (!(bean.success == true)) {
      Toast.show(context, bean.msg ?? BaseK.K.base_bind_failed);
      return;
    }

    await Session.setValues(bean.data);
    Fluttertoast.showToast(msg: BaseK.K.common_bind_succ);
    Navigator.of(context).pop();
  }

  ///一键绑定
  Widget _renderFastBind() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 24, bottom: 6, left: 27, right: 27),
          child: GestureDetector(
            onTap: () => _onBind(),
            child: Container(
              alignment: AlignmentDirectional.center,
              height: 48,
              width: 264,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: R.color.mainBrandColor,
              ),
              child: Text(
                K.setting_selfphone_bind,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _onDisagree(context),
          child: Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 16),
            child: Text(
              K.setting_later_see,
              style: R.textStyle.caption,
            ),
          ),
        ),
      ],
    );
  }

  ///输入手机号绑定
  Widget _renderPhoneBind() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            height: 45.0,
            margin: const EdgeInsets.only(top: 16.0, left: 20.0, right: 20.0),
            padding: const EdgeInsets.only(left: 20.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              color: R.color.dividerColor,
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
                      counterText: '',
                      hintText: K.setting_please_input_phone,
                      contentPadding:
                          const EdgeInsets.only(bottom: 12.0, top: 13.0),
                      isDense: false,
                      filled: false,
                      errorMaxLines: 1,
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.phone,
                    autocorrect: false,
                    maxLength: 11,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onSubmitted: _onEndTypedPhone,
                  ),
                )
              ],
            )),
        Container(
          height: 45.0,
          margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          padding: const EdgeInsets.only(left: 20.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            color: R.color.dividerColor,
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
                      counterText: '',
                      hintText: K.setting_please_input_vcode,
//                        icon: Container(width: 60.0, child: Text('发送验证码')),
                      contentPadding:
                          const EdgeInsets.only(bottom: 12.0, top: 13.0),
                      isDense: false,
                      filled: false,
                      errorMaxLines: 1,
                      border: InputBorder.none),
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  maxLength: 4,
//                      autofocus: _phase == BindPhase.verify,
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
                title: K.setting_send_vcode,
                state: _sendingCode
                    ? TextButtonState.disable
                    : TextButtonState.normal,
                onPressed: _sendVerifyCode,
              )
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 23, right: 22, bottom: 24, top: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => _onDisagree(context),
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 40,
                    decoration: BoxDecoration(
                      color: R.color.dividerColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      K.setting_later_see,
                      style: TextStyle(
                        color: R.color.mainTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 40,
                  child: GestureDetector(
                    onTap: () => _bindSafeMobile(context),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: R.color.mainBrandColor,
                      ),
                      child: Text(
                        K.setting_bind_now,
                        style: const TextStyle(
                          color: Colors.white,
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
      ],
    );
  }
}

enum BindPhase { verify, change }
