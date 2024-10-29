import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

import 'profile_birthday_blessings_bottom_sheet.dart';

/// 个人页生日提醒入口

class ProfileBirthdayEntry extends StatelessWidget {
  final int uid;
  final String rankTopName;

  const ProfileBirthdayEntry(this.uid, this.rankTopName, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Tracker.instance.track(TrackEvent.click,
            properties: {'click_page': 'click_mybrithday_icon'});
        ProfileBirthdayBlessingsBottomSheet.show(context, uid);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color(0x99000000),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(
              RoomAssets.chat_room$birthday_housekeeper_birthday_cake_webp,
              width: 40,
              height: 40,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
            const SizedBox(width: 4),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Session.uid == uid
                      ? K.room_today_my_birthday
                      : K.room_today_ta_birthday,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500),
                ),
                if (Util.validStr(rankTopName)) ...[
                  const SizedBox(height: 2),
                  Text(
                    '$rankTopName${Session.uid == uid ? K.room_bless_my_happy_birthday : K.room_bless_ta_happy_birthday}',
                    style: const TextStyle(
                        color: Color(0x99FFFFFF), fontSize: 11.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}
