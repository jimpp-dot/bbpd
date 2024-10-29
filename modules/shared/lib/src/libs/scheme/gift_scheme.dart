import 'package:shared/shared.dart';
import 'package:shared/src/libs/scheme/base_scheme.dart';
import 'package:flutter/material.dart';

final IGiftManager _manager =
    ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

/// 星座拍拍主弹窗
class ConstellationClapMainScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.openConstellationClapMainDialog(System.context);
    return super.jumpToPage(context, qps);
  }
}

/// 星座拍拍结果弹窗
class ConstellationClapResultScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.openConstellationClapResultDialog(System.context);
    return super.jumpToPage(context, qps);
  }
}
