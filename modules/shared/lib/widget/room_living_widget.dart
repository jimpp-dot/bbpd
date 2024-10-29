import 'package:flutter/material.dart';

import '../shared.dart';

class RoomLivingWidget extends StatelessWidget {
  final double? size;
  final Color? color;

  const RoomLivingWidget({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: R.img(
        "living_small.webp",
        width: size ?? 16,
        height: size ?? 16,
        color: color,
        package: ComponentManager.MANAGER_BASE_CORE,
      ),
    );
  }
}
