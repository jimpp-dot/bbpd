import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class IPremadeManager extends IResourceLoader {
  /// 游戏快速匹配
  Future openPremadeGameScreen(BuildContext context,
      {String type = "", int quick = 0});

  /// 检查是否匹配中，并拦截
  Future<bool> checkMatchAndIntercept();
}
