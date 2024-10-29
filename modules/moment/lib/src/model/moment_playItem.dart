import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class MomentVideoProvider extends ChangeNotifier {
  int playItemID = 999;
  final Map<String, bool> _activeMap = {};
  final Map<String, int> _scorllStateMap = {};

  // 静态私有成员，没有初始化
  MomentVideoProvider();

  void changePlayItemId(value) {
    playItemID = value;
    notifyListeners();
  }

  bool active(MomentFlowPage pageKey) {
    return _activeMap[pageKey.toString()] ?? false;
  }

  void setActive(MomentFlowPage pageKey, bool active, {bool notify = true}) {
    _activeMap[pageKey.toString()] = active;
    if (notify) notifyListeners();
  }

  int scrollState(MomentFlowPage? pageKey) {
    return _scorllStateMap[pageKey?.toString()] ?? 1;
  }

  void setScrollState(MomentFlowPage pageKey, int state) {
    _scorllStateMap[pageKey.toString()] = state;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}
