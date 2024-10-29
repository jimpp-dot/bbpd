import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class KtvTheme {
  static var mainBrandColor = R.color.mainBrandColor;
  static Brightness statusBrightness = R.color.statusBarTheme;
  static var mainBgColor = R.color.mainBgColor;
  static var secondBgColor = R.color.secondBgColor;
  static var mainTextColor = R.color.mainTextColor;

  static get songListDescribeTextColor => R.brightness == Brightness.dark
      ? R.color.mainTextColor
      : const Color(0xFF202020);
  static var secondTextColor = R.color.secondTextColor;
  static var formBg = R.color.secondBgColor;
  static var formHintColor = R.color.thirdTextColor;
  static var cursorColor = R.color.mainBrandColor;
  static var searchCardBg = secondBgColor;

  static List<Color> gradientColors = R.color.mainBrandGradientColors;
  static const List<Color> gradientColorsDisable = <Color>[
    Color(0xFFD5D8E0),
    Color(0xFFE4E7EE)
  ];

  static LinearGradient lyricGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.black.withOpacity(0.6),
      Colors.black.withOpacity(0.0),
      Colors.black.withOpacity(0.0),
      Colors.black.withOpacity(0.0),
      Colors.black.withOpacity(0.6),
    ],
    stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
  );
}
