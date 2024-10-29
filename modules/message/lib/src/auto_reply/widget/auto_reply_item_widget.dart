import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:message/src/accost/widget/strategy_modify_buttons.dart';
import 'package:message/src/auto_reply/model/auto_reply_item.dart';
import 'package:message/src/auto_reply/widget/voice_play_widget.dart';
import 'add_content_widget.dart';
import 'gift_select_widget.dart';

class AutoReplyItemWidget extends StatelessWidget {
  final AutoReplyItem item;
  final VoidCallback onTapText;
  final VoidCallback onTapVoice;
  final VoidCallback onTapImage;
  final VoidCallback onTapDelete;

  const AutoReplyItemWidget(
      {Key? key,
      required this.item,
      required this.onTapText,
      required this.onTapVoice,
      required this.onTapImage,
      required this.onTapDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool auditFail = item.state == 2;
    String editBtnText = '';
    if (item.isText) {
      editBtnText = K.msg_edit;
    } else if (item.isVoice) {
      editBtnText = K.msg_recording;
    } else if (item.isImage) {
      editBtnText = K.msg_reupload;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!item.noReply || item.subIndex == 0)
          Row(
            children: [
              Text(
                item.scene ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: R.colors.mainTextColor,
                ),
              ),
              const Spacer(),
              if (Util.validStr(item.gsReplyCount)) ...[
                Text(
                  K.msg_replied_colon,
                  style: TextStyle(
                    fontSize: 11,
                    color: R.colors.secondTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  item.gsReplyCount ?? '',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFFFD7B08),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
              if (Util.validStr(item.gsReplyCount) &&
                  Util.validStr(item.userReplyRate))
                Container(
                  width: 2,
                  height: 2,
                  margin: const EdgeInsetsDirectional.only(
                    start: 6,
                    end: 6,
                  ),
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: R.colors.mainTextColor.withOpacity(0.2),
                  ),
                ),
              if (Util.validStr(item.userReplyRate)) ...[
                Text(
                  K.msg_boss_reply_rate,
                  style: TextStyle(
                    fontSize: 11,
                    color: R.colors.secondTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  item.userReplyRate ?? '',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFFFD7B08),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        if (item.noReply)
          const SizedBox(
            height: 16,
          ),
        if (item.noReply)
          Text(
            '${K.msg_accost_msg_name_index_prefix} ${item.subIndex + 1} ${K.msg_accost_msg_name_index_postfix}',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: R.colors.secondTextColor,
            ),
          ),
        const SizedBox(
          height: 12,
        ),
        _buildTypeContent(item),
        if (auditFail || (item.state == 0 && item.id > 0) || item.hasData)
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12),
            child: Row(
              children: [
                if (auditFail)
                  R.img(
                    'ic_accost_audit_fail.svg',
                    package: ComponentManager.MANAGER_MESSAGE,
                    width: 16,
                    height: 16,
                  ),
                if (auditFail)
                  const SizedBox(
                    width: 4,
                  ),
                if (auditFail)
                  Text(
                    K.msg_content_audit_fail,
                    style:
                        const TextStyle(fontSize: 13, color: Color(0xFFFF5F7D)),
                  ),
                if (item.state == 0 && item.id > 0)
                  Text(
                    K.msg_content_auditing,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFFD7B08),
                    ),
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
          ),
      ],
    );
  }

  Widget _buildTypeContent(AutoReplyItem item) {
    bool auditFail = item.state == 2;
    if (item.isText || item.isVoice) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
              child: item.isVoice
                  ? VoicePlayWidget(
                      item: item,
                    )
                  : Text(
                      item.content ?? '',
                      style: TextStyle(
                          fontSize: 14, color: R.colors.mainTextColor),
                    ),
            ),
            if (item.designatedGift) ...[
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
          ],
        ),
      );
    } else if (item.isImage) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(item.content ?? ''),
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
          ),
          if (item.designatedGift)
            Container(
              width: double.infinity,
              margin: const EdgeInsetsDirectional.only(top: 10),
              padding: const EdgeInsetsDirectional.only(top: 14, bottom: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: auditFail
                        ? const Color(0xFFFF5F7D)
                        : R.colors.mainTextColor.withOpacity(0.2),
                    width: 0.5),
              ),
              child: GiftSelectWidget(item: item),
            )
        ],
      );
    } else {
      return AddContentWidget(
        item: item,
        onAddText: () => onTapText(),
        onAddVoice: () => onTapVoice(),
        onAddImage: () => onTapImage(),
      );
    }
  }
}
