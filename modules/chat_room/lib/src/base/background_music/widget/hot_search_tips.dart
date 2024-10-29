import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

/// 音乐热搜tips
class HotSearchTips extends StatelessWidget {
  /// 换一换
  final GestureTapCallback? onTap;

  const HotSearchTips({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16, end: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(K.music_search_hot,
              style: TextStyle(fontSize: 12, color: R.color.thirdTextColor)),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                R.img('music/hot_search_change.svg',
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    width: 18,
                    color: R.color.mainTextColor),
                Text(K.change_another_hot, style: const TextStyle(fontSize: 12))
              ],
            ),
          )
        ],
      ),
    );
  }
}
