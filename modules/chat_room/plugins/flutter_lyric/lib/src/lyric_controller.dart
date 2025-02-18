import 'dart:async';

import 'package:flutter/cupertino.dart';

class LyricController extends ChangeNotifier {
  //启用动画
  final TickerProvider vsync;

  LyricController({required this.vsync, this.draggingTimerDuration});

  //当前进度
  Duration _progress = Duration.zero;

  set progress(Duration value) {
    _progress = value;
    notifyListeners();
  }

  Duration get progress => _progress;

  //滑动保持器
  Timer? draggingTimer;

  //滑动保持时间
  Duration? draggingTimerDuration;

  bool _isDragging = false;

  get isDragging => _isDragging;

  set isDragging(value) {
    _isDragging = value;
    notifyListeners();
  }

  Duration draggingProgress = Duration.zero;

  Function? draggingComplete;

  double draggingOffset = 0;

  //动画控制器
  AnimationController? animationController;

  //动画 存放上一次偏移量
  double previousRowOffset = 0;

  int oldLine = 0;
  int draggingLine = 0;
}
