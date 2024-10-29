import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:message/src/quick_msg/model/quick_msg_item.dart';
import 'add_content_widget.dart';
import 'modify_buttons.dart';
import 'voice_play_widget.dart';

class MsgItemWidget extends StatelessWidget {
  final int index;
  final QuickMsgItem item;
  final VoidCallback onTapText;
  final VoidCallback onTapVoice;
  final VoidCallback onTapDelete;

  const MsgItemWidget(
      {Key? key,
      required this.index,
      required this.item,
      required this.onTapText,
      required this.onTapVoice,
      required this.onTapDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String editBtnText = '';
    if (item.isText) {
      editBtnText = K.msg_edit;
    } else if (item.isVoice) {
      editBtnText = K.msg_recording;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${K.msg_quick_msg}${index + 1}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: item.hasData
                    ? R.colors.mainTextColor
                    : R.colors.secondTextColor,
              ),
            ),
            const Spacer(),
            if (item.hasData)
              ModifyButtons(
                editBtnText: editBtnText,
                onEdit: () {
                  if (item.isText) {
                    onTapText();
                  } else if (item.isVoice) {
                    onTapVoice();
                  }
                },
                onDelete: onTapDelete,
              ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        _buildTypeContent(item),
      ],
    );
  }

  Widget _buildTypeContent(QuickMsgItem item) {
    if (item.isText) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.only(
            start: 12, end: 12, top: 14, bottom: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: R.colors.mainTextColor.withOpacity(0.2), width: 0.5),
        ),
        child: Text(
          item.content ?? '',
          style: TextStyle(fontSize: 14, color: R.colors.mainTextColor),
        ),
      );
    } else if (item.isVoice) {
      return VoicePlayWidget(
        item: item,
      );
    } else {
      return AddContentWidget(
        item: item,
        onAddText: () => onTapText(),
        onAddVoice: () => onTapVoice(),
      );
    }
  }
}
