import 'package:shared/shared.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

class RespModel<T> {
  /// 是否请求成功
  final bool isSuccess;

  /// 是否还有更多数据
  final bool hasMore;

  /// 数据列表
  final List<T> list;

  /// 返回提示信息
  final String? msg;

  /// 额外数据，例如我的排行
  final T? extra;

  /// 请求最后一条数据id
  final int lastId;

  RespModel({
    required this.isSuccess,
    required this.hasMore,
    required this.list,
    this.msg,
    this.extra,
    this.lastId = 0,
  });
}

typedef LoadData<T> = Future<RespModel<T>> Function(int pageIndex, int lastId);

/// 支持下拉刷新和上拉加载更多（目前只支持了list，后续有需要可以扩展grid等）
mixin RefreshAndLoadMoreListMixin<T extends StatefulWidget, M> on State<T> {
  late final _RefreshAndLoadMoreSource<M> source;

  Color? get tipsColor => null;

  /// 是否支持下拉刷新
  bool get canRefresh => true;

  /// 第一页索引
  int get firstPageIndex => 1;

  /// 初始化时是否主动刷新
  bool get initialRefresh => true;

  Future<RespModel<M>> loadData(int pageIndex, int lastId);

  Widget buildItem(int index, M item);

  bool onFilter(M item) => true;

  @override
  void initState() {
    super.initState();
    source = _RefreshAndLoadMoreSource(
      loadData,
      canRefresh: canRefresh,
      firstPageIndex: firstPageIndex,
      initialRefresh: initialRefresh,
    );
  }

  /// 构建列表组件
  Widget buildList({EdgeInsetsGeometry? listPadding}) {
    List<M> list = source.list.where(onFilter).toList();
    switch (source.screenStatus) {
      case ScreenStatus.Loading:
        return const Loading();
      case ScreenStatus.Error:
        return buildErrorData();
      case ScreenStatus.Empty:
        return buildEmptyData();
      case ScreenStatus.Ready:
        return SmartRefresher(
          controller: source.refreshController,
          enablePullDown: source.canRefresh,
          enablePullUp: source.canLoadMore,
          header: const MaterialClassicHeader(),
          onRefresh: _refreshData,
          onLoading: _loadMoreData,
          child: ListView.builder(
            padding: listPadding,
            itemBuilder: (_, index) => buildItem(index, list[index]),
            itemCount: list.length,
          ),
        );
    }
  }

  Widget buildErrorData() {
    return Center(
      child: ErrorData(
          fontColor: tipsColor, onTap: _refreshData, error: source.errorMsg),
    );
  }

  Widget buildEmptyData() {
    return Center(
      child: EmptyWidget(textColor: tipsColor, onTap: _refreshData),
    );
  }

  Future<void> _refreshData() async {
    await source.refreshData();
    refresh();
  }

  Future<void> _loadMoreData() async {
    await source.loadMoreData();
    refresh();
  }
}

class _RefreshAndLoadMoreSource<T> {
  final LoadData<T> loadData;

  /// 能否下拉刷新
  final bool canRefresh;

  /// 起始页索引
  final int firstPageIndex;

  /// 初始化时是否刷新
  final bool initialRefresh;

  late final RefreshController _controller;

  RefreshController get refreshController => _controller;

  /// 当前页索引
  late int _pageIndex;

  int get pageIndex => _pageIndex;

  /// 最后一个id
  late int _lastId;

  int get lastId => _lastId;

  late ScreenStatus _screenStatus;

  ScreenStatus get screenStatus => _screenStatus;

  /// 数据源
  final List<T> _list = [];

  List<T> get list => _list;

  /// 是否有更多数据
  bool _hasMore = true;

  /// 能否上拉加载更多
  bool get canLoadMore => _hasMore;

  /// 页面错误提示
  String? _errorMsg;

  String? get errorMsg => _errorMsg;

  T? _extra;

  T? get extra => _extra;

  /// 列表是否为空
  bool get isEmpty => _list.isEmpty;

  _RefreshAndLoadMoreSource(
    this.loadData, {
    required this.canRefresh,
    required this.firstPageIndex,
    required this.initialRefresh,
  }) {
    _pageIndex = firstPageIndex;
    _lastId = 0;
    _controller = RefreshController(initialRefresh: initialRefresh);
    _screenStatus = initialRefresh ? ScreenStatus.Ready : ScreenStatus.Loading;
  }

  /// 下拉刷新
  Future<void> refreshData() async {
    RespModel<T> respData = await loadData(firstPageIndex, 0);
    _syncRefreshData(respData);
  }

  /// 上拉加载更多
  Future<void> loadMoreData() async {
    RespModel<T> respData = await loadData(_pageIndex, _lastId);
    _syncLoadMoreData(respData);
  }

  void _syncRefreshData(RespModel<T> respData) {
    _list.clear(); // 刷新需清空之前数据
    if (respData.isSuccess) {
      _errorMsg = null;
      // 刷新成功
      _pageIndex = firstPageIndex + 1;
      _extra = respData.extra;
      _lastId = respData.lastId;
      if (respData.list.isEmpty) {
        // 返回数据为空
        _hasMore = false;
        _screenStatus = ScreenStatus.Empty;
      } else {
        // 数据返回正常
        _hasMore = respData.hasMore;
        _list.addAll(respData.list);
        _screenStatus = ScreenStatus.Ready;
      }
    } else {
      // 刷新失败，重置状态
      _pageIndex = firstPageIndex;
      _extra = null;
      _lastId = 0;
      _hasMore = true;
      _errorMsg = respData.msg;
      _screenStatus = ScreenStatus.Error;
    }
    _controller.refreshCompleted();
  }

  void _syncLoadMoreData(RespModel<T> respData) {
    if (respData.isSuccess) {
      // 加载成功
      _pageIndex++;
      _lastId = respData.lastId;
      if (respData.list.isEmpty) {
        _hasMore = false;
      } else {
        _hasMore = respData.hasMore;
        _list.addAll(respData.list);
      }
    } else {
      // 加载失败
    }
    _controller.loadComplete();
  }
}
