import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart';

class ResponseData {
  List? listData;
  bool hasMore;
  bool success;

  ResponseData({this.listData, required this.hasMore, this.success = true});
}

class LoadMoreBaseListWidget extends StatefulWidget {
  final Widget Function(
    int index,
    dynamic item,
  ) itemBuilder;
  final int firstIndex; //从第几个item开始展示
  final Widget? insertWidget; //前面添加的widget
  final Widget? insertSliverWidget; //前面添加的widget
  final bool showMoreWidget;
  final Future<ResponseData> Function(int page) loadData; //获取数据接口
  final VoidCallback? activeRefreshCallback; //用于通知父页面刷新
  final double? itemHeight;
  final int firstPage;
  final bool showSafeBottomArea;
  final bool ownerController;
  final bool canScroll;

  static LoadMoreBaseListWidgetState? of(BuildContext context) {
    final LoadMoreBaseListWidgetState? result =
        context.findAncestorStateOfType<LoadMoreBaseListWidgetState>();
    return result;
  }

  const LoadMoreBaseListWidget({
    super.key,
    required this.itemBuilder,
    this.itemHeight,
    required this.loadData,
    this.activeRefreshCallback,
    this.showMoreWidget = true,
    this.firstPage = 1,
    this.showSafeBottomArea = true,
    this.insertWidget,
    this.insertSliverWidget,
    this.firstIndex = 0,
    this.ownerController = true,
    this.canScroll = true,
  });

  @override
  LoadMoreBaseListWidgetState createState() => LoadMoreBaseListWidgetState();
}

class LoadMoreBaseListWidgetState extends State<LoadMoreBaseListWidget> {
  bool _loading = true;
  bool _loadingFailed = false;
  bool _more = true;
  List _listData = [];
  int _actualNum = 0;
  int _page = 1;
  late ScrollController _controller;

  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return _renderBody();
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_onScroll);
    _handleData(widget.firstPage);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  reloadData() {
    _handleData(widget.firstPage);
  }

  Future<void> _onRefresh() async {
    _handleData(widget.firstPage);
    if (widget.activeRefreshCallback != null) {
      widget.activeRefreshCallback!();
    }
  }

  scrollToTop() {
    if (!_controller.hasClients) return;
    _controller.animateTo(0.0,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }

  _onScroll() async {
    if (!_controller.hasClients) return;
    //加载更多
    if (_more == true &&
        _controller.position.maxScrollExtent == _controller.offset) {
      _handleData(_page);
      // if (mounted) setState(() {});
    }
  }

  List get items {
    return _listData;
  }

  void deleteItem(dynamic item) {
    if (mounted) {
      setState(() {
        _listData.remove(item);
      });
    }
  }

  void clearItems() {
    if (mounted) {
      setState(() {
        _listData.clear();
      });
    }
  }

  _handleData(int page) async {
    _loading = true;
    if (widget.firstPage == page) {
      _listData.clear();
      _actualNum = 0;
      _page = widget.firstPage;
    }
    ResponseData responseData = await widget.loadData(page);
    _loading = false;
    if (!responseData.success) {
      //数据获取失败
      if (mounted) {
        setState(() {
          _loadingFailed = true;
        });
      }
    } else {
      if (responseData.listData == null || responseData.listData!.isEmpty) {
        _more = false;
      } else {
        _more = responseData.hasMore;
        if (page > widget.firstPage) {
          _listData.addAll(responseData.listData!);
        } else {
          _listData = List.from(responseData.listData!);
          _actualNum = _listData.length;
          if (widget.firstIndex > 0) {
            _listData.removeRange(
                0,
                (widget.firstIndex >= _listData.length)
                    ? _listData.length
                    : widget.firstIndex);
          }
        }
        _page = page + 1;
      }
      if (mounted) {
        setState(() {
          _loadingFailed = false;
        });
      }
    }
  }

  Widget _renderBody() {
    if (_loading && _listData.isEmpty) {
      //首次加载
      return const Center(
        child: Loading(),
      );
    }

    if (_loadingFailed && _listData.isEmpty) {
      //首次请求失败
      return Center(
        child: ErrorData(
          onTap: _onRefresh,
        ),
      );
    }

    if (!_loading && _listData.isEmpty && _actualNum == 0) {
      //暂无数据
      return Center(
        child: ErrorData(
          error: K.no_data,
          onTap: _onRefresh,
        ),
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: RefreshIndicatorFactory.of(
                key: _key, onRefresh: _onRefresh, child: _buildContent()),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return CustomScrollView(
      physics: widget.canScroll
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      controller: widget.ownerController ? _controller : null,
      slivers: <Widget>[
        if (widget.insertSliverWidget != null) widget.insertSliverWidget!,
        SliverList(
            delegate:
                SliverChildListDelegate([widget.insertWidget ?? Container()])),
        widget.itemHeight == null
            ? SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                if (_listData.isEmpty) return Container();
                dynamic item = _listData[index];
                return widget.itemBuilder(index, item);
              }, childCount: _listData.length, addAutomaticKeepAlives: false))
            : SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  if (_listData.isEmpty) return Container();
                  dynamic item = _listData[index];
                  return widget.itemBuilder(index, item);
                }, childCount: _listData.length, addAutomaticKeepAlives: false),
                itemExtent: widget.itemHeight!),
        SliverList(
            delegate: SliverChildListDelegate(
                [widget.showMoreWidget ? _renderExtend() : Container()])),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            height: widget.showSafeBottomArea ? Util.iphoneXBottom : 0,
          )
        ])),
      ],
    );
  }

  String _getExtendTitle() {
    if (_more) {
      return K.waitting_load;
      if (_loading) {
        return K.waitting_load;
      } else {
        return '';
      }
    } else {
      return K.not_any_more;
    }
  }

  Widget _renderExtend() {
    return SizedBox(
      height: 50.0,
      child: Center(
        child: Text(_getExtendTitle(),
            textScaleFactor: 1.0,
            style: TextStyle(fontSize: 14.0, color: Colors.black)),
      ),
    );
  }
}
