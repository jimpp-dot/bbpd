import 'package:shared/shared.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 加入群聊申请消息
class DisplayGroupApply extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final PageRefer? refer;

  const DisplayGroupApply(
      {super.key, required this.message, required this.extra, this.refer});

  @override
  State<StatefulWidget> createState() => _DisplayGroupApplyState();
}

class _DisplayGroupApplyState extends State<DisplayGroupApply> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
              text: widget.message.content,
              style: R.textStyle.body1
                  .copyWith(fontSize: 16, color: R.colors.mainTextColor)),
          if (widget.extra['tail_text'] != null)
            TextSpan(
              text: widget.extra['tail_text'],
              style: R.textStyle.body1
                  .copyWith(fontSize: 16, color: R.colors.highlightColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  IGroupManager manager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_GROUP);
                  manager.openGroupApplyList(
                      context, Util.parseInt(widget.extra['group_id']));
                },
            ),
        ],
      ),
    );
  }
}
