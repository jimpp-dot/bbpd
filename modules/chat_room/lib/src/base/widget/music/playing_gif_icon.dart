import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

/// 音乐播放中的动图
class MusicPlayingGifIcon extends StatelessWidget {
  final double size;
  final double gifSize;

  const MusicPlayingGifIcon({
    super.key,
    required this.size,
    this.gifSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: R.color.mainBrandColor,
        ),
        alignment: Alignment.center,
        child: R.img(
          BaseAssets.shared$living_small_gif,
          width: gifSize,
          height: gifSize,
        ),
      ),
    );
  }
}
