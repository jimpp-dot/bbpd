import 'package:flutter/cupertino.dart';

import '../../shared.dart';

extension BoxExtension on BoxDecoration {}

commonBoxDecoration({List<Color>? linearGradientColor, double? borderRadius}) =>
    BoxDecoration(
      gradient: LinearGradient(
          colors: linearGradientColor ?? R.dColor.darkGradientColors),
      borderRadius: BorderRadius.circular(borderRadius ?? 24),
    );

commonBoxDecorationWithParams(
        List<Color>? linearGradientColor, double? borderRadius) =>
    BoxDecoration(
      gradient: LinearGradient(
          colors: linearGradientColor ?? R.dColor.darkGradientColors),
      borderRadius: BorderRadius.circular(borderRadius ?? 24),
    );
commonBoxDecorationWithParamsBeginAndEnd(List<Color>? linearGradientColor,
        double? borderRadius, Alignment? begin, Alignment? end) =>
    BoxDecoration(
      gradient: LinearGradient(
          colors: linearGradientColor ?? R.dColor.darkGradientColors,
          begin: begin ?? Alignment.centerLeft,
          end: end ?? Alignment.centerRight),
      borderRadius: BorderRadius.circular(borderRadius ?? 24),
    );

commonBoxDecorationWithParamsAndBorderRadius(
        List<Color>? linearGradientColor, BorderRadius? borderRadius) =>
    BoxDecoration(
      gradient: LinearGradient(
          colors: linearGradientColor ?? R.dColor.darkGradientColors),
      borderRadius: borderRadius ?? BorderRadius.circular(24),
    );

commonBoxDecorationWithParamsAndBorderRadiusBeginAndEnd(
        List<Color>? linearGradientColor,
        BorderRadius? borderRadius,
        Alignment? begin,
        Alignment? end) =>
    BoxDecoration(
      gradient: LinearGradient(
          colors: linearGradientColor ?? R.dColor.darkGradientColors,
          begin: begin ?? Alignment.centerLeft,
          end: end ?? Alignment.centerRight),
      borderRadius: borderRadius ?? BorderRadius.circular(24),
    );

// commonBoxDecorationWithParamsAndBorder() => const BoxDecoration(
//   borderRadius: BorderRadius.only(
//     topLeft: Radius.circular(16),
//     topRight: Radius.circular(16),
//   ),
//   border: GradientBoxBorder(
//     gradient: LinearGradient(
//         colors: [Color(0xFFFDE6D7), Color(0xff2B0656)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//     width: 1,
//   ),
//   gradient: LinearGradient(
//       colors: [Color(0xff201050), Color(0xff32025B)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
// );
