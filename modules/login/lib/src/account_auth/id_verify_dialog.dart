import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:login/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

enum IdVerifyType {
  IdOnly,
  FaceVerify,
}

class IdVerifyDialog extends StatefulWidget {
  final String? title;
  final IdVerifyType type;
  final String certifyType;
  final bool auto;

  const IdVerifyDialog(
      {Key? key,
      this.title,
      this.type = IdVerifyType.IdOnly,
      this.certifyType = '',
      this.auto = false})
      : super(key: key);

  @override
  IdVerifyState createState() {
    return IdVerifyState();
  }
}

class IdVerifyState extends State<IdVerifyDialog> {
  String _cardName = '';
  String _cardNum = '';
  String _realCardName = '';
  String _realCardNum = '';

  bool _hasName = false; // 已通过身份证验证(非人脸)

  bool _enableSubmit = false;

  TextEditingController? _nameController;
  TextEditingController? _numController;
  bool autoVerify = false;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _numController = TextEditingController();
    if (widget.type == IdVerifyType.FaceVerify) {
      _load();
    }
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _numController?.dispose();
    super.dispose();
  }

  /// 查询服务端认证状态
  _load() async {
    try {
      String url = "${System.domain}account/idcard?ver=3&real=1";
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      Map res = response.value();

      if (res['success'] == true) {
        Map data = res['data'];
        _cardName = Util.notNullStr(data['cardname']);
        _cardNum = Util.notNullStr(data['cardnum']);
        _realCardName = Util.notNullStr(data['realcardname']);
        _realCardNum = Util.notNullStr(data['realcardnum']);

        if ((_realCardName.isNotEmpty)) {
          _enableSubmit = true;
          _hasName = true;
        }
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
      if (!mounted) return;
      setState(() {});
      autoVerify = _enableSubmit && _hasName && widget.auto == true;
      // 延迟初始化
      Future.delayed(Duration(milliseconds: autoVerify ? 50 : 1000), () async {
        await AliCertify.init();
        if (autoVerify) {
          _onSubmit();
        }
      });
    } catch (e) {
      Log.d(e.toString());
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      if (!mounted) return;
      setState(() {});
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
          _buildButton(),
          _buildAuthProtocol(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  /// 同意实名认证服务协议
  bool hasAgreeProtocol = false;

  Widget _buildAuthProtocol() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildProtocolCheckBox(),
        _buildProtocolText(),
      ],
    );
  }

  Widget _buildProtocolCheckBox() {
    return GestureDetector(
      onTap: () {
        refresh(() {
          hasAgreeProtocol = !hasAgreeProtocol;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsetsDirectional.only(
            start: 4, end: 4, top: 12, bottom: 12),
        child: hasAgreeProtocol
            ? const CheckBoxChecked(width: 15, height: 15)
            : CheckBoxUnchecked(
                color: R.color.mainTextColor.withOpacity(0.2),
                width: 15,
                height: 15),
      ),
    );
  }

  Widget _buildProtocolText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '《${K.login_auth_protocol_text}》',
            style: TextStyle(fontSize: 13, color: R.color.mainBrandColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () => BaseWebviewScreen.show(context,
                  url: Util.getHelpUrlWithQStr('k158'),
                  title: K.login_auth_protocol_text),
          ),
        ],
        text: K.login_agree_user_license,
        style: TextStyle(
            fontSize: 13,
            fontFamily: Util.fontFamily,
            color: R.color.secondTextColor),
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
    if (widget.type == IdVerifyType.IdOnly || !_hasName) {
      return _buildNormal();
    } else {
      return _buildHasName();
    }
  }

  Widget _buildNormal() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 56,
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: R.color.dividerColor,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 30),
                child: Text(
                  R.string('setting_real_name'),
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: R.string('setting_input_real_name'),
                    counterText: '',
                  ),
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                  textAlign: TextAlign.end,
                  autofocus: false,
                  autocorrect: false,
                  maxLines: 1,
                  maxLength: 20,
                  onChanged: _onChanged,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 56,
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: R.color.dividerColor,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 30),
                child: Text(
                  R.string('setting_user_id_num'),
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _numController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: R.string('setting_input_idnum'),
                    counterText: '',
                  ),
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                  textAlign: TextAlign.end,
                  autofocus: false,
                  autocorrect: false,
                  maxLines: 1,
                  maxLength: 18,
                  onChanged: _onChanged,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHasName() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 56,
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: R.color.dividerColor,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 30),
                child: Text(
                  R.string('setting_real_name'),
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  _cardName,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 56,
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: R.color.dividerColor,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 30),
                child: Text(
                  R.string('setting_user_id_num'),
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  _cardNum,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.secondTextColor,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onChanged(String value) {
    _realCardName = _nameController?.value.text ?? '';
    _realCardNum = _numController?.value.text ?? '';
    if (_realCardName.length < 2 || _realCardName.length > 20) {
      _enableSubmit = false;
    } else if (_realCardNum.length != 18) {
      _enableSubmit = false;
    } else {
      _enableSubmit = true;
    }
    setState(() {});
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 20, bottom: 8),
      child: GestureDetector(
        onTap: _enableSubmit ? _onSubmit : _infoIncomplete,
        child: Container(
          height: 48.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: R.color.mainBrandGradientColors,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            widget.type == IdVerifyType.IdOnly
                ? K.login_id_verify_button
                : K.login_face_verify_button,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  _infoIncomplete() {
    Fluttertoast.showToast(
        msg: R.string('settings_info_incomplete'),
        gravity: ToastGravity.CENTER);
  }

  int lastClickTime = 0;
  void _onSubmit() async {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - lastClickTime < 3000) {
      // 防止跳转认证页面前频繁点击
      Log.d('_submit ignore, after last click time: ${now - lastClickTime}');
      return;
    }
    lastClickTime = now;

    if (!hasAgreeProtocol && !autoVerify) {
      Fluttertoast.showCenter(msg: K.login_auth_protocol_toast);
      return;
    }

    FocusScope.of(context).requestFocus(FocusNode());

    if (widget.type == IdVerifyType.IdOnly) {
      // 仅验证身份信息
      try {
        String url = "${System.domain}certify/idcardVerify?uid=${Session.uid}";
        XhrResponse response = await Xhr.postJson(
            url,
            {
              'cardname': _realCardName,
              'cardnum': _realCardNum,
            },
            throwOnError: false);
        Map res = response.value();

        if (res['success'] == true) {
          Fluttertoast.showToast(
              msg: K.login_id_verify_suc, gravity: ToastGravity.CENTER);
          await Session.sync({'auth': true, 'young_mode': true});
          Navigator.of(context).pop(true);
          Tracker.instance.track(TrackEvent.identity_finish, properties: {
            'refer': '2',
          });
        } else {
          if (res['msg'] != null && res['msg'] is String) {
            Fluttertoast.showToast(
                msg: res['msg'], gravity: ToastGravity.CENTER);
          }
        }
      } catch (e) {
        Log.d(e.toString());
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      }
    } else {
      if (!autoVerify) {
        bool? agree = await FaceLiveLicenseDialog.show(context);
        if (agree != true) {
          Log.w('agree: $agree, do nothing');
          return;
        }
      }

      String? verifyToken;
      try {
        String name = _realCardName;
        String num = _realCardNum;

        String? metaInfo = await AliCertify.getMetaInfos();

        // 获取本次实人认证的token
        XhrResponse response = await Xhr.postJson(
            "${System.domain}account/idsetV3",
            {
              'cardname': name,
              'cardnum': num,
              'platform': 'alicloud',
              'type': widget.certifyType,
              'metainfo': metaInfo ?? '',
            },
            throwOnError: true);
        Map data = response.value();
        if (data['success'] == true) {
          verifyToken = data['data']['certifyid'];
        } else {
          Fluttertoast.showToast(
              msg: data['msg'] ?? R.string('setting_auth_failed'),
              gravity: ToastGravity.CENTER);
        }
      } catch (e) {
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      }

      if (!mounted) {
        return;
      }

      if (verifyToken != null && verifyToken.isNotEmpty) {
        // 开始实人认证
        bool verify = await AliCertify.verify(verifyToken);
        if (!mounted) {
          return;
        }
        if (verify) {
          // 查询实人认证结果
          _queryState(verifyToken);
        } else {
          _sendBrokerSafeReportFailRequest(0);
        }
      } else {
        Log.d('AliCertify _vertifyToken is empty,can not certify');
      }
    }
  }

  /// 快乐星球服务端查询人脸认证结果
  void _queryState(String certifyId) async {
    try {
      String queryInterface = 'certify/queryV3?certify_id=$certifyId';
      XhrResponse response = await Xhr.getJson(
          "${System.domain}$queryInterface",
          params: {'type': widget.certifyType},
          throwOnError: false);
      Map res = response.value();

      if (res['success'] == true) {
        Fluttertoast.showToast(
            msg: K.login_id_verify_suc, gravity: ToastGravity.CENTER);
        await Session.sync({'auth': true, 'young_mode': true});
        Navigator.of(context).pop(true);
        Tracker.instance.track(TrackEvent.identity_finish, properties: {
          'refer': '3',
        });
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Log.d(e.toString());
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  /// 扫脸识别超时或者失败调用时调用brokersafe/reportFail POST 接口 参数 state 整形 0 失败 1超时
  static void _sendBrokerSafeReportFailRequest(int state) async {
    try {
      String url = '${System.domain}brokersafe/reportFail';
      XhrResponse response = await Xhr.postJson(
        url,
        {'state': state.toString()},
        throwOnError: true,
      );

      Map res = response.value();

      Log.d('sendBrokerSafeReportFailRequest, res: $res');

      if (res['success'] == true) {}
    } catch (e) {
      Log.d('sendBrokerSafeReportFailRequest error: $e');
    }
  }
}
