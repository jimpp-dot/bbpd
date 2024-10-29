import 'dart:async';

import 'package:category_selector/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SearchResultScreen extends StatefulWidget {
  final Map params;
  final PageRefer refer;

  const SearchResultScreen({Key? key, required this.params, required this.refer}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();

  static void show(BuildContext context, {required Map params}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SearchResultScreen(
        params: params,
        refer: const PageRefer('SearchResultScreen'),
      ),
      settings: const RouteSettings(name: '/searchResultScreen'),
    ));
  }
}

class _ScreenState extends State<SearchResultScreen> {
  final ScrollController _controller = ScrollController();

  final List<ListItem> _data = [];
  bool _loading = true;
  bool _hasMore = false;
  int pageSize = 20;
  int pageIndex = 1;
  final GlobalKey<RefreshIndicatorState> _key = GlobalKey<RefreshIndicatorState>();
  int _cityCode = 0;

  final List<String> _followUids = []; //已关注uid列表
  GlobalKey _listGlobalKey = GlobalKey();

  @override
  void initState() {
    initParam();
    super.initState();
    _controller.addListener(_onScroll);
    _load();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    AudioPlay.instance().closeSound();
    super.dispose();
  }

  void initParam() {
    _cityCode = Config.getInt('location.cityCode', 0);
  }

  Future<void> _reload() async {
    _data.clear();
    _hasMore = false;
    pageIndex = 1;

    _load();
  }

  _loadMore() async {
    pageIndex++;
    _load();
  }

  _load() async {
    double lng = Util.parseDouble(Config.get('location.longitude'));
    double lat = Util.parseDouble(Config.get('location.latitude'));
    String url = '${System.domain}home/strangerlistnew';
    Map<String, String> params = {};
    params['page'] = pageIndex.toString();
    params['pageSize'] = pageSize.toString();
    params['cityCode'] = _cityCode.toString();
    params['latitude'] = lat.toString();
    params['longitude'] = lng.toString();
    widget.params.forEach((key, value) {
      params[key] = value.toString();
      if (key == 'agemin' || key == 'agemax') {
        params[key] = Util.parseDouble(params[key]).toInt().toString();
      }
    });
    XhrResponse response = await Xhr.postJson(url, params);
    if (response.error != null || mounted == false) {
      return;
    }
    Map res = response.response as Map;

    if (res['success'] == false) {
      return;
    }

    _hasMore = res['more'];
    List data = res['data'];

    if (pageIndex == 1) {
      _data.clear();
      _followUids.clear();
      _listGlobalKey = GlobalKey();
    }

    if (data.isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        Map item = data[i];
        try {
          ListItem li = changeData(item);
          _data.add(li);
          if (li.follow) {
            //已关注
            if (!_followUids.contains(li.uid.toString())) {
              _followUids.add(li.uid.toString());
            }
          } else {
            if (_followUids.contains(li.uid.toString())) {
              _followUids.remove(li.uid.toString());
            }
          }
        } catch (e, s) {
          Log.e(e, stackTrace: s);
        }
      }
    } else {}

    _loading = false;
    if (mounted) setState(() {});

    return;
  }

  //数据转换
  ListItem changeData(Map data) {
    ListItem item = ListItem.fromJson(data);

    item.position = data['city'] ?? ''; //显示取city
    //item.nickname
    item.nick = item.cName; //显示取cName
    item.name = '';

    item.cName = item.tagName; //显示取cName

    return item;
  }

  void _onScroll() {
    if (_controller.offset == _controller.position.maxScrollExtent && _hasMore && _loading == false) {
      _loadMore();
    }
  }

  Future<void> _onRefresh() async {
    await _reload();
  }

  void _onTapItem(ListItem? item) {
    if ((item?.inRoom ?? 0) > 0) {
      int rid = item!.inRoom;
      IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, rid);
    } else {
      IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
      personalDataManager.openImageScreen(context, item?.uid ?? 0, refer: widget.refer);
    }
  }

  void _onTapImage(ListItem? item) {
    IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, item?.uid ?? 0, refer: widget.refer);
  }

  void _onFollow(ListItem? item) async {
    if (!Session.isLogined) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      return loginManager.show(context);
    }
    NormalNull response = await BaseRequestManager.onFollow(item?.uid.toString() ?? '');
    if (response.success) {
      Fluttertoast.showToast(msg: K.followed, gravity: ToastGravity.CENTER);
      if (!_followUids.contains(item?.uid.toString() ?? '')) {
        _followUids.add(item?.uid.toString() ?? '');
      }
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
      if (mounted) {
        setState(() {
          //关注失败,需要重新刷新
        });
      }
    }
  }

  void _onChat(ListItem? item) async {
    if (!Session.isLogined) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      return loginManager.show(context);
    }
    IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(context, type: 'private', targetId: item?.uid ?? 0, title: item?.nickName);
  }

  Widget _renderExtend() {
    return SizedBox(
      height: 50.0,
      child: Center(
        child: Text(
          _hasMore ? K.hard_loading : K.no_more_data,
          textScaleFactor: 1.0,
          style: TextStyle(fontSize: 12.0, color: R.colors.secondTextColor),
        ),
      ),
    );
  }

  Widget _renderBody() {
    if (_loading) {
      return const Loading();
    } else if (_data.isEmpty) {
      return Center(
        child: ErrorData(
          error: K.find_no_releated_data,
          fontColor: R.colors.secondTextColor,
          onTap: () {
            setState(() {
              _loading = true;
            });
            _load();
          },
        ),
      );
    } else {
      return RefreshIndicatorFactory.of(
        key: _key,
        onRefresh: _onRefresh,
        child: CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            SliverFixedExtentList(
              key: _listGlobalKey,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  ListItem it = _data.elementAt(index);
                  bool follow = _followUids.contains(it.uid.toString());

                  return HomeListItemWidget(
                    item: it,
                    onFollowClick: _onFollow,
                    onChatClick: _onChat,
                    onImageClick: _onTapImage,
                    onItemClick: _onTapItem,
                    follow: follow,
                    refer: widget.refer,
                    suppDark: true,
                  );
                },
                childCount: _data.length,
                addAutomaticKeepAlives: false,
              ),
              itemExtent: HomeListItemWidget.height,
            ),
            SliverList(delegate: SliverChildListDelegate([_renderExtend()])),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: Util.iphoneXBottom),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        widget.params['title'] ?? K.find_result,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
      ),
      body: _renderBody(),
    );
  }
}
