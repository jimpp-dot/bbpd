import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:premade/src/premadeFloatWindow.dart';
import 'package:premade/src/premadeV2GameScreen.dart';

class PremadeManager extends IPremadeManager {
  /// [quick] 1.首页快速匹配按钮,   其他场景不用传
  @override
  Future openPremadeGameScreen(BuildContext context,
      {String type = "", int quick = 0}) {
    return PremadeV2GameScreen.show(context, type: type, quick: quick);
  }

  @override
  Future<bool> checkMatchAndIntercept() {
    return PremadeFloatingWindow.checkAndIntercept();
  }
}
