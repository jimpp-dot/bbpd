import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../k.dart';
import '../bottom/tacit_dialog.dart';

/// 默契问答提示
class DisplayTacitTips extends StatelessWidget {
  final String targetUid;

  const DisplayTacitTips({Key? key, required this.targetUid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TacitDialog.show(context, targetUid);
        Tracker.instance
            .track(TrackEvent.questions_click_entrance, properties: {
          'questions_click_entrance_tag': 1,
        });
      },
      child: Center(
        child: Container(
          padding: const EdgeInsetsDirectional.only(
              start: 12, end: 12, top: 8, bottom: 8),
          child: RichText(
            text: TextSpan(
              text: K.chat_tacit_tips_msg_1,
              children: [
                TextSpan(
                  text: K.chat_tacit,
                  style: TextStyle(
                    color: R.colors.highlightColor,
                    fontSize: 12,
                    height: 1.1,
                  ),
                ),
                TextSpan(
                  text: K.chat_tacit_tips_msg_2,
                  style: TextStyle(
                    color: R.colors.thirdTextColor,
                    fontSize: 12,
                    height: 1.1,
                  ),
                ),
              ],
              style: TextStyle(
                fontSize: 12,
                color: R.colors.thirdTextColor,
                fontFamily: Util.fontFamily,
                height: 1.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
