import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings/k.dart';
import 'package:login/k.dart' as LoginK;
import 'package:settings/src/page/id_auth_unbind_success_page.dart';

import '../../assets.dart';

/// 身份认证，阿里云实人认证
///
/// 步骤：
/// 1.查询当前的认证信息（_load）
/// 2.填写身份信息（或者服务端下发的已认证信息），进行实人认证（_submit）
/// 3.查询实人认证结果（_queryState）
class IdAuth extends StatefulWidget {
  /// 实人认证用途：
  /// null       : 给账号做实人认证
  /// find       : 找回安全手机号及账号
  /// god        : 主播认证
  /// modify     : 修改手机号或者安全手机号
  /// security   : 防止卖号，有风险账号强制实人认证
  /// youngmode  : 青少年模式申诉重置密码
  /// check      : 仅验证实人(不管是否已认证都再认证一次，返回认证结果)
  /// IdOnly    : 仅认证"身份证号码和姓名"
  /// unbind     :解除实人认证
  final CertifyType? certifyType;
  final bool godCertifySupportSkill; //主播认证是否支持技能

  // 修改手机号type：修改手机号（bind）、修改安全手机号（safe_bind）
  final String? bindType;

  // 风险类型：换设备登录（device）、换充值账号(account)
  final String? securityType;
  final bool canSkip; // 收集陪陪/主播实人照片，允许跳过认证（非强制）

  const IdAuth(
      {Key? key,
      this.certifyType,
      this.bindType,
      this.securityType,
      this.canSkip = false,
      this.godCertifySupportSkill = true})
      : super(key: key);

  @override
  _IdAuthState createState() {
    return _IdAuthState();
  }

  static Future show(BuildContext context,
      {CertifyType? certifyType,
      String? bindType,
      String? securityType,
      bool canSkip = false,
      bool godCertifySupportSkill = true}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => IdAuth(
          certifyType: certifyType,
          bindType: bindType,
          securityType: securityType,
          canSkip: canSkip,
          godCertifySupportSkill: godCertifySupportSkill,
        ),
        settings: const RouteSettings(name: '/idCard'),
      ),
    );
  }
}

class _IdAuthState extends State<IdAuth> with WidgetsBindingObserver {
  bool _loading = true;
  XhrError? _error;
  int _state = 0;
  String _cardname = '';
  String _cardnum = '';
  String _verifyId = '';
  String _realCardname = '';
  String _realCardnum = '';
  bool _hasName = false; // 已通过身份证验证(非人脸)
  bool _openUnbind = false; //是否开放取消实人认证权限

  TextEditingController? _nameController;
  TextEditingController? _numController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _nameController = TextEditingController();
    _numController = TextEditingController();
    if (CertifyType.find == widget.certifyType ||
        CertifyType.modify == widget.certifyType) {
      _loading = false;
      // 找回安全手机号/修改安全手机号（不做身份认证信息查询），页面打开立即初始化实人认证
      Future.delayed(
          const Duration(milliseconds: 1000), () => AliCertify.init());
    } else {
      _load();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _nameController?.dispose();
    _numController?.dispose();
    super.dispose();
  }

  /// 查询服务端认证状态
  _load() async {
    try {
      String url =
          "${System.domain}account/idcard?ver=3&real=1"; // 新增了仅验证身份证信息的认证，所有的刷脸认证都要带real参数获取真实姓名

      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      Map res = response.value();
      _loading = false;

      if (res['success'] == true) {
        Map? data = res['data'];
        _cardname = data?['cardname'] ?? '';
        _cardnum = data?['cardnum'] ?? '';
        _realCardname = data?['realcardname'] ?? '';
        _realCardnum = data?['realcardnum'] ?? '';
        _state = Util.parseInt(data?['state']);
        _openUnbind = Util.parseBool(data?['open_unbind']);
        if (_state <= 2 && _realCardname.isNotEmpty) {
          // 通过身份证验证（未人脸），显示下名字
          _hasName = true;
          _enableSubmit = true;
        }
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
      if (!mounted) return;
      setState(() {});

      if (_state <= 2 ||
          widget.certifyType == CertifyType.security ||
          widget.certifyType == CertifyType.youngmode ||
          widget.certifyType == CertifyType.check ||
          widget.certifyType == CertifyType.unbind) {
        // 未认证或者强制做实人认证才初始化认证SDK
        Log.d('_IdAuthState _load end, AliCertify init');
        Future.delayed(
            const Duration(milliseconds: 1000), () => AliCertify.init());
      }
    } catch (e) {
      Log.d(e.toString());
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      if (!mounted) return;
      setState(() {
        _loading = false;
      });
    }
  }

  bool _enableSubmit = false;

  int lastClickTime = 0;

  // 调用阿里云实人认证（SDK）
  _submit() async {
    int now = DateTime.now().millisecondsSinceEpoch;

    if (now - lastClickTime < 3000) {
      // 防止跳转认证页面前频繁点击
      Log.d('_submit ignore, after last click time: ${now - lastClickTime}');
      return;
    }
    lastClickTime = now;

    if (!hasAgreeProtocol) {
      Fluttertoast.showCenter(msg: LoginK.K.login_auth_protocol_toast);
      return;
    }

    FocusScope.of(context).requestFocus(FocusNode());

    if (CertifyType.IdOnly != widget.certifyType) {
      bool? agree = await FaceLiveLicenseDialog.show(context);

      if (agree != true) {
        Log.d('agree: $agree, do nothing');
        return;
      }

      String? type;
      String name = _realCardname;
      String num = _realCardnum;
      if (CertifyType.find == widget.certifyType) {
        type = 'find';
      } else if (CertifyType.modify == widget.certifyType &&
          widget.bindType != null) {
        type = widget.bindType;
      } else if (CertifyType.security == widget.certifyType) {
        type = 'security';
      } else if (CertifyType.youngmode == widget.certifyType) {
        type = 'youngmode';
      } else if (CertifyType.check == widget.certifyType) {
        type = 'check';
      } else if (CertifyType.unbind == widget.certifyType) {
        type = 'unbind_idcard';
      }
      String? verifyToken;
      try {
        String? metaInfo = await AliCertify.getMetaInfos();

        // 获取本次实人认证的token
        XhrResponse response = await Xhr.postJson(
            "${System.domain}account/idsetV3",
            {
              'cardname': name,
              'cardnum': num,
              if (type != null && type.isNotEmpty) 'type': type,
              'platform': 'alicloud',
              'metainfo': metaInfo ?? '',
            },
            throwOnError: true);
        Map data = response.value();
        if (data['success'] == true) {
          verifyToken = data['data']['certifyid'];
          _verifyId = Util.notNullStr(data['data']['uniqid']);
        }
      } catch (e) {
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
        return;
      }

      if (!mounted) {
        return;
      }
      if (verifyToken == null || verifyToken.isEmpty) {
        return;
      }

      bool verify = await AliCertify.verify(verifyToken);
      if (!mounted) {
        return;
      }

      if (verify) {
        setState(() {
          _loading = true;
        });
        // 查询实人认证结果
        _queryState(verifyToken);
      }
    } else {
      // 仅验证身份信息
      try {
        String url = "${System.domain}certify/idcardVerify?uid=${Session.uid}";
        XhrResponse response = await Xhr.postJson(
            url,
            {
              'cardname': _realCardname,
              'cardnum': _realCardnum,
            },
            throwOnError: false);
        Map res = response.value();

        if (res['success'] == true) {
          Fluttertoast.showToast(
              msg: K.setting_user_auth_success, gravity: ToastGravity.CENTER);
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
    }
  }

  /// 从快乐星球服务端查询认证是否成功
  _queryState(String certifyId) async {
    if (CertifyType.find == widget.certifyType) {
      // 未登录情况下，查实人认证下的安全手机号
      _queryStateFindSafeMobile(certifyId);
    } else {
      // 登录情况下，查询认证结果
      _queryStateNormal(certifyId);
    }
  }

  // 查询找回安全手机号
  _queryStateFindSafeMobile(String certifyId) async {
    Map? data;
    bool success = false;
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}certify/findQueryV2",
          {
            'uniqid': _verifyId,
            'cardname': _realCardname,
            'cardnum': _realCardnum,
            'platform': 'alicloud',
            'certify_id': certifyId,
          },
          throwOnError: false);
      Map res = response.value();
      if (res['success'] == true) {
        data = res['data'];
        data?['uniqid'] = _verifyId;
        success = true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }

    _loading = false;
    if (success) {
      Navigator.of(context).pop(data);
    } else {
      if (mounted) setState(() {});
    }
  }

  /// 快乐星球服务端查询阿里云认证结果
  _queryStateNormal(String certifyId) async {
    try {
      String queryInterface = 'certify/queryV3?certify_id=$certifyId';
      if (CertifyType.modify == widget.certifyType && widget.bindType != null) {
        queryInterface = '$queryInterface&type=${widget.bindType}';
      } else if (CertifyType.security == widget.certifyType) {
        queryInterface = '$queryInterface&type=security';
      } else if (CertifyType.youngmode == widget.certifyType) {
        queryInterface = '$queryInterface&type=youngmode';
      } else if (CertifyType.check == widget.certifyType) {
        queryInterface = '$queryInterface&type=check';
      } else if (CertifyType.unbind == widget.certifyType) {
        queryInterface = '$queryInterface&type=unbind_idcard';
      }
      Log.d("===>>>>${System.domain}$queryInterface");
      XhrResponse response = await Xhr.getJson(
          "${System.domain}$queryInterface",
          throwOnError: false);
      Map res = response.value();
      _loading = false;

      if (res['success'] == true) {
        Map? data = res['data'];
        _cardname = data?['cardname'] ?? '';
        _cardnum = data?['cardnum'] ?? '';
        _state = Util.parseInt(data?['state']);
        await Session.sync({'auth': true, 'young_mode': true});
        Log.d('_queryStateNormal:${CertifyType.modify}');
        if (CertifyType.modify == widget.certifyType) {
          // 修改手机号，返回修改手机号的token到上一级页面
          String? token = data?['token'];
          if (token != null && token.isNotEmpty) {
            Navigator.of(context).pop(data);
          } else {
            Fluttertoast.showToast(
                msg: K.settings_no_token, gravity: ToastGravity.CENTER);
          }
        } else if (CertifyType.security == widget.certifyType) {
          // 防止卖号，认证成功退出认证页面，用户继续使用
          Navigator.of(context).pop();
          Fluttertoast.showToast(
              msg: K.setting_user_auth_success, gravity: ToastGravity.CENTER);
          return;
        } else if (CertifyType.youngmode == widget.certifyType) {
          // 认证成功退出认证页面，用户继续使用
          Navigator.of(context).pop(true);
          Fluttertoast.showToast(
              msg: K.setting_user_auth_success, gravity: ToastGravity.CENTER);
          return;
        } else if (CertifyType.check == widget.certifyType) {
          // 认证成功退出认证页面，用户继续使用
          Navigator.of(context).pop(true);
          Fluttertoast.showToast(
              msg: K.setting_user_auth_success, gravity: ToastGravity.CENTER);
          return;
        } else if (CertifyType.unbind == widget.certifyType) {
          IdAuthUnbindSuccessPage.show(context);
          return;
        }
        if (CertifyType.god == widget.certifyType && _state > 2) {
          // 完成人脸认证上报，其他认证类型（needVerifyNew）在verify_page.dart中处理
          Tracker.instance.track(TrackEvent.identity_finish, properties: {
            'refer': '3',
          });
        }
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
      if (!mounted) return;
      setState(() {});
    } catch (e) {
      Log.d(e.toString());
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      if (!mounted) return;
      setState(() {
        _loading = false;
      });
    }
  }

  _onChanged(String value) {
    _realCardname = _nameController?.value.text ?? '';
    _realCardnum = _numController?.value.text ?? '';
    if (_realCardname.length < 2 || _realCardname.length > 20) {
      _enableSubmit = false;
    } else if (_realCardnum.length != 18) {
      _enableSubmit = false;
    } else {
      _enableSubmit = true;
    }
    setState(() {});
  }

  _infoIncomplete() {
    Fluttertoast.showToast(
        msg: K.settings_info_incomplete, gravity: ToastGravity.CENTER);
  }

  Future<bool> exitApp() async {
    SystemNavigator.pop();
    return false;
  }

  Future<bool> exitIdAuth() async {
    // 返回认证状态
    Navigator.of(context).pop(_state > 2);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (CertifyType.security == widget.certifyType ||
        CertifyType.youngmode == widget.certifyType ||
        CertifyType.check == widget.certifyType ||
        CertifyType.unbind == widget.certifyType) {
      // 强制做实人认证
      return WillPopScope(
        onWillPop: CertifyType.security == widget.certifyType
            ? exitApp
            : () => Future.value(true),
        child: Scaffold(
          appBar: BaseAppBar(
            CertifyType.unbind == widget.certifyType
                ? K.unbind_user_auth
                : K.setting_user_auth,
            showBack: CertifyType.security == widget.certifyType ? false : true,
          ),
          body: _renderBody(),
          bottomNavigationBar: (_loading == true ||
                  _error != null ||
                  CertifyType.security == widget.certifyType)
              ? null
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildAuthProtocol(),
                    BottomButton.of(
                      margin: const EdgeInsetsDirectional.only(
                          bottom: 12.0, top: 8.0, start: 20.0, end: 20.0),
                      title: K.setting_next_step,
                      onTap: _submit,
                    ),
                  ],
                ),
        ),
      );
    } else {
      return WillPopScope(
        onWillPop: exitIdAuth,
        child: Scaffold(
          appBar: BaseAppBar(
              _state > 2 && CertifyType.god == widget.certifyType
                  ? K.setting_user_auth_result
                  : K.setting_user_auth,
              onBackPressedCallback: exitIdAuth),
          body: _renderBody(),
          bottomNavigationBar:
              (_loading == true || _error != null || _state > 2)
                  ? null
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildAuthProtocol(),
                        BottomButton.of(
                          margin: const EdgeInsetsDirectional.only(
                              bottom: 12.0, top: 8.0, start: 20.0, end: 20.0),
                          title: CertifyType.IdOnly == widget.certifyType
                              ? K.setting_submit
                              : K.setting_next_step,
                          onTap: _enableSubmit ? _submit : _infoIncomplete,
                        ),
                      ],
                    ),
        ),
      );
    }
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
            text: '《${LoginK.K.login_auth_protocol_text}》',
            style: TextStyle(fontSize: 13, color: R.color.mainBrandColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () => BaseWebviewScreen.show(context,
                  url: Util.getHelpUrlWithQStr('k158'),
                  title: LoginK.K.login_auth_protocol_text),
          ),
        ],
        text: LoginK.K.login_agree_user_license,
        style: TextStyle(
            fontSize: 13,
            fontFamily: Util.fontFamily,
            color: R.color.secondTextColor),
      ),
    );
  }

  Widget _renderBody() {
    if (_loading == true || _error != null) {
      return _renderWait();
    }
    if (CertifyType.security == widget.certifyType ||
        CertifyType.youngmode == widget.certifyType ||
        CertifyType.check == widget.certifyType ||
        CertifyType.unbind == widget.certifyType) {
      return _renderAuthContent();
    }
    if (_state > 2) {
      return _renderSuccess();
    }
    return _renderNormal();
  }

  Widget _renderWait() {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_error != null) {
      return ErrorData(
        error: _error.toString(),
        onTap: () {
          setState(() {
            _loading = true;
          });
          _load();
        },
      );
    }

    return Container();
  }

  Widget _renderSuccess() {
    if (CertifyType.god == widget.certifyType) return _renderGodSuccess();

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 28),
          child: R.img(Assets.settings$auth_success_svg,
              width: 72,
              height: 72,
              package: ComponentManager.MANAGER_SETTINGS),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 6),
          child: Text(
            K.setting_user_auth_success,
            style: TextStyle(
              fontSize: 16,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            K.setting_cant_modify_after_auth,
            style: TextStyle(
              fontSize: 14,
              color: R.color.secondTextColor,
            ),
          ),
        ),
        Container(
          height: 64,
          margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
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
                  K.setting_real_name,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  _cardname,
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
          height: 64,
          margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
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
                  K.setting_user_id_num,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  _cardnum,
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
        if (_openUnbind) ...[
          const Spacer(),
          GestureDetector(
            onTap: () {
              IdAuth.show(System.context, certifyType: CertifyType.unbind);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.unbind_user_auth,
                  style: TextStyle(
                    fontSize: 13,
                    color: R.color.mainTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                R.img(Assets.settings$ic_next_svg,
                    color: Colors.black, width: 14, height: 14)
              ],
            ),
          ),
          SizedBox(
            height: Util.bottomMargin,
          ),
        ]
      ],
    );
  }

  Widget _renderGodSuccess() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          R.img(Assets.settings$ic_god_certify_success_webp,
              height: 132,
              fit: BoxFit.fitHeight,
              package: ComponentManager.MANAGER_SETTINGS),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 83),
            child: Text(
              K.setting_user_auth_success, //K.setting_certify_god_success,
              style: R.textStyle.title,
            ),
          ),
          if (widget.godCertifySupportSkill)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                K.setting_certify_god_tip,
                style:
                    R.textStyle.body1.copyWith(color: R.color.secondTextColor),
              ),
            ),
          if (widget.godCertifySupportSkill)
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                ICertificateManager? certificateManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_CERTIFICATE);
                certificateManager?.openCertificateVerifyScreen(context);
              },
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 40,
                decoration: ShapeDecoration(
                  color: R.color.secondBgColor,
                  shape: const StadiumBorder(),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    R.img(Assets.settings$ic_add_skill_svg,
                        width: 16,
                        height: 16,
                        package: ComponentManager.MANAGER_SETTINGS,
                        color: R.color.mainBrandColor),
                    const SizedBox(width: 4),
                    Text(
                      K.setting_certify_god_add_skill,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: R.color.mainBrandColor),
                    )
                  ],
                ),
              ),
            ),
          Container(
            height: Util.height * 0.18,
          )
        ],
      ),
    );
  }

  Widget _renderNormal() {
    String detail = K.setting_auth_user_notice;
    if (CertifyType.modify == widget.certifyType) {
      detail = K.settings_auth_bind_detail;
    }
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            detail,
            style: TextStyle(
              fontSize: 14,
              color: R.color.secondTextColor,
            ),
          ),
        ),
        Container(
          height: 64,
          margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
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
                  K.setting_real_name,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              Expanded(
                child: _hasName
                    ? Text(
                        _cardname,
                        style: TextStyle(
                          fontSize: 16,
                          color: R.color.mainTextColor,
                        ),
                        textAlign: TextAlign.end,
                      )
                    : TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: K.setting_input_real_name,
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
          height: 64,
          margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
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
                  K.setting_user_id_num,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              Expanded(
                child: _hasName
                    ? Text(
                        _cardnum,
                        style: TextStyle(
                          fontSize: 16,
                          color: R.color.secondTextColor,
                        ),
                        textAlign: TextAlign.end,
                      )
                    : TextField(
                        controller: _numController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: K.setting_input_idnum,
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

  // 强制实人认证UI（防止卖号/青少年模式重置密码）
  Widget _renderAuthContent() {
    String detail = K.settings_security_login_detail;
    Color detailColor = R.color.secondTextColor;
    if (widget.certifyType == CertifyType.youngmode) {
      detail = K.settings_idauth_reset_notice;
    } else if ('account' == widget.securityType) {
      detail = K.settings_security_account_detail;
    }
    if (widget.certifyType == CertifyType.unbind) {
      detail = K.unbind_user_auth_des;
      detailColor = const Color(0xff7D2EE6);
    }
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 16, bottom: 26, start: 20, end: 20),
          child: Text(
            detail,
            style: TextStyle(
              fontSize: 16,
              color: detailColor,
            ),
          ),
        ),
        Container(
          height: 64,
          margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
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
                  K.setting_real_name,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              Expanded(
                child: (_cardname.isNotEmpty)
                    ? Text(
                        _cardname,
                        style: TextStyle(
                          fontSize: 16,
                          color: R.color.mainTextColor,
                        ),
                        textAlign: TextAlign.end,
                      )
                    : TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: K.setting_input_real_name,
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
          height: 64,
          margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
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
                  K.setting_user_id_num,
                  style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              Expanded(
                child: (_cardname.isNotEmpty)
                    ? Text(
                        _cardnum,
                        style: TextStyle(
                          fontSize: 16,
                          color: R.color.secondTextColor,
                        ),
                        textAlign: TextAlign.end,
                      )
                    : TextField(
                        controller: _numController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: K.setting_input_idnum,
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
        if (CertifyType.security == widget.certifyType)
          ...buildSecurityBottom(),
      ],
    );
  }

  /// 防止卖号，有风险账号强制实人认证（CertifyType.security），增加退出账号
  /// 收集陪陪/主播实人照片，增加跳过选项
  List<Widget> buildSecurityBottom() {
    List<Widget> res = [];
    res.add(const Spacer());
    res.add(_buildAuthProtocol());
    res.add(BottomButton.of(
      margin: const EdgeInsetsDirectional.only(
          bottom: 12.0, top: 8.0, start: 20.0, end: 20.0),
      title: K.setting_next_step,
      onTap: _submit,
    ));
    res.add(GestureDetector(
      onTap: widget.canSkip ? _onSkip : _onLogout,
      child: Padding(
        padding:
            EdgeInsetsDirectional.only(top: 1, bottom: 14 + Util.iphoneXBottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.canSkip ? K.setting_skip : K.setting_quit_account,
              style: TextStyle(fontSize: 13, color: R.color.thirdTextColor),
            ),
            R.img(
              Assets.settings$ic_next_svg,
              width: 16,
              height: 16,
              color: R.color.mainTextColor.withOpacity(0.2),
              package: ComponentManager.MANAGER_SETTINGS,
            )
          ],
        ),
      ),
    ));
    return res;
  }

  _onSkip() {
    Navigator.of(context).pop();
  }

  _onLogout() {

    if(kDebugMode){
      //TODO 暂时屏蔽实名认证

      Navigator.of(context).pop();
    }else{
      Session.logout();
      if (Util.isLoginBeforeBoot()) {
        eventCenter.emit('System.Need.Login', context);
      } else {
        Navigator.of(context).popUntil(ModalRoute.withName('/'));
      }
    }




  }
}
