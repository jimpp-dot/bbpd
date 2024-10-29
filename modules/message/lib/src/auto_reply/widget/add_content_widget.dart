import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:message/src/auto_reply/model/auto_reply_item.dart';
import 'package:message/src/auto_reply/widget/gift_select_widget.dart';

class AddContentWidget extends StatelessWidget {
  final AutoReplyItem item;
  final VoidCallback onAddText;
  final VoidCallback onAddVoice;
  final VoidCallback onAddImage;

  const AddContentWidget(
      {super.key,
      required this.item,
      required this.onAddText,
      required this.onAddVoice,
      required this.onAddImage});

  @override
  Widget build(BuildContext context) {
    bool auditFail = item.state == 2;
    Widget btnRow = Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAddTextBtn(item),
          Container(
            width: 0.5,
            height: 16,
            color: R.colors.mainTextColor.withOpacity(0.1),
          ),
          _buildAddVoiceBtn(item),
          Container(
            width: 0.5,
            height: 16,
            color: R.colors.mainTextColor.withOpacity(0.1),
          ),
          _buildAddImageBtn(item),
        ],
      ),
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(top: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: auditFail
                ? const Color(0xFFFF5F7D)
                : R.colors.mainTextColor.withOpacity(0.2),
            width: 0.5),
      ),
      child: item.designatedGift
          ? Column(
              children: [
                btnRow,
                const SizedBox(
                  height: 14,
                ),
                Container(
                  height: 0.5,
                  color: R.colors.mainTextColor.withOpacity(0.2),
                ),
                const SizedBox(
                  height: 14,
                ),
                GiftSelectWidget(item: item),
              ],
            )
          : btnRow,
    );
  }

  Widget _buildAddTextBtn(AutoReplyItem item) {
    return GestureDetector(
      onTap: () async {
        onAddText();
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          R.img(
            'ic_accost_add_text.svg',
            color: R.colors.secondTextColor,
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

  Widget _buildAddVoiceBtn(AutoReplyItem item) {
    return GestureDetector(
      onTap: () {
        onAddVoice();
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          R.img(
            'ic_accost_add_voice.svg',
            color: R.colors.secondTextColor,
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

  Widget _buildAddImageBtn(AutoReplyItem item) {
    return GestureDetector(
      onTap: () {
        onAddImage();
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          R.img(
            'ic_accost_add_image.svg',
            color: R.colors.secondTextColor,
            package: ComponentManager.MANAGER_MESSAGE,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            K.msg_upload_image,
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
