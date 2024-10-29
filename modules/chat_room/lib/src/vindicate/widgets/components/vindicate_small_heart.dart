import 'dart:math';

import 'package:chat_room/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';

/// 小心型❤️
class VindicateSmallHeart extends StatelessWidget {
  final double? size;

  Color? color;

  double? rotationAngle;

  VindicateSmallHeart({
    Key? key,
    this.size = 8.0,
    this.color = const Color(0xFFFFFCC2),
    this.rotationAngle = 0,
  }) : super(key: key);

  /// 黄色心型
  VindicateSmallHeart.yellow({
    Key? key,
    this.size = 8.0,
  }) : super(key: key) {
    color = const Color(0xFFFFFCC2).withOpacity(0.4);
    rotationAngle = pi / 4.0;
  }

  /// 粉红色心型
  VindicateSmallHeart.pink({
    Key? key,
    this.size = 8.0,
    AlignmentDirectional alignment = AlignmentDirectional.topStart,
  }) : super(key: key) {
    color = const Color(0xFFF754B9).withOpacity(0.4);
    if (alignment == AlignmentDirectional.topStart) {
      rotationAngle = 0;
    } else if (alignment == AlignmentDirectional.topEnd) {
      rotationAngle = pi / 2.0;
    } else if (alignment == AlignmentDirectional.bottomEnd) {
      rotationAngle = pi;
    } else {
      rotationAngle = -(pi / 2.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAngle ?? 0,
      child: R.img(RoomAssets.chat_room$vindicate_vindicate_heart_small_webp,
          width: size, height: size, color: color),
    );
  }
}
