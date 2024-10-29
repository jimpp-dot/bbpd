import 'dart:convert';

import 'package:shared/shared.dart' hide RoomListItem;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../k.dart';
import '../../rank.dart';

class LiveList extends StatefulWidget {
  final String type;
  final AsyncCallback? tableViewScrollTop;
  final bool isFirstTab;
  final EdgeInsetsGeometry? listPadding;
  final RoomListItemBuilder? itemBuilder;

  const LiveList(
    this.type,
    Key? key,
    this.tableViewScrollTop,
    this.isFirstTab, {
    this.listPadding = const EdgeInsets.all(0),
    this.itemBuilder,
  }) : super(key: key);

  @override
  LiveListState createState() {
    return LiveListState();
  }
}

class LiveListState extends State<LiveList>
    with AutomaticKeepAliveClientMixin<LiveList> {
  late LoadMoreListSource source;
  AsyncCallback? _tableViewScrollTop;
  late String type;

  String? _errorMsg;

  set errorMsg(String? msg) {
    _errorMsg = msg;
  }

  @override
  void initState() {
    super.initState();
    _tableViewScrollTop = widget.tableViewScrollTop;
    type = widget.type;
    source = LoadMoreListSource(state: this);
    if (widget.isFirstTab == true) {
      // 默认展示TAB，初次从其他TAB移回需要刷新
      refreshIndex++;
    }
    source.refresh();
  }

  @override
  void dispose() {
    source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (type != widget.type) {
      // tab更新，type变换，重新拉取数据
      Log.d('livelist build type = $type, widget.type = ${widget.type}');
      type = widget.type;
      source.refresh(false);
    }

    var child = LoadingMoreList<RoomItemModel>(ListConfig<RoomItemModel>(
//      physics: const ClampingScrollPhysics(),
      padding: widget.listPadding ?? const EdgeInsets.all(0),
      itemBuilder: (c, item, index) {
        RoomItemModel room = source[index];
        if (widget.itemBuilder != null) {
          return widget.itemBuilder!(room, RoomFrom(type, RoomFrom.live));
        }
        return RoomListItem(
            room: room, roomFrom: RoomFrom(type, RoomFrom.live));
      },
//      itemExtent: 92.0,
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: source,
      indicatorBuilder: _indicatorBuilder,
      extendedListDelegate: ExtendedListDelegate(
          viewportBuilder: (type == 'rcmd' || type == 'young')
              ? _handleExposureReport
              : null // 仅推荐和新秀TAB做曝光上报
          ),
    ));

    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        source.refresh();
      },
      backgroundColor: R.color.mainBgColor,
      child: NestedScrollViewInnerScrollPositionKeyWidget(
          Key('live_$type'), child),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return Container(
        height: 0,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _errorMsg,
        onTap: () {
          source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(errorMessage: _errorMsg, loadMore: source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: K.rank_no_data,
        onTap: () {
          source.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  @override
  bool get wantKeepAlive => type == widget.type;

  /// 第一次移动到该TAB，会在initState处刷新，需要避免重复刷新
  int refreshIndex = 0;

  void refresh() {
    refreshIndex++;
    if (!source.isLoading) {
      if (refreshIndex == 1 && source.isNotEmpty) {
        return;
      }
      source.refresh();
    }
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
//    Log.d('livelist-$type._handleExposureReport first: $firstIndex, last: $lastIndex');
    if (source.isLoading && source.isEmpty) return;

    int maxNum = source.length;

    List<int> rids = [];

    for (int i = firstIndex; i < lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;
      RoomItemModel item = source.elementAt(i);
      if (!item.exposured) {
        item.exposured = true;
        rids.add(item.rid);
//        Log.d('livelist-$type._handleExposureReport, ${item.roomName}');
      }
    }

    if (type == 'rcmd') {
      Session.setBrowseRids(rids);
    }
  }
}

class LoadMoreListSource extends LoadingMoreBase<RoomItemModel> {
  LiveListState state;

  LoadMoreListSource({required this.state});

  int _pageIndex = 0;

  bool _hasMore = true;

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    Log.d(
        'livelist ${state.type} loadData, isloadMoreAction: $isloadMoreAction, this.length: $length');
    bool success;
    if (isloadMoreAction) {
      // 加载更多
      success = await _loadMore();
    } else {
      // 新加载
      if (state._tableViewScrollTop != null) {
        // 如果不在顶部，滑动到顶部
        state._tableViewScrollTop!();
      }
      _pageIndex = 0;
      _hasMore = true;
      success = await _loadMore();
    }

    return success;
  }

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  Future<bool> _load(int page) async {
    try {
      String url = '${System.domain}list/live/?type=${state.type}&page=$page';

      Map<String, String> post = {};

      if (state.type == 'rcmd') {
        post['browseRids'] = json.encode(await Session.browseRids);
      }

      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      Map res = response.response as Map;
      Log.d(res);

      if (page == 1) {
        // 重新加载第一页数据，清除列表中历史数据
        clear();
      }

      List list = res['data']['list'];
      for (int i = 0; i < list.length; i++) {
        Map item = list[i];
        try {
          add(RoomItemModel.fromJson(item));
        } catch (e) {
          Log.d(e);
        }
      }

      _pageIndex = page;
      state.errorMsg = null;

      _hasMore = (res['data']['more'] == 1);

      return true;
    } catch (e) {
      Log.d('catch: ${e.toString()}');
      String message = e.toString();
      if (e is XhrError) {
        Log.d(e.code.toString());
      }
      state.errorMsg = message;
      return false;
    }
  }

  Future<bool> _loadMore() async {
    state.errorMsg = null;
    return _load(_pageIndex + 1);
  }
}

class LiveExposureItem {
  final int rid;
  final String tab;
  final String room_type;

  LiveExposureItem(this.rid, this.tab, this.room_type);

  Map<String, dynamic> toJson() =>
      {'rid': rid, 'tab': tab, 'room_type': room_type};
}
