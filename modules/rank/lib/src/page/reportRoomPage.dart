import 'package:shared/shared.dart' hide RoomListItem;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rank/k.dart';
import 'package:rank/src/widget/room_list_item.dart';

typedef PageValueChanged = Function(
    Notification notify, ScrollController controller, int index);

class ReportRoomPage extends StatefulWidget {
  const ReportRoomPage({
    super.key,
    this.index,
    this.type,
    this.onScroll,
  });

  final int? index;
  final String? type;
  final PageValueChanged? onScroll;

  @override
  _RoomPageState createState() => _RoomPageState();
}

class RoomTagType {
  final String label;
  final String val;
  final String color;
  final bool isFollow;

  RoomTagType.fromJson(Map data)
      : label = data['label'],
        val = data['val'],
        isFollow = data.containsKey('isFollow') ? data['isFollow'] > 0 : false,
        color = data['color'];
}

class _RoomPageState extends State<ReportRoomPage>
    with AutomaticKeepAliveClientMixin<ReportRoomPage> {
  final List<RoomItemModel> _data = [];
  bool _loading = true;
  bool _hasMore = false;
  bool _loadingMoreLock = false;
  int _pageIndex = 1;
  bool _first = true;
  String? _errorMessage;
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  late ScrollController _controller;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_onScroll);
    _load(_pageIndex);
  }

  void scrollToTop() {
    if (_controller.hasClients) {
      _controller.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_controller.hasClients) return;

    if (_controller.offset >= _controller.position.maxScrollExtent - 40.0 &&
        _hasMore &&
        _loading == false &&
        _loadingMoreLock == false) {
      _loadMore();
    }
  }

  _loadMore() async {
    if (!mounted) return;
    setState(() {
      _errorMessage = null;
      _loading = true;
    });
    _load(_pageIndex + 1);
  }

  Future<void> reload() async {
    _hasMore = false;
    if (_first) {
      _first = false;
      return;
    }
//    if (this._key.currentState != null) {
//      this._key.currentState.show();
//    } else {
    if (!mounted) return;
    setState(() {
      _loading = true;
    });
    _pageIndex = 1;
    _load(_pageIndex);
//    }
  }

  Future<void> _load(int pageIndex) async {
    try {
      _loadingMoreLock = true;
      _errorMessage = null;
      _pageIndex = pageIndex;
      String url =
          '${System.domain}room/reportedList?page_no=$pageIndex&page_size=50';

      XhrResponse response = await Xhr.getJson(url, throwOnError: true);

      // 数据拉取成功后，延时500ms复位_loadingMoreLock，防止在刷新UI的过程中又reload
      Future.delayed(const Duration(milliseconds: 500), () {
        _loadingMoreLock = false;
      });

      Map res = response.response as Map;
      Log.d(res);
      if (pageIndex == 1) {
        _data.clear();
      }
      List list = res['data']['list'];
      for (int i = 0; i < list.length; i++) {
        Map item = list[i];
        try {
          _data.add(RoomItemModel.fromJson(item));
        } catch (e) {
          Log.d(e);
        }
      }
      _hasMore = !res['data']['isEnd'];
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      Log.d(widget.type);
      _loadingMoreLock = false;
      if (!mounted) return;
      setState(() {
        _loading = false;
        _errorMessage = e.toString();
        _hasMore = true;
      });
    }
  }

  Widget buildItem(BuildContext context, int index) {
    return RoomListItem(
      room: _data.elementAt(index),
      roomFrom: RoomFrom(widget.type ?? ''),
      refer: 'report',
    );
  }

  /// 加载更多
  Widget _buildLoadMore() {
    Widget more;
    if (_errorMessage != null) {
      more = InkWell(
        onTap: _loadMore,
        child: Center(
          child: Text(
            "${_errorMessage!}, ${R.string('click_to_retry')}",
            style: TextStyle(color: R.color.secondTextColor),
          ),
        ),
      );
    } else if (_hasMore) {
      more = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CupertinoActivityIndicator(animating: _loading),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              R.string('waitting_load'),
              style: TextStyle(color: R.color.secondTextColor),
            ),
          )
        ],
      );
    } else {
      more = Text(
        R.string('not_any_more'),
        style: TextStyle(color: R.color.secondTextColor),
      );
    }

    return Container(
      height: 50.0,
      width: Util.width,
      alignment: Alignment.center,
      child: more,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading && _data.isEmpty) {
      return const Loading();
    }
    if (_errorMessage != null) {
      Log.d(_errorMessage);
      return ErrorData(
        error: _errorMessage,
        onTap: () {
          setState(() {
            _loading = true;
          });
          _load(1);
        },
      );
    }
    if (!_loading && (_data.isEmpty)) {
      return ErrorData(
        error: K.rank_no_data,
        onTap: () {
          setState(() {
            _loading = true;
          });
          _load(1);
        },
      );
    }
    return RefreshIndicatorFactory.of(
      key: _key,
      child: NotificationListener(
          onNotification: (Notification e) {
            if (widget.onScroll != null)
              widget.onScroll!(e, _controller, widget.index ?? 0);
            return false;
          },
//        child: ListView.builder(
//          padding: EdgeInsets.only(top: 10.0, bottom: Util.iphoneXBottom),
//          controller: this._controller,
//          physics: AlwaysScrollableScrollPhysics(),
//          itemCount: this._data.length,
//          itemExtent: 92.0,
//          addAutomaticKeepAlives: false,
//          itemBuilder: (BuildContext context, int index) {
//            RoomItemModel room = this._data.elementAt(index);
//            return RoomListItem(room: room);
//          },
//        ),
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                  buildItem,
                  childCount: _data.length,
                ),
                itemExtent: 92,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildLoadMore(),
                ]),
              )
            ],
          )),
      onRefresh: () async {
        return reload();
      },
    );
  }
}
