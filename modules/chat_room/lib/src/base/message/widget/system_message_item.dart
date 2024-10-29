import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import '../../model/room_message_extra.dart';

class SystemMessageItem extends StatelessWidget {
  final MessageContent message;
  final ChatRoomData room;

  const SystemMessageItem(this.message, this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    if (message.op == 'on.user.level.upgrade' ||
        message.op == 'on.user.level.upgrade.new') {
      return Container(
        margin: const EdgeInsetsDirectional.only(bottom: 12),
        child: _renderSystemWithBack(context, message),
      );
    }
    String? subType = Util.parseStr(message.extra?['sub_type']);
    if (subType == 'room_red_packet') {
      return _renderGiftRedPacket(context);
    }
    return _renderDefaultSystem();
  }

  Widget _renderDefaultSystem() {
    Color textColor = Colors.white;
    String? color = Util.parseStr(message.extra?['color']);
    if (color != null) textColor = HexColor(color);
    return Text(message.message ?? '',
        style: messageTextStyle.copyWith(color: textColor));
  }

  /// 礼物红包
  Widget _renderGiftRedPacket(BuildContext context) {
    if (message.extra?.containsKey('red_packet_v2') == true &&
        message.extra?['red_packet_v2'] != null) {
      RoomRedPacket redPacket =
          RoomRedPacket.fromJson(message.extra?['red_packet_v2']);
      return InkWell(
        onTap: () {
          SchemeUrlHelper.instance().jump(
              'bbpd://com.ly.bbpd/common_redirect?page=room_gift_red_packet&rid=${room.rid}');
        },
        child: Container(
          child: giftRedPacketMessageWidget(redPacket),
        ),
      );
    }
    return _renderDefaultSystem();
  }

  Widget giftRedPacketMessageWidget(RoomRedPacket giftRedPacket) {
    if (giftRedPacket.type == 1) {
      return RichText(
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
            text: giftRedPacket.robName,
            style: messageTextStyle.copyWith(color: const Color(0xFFFFF01F)),
          ),
          TextSpan(
            text: K.rob_red_packet,
            style: messageTextStyle.copyWith(color: Colors.white),
          ),
          TextSpan(
            text: giftRedPacket.authorName,
            style: messageTextStyle.copyWith(color: const Color(0xFFFFF01F)),
          ),
          TextSpan(
            text: K.author_send_red_packet([(giftRedPacket.redName ?? '')]),
            style: messageTextStyle.copyWith(color: Colors.white),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle, // 添加这行代码
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(giftRedPacket.icon ?? ''),
                height: 25,
                width: 25, // 你可以根据需要调整宽度
              ),
            ),
          ),
          if (giftRedPacket.giftNum > 0)
            WidgetSpan(
              child: Text(
                ' x${giftRedPacket.giftNum}',
                style: messageTextStyle.copyWith(color: Colors.white),
              ),
            ),
        ]),
      );
    } else {
      return RichText(
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
            text: giftRedPacket.authorName,
            style: messageTextStyle.copyWith(color: const Color(0xFFFFF01F)),
          ),
          TextSpan(
            text: K.send_red_packet([(giftRedPacket.redName ?? '')]),
            style: messageTextStyle.copyWith(color: Colors.white),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle, // 添加这行代码
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(giftRedPacket.icon ?? ''),
                height: 25,
                width: 25, // 你可以根据需要调整宽度
              ),
            ),
          ),
        ]),
      );
    }
  }

  Widget _renderSystemWithBack(BuildContext context, MessageContent message) {
    Map? data = message.data;
    if (data == null || data.isEmpty) return Container();

    final String type = Util.notNullStr(data['type']);
    final int level = Util.parseInt(data['level']);
    final int titleNew = Util.parseInt(data['title_new']);
    final Widget levelUpIcon = _getLevelUpIcon(type, level, titleNew);
    String name = Util.notNullStr(data['name']);

    final imagePath = R.imagePath("room_level_up_message_back.png",
        package: ComponentManager.MANAGER_BASE_ROOM);
    final backImageUrl = Util.parseStr(data['bg_img']);
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: const BorderRadiusDirectional.only(
        topStart: Radius.circular(4),
        topEnd: Radius.circular(14),
        bottomStart: Radius.circular(14),
        bottomEnd: Radius.circular(14),
      ),
      color: Colors.black.withOpacity(0.2),
    );
    return Stack(
      children: [
        Positioned.fill(
          child: backImageUrl != null
              ? CachedNetworkImageStretch(
                  imageUrl: backImageUrl,
                  centerSlice: const Rect.fromLTWH(32, 23, 2, 2),
                  scale: 3,
                  errorWidget: Container(
                    margin: const EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
                    decoration: boxDecoration,
                  ),
                  placeholder: Container(
                    margin: const EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
                    decoration: boxDecoration,
                  ),
                )
              : ImageStretch.asset(
                  imagePath,
                  scale: 2,
                  centerSlice: const Rect.fromLTWH(32, 20, 2, 2),
                ),
        ),
        Container(
          constraints: const BoxConstraints(minHeight: 44, minWidth: 66),
          padding: const EdgeInsetsDirectional.fromSTEB(19, 12.5, 19, 14.5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '${K.room_congratulations} ',
                style: messageTextStyle.copyWith(
                    fontSize: 12,
                    color: HexColor(Util.notNullStr(data['msg_tail_color']))),
              ),
              levelUpIcon,
              Flexible(
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 12,
                      color: HexColor(Util.notNullStr(data['name_color']))),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const Text(' '),
              Text(
                Util.notNullStr(data['msg_tail']),
                style: TextStyle(
                    fontSize: 12,
                    color: HexColor(Util.notNullStr(data['msg_tail_color']))),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _getLevelUpIcon(String type, int level, int titleNew) {
    switch (type) {
      case 'title':
        return renderUserTitle(level, titleNew);
      case 'vip':
        return renderUserVip(level, false);
      case 'popularity':
        return UserPopularity(
          popularityLevel: level,
          height: kNameplateHeight,
          padding: const EdgeInsetsDirectional.only(end: 2),
        );
      default:
        break;
    }
    return const SizedBox.shrink();
  }
}
