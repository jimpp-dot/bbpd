import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/trueword/model/true_word_beans.dart';
import 'package:chat_room/src/biz_plugin/trueword/widget/true_word_answer_item_widget.dart';
import 'package:chat_room/src/biz_plugin/trueword/widget/true_word_question_item_widget.dart';

class TrueWordMsgItemWidget extends StatelessWidget {
  final int rid;
  final MessageContent msg;

  const TrueWordMsgItemWidget(
      {super.key, required this.msg, required this.rid});

  @override
  Widget build(BuildContext context) {
    Map? extraData = msg.extra?['truth'];

    if (extraData == null) {
      return const SizedBox();
    }

    TrueWordMsgData trueWordMsgData;
    if (msg.expData is TrueWordMsgData) {
      trueWordMsgData = msg.expData as TrueWordMsgData;
    } else {
      trueWordMsgData =
          TrueWordMsgData.fromJson(jsonDecode(jsonEncode(extraData)));
      msg.expData = trueWordMsgData;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF2C115F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: trueWordMsgData.mode == TrueWordMode.ask
          ? TrueWordQuestionItemWidget(
              msgExtra: trueWordMsgData,
              rid: rid,
            )
          : TrueWordAnswerItemWidget(
              msgExtra: trueWordMsgData,
            ),
    );
  }
}
