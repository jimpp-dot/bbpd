import 'package:flutter/material.dart';

import '../shared.dart';

class UserPopularity extends StatelessWidget {
  final int? popularityLevel;
  final double height;

  final EdgeInsetsGeometry? padding;

  const UserPopularity({
    super.key,
    this.popularityLevel,
    this.height = 26,
    this.padding = EdgeInsets.zero,
  });

  String get _iconUrl => '${System.imageDomain}static/core/popularity/popularity_$popularityLevel.webp';

  @override
  Widget build(BuildContext context) {
    if (popularityLevel == null || popularityLevel! <= 0) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: CachedNetworkImage(
        imageUrl: _iconUrl,
        height: height,
        fit: BoxFit.fitHeight,
        placeholder: SizedBox(width: 123 / 75 * height),
      ),
    );
  }
}
