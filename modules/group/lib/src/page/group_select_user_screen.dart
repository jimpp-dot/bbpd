import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/model/friend_bean.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:group/k.dart';
import 'package:group/src/model/group_setting_beans.dart';
import 'package:group/src/model/pb/generated/account.pb.dart';
import 'package:group/src/repo/group_repo.dart';
import 'package:group/src/widget/invite_contact_Item.dart';

/// 邀请成员加群
class SelectUserScreen extends StatefulWidget {
  final String? title;
  final List<int>? preSelectedUis;
  final List<int>? selectedUis;

  const SelectUserScreen(
      {Key? key, this.title, this.preSelectedUis, this.selectedUis})
      : super(key: key);

  static Future<List<int>?> show(BuildContext context,
      {String? title, List<int>? preSelectedUis, List<int>? selectedUis}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SelectUserScreen(
        title: title,
        preSelectedUis: preSelectedUis,
        selectedUis: selectedUis,
      ),
      settings: const RouteSettings(name: '/group_invite_member'),
    ));
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<SelectUserScreen> with TickerProviderStateMixin {
  final Set<int> _selectedContact = {};
  final GlobalKey<_InviteFriendListState> _keyRecent = GlobalKey();
  final GlobalKey<_InviteFriendListState> _keyFriend = GlobalKey();
  final GlobalKey<_InviteFriendListState> _keyFollow = GlobalKey();
  final GlobalKey<_InviteFriendListState> _keyFans = GlobalKey();
  final GlobalKey<_InviteFriendListState> _keySearch = GlobalKey();
  TabController? _tabController;
  String finishTxt = K.group_complete;

  bool _showSearch = false;
  final List<String> _tabs = [];
  List<Widget> _tabWidgets = [];

  @override
  void initState() {
    super.initState();
    if (!Util.isCollectionEmpty(widget.selectedUis)) {
      for (var element in widget.selectedUis!) {
        _selectedContact.add(element);
      }
    }
    _initDefaultData();
    _loadData();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _loadData() async {
    GroupInviteTabResp resp = await GroupRepo.getGroupInviteTabs();
    if (resp.success == true &&
        resp.data != null &&
        !Util.isCollectionEmpty(resp.data!.tabs)) {
      _tabs.clear();
      List<Widget> tabWidgets = [];
      for (var element in resp.data!.tabs!) {
        if (element.key == "familiar") {
          _tabs.add(element.name);
          tabWidgets.add(InviteFriendListView(
            type: InviteFriendsListType.Recent,
            showSearch: false,
            key: _keyRecent,
            selectedContact: _selectedContact,
            preSelectedUis: widget.preSelectedUis ?? [],
            onItemClick: _onItemCLick,
          ));
        } else if (element.key == "friend") {
          _tabs.add(element.name);
          tabWidgets.add(InviteFriendListView(
            type: InviteFriendsListType.Friend,
            showSearch: !resp.data!.showSearch,
            key: _keyFriend,
            selectedContact: _selectedContact,
            preSelectedUis: widget.preSelectedUis ?? [],
            onItemClick: _onItemCLick,
          ));
        } else if (element.key == "follow") {
          _tabs.add(element.name);
          tabWidgets.add(InviteFriendListView(
            type: InviteFriendsListType.Follow,
            showSearch: false,
            key: _keyFollow,
            selectedContact: _selectedContact,
            preSelectedUis: widget.preSelectedUis ?? [],
            onItemClick: _onItemCLick,
          ));
        } else if (element.key == "fans") {
          _tabs.add(element.name);
          tabWidgets.add(InviteFriendListView(
            type: InviteFriendsListType.Fans,
            showSearch: false,
            key: _keyFans,
            selectedContact: _selectedContact,
            preSelectedUis: widget.preSelectedUis ?? [],
            onItemClick: _onItemCLick,
          ));
        }
      }
      setState(() {
        _showSearch = resp.data!.showSearch;
        _tabWidgets = tabWidgets;
        safeRun(() {
          _tabController = TabController(length: _tabs.length, vsync: this);
        });
      });
    }
  }

  _initDefaultData() {
    /// 初始化 两个默认tab
    _tabs.add(K.group_contact_recent);
    _tabs.add(K.group_friend);

    /// 初始化 两个默认tabWidget
    List<Widget> tabWidgets = [];
    tabWidgets.add(InviteFriendListView(
      type: InviteFriendsListType.Recent,
      showSearch: false,
      key: _keyRecent,
      selectedContact: _selectedContact,
      preSelectedUis: widget.preSelectedUis ?? [],
      onItemClick: _onItemCLick,
    ));
    tabWidgets.add(InviteFriendListView(
      type: InviteFriendsListType.Friend,
      showSearch: true,
      key: _keyFriend,
      selectedContact: _selectedContact,
      preSelectedUis: widget.preSelectedUis ?? [],
      onItemClick: _onItemCLick,
    ));
    setState(() {
      _tabWidgets = tabWidgets;
      safeRun(() {
        _tabController = TabController(length: _tabs.length, vsync: this);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color textColor;
    textColor = _selectedContact.isNotEmpty
        ? R.color.mainBrandColor
        : R.color.thirdTextColor;
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: DefaultTextStyle(
          style: Theme.of(context).textTheme.titleLarge!,
          child: Text(widget.title ?? K.group_invite_to_group),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () async {
              if (_selectedContact.isNotEmpty) {
                Navigator.of(context).pop(_selectedContact.toList());
              }
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(end: 16),
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                _selectedContact.isNotEmpty
                    ? '$finishTxt(${_selectedContact.length})'
                    : finishTxt,
                style: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            if (_showSearch)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SearchBar(
                  _onQueryChanged,
                  hintText: K.input_id_to_search,
                ),
              ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 40,
                        alignment: AlignmentDirectional.centerStart,
                        padding: const EdgeInsetsDirectional.only(start: 10.0),
                        margin: const EdgeInsetsDirectional.only(bottom: 6.0),
                        child: CommonTabBar(
                          controller: _tabController!,
                          isScrollable: true,
                          tabs: _tabs.map((String tab) {
                            return Tab(child: Text(tab));
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          physics: const ClampingScrollPhysics(),
                          children: _tabWidgets,
                        ),
                      )
                    ],
                  ),
                  InviteFriendListView(
                    key: _keySearch,
                    showSearch: false,
                    type: InviteFriendsListType.Search,
                    selectedContact: _selectedContact,
                    preSelectedUis: widget.preSelectedUis ?? [],
                    onItemClick: _onItemCLick,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQueryChanged(String text) {
    _keySearch.currentState!._onQueryChanged(text);
    setState(() {});
    _keyRecent.currentState!.refreshData();
    _keyFriend.currentState!.refreshData();
    _keyFollow.currentState!.refreshData();
    _keyFans.currentState!.refreshData();
  }

  void _onItemCLick() {
    setState(() {});
  }
}

class InviteFriendListView extends StatefulWidget {
  final bool? showSearch;
  final Set<int>? selectedContact;
  final List<int>? preSelectedUis;
  final VoidCallback? onItemClick;

  const InviteFriendListView(
      {Key? key,
      this.type,
      this.showSearch,
      this.selectedContact,
      this.preSelectedUis,
      this.onItemClick})
      : super(key: key);
  final InviteFriendsListType? type;

  @override
  State<StatefulWidget> createState() {
    return _InviteFriendListState();
  }
}

class _InviteFriendListState extends State<InviteFriendListView> {
  final List<FriendItem> _contactList = [];
  bool _loading = true;
  final int pageSize = 40;
  int pageIndex = 1;
  String? _error;

  bool _more = true;
  bool _lock = false;
  ScrollController? _controller;
  int _lastLoadHiddenDataTime = 0;
  final List<int> _familiarIDs = [];
  final List<int> _tempGroupIDs = [];
  final List<Conversation> _data = []; //当前消息会话列表
  ///当前最新的消息时间点，断网中断后可以从最新的开始拉取，到此处结束
  int _lastCheckpointTime = -1;
  int _loadAllConvsSeqId = 0; //每次全量重新拉取的时候加1，用于终止上一批的拉取
  final Map<String, Conversation> _existsConvKeyMap = {};

  int _startTime = 0;
  String _searchKey = '';
  Timer? _cancelTimer;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller!.addListener(_onScroll);
    _load(1);
  }

  @override
  void dispose() {
    _controller!.removeListener(_onScroll);
    _controller!.dispose();
    super.dispose();
    _cancelTimer?.cancel();
  }

  _onScroll() {
    if (widget.type == InviteFriendsListType.Recent) return;
    if (!_controller!.hasClients) return;
    if (_more == true &&
        _lock == false &&
        _controller!.position.maxScrollExtent == _controller!.offset) {
      _load(pageIndex + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    int count = _contactList.length;
    return Column(
      children: <Widget>[
        if (widget.showSearch!)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchBar(
              _onQueryChanged,
              hintText: R.string('input_name_to_search'),
            ),
          ),
        Expanded(
          child: _buildBody(count),
        ),
      ],
    );
  }

  Widget _buildBody(int count) {
    if (_loading && pageIndex == 1) {
      return Container(
        color: widget.type == InviteFriendsListType.Search
            ? Colors.white
            : Colors.transparent,
        child: const Loading(),
      );
    }
    if (_error != null && pageIndex == 1) {
      return Container(
        color: widget.type == InviteFriendsListType.Search
            ? Colors.white
            : Colors.transparent,
        child: Center(
          child: ErrorData(
            error: _error!,
            onTap: () {
              _load(pageIndex);
            },
          ),
        ),
      );
    }
    if (widget.type == InviteFriendsListType.Search && _searchKey.isEmpty) {
      return Container();
    }

    if ((widget.type == InviteFriendsListType.Friend ||
            widget.type == InviteFriendsListType.Search) &&
        _searchKey.isNotEmpty &&
        pageIndex == 1 &&
        _contactList.isEmpty) {
      return _buildEmpty();
    }
    if (count == 0) return _buildEmpty();

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 4, end: 16),
      color: widget.type == InviteFriendsListType.Search
          ? Colors.white
          : Colors.transparent,
      child: ListView.builder(
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: count,
        padding: const EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          return _renderContactItem(index);
        },
      ),
    );
  }

  Widget _renderContactItem(int index) {
    FriendItem data = _contactList[index];
    bool selected = widget.selectedContact!.contains(data.uid);
    bool preselected = !Util.isCollectionEmpty(widget.preSelectedUis) &&
        widget.preSelectedUis!.contains(data.uid);
    return InviteContactItem(
      selected: selected,
      preSelected: preselected,
      data: data,
      onItemClick: _onItemClick,
    );
  }

  Widget _buildEmpty() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: Util.height / 3),
      color: widget.type == InviteFriendsListType.Search
          ? Colors.white
          : Colors.transparent,
      child: Text(
        K.group_result_empty,
        style: TextStyle(color: R.color.secondTextColor, fontSize: 15),
      ),
    );
  }

  _load(int page) async {
    _lock = true;
    if (widget.type == InviteFriendsListType.Recent) {
      await loadConversationItem();
      _loading = false;
      if (mounted) {
        setState(() {});
      }
      return;
    }
    if (widget.type == InviteFriendsListType.Search) {
      String url = '${System.domain}go/yy/account/search';
      final Map<String, String> params = {
        "word": _searchKey,
      };
      try {
        XhrResponse response =
            await Xhr.postPb(url, params, throwOnError: true);
        ResAccountInfo resp = ResAccountInfo.fromBuffer(response.bodyBytes);
        _contactList.clear();
        if (resp.success) {
          FriendItem friend = FriendItem(
              uid: resp.data.uid,
              icon: resp.data.icon,
              name: resp.data.name,
              titleNew: resp.data.titleNew);
          friend.isGroup = widget.type == InviteFriendsListType.Group;

          if ((friend.uid ?? 0) > 0) {
            _contactList.add(friend);
          }
        }
        _loading = false;
        _error = null;
      } catch (e) {
        Log.d(e);
        _loading = false;
        _error = e.toString();
      }
      _lock = false;
      if (mounted) {
        setState(() {});
      }
      return;
    }

    String type = "group";
    if (widget.type == InviteFriendsListType.Friend) {
      type = "friend";
    } else if (widget.type == InviteFriendsListType.Follow) {
      type = "follow";
    } else if (widget.type == InviteFriendsListType.Fans) {
      type = "fans";
    }
    String url = '${System.domain}go/yy/friend/data';
    final Map<String, String> params = {
      "type": type,
      "page": page.toString(),
      "pageSize": pageSize.toString(),
      "query": _searchKey,
    };
    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true, formatJson: true);
      Map res = response.response as Map<dynamic, dynamic>;
      List? list = res['data'];
      if (page == 1) {
        _contactList.clear();
      }

      if (list != null && list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          Map item = list[i];
          try {
            FriendItem friend = FriendItem.fromJson(item);
            friend.isGroup = widget.type == InviteFriendsListType.Group;

            if ((friend.uid ?? 0) > 0) {
              _contactList.add(friend);
            }
          } catch (e) {
            Log.d(e);
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
      _loading = false;
      _error = null;
    } catch (e) {
      Log.d(e);
      _loading = false;
      _error = e.toString();
    }
    _lock = false;
    if (mounted) {
      setState(() {});
    }
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

  refreshData() {
    setState(() {});
  }

  //重置数据并刷行界面
  resetData() {
    _contactList.clear();
    setState(() {});
  }

  Future loadConversationItem() async {
    const int limit = 200; //每批次拉取的最大会话数量
    _loadAllConvsSeqId += 1;
    int currentSeqId = _loadAllConvsSeqId;

    while (true) {
      Log.d(
          "_getConversationListAllForRongCloud limit=$limit, _startTime=$_startTime");
      List<Conversation> convs =
          await Im.getConversationListByPage(limit, _startTime);
      if (currentSeqId != _loadAllConvsSeqId) {
        break;
      }
      Log.d(
          "_getConversationListAllForRongCloud  convs.length : ${convs.length}");

      await _batchRefreshConversations(convs);

      if (convs.length < limit) {
        break;
      }

      ConversationTimePoints endTimePoints =
          ConversationUtil.getEndTimePoints(convs);
      bool needBreak = false;
      if (endTimePoints.newestSentTime > _lastCheckpointTime) {
        _lastCheckpointTime = endTimePoints.newestSentTime;
      }
      if (needBreak) {
        break;
      }
    }

    conversationToFriendList();
  }

  Future<void> _batchRefreshConversations(List<Conversation> convs) async {
    await _loadDataForHidden();

    ConversationClassificationParam param = ConversationClassificationParam(
        convs: convs,
        familiar: _familiarIDs,
        tempGroups: _tempGroupIDs,
        startTime: _startTime);
    ConversationClassificationResult result =
        ConversationUtil.classifyConversations(param);

    bool dataEmpty = _data.isEmpty;
    for (var conv in result.normalConvs) {
      _addNormalConv(conv);
    }
    _startTime = result.startTime;

    _sortConversationList();

    if (dataEmpty && _loading) {
      _loading = false;
    }

    if (mounted) {
      setState(() {});
    }
  }

  _addNormalConv(Conversation conv) {
    String key = conv.key;
    if (_existsConvKeyMap.containsKey(key)) {
      _existsConvKeyMap[key]!.copyFrom(conv);
    } else {
      _data.add(conv);
      _existsConvKeyMap[key] = conv;
    }
  }

  void _sortConversationList() {
    _data.sort((Conversation a, Conversation b) {
      if (a.isTop == b.isTop) {
        return a.sentTime <= b.sentTime ? 1 : -1;
      }
      if (a.isTop && b.isTop) return 0;
      return a.isTop ? -1 : 1;
    });
  }

  Future<void> _loadDataForHidden() async {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - _lastLoadHiddenDataTime <= 1000) {
      return;
    }

    _familiarIDs.clear();
    _tempGroupIDs.clear();

    bool ok = await _loadDataForHiddenFromServer(now);
    if (!ok) {
      await _buildFamiliarFromCache();
      await _buildTempGroupFromCache();
    }
  }

  Future<bool> _loadDataForHiddenFromServer(int now) async {
    bool ok = false;
    ResFriendFamiliar resp = await RelationshipApi.getFamiliarDataPb();
    if (resp.success) {
      _buildFamiliarFromData(resp.data.familiar);
      _buildTempGroupFromData(resp.data.tmpgroup);
      ok = true;
      _lastLoadHiddenDataTime = now;
    } else {
      Log.d('_loadDataForHiddenFromServer error and msg =${resp.msg}');
      ok = false;
      _lastLoadHiddenDataTime = 0;
    }
    return ok;
  }

  void _buildTempGroupFromData(List tpData) {
    for (var value in tpData) {
      int val = Util.parseInt(value, 0);
      if (val > 0) {
        _tempGroupIDs.add(val);
      }
    }
  }

  void _buildFamiliarFromData(List<int> data) {
    for (var value in data) {
      if (value > 0) {
        _familiarIDs.add(value);
      }
    }
  }

  Future _buildTempGroupFromCache() async {
    if (_tempGroupIDs.isEmpty) {
      String jsonTempGroup = Config.get("${Session.uid}.message.tempgroup");
      if (jsonTempGroup.isNotEmpty) {
        try {
          List data = Util.jsonDecode(jsonTempGroup);
          for (var value in data) {
            int val = Util.parseInt(value, 0);
            if (val > 0) {
              _tempGroupIDs.add(val);
            }
          }
        } catch (e) {
          Log.d(e);
        }
      }
    }
  }

  Future _buildFamiliarFromCache() async {
    if (_familiarIDs.isEmpty) {
      String jsonFamiliar = Config.get("${Session.uid}.message.familiar");
      if (jsonFamiliar.isNotEmpty) {
        try {
          List data = Util.jsonDecode(jsonFamiliar);
          for (var value in data) {
            int val = Util.parseInt(value, 0);
            if (val > 0) {
              _familiarIDs.add(val);
            }
          }
        } catch (e) {
          Log.d(e);
        }
      }
    }
  }

  conversationToFriendList() {
    int traverseNum = 0;
    _data.forEach((Conversation conv) async {
      traverseNum++;
      UserInfo? info = await CachedNames.instance()
          .get(Util.parseInt(conv.targetId), conv.type);
      if (info != null) {
        FriendItem friendItem = FriendItem(
            uid: info.uid,
            memberIcons: info.members,
            mark: info.mark,
            name: info.name,
            icon: info.icon);
        if (conv.type == 'group') friendItem.isGroup = true;
        bool isGroupItem = friendItem.isGroup;
        if (!isGroupItem) {
          _contactList.add(friendItem);
        }
      }
      if (mounted && traverseNum == _data.length) setState(() {});
    });
  }

  _onItemClick(int uid) {
    if (widget.selectedContact!.contains(uid)) {
      widget.selectedContact!.remove(uid);
    } else {
      widget.selectedContact!.add(uid);
    }
    widget.onItemClick!();
    setState(() {});
  }
}
