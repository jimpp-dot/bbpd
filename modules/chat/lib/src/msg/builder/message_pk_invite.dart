import 'package:shared/shared.dart';
import 'package:chat/k.dart';
import 'package:chat/src/msg/config.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';
import 'message_widget_builder.dart';

/// 用户pk 邀请消息
class PkInviteMessage extends MessageWidgetBuilder {
  @override
  Widget buildMsg(BuildContext context, MessageContent message,
      {Key? key, MessageDisplayDirection? direction}) {
    return GestureDetector(
      onTap: () {
        Map extra = message.getExtraMap();
        int pkId = Util.parseInt(extra['user_pk_id']);
        int expire = Util.parseInt(extra['user_pk_expire_at']);
        if (pkId <= 0 ||
            DateTime.now()
                .isAfter(DateTime.fromMillisecondsSinceEpoch(expire * 1000))) {
          Fluttertoast.showToast(msg: K.chat_user_pk_invite_expired);
          return;
        }
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              message.content,
              maxLines: 100,
              softWrap: true,
              style: R.textStyle.body1.copyWith(color: R.colors.mainTextColor),
            ),
          ),
          Container(
              color: R.colors.dividerColor,
              width: 1,
              height: 16,
              margin: const EdgeInsets.symmetric(horizontal: 12)),
          Text(
            K.chat_btn_check,
            style: TextStyle(
                color: R.colors.mainBrandColor,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
          R.img(Assets.chat$ic_next_small_svg,
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_CHAT,
              color: R.colors.mainBrandColor),
        ],
      ),
    );
  }
}
