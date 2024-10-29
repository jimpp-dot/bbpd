import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

BoxShadow getCardBoxShadow({Color? color}) {
  return BoxShadow(
    offset: const Offset(0.0, 4.0),
    blurRadius: 8.0,
    spreadRadius: 2.0,
    color: color ?? R.color.dividerColor.withOpacity(0.05),
  );
}

BoxShadow getHomeBoxShadow({Color? color}) {
  return BoxShadow(
    offset: const Offset(0.0, 4.0),
    blurRadius: 12.0,
    spreadRadius: 4.0,
    color: color ?? R.color.dividerColor.withOpacity(0.05),
  );
}
