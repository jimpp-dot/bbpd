import 'package:shared/shared.dart';
import 'package:shared/src/libs/scheme/base_scheme.dart';
import 'package:flutter/material.dart';

IChatManager _manager =
    ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);

/// 快捷回复分组
class QuickReplyGroupScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.showQuickReplyGroup(System.context);
    return super.jumpToPage(context, qps);
  }
}
