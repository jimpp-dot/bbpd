import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as basek;
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:login/k.dart' as logink;
import 'package:login/login.dart';

export 'wechat_timeline_platform.dart';

class WechatPlatform extends Conn with IThirdPlatform {
  bool canLogin;
  bool canShare;

  WechatPlatform({this.canLogin = true, this.canShare = true});

  @override
  Widget getIcon({String? imgPath, required double width, required double height}) {
    return R.img(
      imgPath ?? 'wechat.svg',
      width: width,
      height: height,
      package: ComponentManager.MANAGER_PLATFORM_WECHAT,
    );
  }

  @override
  String getName() {
    return basek.K.base_wechat;
  }

  @override
  Future<bool> isInstalled() async {
    bool installed = false;
    try {
      installed = await fluwx.isWeChatInstalled;
    } catch (e) {
      installed = false;
    }
    return installed;
  }

  @override
  void onLoginTap(BuildContext context, String? actionType, onSuccess, onError, {Map? params}) {
    this.context = context;
    loginType = actionType;
    onPlatformSuccess = onSuccess;
    onPlatformError = onError;
    login();
  }

  @override
  void initialize() async {
    String? wxAppId;
    if (Platform.isAndroid) {
      wxAppId = await SharedAppPlugin.getMetadata('WX_APPID');
    } else if (Platform.isIOS) {
      wxAppId = await SharedAppPlugin.getIOSWxAppId();
    }
    if (wxAppId != null) {
      fluwx.registerWxApi(appId: wxAppId, universalLink: '${System.universalLinkDomain}/wechat/');
    }
  }

  @override
  Future login() async {
    bool installed = false;
    try {
      installed = await isInstalled();
    } catch (e) {
      Log.d("wechat isInstalled error:${e.toString()}");
    }
    if (!installed) {
      Fluttertoast.showToast(msg: logink.K.need_install_wecaht_first, gravity: ToastGravity.CENTER);
      return;
    }

    try {
      stream = fluwx.weChatResponseEventHandler.distinct((a, b) => a == b).listen(_onAuthResponse);

      if (Platform.isAndroid) prepareLogin(logink.K.wechat_is_starting);
      Log.d("wechat call sendAuth");

      bool value = await fluwx.sendWeChatAuth(scope: 'snsapi_userinfo', state: 'guid');
      Log.d('sendWeChatAuth result:$value');
    } catch (e) {
      Log.d("wechat weChatResponseEventHandler ${e.toString()}");
      onConnError('', 'wechat');
    }
    Log.d("wechat call sendAuth end");
  }

  void _onAuthResponse(response) async {
    if (response is fluwx.WeChatAuthResponse) {
      Log.d('wechat---debug code: ${response.code},type:${response.type},state:${response.state}');
      if (response.errCode != 0) {
        hasCallback = false;
        onConnError(response.errStr ?? logink.K.wechat_cancel_tips, 'wechat');
      } else {
        hasCallback = true;
        showLoading(logink.K.login_vertifying);

        ReqData reqData = await getReqData();

        String dtoken = Session.getString('dtoken', '');

        try {
          int publicIp = await DeviceInfo.getPublicIP(false);
          XhrResponse resp = await Xhr.postJson(
              "${System.domain}account/wechatLogin?v=1&code=${response.code}",
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
            onConnComplete(res['data'], ConnType.Wechat);
          } else {
            if (res['msg'] != null && res['msg'] is String) {
              onConnError(res['msg'], 'wechat');
            }
          }
        } catch (e) {
          onConnError(e.toString(), 'wechat');
        }
      }
    }
  }

  String defaultShareIcon = '${System.imageDomain}static/slp_icon.png';

  @override
  void onShareTap(
    BuildContext context,
    ShareInfo? shareInfo,
    ValueChanged<Map>? onSuccess,
    onError, {
    Map? params,
  }) async {
    if (shareInfo == null) return;
    bool installed = false;
    try {
      installed = await isInstalled();
    } catch (e) {
      Log.d("wechat isInstalled error:${e.toString()}");
    }
    if (!installed) {
      Fluttertoast.showToast(msg: logink.K.need_install_wecaht_first, gravity: ToastGravity.CENTER);
      return;
    }

    bool isTimeLine = params != null && params['subType'] == 'timeline';
    fluwx.WeChatScene scene = isTimeLine ? fluwx.WeChatScene.TIMELINE : fluwx.WeChatScene.SESSION;

    fluwx.weChatResponseEventHandler.listen((res) {
      if (res is fluwx.WeChatShareResponse) {
        //分享回调通知
        if (onSuccess != null) {
          onSuccess({'data': res.isSuccessful, 'type': '${shareInfo.type}'});
        }
      }
    });

    fluwx.WeChatShareBaseModel? model;
    if (shareInfo.type == 1) {
      if (shareInfo.wxUsername!.isNotEmpty && shareInfo.wxPath!.isNotEmpty) {
        String? icon = shareInfo.wxIcon;
        if (Util.isStringEmpty(icon)) {
          icon = shareInfo.icon;
        }
        model = fluwx.WeChatShareMiniProgramModel(
          webPageUrl: shareInfo.url ?? '',
          miniProgramType: fluwx.WXMiniProgramType.RELEASE,
          userName: shareInfo.wxUsername ?? '',
          path: shareInfo.wxPath ?? '',
          title: shareInfo.title,
          description: shareInfo.desc,
          thumbnail: fluwx.WeChatImage.network(Util.isStringEmpty(shareInfo.icon) ? defaultShareIcon : shareInfo.icon!),
        );
      } else {
        model = fluwx.WeChatShareWebPageModel(
          shareInfo.url ?? '',
          title: shareInfo.title ?? '',
          description: shareInfo.desc,
          thumbnail: fluwx.WeChatImage.network(Util.isStringEmpty(shareInfo.icon) ? defaultShareIcon : shareInfo.icon!),
          scene: isTimeLine ? fluwx.WeChatScene.TIMELINE : fluwx.WeChatScene.SESSION,
        );
      }
    } else if (shareInfo.type == 2) {
      model = fluwx.WeChatShareImageModel(
        fluwx.WeChatImage.network(shareInfo.icon ?? ''),
        thumbnail: fluwx.WeChatImage.network(shareInfo.icon ?? ''),
        title: shareInfo.title,
        description: shareInfo.desc,
        scene: scene,
      );
    } else if (shareInfo.type == 3) {
      model = fluwx.WeChatShareImageModel(
        fluwx.WeChatImage.file(File(shareInfo.localImgPath ?? '')),
        title: shareInfo.title,
        description: shareInfo.desc,
        scene: scene,
      );
    }

    if (model != null) {
      fluwx.shareToWeChat(model);
    }
  }

  @override
  bool supportShare() {
    return canShare;
  }

  @override
  String tag() {
    return 'wechat';
  }

  @override
  bool supportLogin() {
    return canLogin;
  }

  @override
  String shareTag() {
    return 'wechat';
  }

  @override
  bool supportAddFriend() {
    return canShare;
  }
}
