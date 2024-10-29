import 'package:shared/model/report_type.dart';
import 'package:chat/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 反诈骗信息
class DisplaySwindleTips extends StatefulWidget {
  final MessageContent message;

  const DisplaySwindleTips({super.key, required this.message});

  @override
  _DisplaySwindleTipsState createState() => _DisplaySwindleTipsState();
}

class _DisplaySwindleTipsState extends State<DisplaySwindleTips> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 2, bottom: 16),
      child: Text.rich(
        TextSpan(children: <InlineSpan>[
          TextSpan(
              text: K.chat_swindle_tips_prefix,
              style: R.textStyle.body2.copyWith(
                  color: darkMode
                      ? const Color(0x80FFFFFF)
                      : const Color(0x80000000))),
          TextSpan(
            text: K.chat_report_now,
            style: R.textStyle.body1
                .copyWith(fontSize: 12, color: R.colors.highlightColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                IPersonalDataManager manager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                manager.openReportScreen(context,
                    uid: Util.parseInt(widget.message.targetId),
                    reportType: ReportType.User);
              },
          )
        ]),
        textAlign: TextAlign.center,
      ),
    );
  }
}
