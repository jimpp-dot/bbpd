import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

/// 发送礼物的引导条，只有用户第一次给对方发送消息时才会出现
class DisplaySendGiftTips extends StatefulWidget {
  final MessageContent message;

  const DisplaySendGiftTips({super.key, required this.message});

  @override
  State<StatefulWidget> createState() {
    return _DisplaySendGiftTipsState();
  }
}

class _DisplaySendGiftTipsState extends State<DisplaySendGiftTips> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Padding renderTextTips(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 20, end: 20, top: 6, bottom: 20),
        child: Container(
            padding: const EdgeInsetsDirectional.only(
                start: 10, end: 10, top: 2, bottom: 2),
            decoration: ShapeDecoration(
                shape: const StadiumBorder(), color: R.colors.secondBgColor),
            child: Text.rich(TextSpan(children: <InlineSpan>[
              TextSpan(
                  text: K.chat_send_gift_tips,
                  style:
                      TextStyle(color: R.colors.thirdTextColor, fontSize: 11)),
              WidgetSpan(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _openGiftPanel(context);
                },
                child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 4),
                    child: Text(
                      K.chat_send_gift_to_user,
                      style: TextStyle(
                          color: R.colors.highlightColor, fontSize: 11),
                    )),
              )),
            ]))));
  }

  Widget _buildBody() {
    int giftId = getGiftId();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _openGiftPanel(context);
          },
          child: CachedNetworkImage(
            imageUrl: "${System.imageDomain}static/$giftSubDir/$giftId.png",
            width: 52.0,
            height: 52.0,
          ),
        ),
        renderTextTips(context)
      ],
    );
  }

  void _openGiftPanel(BuildContext context) {
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.showPrivateGiftPanel(context,
        fromChat: true,
        uid: Util.parseInt(widget.message.targetId),
        defaultId: getGiftId());
  }

  int getGiftId() {
    String? extraJson = widget.message.extra;
    Map? extra;
    try {
      if (extraJson != null && extraJson.isNotEmpty) {
        extra = json.decode(extraJson);
      }
    } catch (e) {}

    if (extra != null) {
      return Util.parseInt(extra['gift_id'], 5);
    }
    return 5;
  }
}
