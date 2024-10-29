import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:message/src/accost/widget/strategy_modify_buttons.dart';
import 'package:message/src/model/pb/generated/slp_gs.pb.dart';
import '../../../k.dart';
import '../../model/pb/slp_gs_extension.dart';
import 'slp_strategy_add_content_widget.dart';
import 'slp_strategy_voice_play_widget.dart';

class BbStrategyMsgItemWidget extends StatelessWidget {
  final int index;
  final GsChatMsg item;
  final VoidCallback onTapText;
  final VoidCallback onTapVoice;
  final VoidCallback onTapImage;
  final VoidCallback onTapDelete;

  const BbStrategyMsgItemWidget(
      {super.key,
      required this.index,
      required this.item,
      required this.onTapText,
      required this.onTapVoice,
      required this.onTapImage,
      required this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    bool auditFail = item.state == 2;
    String typeText = '';
    String editBtnText = '';
    if (item.isText) {
      typeText = K.msg_text_accost;
      editBtnText = K.msg_edit;
    } else if (item.isVoice) {
      typeText = K.msg_voice_accost;
      editBtnText = K.msg_recording;
    } else if (item.isImage) {
      typeText = K.msg_image_accost;
      editBtnText = K.msg_reupload;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${K.msg_accost_msg_name_index_prefix} ${index + 1} ${K.msg_accost_msg_name_index_postfix}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: item.hasData
                    ? R.colors.mainTextColor
                    : R.colors.secondTextColor,
              ),
            ),
            const SizedBox(width: 8),
            if (typeText.isNotEmpty)
              Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  color: R.colors.mainTextColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            const SizedBox(
              width: 8,
            ),
            Text(
              typeText,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: R.colors.secondTextColor),
            ),
            const Spacer(),
            if (item.hasData)
              StrategyModifyButtons(
                editBtnText: editBtnText,
                onEdit: () {
                  if (item.isText) {
                    onTapText();
                  } else if (item.isVoice) {
                    onTapVoice();
                  } else if (item.isImage) {
                    onTapImage();
                  }
                },
                onDelete: onTapDelete,
              ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        _buildTypeContent(item, index),
        if (auditFail)
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 8),
            child: Row(
              children: [
                R.img(
                  'ic_accost_audit_fail.svg',
                  package: ComponentManager.MANAGER_MESSAGE,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  K.msg_content_audit_fail,
                  style:
                      const TextStyle(fontSize: 13, color: Color(0xFFFF5F7D)),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildTypeContent(GsChatMsg item, int index) {
    bool auditFail = item.state == 2;
    if (item.isText) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.only(
            start: 12, end: 12, top: 14, bottom: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: auditFail
                  ? const Color(0xFFFF5F7D)
                  : R.colors.mainTextColor.withOpacity(0.2),
              width: 0.5),
        ),
        child: Text(
          item.content,
          style: TextStyle(fontSize: 14, color: R.colors.mainTextColor),
        ),
      );
    } else if (item.isVoice) {
      return BbStrategyVoicePlayWidget(
        item: item,
      );
    } else if (item.isImage) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(item.content),
          width: 144,
          height: 144,
          fit: BoxFit.cover,
          placeholder: Container(
            width: 144,
            height: 144,
            alignment: AlignmentDirectional.center,
            child: const CupertinoActivityIndicator(),
          ),
        ),
      );
    } else {
      return BbStrategyAddContentWidget(
        item: item,
        index: index,
        onAddText: () => onTapText(),
        onAddVoice: () => onTapVoice(),
        onAddImage: () => onTapImage(),
      );
    }
  }
}
