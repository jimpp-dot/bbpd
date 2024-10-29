import 'package:shared/shared.dart';
import 'package:shared/src/libs/scheme/base_scheme.dart';
import 'package:flutter/material.dart';

ISettingManager _manager =
    ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);

/// 限时充值礼包活动
class SettingRechargeActivityScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    // _manager.showRechargeActivitySendDialog(context);
    return super.jumpToPage(context, qps);
  }
}
