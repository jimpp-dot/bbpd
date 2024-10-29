import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/message.dart';

class MsgItemEtcWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const MsgItemEtcWidget(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        IChatManager chatManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
        chatManager.showETCUserPoolPage(context);
      },
      child: Rext.themeCardContainer(
        height: MessageItem.ITEM_EXTENT,
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(start: 3, end: 12),
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 7),
        cornerRadius: 16,
        child: Row(
          children: <Widget>[
            ClipOval(
                child: Rext.autoStyleImg('chat_etc.webp',
                    width: 66,
                    height: 66,
                    package: ComponentManager.MANAGER_MESSAGE)),
            const SizedBox(width: 3),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: R.colors.mainTextColor,
                        fontSize: 16,
                        height: 1.1),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(color: R.colors.thirdTextColor, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
