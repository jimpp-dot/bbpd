import 'package:get/get.dart';

/// 当前在哪个房间公屏Tab，只有在本房间公屏Tab，底部控制栏才允许发言
class MessageTabLogic extends GetxController {
  int currentTabRid = 0;

  MessageTabLogic({required this.currentTabRid});

  void change(int rid) {
    currentTabRid = rid;
    update();
  }
}
