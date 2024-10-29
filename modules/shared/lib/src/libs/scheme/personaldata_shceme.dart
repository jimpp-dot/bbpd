import 'package:shared/shared.dart';
import 'package:shared/src/libs/scheme/base_scheme.dart';
import 'package:flutter/material.dart';

IPersonalDataManager _manager =
    ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);

/// 聊愈师首页
class HealerMainScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.openHealerMainPage(context);
    return super.jumpToPage(context, qps);
  }
}
