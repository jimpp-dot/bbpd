import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:chat_room/src/base/widget/roomInviteItem.dart';
import 'package:shared/model/friend_bean.dart';

class ContactSelectScreen extends StatefulWidget {
  final int rid;
  final int preSelectUid;
  final ContactSelectSubmitCallback submitCallback;
  final bool hideRecentTab;
  final bool hideFriendTab;
  final bool hideGroupTab;
  final bool onlySelectOne;
  final String title;

  const ContactSelectScreen({
    super.key,
    required this.rid,
    required this.submitCallback,
    required this.hideRecentTab,
    required this.hideFriendTab,
    required this.hideGroupTab,
    required this.preSelectUid,
    required this.onlySelectOne,
    required this.title,
  });

  static Future show(
    BuildContext context,
    ContactSelectSubmitCallback callback, {
    int? rid,
    int? preSelectUid,
    bool? hideRecentTab,
    bool? hideFriendTab,
    bool? hideGroupTab,
    bool? onlySelectOne,
    String? title,
  }) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ContactSelectScreen(
        rid: rid ?? 0,
        preSelectUid: preSelectUid ?? 0,
        hideFriendTab: hideFriendTab ?? false,
        hideRecentTab: hideRecentTab ?? false,
        hideGroupTab: hideGroupTab ?? false,
        submitCallback: callback,
        onlySelectOne: onlySelectOne ?? false,
        title: title ?? '',
      ),
      settings: const RouteSettings(name: '/roomInviteFriend'),
    ));
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ContactSelectScreen>
    with SingleTickerProviderStateMixin {
  final Map<int, FriendItem> _selectedContact = {};
  final GlobalKey<_InviteFriendListState> _keyRecent = GlobalKey();
  final GlobalKey<_InviteFriendListState> _keyGroup = GlobalKey();
  final GlobalKey<_InviteFriendListState> _keyFriend = GlobalKey();
  late final TabController _tabController;
  String finishTxt = R.string('chat_done');
  final List<String> _tabs = [
    R.string('recent_contact'),
    R.string('friend'),
    R.string('group_friend')
  ];

  Map? _room;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    int length = 3;
    if (widget.hideGroupTab) {
      _tabs.removeAt(2);
      length--;
    }
    if (widget.hideRecentTab) {
      _tabs.removeAt(0);
      length--;
    }
    if (widget.hideFriendTab) {
      _tabs.removeAt(1);
      length--;
    }
    _tabController = TabController(length: length, vsync: this);
    _load();
  }

  void _load() async {
    if (widget.preSelectUid > 0) {
      UserInfo? info = await CachedNames.instance()
          .get(widget.preSelectUid, ConversationType.Private);
      if (info != null) {
        FriendItem friendItem = FriendItem(
          uid: info.uid,
          memberIcons: info.members,
          mark: info.mark,
          name: info.name,
          icon: info.icon,
        );
        _selectedContact[widget.preSelectUid] = friendItem;
      }
    }
    if (widget.rid <= 0) {
      _loading = false;
      if (mounted) {
        setState(() {});
      }
      return;
    }

    String url = "${System.domain}room/getFriends/?rid=${widget.rid}";
    XhrResponse response = await Xhr.getJson(url);
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        if (mounted) {
          _loading = false;
          _room = res['room'];
          setState(() {});
        }
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          style: Theme.of(context).textTheme.titleLarge ??
              TextStyle(fontFamily: Util.fontFamily),
          child: Text(widget.title),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () async {
              if (_selectedContact.isNotEmpty) {
                List<int> uids = [];
                List<bool> isGroups = [];

                _selectedContact.forEach((uid, contact) {
                  uids.add(contact.uid);
                  bool isGroup = contact.isGroup ||
                      (contact.memberIcons?.isNotEmpty ?? false) ||
                      (contact.members?.isNotEmpty ?? false);
                  isGroups.add(isGroup);
                });
                widget.submitCallback(context, uids, isGroups, _room ?? {});
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
      body: _loading
          ? const Loading()
          : Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 40,
                    alignment: AlignmentDirectional.centerStart,
                    padding: const EdgeInsetsDirectional.only(start: 10.0),
                    margin: const EdgeInsetsDirectional.only(bottom: 6.0),
                    child: CommonTabBar(
                      controller: _tabController,
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
                      children: <Widget>[
                        if (!widget.hideRecentTab)
                          InviteFriendListView(
                            type: InviteFriendsListType.Recent,
                            key: _keyRecent,
                            selectedContact: _selectedContact,
                            onItemClick: _onItemCLick,
                            onlySelectOne: widget.onlySelectOne,
                            hideGroup: widget.hideGroupTab,
                          ),
                        if (!widget.hideFriendTab)
                          InviteFriendListView(
                            type: InviteFriendsListType.Friend,
                            key: _keyFriend,
                            selectedContact: _selectedContact,
                            onItemClick: _onItemCLick,
                            onlySelectOne: widget.onlySelectOne,
                          ),
                        if (!widget.hideGroupTab)
                          InviteFriendListView(
                            type: InviteFriendsListType.Group,
                            key: _keyGroup,
                            selectedContact: _selectedContact,
                            onItemClick: _onItemCLick,
                            onlySelectOne: widget.onlySelectOne,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  void _onItemCLick() {
    setState(() {});
  }
}

class InviteFriendListView extends StatefulWidget {
  final Map<int, FriendItem> selectedContact;
  final VoidCallback onItemClick;
  final InviteFriendsListType type;
  final bool onlySelectOne;
  final bool hideGroup;

  const InviteFriendListView({
    super.key,
    required this.type,
    required this.selectedContact,
    required this.onItemClick,
    this.onlySelectOne = false,
    this.hideGroup = false,
  });

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
  late final ScrollController _controller;
  late final Map<int, FriendItem> _selectedContact;
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
    _controller.addListener(_onScroll);
    _selectedContact = widget.selectedContact;
    _load(1);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
    _cancelTimer?.cancel();
  }

  _onScroll() {
    if (widget.type == InviteFriendsListType.Recent) return;
    if (!_controller.hasClients) return;
    if (_more == true &&
        _lock == false &&
        _controller.position.maxScrollExtent == _controller.offset) {
      _load(pageIndex + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    int count = _contactList.length;
    return Column(
      children: <Widget>[
        if (widget.type == InviteFriendsListType.Friend)
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

    if (widget.type == InviteFriendsListType.Friend &&
        _searchKey.isNotEmpty &&
        pageIndex == 1 &&
        _contactList.isEmpty) {
      return _buildEmpty();
    }
    if (count == 0) return _buildEmpty();

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: ListView.builder(
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: count,
        padding: const EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          return _renderContactList(index);
        },
      ),
    );
  }

  Widget _renderContactList(int index) {
    FriendItem data = _contactList[index];
    bool selected = _selectedContact.containsKey(data.uid);

    return RoomInviteItem(
      selected: selected,
      data: data,
      onRoomItemClick: _onItemClick,
    );
  }

  Widget _buildEmpty() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: Util.height / 3),
      child: Text(
        R.string('no_result'),
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

    String url = '${System.domain}go/yy/friend/data';
    final Map<String, String> params = {
      "type": widget.type == InviteFriendsListType.Group ? 'group' : 'friend',
      "page": page.toString(),
      "pageSize": pageSize.toString(),
      "query": _searchKey,
    };

    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true, formatJson: true);
      Map res = response.value();
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

            if (friend.uid > 0) {
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
      if (endTimePoints.newestSentTime > _lastCheckpointTime) {
        _lastCheckpointTime = endTimePoints.newestSentTime;
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
      _existsConvKeyMap[key]?.copyFrom(conv);
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

  void _buildTempGroupFromData(List? tpData) {
    tpData?.forEach((value) {
      int val = Util.parseInt(value, 0);
      if (val > 0) {
        _tempGroupIDs.add(val);
      }
    });
  }

  void _buildFamiliarFromData(List<int>? data) {
    data?.forEach((int value) {
      if (value > 0) {
        _familiarIDs.add(value);
      }
    });
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

  conversationToFriendList() async {
    int traverseNum = 0;
    for (var conv in _data) {
      traverseNum++;
      UserInfo? info = await CachedNames.instance()
          .get(Util.parseInt(conv.targetId), conv.type);
      if (info != null) {
        FriendItem friendItem = FriendItem(
          uid: info.uid,
          memberIcons: info.members,
          mark: info.mark,
          name: info.name,
          icon: info.icon,
        );
        if (conv.type == 'group') friendItem.isGroup = true;
        bool isGroupItem = friendItem.isGroup;
        if (!isGroupItem || !widget.hideGroup) {
          _contactList.add(friendItem);
        }
      }
      if (mounted && traverseNum == _data.length) setState(() {});
    }
  }

  _onItemClick(FriendItem item, bool selected) {
    if (selected && !_selectedContact.containsKey(item.uid)) {
      if (widget.onlySelectOne) {
        _selectedContact.clear();
        eventCenter.emit('Contact.select.clear', item.uid);
      }
      _selectedContact[item.uid] = item;
    }

    if (!selected && _selectedContact.containsKey(item.uid)) {
      _selectedContact.remove(item.uid);
    }
    widget.onItemClick();
  }
}
