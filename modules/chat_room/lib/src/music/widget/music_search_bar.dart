import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

/// 播放列表搜索bar
class MusicSearchBar extends StatelessWidget {
  final VoidCallback? onTap;

  const MusicSearchBar({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Ink(
        height: 36,
        decoration: BoxDecoration(
          color: R.color.secondBgColor,
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(23.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(width: 15),
              R.img(
                RoomAssets.chat_room$music_icon_search_svg,
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_BASE_ROOM,
                color: R.color.thirdTextColor,
              ),
              const SizedBox(width: 4),
              Text(K.room_search_music,
                  style: TextStyle(color: R.color.thirdTextColor, fontSize: 15))
            ],
          ),
        ),
      ),
    );
  }
}
