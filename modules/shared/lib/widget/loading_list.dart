import 'package:shared/component/no_data.dart' as NoData;
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../shared.dart';

class PageLoadingList<T> extends StatefulWidget {
  final void Function(PageListResponse response)? onFirstPageData;
  final Future<PageListResponse<T>> Function(int page) loadData;
  final Widget Function(BuildContext context, dynamic item, int index)
      itemBuilder;
  final ExtendedListDelegate? extendedListDelegate;
  final LoadingMoreIndicatorBuilder? indicatorBuilder;
  final Widget? errorWidget;
  final Widget? noDataWidget;
  final Axis scrollDirection;
  final double? itemExtent;
  final ScrollController? scrollController;
  final bool suppDark;

  const PageLoadingList({
    super.key,
    required this.loadData,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.onFirstPageData,
    this.extendedListDelegate,
    this.indicatorBuilder,
    this.itemExtent,
    this.scrollController,
    this.noDataWidget,
    this.errorWidget,
    this.suppDark = false,
  });

  @override
  PageLoadingListState createState() => PageLoadingListState<T>();
}

class PageLoadingListState<T> extends State<PageLoadingList<T>>
    with AutomaticKeepAliveClientMixin {
  late _LoadingSource<T> _source;

  @override
  void initState() {
    super.initState();
    _source = _LoadingSource(this);
    _source.refresh();
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  void refresh([bool notifyStateChanged = false]) {
    _source.refresh(notifyStateChanged);
  }

  String errorMsg() {
    return _source.errorMsg;
  }

  List<T> get data {
    return _source;
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    Widget? indicatorWidget;
    if (widget.indicatorBuilder != null) {
      indicatorWidget = widget.indicatorBuilder!(context, status);
      if (indicatorWidget != null) return indicatorWidget;
    }

    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(
        hasMore: true,
        textColor: widget.suppDark ? R.colors.secondTextColor : null,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const SizedBox.shrink();
    } else if (status == IndicatorStatus.fullScreenError) {
      return widget.errorWidget ??
          Center(
            child: SingleChildScrollView(
              child: ErrorData(
                error: _source.errorMsg,
                fontColor: widget.suppDark ? R.colors.secondTextColor : null,
                onTap: () {
                  _source.refresh();
                },
              ),
            ),
          );
    }
    if (status == IndicatorStatus.empty) {
      return widget.noDataWidget ??
          Center(
            child: SingleChildScrollView(
              child: NoData.EmptyWidget(
                desc: BaseK.K.no_data,
                textColor: widget.suppDark ? R.colors.secondTextColor : null,
                onTap: () {
                  _source.refresh();
                },
              ),
            ),
          );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: _source.errorMsg,
        loadMore: _source.loadMore,
        textColor: widget.suppDark ? R.colors.secondTextColor : null,
      );
    } else {
      return LoadingFooter(
        hasMore: _source.hasMore,
        loadMore: _source.loadMore,
        textColor: widget.suppDark ? R.colors.secondTextColor : null,
      );
    }
  }

  Widget _buildList() {
    LoadingMoreList child = LoadingMoreList<T>(
      ListConfig<T>(
        itemExtent: widget.itemExtent,
        itemBuilder: widget.itemBuilder,
        scrollDirection: widget.scrollDirection,
        lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
        sourceList: _source,
        indicatorBuilder: _indicatorBuilder,
        extendedListDelegate: widget.extendedListDelegate,
        controller: widget.scrollController,
      ),
    );

    return RefreshIndicatorFactory.of(
      backgroundColor: R.color.mainBgColor,
      child: child,
      onRefresh: () => _source.refresh(),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildList();
  }

  @override
  bool get wantKeepAlive => true;
}

class _LoadingSource<T> extends LoadingMoreBase<T> {
  final PageLoadingListState state;
  static const int _firstPageIndex = 1;

  _LoadingSource(this.state);

  int _pageIndex = _firstPageIndex;
  bool _hasMore = true;
  String errorMsg = '';

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _pageIndex = _firstPageIndex;
      _hasMore = true;
    }

    bool loadSuccess = false;
    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;
    PageListResponse<T> rsp =
        await state.widget.loadData(page) as PageListResponse<T>;
    if (rsp.success) {
      if (page == _firstPageIndex) {
        clear();
      }

      if (rsp.items != null && rsp.items!.isNotEmpty) {
        addAll(rsp.items!);
        _pageIndex = page;

        if (rsp.hasMore == false) {
          _hasMore = false;
        } else {
          _hasMore = true;
        }
      } else {
        _hasMore = false;
      }

      loadSuccess = true;
    } else {
      errorMsg = rsp.msg ?? '';
      loadSuccess = false;
    }

    if (state.widget.onFirstPageData != null && page == _firstPageIndex)
      state.widget.onFirstPageData!(rsp);

    return loadSuccess;
  }
}

mixin PageListResponse<T> on BaseResponse {
  List<T>? get items;

  bool get hasMore => true;
}
