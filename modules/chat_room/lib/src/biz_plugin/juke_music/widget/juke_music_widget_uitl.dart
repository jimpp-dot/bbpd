import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';

import '../page/juke_music_order_panel.dart';

class JukeMusicWidgetUtil {
  static List<Widget> renderJukeEntrance(
      BuildContext context, ChatRoomData room,
      {bool hasRightWidgets = false}) {
    return [
      PositionedDirectional(
        top: MediaQuery.of(context).padding.top +
            (hasRightWidgets == true ? 78 : 68),
        end: 0.0,
        child: GestureDetector(
          onTap: () {
            Tracker.instance.track(TrackEvent.click, properties: {
              'click_page': 'hallen_trance',
            });
            JukeMusicOrderPanel.show(context, room);
          },
          child: Container(
            width: 91,
            height: 32,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsetsDirectional.only(start: 2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.horizontal(
                  start: Radius.circular(16)),
              color: Colors.white.withOpacity(0.12),
            ),
            child: Row(
              children: [
                R.img(RoomAssets.chat_room$jukemusic_ic_juke_wait_mic_png,
                    width: 28, height: 28),
                const SizedBox(width: 4),
                Text(
                  K.room_juke_order_music,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }
}
