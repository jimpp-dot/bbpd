import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/collection_room_api.dart';

class CollectionRoomMainViewModel extends ChangeNotifier {
  bool disposed = false;

  bool isRequesting = false;

  int curTabIndex = 0;

  ResExhibitTab? tabRes;

  final Map<String, List<ExhibitIndexData>> _cachedTabIndexMap = {};

  @override
  dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (disposed) return;
    super.notifyListeners();
  }

  CollectionRoomMainViewModel() {
    disposed = false;

    /// do some init here...

    _loadData();
  }

  _loadData() async {
    _setIsRequesting(true);
    final tabRes = await CollectionRoomApi.requestCollectionRoomTabs();
    if (!Util.isNullOrEmpty(tabRes.msg)) {
      Fluttertoast.showToast(msg: tabRes.msg);
    }
    if (tabRes.success) {
      _setTabRes(tabRes);

      /// 加载当前Tab下的数据
      _setCurrentTabIndex(0);
      final curTab = tabRes.data.first;
      await _loadCollectionLevelList(type: curTab.type);
    }

    _setIsRequesting(false);
  }

  /// 获取物品等级列表
  Future _loadCollectionLevelList({required String type}) async {
    final indexRes =
        await CollectionRoomApi.requestCollectionLevelList(type: type);
    if (!Util.isNullOrEmpty(indexRes.msg)) {
      Fluttertoast.showToast(msg: indexRes.msg);
      return;
    }
    if (indexRes.success) {
      _setTabIndexList(type, indexRes.data);
    }
    return;
  }

  /// 获取收藏品的等级列表
  List<ExhibitIndexData>? getCollectionLevelList(String type) {
    if (_cachedTabIndexMap.containsKey(type)) {
      return _cachedTabIndexMap[type];
    }
    return null;
  }

  _setTabRes(ResExhibitTab value) {
    tabRes = value;
    notifyListeners();
  }

  _setIsRequesting(bool value) {
    isRequesting = value;
    notifyListeners();
  }

  _setTabIndexList(String type, List<ExhibitIndexData> value) {
    _cachedTabIndexMap[type] = value;

    notifyListeners();
  }

  _setCurrentTabIndex(int value) {
    curTabIndex = value;
    notifyListeners();
  }

  actionForRefresh() {
    _loadData();
  }

  actionForChangeTabIndex(int index) async {
    if (tabRes == null) return;

    if (isRequesting) return;

    if (index < tabRes!.data.length) {
      final changeTab = tabRes!.data[index];
      Log.d('切换到Tab:${changeTab.name}');

      _setCurrentTabIndex(index);

      final type = changeTab.type;

      if (!_cachedTabIndexMap.containsKey(type) ||
          (_cachedTabIndexMap[type]?.isEmpty ?? true)) {
        /// 加载数据
        // _setIsRequesting(true);
        await _loadCollectionLevelList(type: type);
        // _setIsRequesting(false);
      }
    }
  }
}
