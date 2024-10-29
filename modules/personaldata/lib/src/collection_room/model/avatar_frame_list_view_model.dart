import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:personaldata/src/collection_room/collection_room_api.dart';
import 'package:personaldata/src/collection_room/collection_room_util.dart';
import 'package:personaldata/src/collection_room/mixin/collection_list_view_model_mixin.dart';

/// 头像框单个等级下的列表ViewModel
class AvatarFrameListViewModel extends ChangeNotifier
    with CollectionListViewModelMix {
  late String type;

  bool disposed = false;

  /// 当前用来做展示的最大展示数量,默认6
  late int currentShowMaxCount;

  /// 每次加载更多数据后的期望数据量
  int _expectItemsCount = 0;

  /// 分页索引
  int _page = 1;

  /// 每次拉取的数据量
  final int _pageSize = 24;

  /// 默认最小展示数量
  int _minShowMaxCount = 6;

  /// 是否还有更多数据
  bool hasMore = true;

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

  /// 加载数据
  _loadData({int page = 1, int pageSize = 24}) async {
    final res = await CollectionRoomApi.requestMoreCollections(
      type: type,
      level: data.grade,
      page: page,
    );

    if (res.success) {
      final newItems = res.data;
      bool hasMore = true;
      if (newItems.length < pageSize) {
        Log.d('没有更多数据了');
        hasMore = false;
      } else {
        Log.d('还有更多数据');
      }
      _expectItemsCount += pageSize;

      final tmpList = allItems.toList();
      tmpList.addAll(newItems);
      _setCurrentShowMaxCount(tmpList.length);
      _setHasMoreData(hasMore);
      setAllItemsList(tmpList);
    }
  }

  /// 展开更多数据,如果已经加载过更多数据
  actionForExpandMoreData() async {
    Log.d('allItems.length = ${allItems.length}');
    Log.d('_expectItemsCount = $_expectItemsCount');
    if (_page != 1 && (allItems.length < _expectItemsCount)) {
      /// 表示已经全部展开完成了
      _setCurrentShowMaxCount(allItems.length);
      _setHasMoreData(false);
    } else {
      _page++;
      _loadData(page: _page, pageSize: _pageSize);
    }
  }

  /// 收起更多数据
  actionForPackUpData() {
    /// 将可展示的数据个数重置为最初的6个
    _setCurrentShowMaxCount(_minShowMaxCount);
    _setHasMoreData(true);
  }

  _setCurrentShowMaxCount(int value) {
    currentShowMaxCount = value;
    notifyListeners();
  }

  _setHasMoreData(bool value) {
    hasMore = value;
    notifyListeners();
  }

  AvatarFrameListViewModel(ExhibitIndexData data) {
    disposed = false;
    this.data = data;
    type = Util.isNullOrEmpty(data.gradeCommodity.first.type)
        ? CollectionRoomUtil.avatarFrameTypeKey
        : data.gradeCommodity.first.type;

    /// 初始化数据
    currentShowMaxCount = _minShowMaxCount;
    if (data.gradeCommodity.length < _minShowMaxCount) {
      /// 如果当前列表初始数据量小于默认最小展示数量，则按照初始数据量作为最小展示数量
      _minShowMaxCount = data.gradeCommodity.length;
      currentShowMaxCount = _minShowMaxCount;
    }

    setAllItemsList(data.gradeCommodity);
    _expectItemsCount = allItems.length;
    _setHasMoreData(true);
  }
}
