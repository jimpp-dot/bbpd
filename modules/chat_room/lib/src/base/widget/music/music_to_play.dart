import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';

/// 音乐播放去播放按钮
class MusicToPlayIcon extends StatelessWidget {
  final double size;

  const MusicToPlayIcon({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return R.img(RoomAssets.chat_room$music_music_to_play_svg,
        width: size, color: R.color.mainTextColor);
  }
}
