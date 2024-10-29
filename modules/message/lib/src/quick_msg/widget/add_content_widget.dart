import 'package:flutter/material.dart';
import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:message/src/quick_msg/model/quick_msg_item.dart';

class AddContentWidget extends StatelessWidget {
  final QuickMsgItem item;
  final VoidCallback onAddText;
  final VoidCallback onAddVoice;

  const AddContentWidget(
      {Key? key,
      required this.item,
      required this.onAddText,
      required this.onAddVoice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: R.colors.mainTextColor.withOpacity(0.2), width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _btnWrapper(_buildAddTextBtn(item)),
          Container(
            width: 0.5,
            height: 16,
            color: R.colors.mainTextColor.withOpacity(0.1),
          ),
          _btnWrapper(_buildAddVoiceBtn(item)),
        ],
      ),
    );
  }

  Widget _btnWrapper(Widget child) {
    return Expanded(
      child: Align(
        child: child,
      ),
    );
  }

  Widget _buildAddTextBtn(QuickMsgItem item) {
    return GestureDetector(
      onTap: () async {
        onAddText();
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(
            'ic_accost_add_text.svg',
            color: R.colors.mainTextColor,
            package: ComponentManager.MANAGER_MESSAGE,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            K.msg_add_text,
            style: TextStyle(
                fontSize: 14,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildAddVoiceBtn(QuickMsgItem item) {
    return GestureDetector(
      onTap: () {
        onAddVoice();
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(
            'ic_accost_add_voice.svg',
            color: R.colors.mainTextColor,
            package: ComponentManager.MANAGER_MESSAGE,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            K.msg_record_voice,
            style: TextStyle(
                fontSize: 14,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
