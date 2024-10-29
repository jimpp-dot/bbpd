import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:personaldata/src/collection_room/mixin/collection_list_view_model_mixin.dart';

/// 单个品级下的座驾列表ViewModel
class MountsListViewModel extends ChangeNotifier
    with CollectionListViewModelMix {
  bool disposed = false;

  /// 当前展示的座驾
  ExhibitCommodityItem? currentShowMounts;

  int currentShowIndex = 0;

  @override
  dispose() {
    disposed = true;

    /// do some dispose here...
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (disposed) return;
    super.notifyListeners();
  }

  MountsListViewModel(ExhibitIndexData data) {
    disposed = false;

    /// do some init here...
    this.data = data;

    if (data.gradeCommodity.isNotEmpty) {
      /// 默认展示第一个
      _setCurrentShowIndex(0);
      _setCurrentMounts(data.gradeCommodity.first);
    }

    setAllItemsList(this.data.gradeCommodity);
  }

  _setCurrentMounts(ExhibitCommodityItem value) {
    currentShowMounts = ExhibitCommodityItem.fromBuffer(value.writeToBuffer());
    notifyListeners();
  }

  _setCurrentShowIndex(int value) {
    currentShowIndex = value;
    notifyListeners();
  }

  actionForChangeCurrentShowMounts(int index) {
    if (index < allItems.length) {
      _setCurrentShowIndex(index);
      _setCurrentMounts(allItems[index]);
    }
  }

  actionForCurrentMountsShowOutOrNot() async {
    Log.d('点击对外展示');
    if (currentShowMounts != null) {
      final tmpData = ExhibitCommodityItem.create()
        ..mergeFromBuffer(currentShowMounts!.writeToBuffer());
      final showed = tmpData.pinned.toPbBool();
      final result = await actionForShowOutOrNot(tmpData);
      if (result) {
        tmpData.pinned = (!showed) ? 1 : 2;
        _setCurrentMounts(tmpData);
      }
    }
  }
}
