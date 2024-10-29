import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared/dart_extensions/extensions_common.dart';

/// vip标签
class UserVipNewWidget extends StatelessWidget {
  final int? vip;
  final double? width;
  final double height;
  final bool isGrey; // 是否置灰

  final EdgeInsetsGeometry? padding;

  const UserVipNewWidget({
    super.key,
    this.vip,
    this.width,
    this.height = 26, // 默认高度26，宽度自适应
    this.isGrey = false,
    this.padding = EdgeInsets.zero,
  });

  String get _iconUrl =>
      '${System.imageDomain}static/core/${isGrey ? 'vip_gray' : 'vip'}/vip_$vip.webp';

  @override
  Widget build(BuildContext context) {
    if (vip == null || vip! <= 0) {
      return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: NumText(
          'Lv.$vip',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      );
    }
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: NumText(
        'Lv.$vip',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
