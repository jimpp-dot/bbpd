import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/login.dart';
import 'package:flutter_qq/flutter_qq.dart';
import 'package:path_provider/path_provider.dart';

class QQPlatform extends Conn with IThirdPlatform {
  @override
  Widget getIcon(
      {String? imgPath, required double width, required double height}) {
    return R.img(
      imgPath ?? 'qq.svg',
      width: width,
      height: height,
      package: ComponentManager.MANAGER_PLATFORM_QQ,
    );
  }

  @override
  String getName() {
    return "QQ";
  }

  @override
  Future<bool> isInstalled() async {
    bool installed = false;
    try {
      installed = await FlutterQq.isQQInstalled();
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return installed;
  }

  @override
  void onLoginTap(BuildContext context, String? actionType, onSuccess, onError,
      {Map? params}) {
    this.context = context;
    loginType = actionType;
    onPlatformSuccess = onSuccess;
    onPlatformError = onError;
    login();
  }

  @override
  void initialize() async {
    if (Platform.isAndroid) {
      String qqAppId = await SharedAppPlugin.getMetadata('QQ_APPID');
      FlutterQq.registerQQ(qqAppId);
    }
  }

  @override
  Future login() async {
    bool installed = false;
    try {
      installed = await FlutterQq.isQQInstalled();
    } catch (e) {}
    if (!installed) {
      Fluttertoast.showToast(
          msg: R.string('need_install_qq_first'), gravity: ToastGravity.CENTER);
      return;
    }

    try {
      if (Platform.isAndroid) prepareLogin(R.string('qq_is_starting'));
      QQResult result = await FlutterQq.login();

      hasCallback = true;
      String? accessToken;
      String? openid;
      if (result.response is Map) {
        accessToken = result.response!['accessToken'];
        openid = result.response!['openid'];
      }
      if ((accessToken?.isNotEmpty ?? false) && (openid?.isNotEmpty ?? false)) {
        showLoading(R.string('login_vertifying'));
        ReqData reqData = await getReqData();

        String dtoken = Session.getString('dtoken', '');

        int publicIp = await DeviceInfo.getPublicIP(false);
        XhrResponse resp = await Xhr.postJson(
            "${System.domain}account/qqLogin?v=1&t=$accessToken&o=$openid",
            {
              'type': loginType ?? 'login',
              'manufacturer': reqData.manufacturer ?? '',
              'model': reqData.model ?? '',
              'dtoken': dtoken,
              'ip': publicIp.toString()
            },
            throwOnError: true);
        Map res = resp.value();
        if (res['success'] == true) {
          onConnComplete(res['data'], ConnType.QQ);
        } else {
          if (res['msg'] != null && res['msg'] is String) {
            onConnError(res['msg'], 'qq');
          }
        }
      } else {
        onConnError(result.message, 'qq');
      }
    } catch (e) {
      onConnError(e.toString(), 'qq');
    }
  }

  @override
  void onShareTap(BuildContext context, ShareInfo? info, onSuccess, onError,
      {Map? params}) async {
    if (info == null) return;
    bool installed = false;
    try {
      installed = await isInstalled();
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    if (!installed) {
      Fluttertoast.showToast(
          msg: R.string('need_install_qq_first'), gravity: ToastGravity.CENTER);
      return;
    }

    ShareQQContent? content;

    if (info.type == 2) {
      String fileName = 'result_share.png';
      String filePath = await getImageSrc(); //后续可以扩展为调用者指定
      String imageLocalUrl =
          await Util.downloadFile(info.icon ?? '', filePath, fileName);
      if (imageLocalUrl.isNotEmpty) {
        content = ShareQQContent(
          title: info.title,
          targetUrl: info.url,
          imageLocalUrl: imageLocalUrl,
          summary: info.desc,
          shareType: SHARE_TO_QQ_TYPE.IMAGE,
        );
      }
    } else if (info.type == 1) {
      content = ShareQQContent(
          title: info.title,
          targetUrl: info.url,
          imageUrl: info.icon,
          summary: info.desc);
    } else if (info.type == 3) {
      content = ShareQQContent(
        title: info.title ?? Util.appName,
        summary: info.desc ?? Util.appName,
        imageLocalUrl: info.localImgPath,
        shareType: SHARE_TO_QQ_TYPE.IMAGE,
      );
    }

    //分享回调通知
    onSuccess?.call({'data': true, 'type': '${info.type}'});

    if (content != null) {
      FlutterQq.shareToQQ(content);
    }
  }

  static Future<String> getImageSrc({String path = '/who/share'}) async {
    String filePath = '';
    try {
      Directory? docDir;
      if (Platform.isAndroid) {
        docDir = await getExternalStorageDirectory();
      } else {
        docDir = await getTemporaryDirectory();
      }
      String docPath = docDir?.path ?? '';

      filePath = docPath + path;
    } catch (e) {}
    return filePath;
  }

  @override
  bool supportShare() {
    return true;
  }

  @override
  String tag() {
    return 'qq';
  }

  @override
  bool supportLogin() {
    return true;
  }

  @override
  String shareTag() {
    return 'qq';
  }

  @override
  bool supportAddFriend() {
    return true;
  }
}
