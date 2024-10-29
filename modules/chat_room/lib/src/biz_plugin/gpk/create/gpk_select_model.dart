import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import '../gpk_constants.dart';

class GPKSelPosItem {
  /// 是否是空闲状态
  late bool isIdle;

  int uid = -1;
  String avatarUrl = '';
  String name = '';
  GPKCamp? camp;

  /// 无人
  GPKSelPosItem.idle() {
    isIdle = true;
  }

  /// 有人，活跃
  GPKSelPosItem.active(this.uid, this.avatarUrl, this.name, this.camp) {
    isIdle = false;
  }

  @override
  String toString() {
    return 'GPKSelPosItem{isIdle: $isIdle, uid: $uid, name: $name, camp: $camp, avatarUrl: $avatarUrl,}';
  }
}

class GPKSelPosModel extends ChangeNotifier {
  List<GPKSelPosItem> _list = [];

  refreshList(ChatRoomData room) {
    List<GPKSelPosItem> newPosList = [];

    // Log.d('gpk refreshList before--> ${_list.length}');
    // for (var i = 0; i < _list.length; i++) {
    //   Log.d('gpk before--> $i : ${_list[i]}');
    // }

    // 遍历当前的麦位信息，同时从之前选中的阵营设置阵营
    for (var p in room.positions) {
      GPKSelPosItem item;
      if (p.uid > 0) {
        // 老数据只需要映射阵营
        var oldItem = _list.firstWhereOrNull((e) => e.uid == p.uid);
        item = GPKSelPosItem.active(p.uid, p.icon, p.name, oldItem?.camp);
      } else {
        item = GPKSelPosItem.idle();
      }
      newPosList.add(item);
    }
    _list = newPosList;

    // Log.d('gpk refreshList end--> ${_list.length}');
    // for (var i = 0; i < _list.length; i++) {
    //   Log.d('gpk end--> $i : ${_list[i]}');
    // }

    notifyListeners();
  }

  GPKSelPosItem getHead() {
    return _list[0];
  }

  void notify() {
    notifyListeners();
  }

  /// 返回中间内容区域的集合
  List<GPKSelPosItem> getContentPosList() {
    return (ChatRoomData.getInstance()?.isEightPosition ?? false)
        ? _list
        : _list.sublist(1);
  }

  List<GPKSelPosItem> getCampPos(GPKCamp camp) {
    return _list.where((e) => e.camp == camp).toList();
  }

  /// 是否到达单边阵营最大选择人数
  bool isReachMaxCampNum(GPKCamp camp) {
    return getCampPos(camp).length >= MAX_SELECT_NUM;
  }
}
