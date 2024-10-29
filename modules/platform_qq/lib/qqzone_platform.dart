import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/login.dart';
import 'package:flutter_qq/flutter_qq.dart';
import 'package:path_provider/path_provider.dart';

class QZonePlatform extends Conn with IThirdPlatform {
  @override
  Widget getIcon(
      {String? imgPath, required double width, required double height}) {
    return R.img(imgPath ?? 'qzone.svg',
        width: width,
        height: height,
        package: ComponentManager.MANAGER_PLATFORM_QQ);
  }

  @override
  String getName() {
    return "QQ空间";
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
      {Map? params}) {}

  @override
  void initialize() async {
    //已经在qq组件中初始化了
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

    ShareQzoneContent? content;

    if (info.type == 2) {
      String fileName = 'result_share.png';
      String filePath = await getImageSrc();
      String imageLocalUrl =
          await Util.downloadFile(info.icon ?? '', filePath, fileName);
      if (imageLocalUrl.isNotEmpty) {
        content = ShareQzoneContent(
          title: info.title,
          targetUrl: info.url,
          imageUrl: imageLocalUrl,
          summary: info.desc,
          shareType: SHARE_TO_QZONE_TYPE.PUBLISH_MOOD,
        );
      }
    } else if (info.type == 1) {
      content = ShareQzoneContent(
          title: info.title,
          targetUrl: info.url,
          imageUrl: info.icon,
          summary: info.desc);
    } else if (info.type == 3) {
      content = ShareQzoneContent(
        title: info.title ?? Util.appName,
        summary: info.desc ?? Util.appName,
        imageUrl: info.localImgPath,
        imageUrls: [info.localImgPath ?? ''],
        shareType: Platform.isIOS
            ? SHARE_TO_QZONE_TYPE.IMAGE
            : SHARE_TO_QZONE_TYPE.PUBLISH_MOOD,
      );
    }

    //分享回调通知
    onSuccess?.call({'data': true, 'type': '${info.type}'});

    if (content != null) {
      FlutterQq.shareToQzone(content);
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
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return filePath;
  }

  @override
  bool supportShare() {
    return true;
  }

  @override
  String tag() {
    return 'qzone';
  }

  @override
  bool supportLogin() {
    return false;
  }

  @override
  String shareTag() {
    return 'qq_zone';
  }

  @override
  bool supportAddFriend() {
    return false;
  }
}
