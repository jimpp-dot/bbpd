import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 七夕勋章
class SevenLoveWidget extends StatelessWidget {
  final int rank; // 排名 1 2 3
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;

  const SevenLoveWidget(
      {super.key,
      required this.rank,
      this.width,
      this.height = 22,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    if (rank <= 0 || rank > 3) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: R.img(
        'ic_qixi_rank_$rank.webp',
        width: height * 70 / 26,
        height: height,
        fit: BoxFit.contain,
        package: ComponentManager.MANAGER_BASE_CORE,
      ),
    );
  }
}
