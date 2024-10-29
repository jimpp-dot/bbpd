import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 明星歌手标签
class UserStarSingerWidget extends StatelessWidget {
  final int? level;
  final EdgeInsetsGeometry? padding;
  final double height;

  const UserStarSingerWidget(
      {super.key, this.level = 1, this.padding, this.height = 22.0});

  @override
  Widget build(BuildContext context) {
    if (level == null || level! <= 0 || level! > 7)
      return const SizedBox.shrink();

    return Container(
      padding: padding ?? EdgeInsetsDirectional.zero,
      child: R.img('ic_singer_$level.webp',
          width: height * 200 / 78,
          height: height,
          package: ComponentManager.MANAGER_BASE_CORE),
    );
  }
}
