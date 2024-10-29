import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/collection_room_util.dart';
import 'package:personaldata/K.dart';
import '../collection_room_api.dart';

/// 单个等级下物品列表ViewModel的mixin
mixin CollectionListViewModelMix on ChangeNotifier {
  /// 单个等级model
  late ExhibitIndexData data;

  /// 所有数据
  List<ExhibitCommodityItem> allItems = [];

  setAllItemsList(List<ExhibitCommodityItem> value) {
    /// 为了确保对象一定有变化
    allItems = value.toList();
    notifyListeners();
  }

  /// 点击展示或取消展示
  Future<bool> actionForShowOutOrNot(ExhibitCommodityItem data) async {
    bool curShowOut = data.pinned.toPbBool();

    if (curShowOut) {
      /// 已展示，点击取消展示，需弹出二次确认框
      bool result = await showDialog(
          context: System.context,
          builder: (context) {
            return ConfirmDialog(
              title: K.personal_cr_cancel_show_confirm,
            );
          });

      if (!result) return false;
    }

    final res = await CollectionRoomApi.requestShowOutOrNot(
        cid: data.cid, level: data.grade);
    if (!Util.isNullOrEmpty(res.msg)) {
      Fluttertoast.showToast(msg: res.msg);
    }

    if (res.success) {
      if (Util.isNullOrEmpty(res.msg)) {
        Fluttertoast.showToast(
            msg: !curShowOut
                ? K.personal_cr_show_success
                : K.personal_cr_cancel_show);
      }

      /// 发送变更消息
      eventCenter.emit(CollectionRoomUtil.messageDisplayItemsDidChange);

      /// 更新数据
      var tmpList = allItems.toList();
      int oldDataIndex =
          tmpList.indexWhere((element) => element.cid == data.cid);
      if (oldDataIndex >= 0) {
        Log.d('更新数据成功');
        tmpList[oldDataIndex].pinned = !curShowOut ? 1 : 2;
      }
      setAllItemsList(tmpList.toList());
    }
    return res.success;
  }
}
