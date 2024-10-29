import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/page/face_recognition/face_recognition_dialog.dart';
import 'package:settings/src/page/face_recognition/face_recognition_secondary_dialog.dart';
import 'package:settings/src/page/id_auth.dart';

import '../../../k.dart';

// 防止卖号：
// 1.换设备登录,V8以上，有实人认证信息，强制弹实人认证，认证之后才能使用
// 2.换账号充值,V8以上，有实人认证信息，强制弹实人认证，认证之后才能使用
// 3.V8以上等级升级未做实人认证，提示做认证
class AccountSecurity {
  static void checkSecurityDelay() async {
    Log.d('checkSecurityDelay');
    Future.delayed(const Duration(seconds: 3), () {
      checkSecurity();
    });
  }

  // 防止进App check失败，首页数据取到之后再次check
  static bool checkFailed = false;

  // 每次应用启动、登录，查询是否需要弹实人认证
  static void checkSecurity() async {
    checkFailed = false;
    if (!Session.isLogined || Util.isLocale || Constant.debugPassAll) {
      // 未登录和海外版本不检测
      return;
    }

    try {
      String url = '${System.domain}certify/checkIdcard?version=1';
      XhrResponse response = await Xhr.postJson(
        url,
        {},
        throwOnError: true,
        tryNum: 3,
      );

      Map res = response.value();

      Log.d('checkSecurity, res: $res');

      if (res['success'] == true && res['data'] != null) {
        if (res['data']['device'] == true) {
          // 换设备需要强制做实人认证
          Fluttertoast.showToast(msg: K.settings_security_login_toast);
          IdAuth.show(System.context,
              certifyType: CertifyType.security, securityType: 'device');
        } else if (res['data']['account'] == true) {
          // 充值账号切换需要强制做实人认证
          Fluttertoast.showToast(msg: K.settings_security_account_toast);
          IdAuth.show(System.context,
              certifyType: CertifyType.security, securityType: 'account');
        } else if (res['data']['grade'] == true) {
          // 升级了，未做实人认证，dialog提示
          showAuthDialog();
        } else if (res['data']['reauth'] == true) {
          // 收集陪陪/主播实人照片，重新实人认证
          Fluttertoast.showToast(msg: K.settings_security_account_toast);
          IdAuth.show(System.context,
              certifyType: CertifyType.security,
              securityType: 'account',
              canSkip: true);
        } else if (res['data']['risk'] == true) {
          // 风控可疑用户扫脸
          Fluttertoast.showToast(msg: K.settings_security_account_toast);
          IdAuth.show(System.context,
              certifyType: CertifyType.security, securityType: 'account');
        } else if (res['data']['broker'] == true) {
          // 主播唯一校验（仅针对快乐星球）:人脸识别弹框
          showFaceRecognitionDialog();
        }
      } else {
        checkFailed = true;
      }
    } catch (e) {
      Log.d('checkSecurity error: $e');
      checkFailed = true;
    }
  }

  /// 点击人脸识别弹框确认关闭按钮时调用brokersafe/confirmClose接口，无参数
  static void sendBrokerSafeConfirmCloseRequest() async {
    try {
      String url = '${System.domain}brokersafe/confirmClose';
      XhrResponse response = await Xhr.getJson(
        url,
        params: {'uid': Session.uid},
        throwOnError: true,
      );

      Map res = response.value();

      Log.d('sendBrokerSafeConfirmCloseRequest, res: $res');

      if (res['success'] == true) {}
    } catch (e) {
      Log.d('sendBrokerSafeConfirmCloseRequest error: $e');
    }
  }

  static Widget _buildContent(BuildContext context) {
    return Text(K.settings_security_dialog_title,
        style: TextStyle(
          color: R.color.mainTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ));
  }

  static void showAuthDialog() {
    showDialog(
        context: System.context,
        barrierDismissible: false,
        builder: (context) {
          return ConfirmDialog(
            contentBuilder: _buildContent,
            negativeButton: const NegativeButton(),
            positiveButton: PositiveButton(
              text: K.settings_security_dialog_sure,
              onPressed: () async {
                await IdAuth.show(context);
                Navigator.of(context).pop(true);
              },
            ),
          );
        });
  }

  /// 人脸识别弹框 带返回值 上麦检测时调用
  static Future<bool?> showFaceRecognitionDialog2(
      {String firstTip = '',
      String secondTip = '',
      bool canSkip = true}) async {
    return await showDialog(
      context: System.context,
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: 'FaceRecognitionFirst'),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false, // 禁止Android物理返回键
          child: FaceRecognitionDialog(
            tip: firstTip,
            canSkip: canSkip,
            onConfirmCallback: () async {
              // 点击"立即识别"按钮，去进行人脸识别认证
              ILoginManager loginManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_LOGIN);
              bool result = await loginManager.openVerifyPage(context, 2,
                  certifyType: 'broker',
                  secondTip: secondTip,
                  canSkip: canSkip);
              if (result == true) {
                Navigator.of(context).pop(true);
              }
            },
            onCancelCallback: () {
              // 点击"暂不"按钮，则进行人脸识别二次弹框确认
              Navigator.of(context).pop(false);
            },
          ),
        );
      },
    );
  }

  /// 人脸识别弹框 不带返回值
  static void showFaceRecognitionDialog(
      {String firstTip = '',
      String secondTip = '',
      bool canSkip = true,
      bool auto = false}) {
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    int index = mainManager.appNavigatorObserverGetIndex("FaceRecognition");
    if (index > -1) {
      /// 栈中已存在此dialog
      Log.d('AccountSecurity Dialog [has show]');
      return;
    }
    showDialog(
      context: System.context,
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: 'FaceRecognitionFirst'),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false, // 禁止Android物理返回键
          child: FaceRecognitionDialog(
            tip: firstTip,
            canSkip: canSkip,
            onConfirmCallback: () {
              // 点击"立即识别"按钮，去进行人脸识别认证
              Navigator.of(context).pop();
              ILoginManager loginManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_LOGIN);
              loginManager.openVerifyPage(context, 2,
                  certifyType: 'broker',
                  secondTip: secondTip,
                  canSkip: canSkip,
                  auto: auto);
            },
            onCancelCallback: () {
              // 点击"暂不"按钮，则进行人脸识别二次弹框确认
              Navigator.of(context).pop();
              // 进行人脸识别二次弹框确认
              showFaceRecognitionSecondaryDialog(
                  firstTip: firstTip, secondTip: secondTip, canSkip: canSkip);
            },
          ),
        );
      },
    );
  }

  /// 人脸识别的二次弹框
  static void showFaceRecognitionSecondaryDialog(
      {String firstTip = '', String secondTip = '', bool canSkip = true}) {
    showDialog(
      context: System.context,
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: 'FaceRecognitionSecond'),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false, // 禁止Android物理返回键
          child: FaceRecognitionSecondaryDialog(
            tip: secondTip,
            onConfirmCloseCallback: () {
              Navigator.of(context).pop();
              // 点击"确认关闭"则调用brokersafe/confirmClose，无参数
              sendBrokerSafeConfirmCloseRequest();
            },
            onCancelCallback: () {
              Navigator.of(context).pop();
              // 点击"取消"按钮时，再次弹人脸识别弹框
              showFaceRecognitionDialog(
                  firstTip: firstTip, secondTip: secondTip, canSkip: canSkip);
            },
          ),
        );
      },
    );
  }
}
