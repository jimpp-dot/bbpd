import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 礼物面板 礼物皮肤顶部提示
class GiftSkinTipsWidget extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String? icon;
  final String? tips;
  final int current;
  final int total;
  final bool inRoom;

  const GiftSkinTipsWidget({
    Key? key,
    this.margin,
    this.icon,
    this.tips,
    this.current = 0,
    this.total = 0,
    this.inRoom = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsetsDirectional.only(start: 4, end: 12),
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: inRoom
            ? const Color(0xFF171621).withOpacity(0.7)
            : R.color.mainBgColor,
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: icon,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              tips ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                color: inRoom ? Colors.white : R.color.mainTextColor,
              ),
            ),
          ),
          if (total > 0) _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    double totalWidth = 67;
    double colorWidth = min(current / total * totalWidth, totalWidth);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$current/$total',
          style: TextStyle(
            fontSize: 12,
            color: inRoom ? Colors.white : R.color.mainTextColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Container(
            width: totalWidth,
            height: 6,
            color: inRoom
                ? Colors.white.withOpacity(0.2)
                : R.color.mainTextColor.withOpacity(0.2),
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              width: colorWidth,
              decoration: ShapeDecoration(
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
                shape: const StadiumBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
