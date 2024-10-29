import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:login/k.dart' as logink;
import 'package:login/login.dart';

class TimelinePlatform extends Conn with IThirdPlatform {
  @override
  Widget getIcon(
      {String? imgPath, required double width, required double height}) {
    return R.img(
      imgPath ?? 'wechat_timeline.svg',
      width: width,
      height: height,
      package: ComponentManager.MANAGER_PLATFORM_WECHAT,
    );
  }

  @override
  String getName() {
    return "微信朋友圈";
  }

  @override
  Future<bool> isInstalled() async {
    bool installed = false;
    try {
      installed = await fluwx.isWeChatInstalled;
    } catch (e) {
      Log.d("wechat isInstalled error:${e.toString()}");
      installed = false;
    }
    return installed;
  }

  @override
  void onLoginTap(BuildContext context, String? actionType, onSuccess, onError,
      {Map? params}) {}

  @override
  void initialize() async {
    if (Platform.isAndroid) {
      String wxAppId = await SharedAppPlugin.getMetadata('WX_APPID');
      fluwx.registerWxApi(appId: wxAppId);
    }
  }

  @override
  void onShareTap(
    BuildContext context,
    ShareInfo? shareInfo,
    ValueChanged<Map>? onSuccess,
    ValueChanged<String>? onError, {
    Map? params,
  }) async {
    if (shareInfo == null) return;
    bool installed = await isInstalled();
    if (!installed) {
      Fluttertoast.showToast(
          msg: logink.K.need_install_wecaht_first,
          gravity: ToastGravity.CENTER);
      return;
    }

    fluwx.weChatResponseEventHandler.listen((res) {
      if (res is fluwx.WeChatShareResponse) {
        //分享回调通知
        onSuccess
            ?.call({'data': res.isSuccessful, 'type': '${shareInfo.type}'});
      }
    });

    fluwx.WeChatShareBaseModel? model;
    if (shareInfo.type == 1) {
      model = fluwx.WeChatShareWebPageModel(
        shareInfo.url ?? '',
        title: shareInfo.title ?? '',
        description: shareInfo.desc,
        thumbnail: fluwx.WeChatImage.network(shareInfo.icon ?? ''),
        scene: fluwx.WeChatScene.TIMELINE,
      );
    } else if (shareInfo.type == 2) {
      model = fluwx.WeChatShareImageModel(
        fluwx.WeChatImage.network(shareInfo.icon ?? ''),
        thumbnail: fluwx.WeChatImage.network(shareInfo.icon ?? ''),
        title: shareInfo.title,
        description: shareInfo.desc,
        scene: fluwx.WeChatScene.TIMELINE,
      );
    } else if (shareInfo.type == 3) {
      model = fluwx.WeChatShareImageModel(
        fluwx.WeChatImage.file(File(shareInfo.localImgPath ?? '')),
        title: shareInfo.title,
        description: shareInfo.desc,
        scene: fluwx.WeChatScene.TIMELINE,
      );
    }

    if (model != null) {
      fluwx.shareToWeChat(model);
    }
  }

  @override
  bool supportShare() {
    return true;
  }

  @override
  String tag() {
    return 'moment';
  }

  @override
  bool supportLogin() {
    return false;
  }

  @override
  String shareTag() {
    return 'wechat_timeline';
  }

  @override
  bool supportAddFriend() {
    return false;
  }
}
