import 'package:flutter/material.dart';
import 'package:chat_room/a.dart';
import 'package:chat_room/src/biz_plugin/trueword/model/true_word_beans.dart';
import 'package:chat_room/src/biz_plugin/trueword/widget/true_word_type_flag_widget.dart';

class TrueWordAnswerItemWidget extends StatelessWidget {
  final TrueWordMsgData? msgExtra;

  const TrueWordAnswerItemWidget({super.key, this.msgExtra});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TrueWordTypeFlagWidget(
            colors: const [Color(0xFF50E3C2), Color(0xFF27E2DF)],
            tag: A.room_true_word_type_tags[3]),
        Container(
            padding: const EdgeInsetsDirectional.only(start: 6.0),
            child: Text(
              msgExtra?.content ?? '',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ))
      ],
    );
  }
}
