import 'package:flutter/widgets.dart';
import 'package:shared/src/share_info.dart';

abstract class IThirdPlatform {
  Map extraData = {};

  // 添加好友页使用，取值与share一样，但是要屏蔽QQ空间和微信朋友圈
  bool supportAddFriend();

  bool supportShare();

  bool supportLogin();

  void initialize();

  Future<bool> isInstalled();

  Widget getIcon({String? imgPath, required double width, required double height});

  String getName();

  void onLoginTap(
    BuildContext context,
    String? actionType,
    ValueChanged<Map>? onSuccess,
    ValueChanged<String>? onError, {
    Map? params,
  });

  void onShareTap(
    BuildContext context,
    ShareInfo? shareInfo,
    ValueChanged<Map>? onSuccess,
    ValueChanged<String>? onError, {
    Map? params,
  });

  String tag();

  String shareTag();
}
