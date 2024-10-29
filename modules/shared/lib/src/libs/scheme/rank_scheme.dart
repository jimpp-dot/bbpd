import 'package:shared/shared.dart';
import 'package:shared/src/libs/scheme/base_scheme.dart';
import 'package:flutter/material.dart';

IRankManager _manager =
    ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);

/// 歌手榜单
class SingerRankScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.showSingerRankScreen(context);
    return super.jumpToPage(context, qps);
  }
}

/// 主播推荐
class GodRecommendScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.showGodRecommendScreen(context);
    return super.jumpToPage(context, qps);
  }
}
