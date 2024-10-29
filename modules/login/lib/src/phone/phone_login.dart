import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/src/phone/phone_code.dart';
import 'package:login/src/phone/phone_login_verify.dart';

import '../../k.dart';

/// 手机号登录--先输入手机号再跳转页面输入验证码
class PhoneLogin extends StatefulWidget {
  final String? title;
  final String? type;
  final String? path;

  const PhoneLogin({Key? key, this.title, this.type, this.path})
      : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  String? _title;
  String _areaCode = '86';

  final TextEditingController _textController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _areaCode = Config.get('area_code', '86');
    _title = widget.title ?? '';
    if (Util.isLocale) {
      ///获取当前ip所在的国家
      _getAreaCode();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _onNext() async {
    String mobile = _textController.text.trim();
    if (!Utility.isMobile(mobile, areaCode: _areaCode)) {
      Fluttertoast.showToast(
          msg: K.wrong_phone_num, gravity: ToastGravity.CENTER);
      return;
    }

    var result = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return PhoneLoginVerify(
          mobile: mobile,
          areaCode: _areaCode,
          type: widget.type,
          path: widget.path,
        );
      },
      settings: const RouteSettings(name: '/loginVerify'),
    ));

    if (result is String && result.toString() == 'loginSuccess') {
      Navigator.of(context).pop(true);
    }
  }

  _onClear() {
    _textController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(_title),
      backgroundColor: R.color.mainBgColor,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 67),
              child: Text(
                K.please_input_phone_num,
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 295,
              height: 54,
              padding: const EdgeInsets.only(left: 18, right: 20),
              decoration: BoxDecoration(
                color: R.color.dividerColor,
                borderRadius: BorderRadius.circular(27),
              ),
              alignment: AlignmentDirectional.centerStart,
              child: Row(
                children: <Widget>[
                  if (Util.isLocale)
                    GestureDetector(
                      onTap: () async {
                        String? code = await PhoneAreaCode.show(context);
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
                      controller: _textController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: K.input_phone_num,
                        hintStyle: TextStyle(
                          color: R.color.secondTextColor,
                          fontSize: 16,
                        ),
                        counterText: '',
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        fontSize: 16,
                        color: R.color.secondTextColor,
                      ),
                      autofocus: true,
                      autocorrect: false,
                      maxLines: 1,
                      maxLength: 11,
                    ),
                  ),
                  GestureDetector(
                    onTap: _onClear,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.clear,
                        color: R.color.secondTextColor,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _onNext,
              child: Container(
                width: 295,
                height: 48,
                margin: const EdgeInsets.only(top: 72),
                decoration: BoxDecoration(
                  color: R.color.mainBrandColor,
                  borderRadius: BorderRadius.circular(27),
                ),
                alignment: Alignment.center,
                child: Text(
                  K.next_step,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getAreaCode() async {
    String url = "${System.domain}account/getAreaCode";
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      if (!mounted) return;
      Map res = response.response as Map;
      if (res['success'] == true && res['data'] != null) {
        _areaCode = res['data']['code'] ?? '86';
        setState(() {});
        Config.set('arae_code', _areaCode);
      }
    } catch (e) {
      return;
    }
  }
}
