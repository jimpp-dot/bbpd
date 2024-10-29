import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base;
import 'package:shared/model/friend_bean.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;

/// 通讯录好友、关注、粉丝列表页
class FriendsSelectPage extends StatefulWidget {
  final String type;
  final bool showSearchBar;
  final SelectData selectData;
  final VoidCallback? selectChanged;

  const FriendsSelectPage(
      {super.key,
      required this.type,
      this.showSearchBar = false,
      required this.selectData,
      this.selectChanged});

  @override
  FriendsSelectPageState createState() {
    return FriendsSelectPageState();
  }
}

class FriendsSelectPageState extends State<FriendsSelectPage>
    with AutomaticKeepAliveClientMixin<FriendsSelectPage> {
  final int pageSize = 20;

  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();

  Timer? _cancelTimer;
  final List<FriendItem> _data = [];
  bool _loading = true;
  bool _first = true;

  int pageIndex = 1;
  String? _error;

  bool _more = true;
  bool _lock = false;
  final ScrollController _controller = ScrollController();
  final IChatManager _chatManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);

  String _searchKey = '';
  final GlobalKey<SearchBarState> _inputKey = GlobalKey<SearchBarState>();

  bool isCurrentTab = true;

  @override
  bool get wantKeepAlive {
    return true;
  }

  List<int> showIdList() {
    List<int> list = [];
    for (FriendItem item in _data) {
      list.add(item.uid);
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    _load(1);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    _cancelTimer?.cancel();
    closeInput();
    super.dispose();
  }

  // 加载更多
  _onScroll() {
    if (!_controller.hasClients) return;
    closeInput();
    if (_more == true &&
        _lock == false &&
        _controller.position.maxScrollExtent == _controller.offset) {
      _load(pageIndex + 1);
    }
  }

  closeInput() {
    _inputKey.currentState?.close();
  }

  Future<void> reload([bool force = false]) async {
    closeInput();
    if (_first && !force) {
      _first = false;
      return;
    }
    if (_key.currentState != null) await _key.currentState?.show();
  }

  //重置数据并刷新界面
  resetData() {
    _data.clear();
    setState(() {});
  }

  _load(int page) async {
    _lock = true;

    String url = '${System.domain}go/yy/friend/data';

    final Map<String, String> params = {
      "type": widget.type,
      "page": page.toString(),
      "pageSize": pageSize.toString(),
      "query": _searchKey
    };

    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true, formatJson: true);
      Map res = response.response as Map;
      List? list = res['data'];
      if (page == 1) {
        _data.clear();
      }

      if (list != null && list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          Map item = list[i];
          try {
            FriendItem friend = FriendItem.fromJson(item);
            if (friend.uid > 0) {
              _data.add(friend);
            }
          } catch (e) {
            Log.d(e.toString());
          }
        }
        if (list.length < pageSize) {
          _more = false;
        } else {
          _more = true;
        }
      } else {
        _more = false;
      }

      pageIndex = page;
      _error = null;
    } catch (e) {
      Log.d(e.toString());
      _error = e.toString();
    }

    _loading = false;
    _lock = false;
    if (mounted) {
      setState(() {});
      if (page == 1 && widget.selectChanged != null) {
        widget.selectChanged!();
      }
    }
  }

  Future<void> _onRefresh() async {
    _more = false;
    pageIndex = 1;
    if (_controller.hasClients) {
      _controller.jumpTo(0.0);
    }

    _load(pageIndex);
  }

  Widget _buildLoadMore() {
    if (!_more && _data.length < pageSize) {
      return Container();
    }
    return SizedBox(
      height: 50.0,
      child: Center(
        child: Text(
          _more ? R.string('common_loading') : R.string('common_no_more'),
          textScaleFactor: 1.0,
          style: TextStyle(fontSize: 13.0, color: R.color.secondTextColor),
        ),
      ),
    );
  }

  void _onTap(FriendItem item) {
    String type = "private";
    item.redpoint = 0;
    _chatManager.openUserChatScreen(
      context,
      type: type,
      targetId: item.uid,
      title: item.name,
      official: item.official ?? 0,
    );
  }

  Widget _renderImage(BuildContext context, FriendItem item) {
    bool online = (item.onlineDateline ?? 0) > 0 && item.online == 1;
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 12.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          CommonAvatar(
            path: item.icon,
            size: 52,
            shape: BoxShape.circle,
            onTap: () {
              item.redpoint = 0;
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, item.uid,
                  refer: PageRefer(widget.type));
            },
          ),
          if ((item.redpoint ?? 0) > 0)
            const PositionedDirectional(
              end: -5,
              top: 0,
              child: RedDot(num: 1),
            ),
          // 在线小圆点
          if (online)
            const PositionedDirectional(
              end: 4,
              bottom: 0,
              child: OnlineDot(),
            ),
        ],
      ),
    );
  }

  Widget _renderInfo(BuildContext context, Object data) {
    FriendItem friend = data as FriendItem;

    List<Widget> widgets = [];
    double maxWidth = MediaQuery.of(context).size.width - 160.0;

    if (friend.tag != null && friend.tag!.isNotEmpty) {
      widgets.add(Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Text(
          friend.tag!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
        ),
      ));
    }

    widgets.add(Expanded(
      child: Container(
          margin: EdgeInsetsDirectional.only(
              start: widgets.isNotEmpty ? 10.0 : 0.0),
          child: Text(
              friend.sign != null && friend.sign!.isNotEmpty
                  ? friend.sign!
                  : '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: R.color.secondTextColor,
                fontSize: 13,
              ))),
    ));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }

  String _getName(FriendItem friend) {
    return friend.markName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        if (widget.type == FriendsListType.Friend && widget.showSearchBar)
          Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 6),
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              _onQueryChanged,
              key: _inputKey,
              height: 36,
              hintText: base.K.input_name_to_search,
            ),
          ),
        Expanded(child: _buildBody()),
      ],
    );
  }

  Widget _buildBody() {
    if (_loading && pageIndex == 1) {
      return const Loading();
    }

    if (_error != null && pageIndex == 1) {
      return Center(
        child: ErrorData(
          error: _error,
          onTap: () {
            _load(pageIndex);
          },
        ),
      );
    }

    if (_searchKey.isNotEmpty && pageIndex == 1 && _data.isEmpty) {
      return _buildEmpty();
    }
    return GestureDetector(
      onTap: () {
        closeInput();
      },
      child: RefreshIndicatorFactory.of(
        key: _key,
        child: SafeArea(
          top: false,
          child: CustomScrollView(
            controller: _controller,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverFixedExtentList(
                itemExtent: 72,
                delegate: FixedExtentSliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    FriendItem item = _data.elementAt(index);

                    return InkWell(
                      onTap: () {
                        _onTap(item);
                      },
                      child: Container(
                        padding: const EdgeInsetsDirectional.only(
                            start: 20, end: 10),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _renderImage(context, item),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Flexible(
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: Util.width -
                                                    183 -
                                                    (item.official == 1
                                                        ? 27
                                                        : 0), //20+52+12+20+15+3+8+8+45  23+4
                                              ),
                                              child: Text(
                                                _getName(item),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: R.color.mainTextColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (item.official == 1)
                                            const SizedBox(
                                              width: 4,
                                            ),
                                          if (item.official == 1)
                                            R.img('ic_official.png',
                                                width: 23,
                                                height: 14,
                                                package: ComponentManager
                                                    .MANAGER_BASE_CORE),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  _renderInfo(context, item),
                                ],
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                if (widget.selectData.selectIdList
                                    .contains(item.uid)) {
                                  widget.selectData.selectIdList
                                      .remove(item.uid);
                                } else {
                                  widget.selectData.selectIdList.add(item.uid);
                                }
                                if (widget.selectChanged != null) {
                                  widget.selectChanged!();
                                }
                              },
                              child: Container(
                                width: 44,
                                height: 44,
                                margin: const EdgeInsetsDirectional.only(
                                    start: 2.0),
                                alignment: Alignment.center,
                                child: widget.selectData.selectIdList
                                        .contains(item.uid)
                                    ? R.img(
                                        'contact_check_sel.png',
                                        width: 24,
                                        height: 24,
                                        package: ComponentManager.MANAGER_VIP,
                                      )
                                    : R.img(
                                        'contact_check_nor.png',
                                        width: 24,
                                        height: 24,
                                        package: ComponentManager.MANAGER_VIP,
                                        color: R.color.mainTextColor,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: _data.length,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _buildLoadMore(),
                  ],
                ),
              ),
            ],
          ),
        ),
        onRefresh: _onRefresh,
      ),
    );
  }

  Widget _buildEmpty() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: Util.height / 3),
      child: Text(
        base.K.no_result,
        style: TextStyle(color: R.color.secondTextColor, fontSize: 15),
      ),
    );
  }

  void _onQueryChanged(String text) {
    setState(() {
      _loading = true;
    });
    _cancelTimer?.cancel();
    _cancelTimer = Timer(
        Duration(milliseconds: text.isEmpty ? 0 : 800), () => _search(text));
  }

  /// [query] 搜索key
  void _search(String query) async {
    resetData();
    _searchKey = query;
    _load(1);
  }
}

class SelectData {
  List<int> selectIdList = [];

  SelectData();
}
