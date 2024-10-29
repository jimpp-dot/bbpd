import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 心动速配，戴帽子的头像
class CpHeartHatAvatar extends StatelessWidget {
  final String icon;
  final int level;
  final bool man;
  final double size;
  final String? headUrl;

  /// 服务端下发的帽子资源

  const CpHeartHatAvatar({
    Key? key,
    required this.icon,
    required this.level,
    required this.man,
    required this.size,
    this.headUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double overflow = 5.0;

    Widget hatWidget;

    if (Util.validStr(headUrl)) {
      hatWidget = PositionedDirectional(
        top: -overflow,
        start: -overflow,
        child: SizedBox(
          width: size + overflow * 2,
          height: size + overflow * 2,
          child: IgnorePointer(
            child: CachedNetworkImage(
              imageUrl: Util.getCpHatImgUrl(headUrl ?? ''),
              width: size + overflow * 2,
              height: size + overflow * 2,
              errorWidget: const SizedBox.shrink(),
            ),
          ),
        ),
      );
    } else {
      String head = R.imagePath(
        man
            ? 'cplove/cp_heart_hat_b$level.webp'
            : 'cplove/cp_heart_hat_g$level.webp',
        package: ComponentManager.MANAGER_BASE_ROOM,
      );
      hatWidget = PositionedDirectional(
        top: -overflow,
        start: -overflow,
        child: SizedBox(
          width: size + overflow * 2,
          height: size + overflow * 2,
          child: IgnorePointer(
            child: Image.asset(head),
          ),
        ),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CommonAvatar(
          path: icon,
          shape: BoxShape.circle,
          size: size,
        ),
        hatWidget
      ],
    );
  }
}
