import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/assets.dart';

class MomentPublishWidget extends StatelessWidget {
  final GestureTapCallback onTap;

  const MomentPublishWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      bottom: 32,
      end: 4,
      child: GestureDetector(
        onTap: onTap,
        child: R.img(
          Assets.ic_moment_publish_webp,
          width: 92,
          height: 92,
          package: Assets.package,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
