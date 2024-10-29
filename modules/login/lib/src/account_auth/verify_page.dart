import 'package:login/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:login/src/account_auth/id_verify_dialog.dart';

import '../../login.dart';
import 'phone_verify_dialog.dart';

class VerifyPage extends StatefulWidget {
  /// 认证类型：
  /// 1.本机-不能预取号走人脸
  // 2.人脸
  // 3.本机或短信
  // 4.身份证
  // 5.（本机或短信）+身份证
  // 6.本机+身份证
  final int type;
  final String certifyType;
  final String secondTip;
  final bool canSkip;
  final bool auto;

  const VerifyPage(
      {Key? key,
      this.type = 1,
      this.certifyType = '',
      this.secondTip = '',
      this.canSkip = true,
      this.auto = false})
      : super(key: key);

  @override
  VerifyPageState createState() {
    return VerifyPageState();
  }

  static Future<bool?> show(
      {BuildContext? context,
      int type = 1,
      String certifyType = '',
      String secondTip = '',
      bool canSkip = true,
      bool auto = false}) {
    return Navigator.of(context ?? System.context).push(MaterialPageRoute(
      builder: (context) => VerifyPage(
        type: type,
        certifyType: certifyType,
        secondTip: secondTip,
        canSkip: canSkip,
        auto: auto,
      ),
      settings: const RouteSettings(name: '/VerifyPage'),
    ));
  }
}

class VerifyPageState extends State<VerifyPage> {
  int type = 1;

  @override
  void initState() {
    super.initState();
    type = widget.type;
    if (type == 1) {
      // 判断是否可以一键登陆，不能就用刷脸认证
      _preLogin();
    }
  }

  // 预取号码
  void _preLogin() async {
    bool canPhoneAuth = await OneKeyLogin.checkEnvAvailable();
    if (canPhoneAuth == true) {
    } else {
      changeFaceVerify();
    }
  }

  void changeFaceVerify() {
    if (mounted) {
      setState(() {
        type = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        K.login_verify_page_title,
        showBack: widget.canSkip,
        onBackPressedCallback: () {
          if (widget.certifyType == 'broker') {
            ISettingManager settingManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_SETTINGS);
            settingManager.openFaceRecognitionSecondaryDialog(context,
                secondTip: widget.secondTip, onConfirmCloseCallback: () {
              if (mounted) {
                Navigator.of(context).pop(true);
              }
            });
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      body: widget.certifyType == 'broker'
          ? WillPopScope(
              onWillPop: () async => false,
              child: _buildSafeArea(),
            )
          : _buildSafeArea(),
    );
  }

  Widget _buildSafeArea() {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildTips(),
          Expanded(
            child: SingleChildScrollView(
              child: _buildBody(),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (type == 1) {
      /// 1.本机-不能预取号走人脸
      return PhoneVerifyDialog(
        type: PhoneVerifyType.OneKeyOnly,
        title: K.login_verify_type_phone,
        onProblem: changeFaceVerify,
      );
    } else if (type == 2) {
      // 2.人脸
      return IdVerifyDialog(
          type: IdVerifyType.FaceVerify,
          title: K.login_verify_type_id,
          certifyType: widget.certifyType,
          auto: widget.auto);
    } else if (type == 3) {
      // 3.本机或短信
      return PhoneVerifyDialog(
        type: PhoneVerifyType.OneKeyAndCode,
        title: K.login_verify_type_phone,
      );
    } else if (type == 4) {
      // 4.身份证
      return IdVerifyDialog(
          type: IdVerifyType.FaceVerify, title: K.login_verify_type_id);
    } else if (type == 5) {
      // 5.（本机或短信）+身份证
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhoneVerifyDialog(
            type: PhoneVerifyType.OneKeyAndCode,
            title: K.login_verify_type_phone,
          ),
          IdVerifyDialog(
              type: IdVerifyType.FaceVerify, title: K.login_verify_type_id),
        ],
      );
    } else if (type == 6) {
      // 6.本机+身份证
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhoneVerifyDialog(
            type: PhoneVerifyType.OneKeyOnly,
            title: K.login_verify_type_phone,
          ),
          IdVerifyDialog(
              type: IdVerifyType.FaceVerify, title: K.login_verify_type_id),
        ],
      );
    }

    return IdVerifyDialog(
        type: IdVerifyType.FaceVerify, title: K.login_verify_type_id);
  }

  Widget _buildTips() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
      padding:
          const EdgeInsetsDirectional.only(start: 5, end: 5, top: 5, bottom: 5),
      child: Text(
        K.login_verify_tips,
        style: TextStyle(
          fontSize: 13,
          color: R.color.thirdBrightColor,
        ),
      ),
    );
  }
}
