import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class SettingDividerWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final double height;
  final Color? color;

  const SettingDividerWidget({
    super.key,
    this.height = 0.5,
    this.margin = const EdgeInsetsDirectional.fromSTEB(18, 10, 18, 10),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      color: color ?? R.color.dividerColor,
    );
  }
}
