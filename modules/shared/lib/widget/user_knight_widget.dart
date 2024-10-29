import 'package:flutter/material.dart';
import '../shared.dart';

///骑士守护
class UserKnightWidget extends StatelessWidget {
  final int knightLevel;
  final double height;
  final EdgeInsetsGeometry? padding;

  const UserKnightWidget(
      {super.key,
      required this.knightLevel,
      this.height = 26,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    if (knightLevel <= 0 || Util.isVerify) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: R.img(
        'ic_knight_level_$knightLevel.png',
        package: ComponentManager.MANAGER_BASE_ROOM,
        height: height,
        width: height * 150 / 78,
        fit: BoxFit.contain,
      ),
    );
  }
}
