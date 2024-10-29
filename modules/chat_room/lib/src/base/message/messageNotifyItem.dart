import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/src/base/message/messageItem.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/base/profile/room_user_profile.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import '../../base/config.dart';
import '../../chatRoomData.dart';

/// 公屏欢迎消息
///
class MessageNotifyItem extends StatelessWidget {
  final MessageContent message;
  final ChatRoomData? room;

  const MessageNotifyItem({super.key, required this.message, this.room});

  @override
  Widget build(BuildContext context) {
    Map extra = message.extra ?? {};
    int defends = Util.parseInt(extra['defends']);
    int title = Util.parseInt(extra['title']);
    int titleNew = Util.parseInt(extra['title_new']);
    int vip = Util.parseInt(extra['vip_new']);

    bool hasDefend = defends != 0;
    bool hasMounts = message.mounts != null && message.mounts?['id'] != null;
    bool hasTitle = !(title <= 0 || title > 5);
    bool hasVip = vip > 0;

    return InkWell(
      onTap: () {
        RoomUserProfile.openImageFloatScreenDisplayModalBottomSheet(
            context, Util.parseInt(extra['uid']), room!, 1);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '${K.welcome} ',
            style: messageTextStyle,
          ),
          renderRadioDefend(defends),
          _renderMounts(message),
          renderUserTitle(title, titleNew),
          renderNewer(
              isNewer: Util.parseInt(extra['is_newer']) > 0,
              isNewNoble: Util.parseBool(extra['new_noble'])),
          renderUserVip(vip, Util.parseBool(extra['icongray'])),
          if (Util.parseInt(extra['is_grow_user']) > 0)
            const GrowUserWidget(padding: EdgeInsetsDirectional.only(end: 4)),
          Text(
            getDisplayText(
                message, (hasDefend && hasMounts && hasTitle && hasVip)),
            maxLines: 6,
            style: messageTextStyle.copyWith(
              color: getUserColor(message),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderRadioDefend(int defend, {double top = 0}) {
    if (defend == 0) {
      return const SizedBox(
        width: 0.0,
        height: 0.0,
      );
    } else {
      return Container(
        margin: EdgeInsetsDirectional.only(end: 2.0, top: top),
        child: R.img(
          'radio_badge_$defend.png',
          width: 18,
          height: 18,
          package: ComponentManager.MANAGER_BASE_ROOM,
        ),
      );
    }
  }

  Widget _renderMounts(MessageContent message) {
    if (message.mounts != null && message.mounts?['id'] != null) {
      String mountImageUrl =
          Util.giftImgUrl(Util.parseInt(message.mounts?['id']));
      return Container(
        margin: const EdgeInsetsDirectional.only(end: 2.0),
        child: CachedNetworkImage(
          imageUrl: mountImageUrl,
          height: 25,
        ),
      );
    } else {
      return const SizedBox(
        width: 0.0,
        height: 0.0,
      );
    }
  }

  Widget renderUserTitle(int title, int titleNew) {
    return UserNobilityWidget(
      titleNew: titleNew,
      padding: const EdgeInsetsDirectional.only(end: 2.0, top: 1),
    );
  }

  Color getUserColor(MessageContent message) {
    int vip = Util.parseInt(message.extra?['vip_new']);
    if (message.extra?['icongray'] == true) {
      vip = 0;
    }
    return Color(getVipColor(vip));
  }

  String getDisplayText(MessageContent message, bool useSub) {
    String? name = Util.parseStr(message.extra?['name']);
    if (name != null) {
      if (useSub && name.toString().length > 5) {
        name = name.toString().safeSubstring(0, 5);
      }
    } else {
      name = '';
    }
    return name
//        + '${message.rankStr}'  //欢迎消息中屏蔽掉榜单信息
        ;
  }
}
