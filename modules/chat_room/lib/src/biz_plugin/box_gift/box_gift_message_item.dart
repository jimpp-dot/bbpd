import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

final textStyle = messageTextStyle.copyWith(color: Colors.white);

class BoxGiftMessageItem extends StatelessWidget {
  final MessageContent message;

  const BoxGiftMessageItem({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? giftIcon = _getGiftIcon();
    String? giftNum = _getGiftNum();
    if (Util.isStringEmpty(giftIcon) || Util.isStringEmpty(giftNum)) {
      return const SizedBox.shrink();
    }
    return _buildMessageItem(giftIcon!, giftNum!);
  }

  Map? get _gift => message.extra?['gift'];

  int get _luckyLevel => message.extra?['outstanding_box']?['luck_level'] ?? 0;

  String get _luckyIcon =>
      message.extra?['outstanding_box']?['sender_box_tag'] ?? '';

  String get _luckyDesc =>
      message.extra?['outstanding_box']?['sender_suffix'] ?? '';

  /// 收到礼物消息
  Widget _buildMessageItem(String giftIcon, String giftNum) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Text('${K.room_reward} ${message.user?.toName}',
                  style: textStyle),
              // 礼物icon
              R.img(giftIcon,
                  width: 24, height: 24, cachedWidth: 90, cachedHeight: 90),
              // 礼物数量
              Text(giftNum,
                  style: textStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
            ],
          ),
          if (_luckyLevel > 0 && _luckyIcon.isNotEmpty) _buildLuckyWidget(),
        ],
      ),
    );
  }

  Widget _buildLuckyWidget() {
    bool needWrap = Util.width <= 375;
    double maxWidth = needWrap ? 153 : Util.width - 375 + 153;
    String desc = needWrap ? _luckyDesc.replaceAll('|', "\n") : _luckyDesc;
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          R.img(Util.getRemoteImgUrl(_luckyIcon), width: 68, height: 18),
          const SizedBox(width: 5),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: _luckyLevel == 1
                ? Text(
                    desc,
                    style: textStyle.copyWith(color: const Color(0xFF1EB0D9)),
                  )
                : ColorfulTextWidget(
                    text: desc,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFFAFFA3),
                      Color(0xFFFF5C73),
                      Color(0xFFAC70FF)
                    ]),
                  ),
          ),
        ],
      ),
    );
  }

  String? _getGiftIcon() {
    Map? gift = _gift;
    if (gift == null) return null;
    return Util.giftImgUrl(Util.parseInt(gift['id']));
  }

  String? _getGiftNum() {
    Map? gift = _gift;
    if (gift == null || gift['_num']?.toString().isEmpty == true) {
      return null;
    }
    return ' x ${gift['_num']}';
  }
}
