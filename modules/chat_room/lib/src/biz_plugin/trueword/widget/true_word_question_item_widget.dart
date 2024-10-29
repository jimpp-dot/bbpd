import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/a.dart';
import 'package:chat_room/src/biz_plugin/trueword/model/true_word_beans.dart';
import 'package:chat_room/src/biz_plugin/trueword/model/true_word_repo.dart';
import 'package:chat_room/src/biz_plugin/trueword/widget/true_word_type_flag_widget.dart';

class TrueWordQuestionItemWidget extends StatelessWidget {
  final int rid;
  final TrueWordMsgData msgExtra;

  const TrueWordQuestionItemWidget(
      {super.key, required this.rid, required this.msgExtra});

  Widget _buildTypeFlag() {
    List<Color> colors = [];
    String tag = '';
    if (msgExtra.type == TrueWordMsgType.normal) {
      colors = [const Color(0xFFFFDD5B), const Color(0xFFFFA257)];
      tag = A.room_true_word_type_tags[1];
    } else if (msgExtra.type == TrueWordMsgType.private) {
      colors = [const Color(0xFFFFA8D0), const Color(0xFFFF7092)];
      tag = A.room_true_word_type_tags[0];
    } else if (msgExtra.type == TrueWordMsgType.open) {
      colors = [const Color(0xFF86BAFF), const Color(0xFF8269FF)];
      tag = A.room_true_word_type_tags[2];
    }
    return TrueWordTypeFlagWidget(
      colors: colors,
      tag: tag,
    );
  }

  Widget _buildAnswerItem(String answerStr) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        TrueWordRepo.answer(rid, msgExtra, answerStr)
            .then((rsp) => BaseResponse.toast(rsp));
      },
      child: Container(
        height: 22.0,
        width: Util.width,
        margin: const EdgeInsetsDirectional.only(top: 6, bottom: 4),
        child: Text(
          answerStr,
          style: TextStyle(
              fontSize: 16.0,
              color: R.color.mainBrandColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildTypeFlag(),
        const SizedBox(
          width: 12,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msgExtra.question?.content ?? '',
                softWrap: true,
                style: const TextStyle(
                  fontSize: 16.0,
                  textBaseline: TextBaseline.ideographic,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (msgExtra.question?.answers.isNotEmpty ?? false)
                ...msgExtra.question!.answers.map(_buildAnswerItem).toList()
            ],
          ),
        ),
      ],
    );
  }
}
