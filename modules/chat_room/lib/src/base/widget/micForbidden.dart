import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class MicForbidden extends StatelessWidget {
  final bool forbidden;
  final int? micStatus;
  final bool? isBottomCenter;
  final Color? backgroundColor;
  final Color? iconColor;

  const MicForbidden(
      {super.key,
      required this.forbidden,
      this.micStatus,
      this.isBottomCenter,
      this.backgroundColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    if (!forbidden && (micStatus ?? 0) > 0) {
      return const SizedBox.shrink();
    }

    String icon = 'ic_close_mic.svg';
    if (forbidden) {
      icon = 'ic_forbidden_mic.svg';
    }

    if (isBottomCenter == true) {
      return Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: buildIcon(icon),
      );
    }

    return PositionedDirectional(
      end: -4.0,
      bottom: 4.0,
      width: 16.0,
      height: 16.0,
      child: buildIcon(icon),
    );
  }

  Widget buildIcon(String icon) {
    // Color? bgColor = backgroundColor;
    // bgColor ??= Colors.black.withOpacity(0.4);



    return IgnorePointer(
      child: Container(
        width: 16.0,
        height: 16.0,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: R.img(icon,
            package: ComponentManager.MANAGER_BASE_ROOM,
            width: 12,
            height: 12,
            color: iconColor),
      ),
    );
  }
}
