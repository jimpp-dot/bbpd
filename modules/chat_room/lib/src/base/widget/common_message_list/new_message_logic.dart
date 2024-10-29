import 'package:get/get.dart';

/// 房间公屏TAB，新消息红点
class NewMessageLogic extends GetxController {
  final Map<int, bool> _newMsg = {};

  void add(int rid) {
    if (!_newMsg.containsKey(rid)) {
      _newMsg[rid] = false;
    }
  }

  void change(int rid, bool hasNewMsg) {
    _newMsg[rid] = hasNewMsg;
    update();
  }

  bool hasNewMsg(int rid) {
    if (_newMsg.containsKey(rid)) {
      return _newMsg[rid]!;
    }
    return false;
  }

  void clear() {
    _newMsg.clear();
  }
}
