import 'package:chat/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DisplayBirthdayTips extends StatelessWidget {
  final MessageContent message;
  const DisplayBirthdayTips({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Tracker.instance.track(TrackEvent.click,
              properties: {'click_page': 'click_birthdayremark'});
          int uid = Util.parseInt(message.targetId);
          IGiftManager giftManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_GIFT);
          giftManager.showPrivateGiftPanel(context, uid: uid, fromChat: true);
        },
        child: Container(
          padding: const EdgeInsetsDirectional.only(
              start: 20, end: 20, top: 8, bottom: 8),
          decoration: ShapeDecoration(
              shape: const StadiumBorder(), color: R.colors.secondBgColor),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                K.chat_ta_today_birthday,
                style: TextStyle(color: R.colors.thirdTextColor, fontSize: 12),
              ),
              Text(
                K.chat_birthday_bless,
                style: TextStyle(
                    color: R.colors.highlightColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                K.chat_ba,
                style: TextStyle(color: R.colors.thirdTextColor, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
