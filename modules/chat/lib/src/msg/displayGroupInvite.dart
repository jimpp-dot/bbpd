import 'package:shared/shared.dart';
import 'package:chat/src/model/chat_group_msg.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';
import '../../k.dart';

/// 邀请加入群聊
class DisplayGroupInvite extends StatefulWidget {
  final MessageContent message;
  final Map extra;

  const DisplayGroupInvite(
      {super.key, required this.message, required this.extra});

  @override
  State<StatefulWidget> createState() {
    return _DisplayGroupInviteState();
  }
}

class _DisplayGroupInviteState extends State<DisplayGroupInvite> {
  late GroupInviteMsg _groupInviteMsg;

  @override
  void initState() {
    super.initState();
    _groupInviteMsg =
        GroupInviteMsg.fromJson(widget.extra as Map<String, dynamic>);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        bool isSelf = widget.message.senderId == Session.uid.toString();
        Log.d(".....isSelf = $isSelf");
        IGroupManager iGroupManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_GROUP);
        iGroupManager.openGroupInviteOperateScreen(
            context, _groupInviteMsg.inviteId, isSelf);
      },
      child: Container(
        decoration: BoxDecoration(
            color: R.colors.secondBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 12),
        child: Column(
          children: [
            _buildMessageInfo(),
            const SizedBox(
              height: 12,
            ),
            Divider(
              height: 1,
              color: R.colors.dividerColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInfo() {
    return Row(
      children: [
        CommonAvatar(
          path: _groupInviteMsg.groupIcon,
          shape: BoxShape.circle,
          size: 56,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _groupInviteMsg.inviteTips ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: R.colors.mainTextColor),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                R.img(Assets.chat$chat_ic_people_svg,
                    width: 17,
                    height: 17,
                    color: R.colors.thirdTextColor,
                    package: ComponentManager.MANAGER_CHAT),
                Expanded(
                    child: Text(
                  K.chat_group_count([
                    _groupInviteMsg.groupName ?? '',
                    _groupInviteMsg.memberCount.toString()
                  ]),
                  style:
                      TextStyle(color: R.colors.thirdTextColor, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            )
          ],
        ))
      ],
    );
  }
}
