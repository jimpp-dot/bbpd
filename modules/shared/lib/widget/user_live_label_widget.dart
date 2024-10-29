import 'package:flutter/material.dart';

enum UserLiveLabelType {
  frame, //显示在头像框上
  bubble, //显示在气泡上
  effect, //显示在进场特效上
}

/// 头像框 气泡 进场特效 上的粉丝牌名
///
class UserLiveLabelWidget extends StatelessWidget {
  final UserLiveLabelType? type;
  final String? liveLabel; //粉丝牌名
  final double bgHeight; //背景高 头像框传头像框高 气泡不传 特效传背景高
  final double frameBottomOverflow; //头像框底部overflow

  const UserLiveLabelWidget(this.liveLabel, this.type,
      {super.key, this.bgHeight = 0, this.frameBottomOverflow = 0.0});

  @override
  Widget build(BuildContext context) {
    if (type == null ||
        liveLabel == null ||
        liveLabel!.isEmpty ||
        (type == UserLiveLabelType.frame && bgHeight == 0.0) ||
        (type == UserLiveLabelType.effect && bgHeight == 0.0))
      return const SizedBox.shrink();

    switch (type) {
      case UserLiveLabelType.frame:
        return PositionedDirectional(
          start: 0,
          end: 0,
          bottom: frameBottomOverflow + 20 / 400 * bgHeight,
          child: IgnorePointer(
            child: Container(
              height: 94 / 400 * bgHeight,
              alignment: AlignmentDirectional.center,
              child: Text(
                liveLabel!,
                style: TextStyle(
                    fontSize: 64 / 400 * bgHeight,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );

      case UserLiveLabelType.bubble:
        return PositionedDirectional(
          start: 2,
          top: 3,
          child: IgnorePointer(
            child: Container(
              width: 28,
              height: 13,
              alignment: AlignmentDirectional.center,
              child: Text(
                liveLabel!,
                style: const TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );

      case UserLiveLabelType.effect:
        return PositionedDirectional(
          start: 0,
          top: 0,
          child: IgnorePointer(
            child: Container(
              width: 120 / 132 * bgHeight,
              height: 44 / 132 * bgHeight,
              alignment: AlignmentDirectional.center,
              child: Text(
                liveLabel!,
                style: TextStyle(
                    fontSize: 32 / 132 * bgHeight,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
