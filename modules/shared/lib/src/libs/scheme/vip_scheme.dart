import 'package:shared/shared.dart';
import 'package:shared/src/libs/scheme/base_scheme.dart';
import 'package:flutter/material.dart';

IVipManager _manager =
    ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);

/// 座驾系列背包
class MountPieceBagScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.openMountPieceBagPage(System.context,
        serialId: Util.parseInt(qps['serialId']));
    return super.jumpToPage(context, qps);
  }
}

/// 我的座驾
class MyMountScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.openMyMountPage(
        System.context, Util.parseInt(qps['uid'], Session.uid),
        serialId: Util.parseInt(qps['serial_id']));
    return super.jumpToPage(context, qps);
  }
}
