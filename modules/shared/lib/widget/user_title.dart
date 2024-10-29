import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 用户爵位新标签
class UserNobilityWidget extends StatelessWidget {
  static double imageaspectRatio = 156 / 78;
  final int? titleNew;
  final double height;
  final EdgeInsetsGeometry? padding;

  const UserNobilityWidget(
      {super.key,
      required this.titleNew,
      this.height = 26,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    if (NobilityUtil.titleIsInvalid(titleNew)) {
      return const SizedBox.shrink();
    } else {
      return Padding(
          padding: padding ?? EdgeInsets.zero,
          child: NobilityUtil.titleTagImage(
              titleNew!, height * imageaspectRatio + 10, height));
    }
  }
}

class NobilityCornerMarker extends StatelessWidget {
  final int titleNew;
  final double height;
  final EdgeInsetsGeometry? padding;

  const NobilityCornerMarker(
      {super.key,
      required this.titleNew,
      this.height = 48,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    if (NobilityUtil.titleIsInvalid(titleNew)) {
      return const SizedBox.shrink();
    }

    return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: NobilityUtil.titleBigImage(titleNew, height, height));
  }
}
