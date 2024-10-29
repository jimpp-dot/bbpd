import 'package:shared/shared.dart';
import 'config.dart';
import 'package:flutter/material.dart';

///亲密卡IM消息（包括发送者和接收者视角）
class DisplayIntimateCard extends StatelessWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;
  final String? sentText;
  final Widget? iconView;
  final String? targetName;

  const DisplayIntimateCard(
      {super.key,
      required this.message,
      required this.extra,
      required this.direction,
      this.sentText,
      this.iconView,
      this.targetName});

  @override
  Widget build(BuildContext context) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    return manager.getIntimateCardIm(
        message,
        extra,
        direction == MessageDisplayDirection.Right,
        sentText,
        iconView,
        targetName);
  }
}
