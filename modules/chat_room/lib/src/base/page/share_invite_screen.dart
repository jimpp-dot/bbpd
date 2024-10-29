import 'dart:async';
import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'dart:convert';
import 'package:chat_room/k.dart';
import 'package:shared/k.dart' as BaseK;

typedef OnShareInviteClick = Function(ShareInviteItem item, bool selected);

/// 房间分享邀请页
class ShareInviteScreen extends StatefulWidget {
  final int rid;
  final int musicId;

  const ShareInviteScreen({super.key, required this.rid, this.musicId = 0});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ShareInviteScreen>
    with SingleTickerProviderStateMixin {
  final Map<int, ShareInviteItem> _selectedContact = {};
  final GlobalKey<_ShareInviteListState> _keyRecent = GlobalKey();
  final GlobalKey<_ShareInviteListState> _keyGroup = GlobalKey();
  final GlobalKey<_ShareInviteListState> _keyFriend = GlobalKey();

  late final TabController _tabController;
  final List<String> _tabs = [
    K.recent_contact,
    K.room_friend,
    K.room_group_friend
  ];

  Map? _room;
  bool _loading = true;
  Map<String, String>? _musicInfo;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _load();
  }

  void _load() async {
    if (widget.rid == 0) {
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
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
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
                      tabs: _tabs
                          .map((String tab) => Tab(child: Text(tab)))
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: const ClampingScrollPhysics(),
                      children: <Widget>[
                        ShareInviteListView(
                          type: InviteFriendsListType.Recent,
                          key: _keyRecent,
                          selectedContact: _selectedContact,
                          onItemClick: _onItemCLick,
                          musicShare: Util.parseInt(widget.musicId) > 0,
                        ),
                        ShareInviteListView(
                          type: InviteFriendsListType.Friend,
                          key: _keyFriend,
                          selectedContact: _selectedContact,
                          onItemClick: _onItemCLick,
                          musicShare: Util.parseInt(widget.musicId) > 0,
                        ),
                        ShareInviteListView(
                          type: InviteFriendsListType.Group,
                          key: _keyGroup,
                          selectedContact: _selectedContact,
                          onItemClick: _onItemCLick,
                          musicShare: Util.parseInt(widget.musicId) > 0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  void _onItemCLick(ShareInviteItem item, bool selected) async {
    setState(() {});

    bool isGroup = item.isGroup ||
        (item.memberIcons?.isNotEmpty ?? false) ||
        (item.members?.isNotEmpty ?? false);

    bool inviteSuccess = false;
    if (widget.rid > 0) {
      MessageContent content = MessageContent(
          'text', SendUser(Session.uid.toString(), Session.name, Session.icon));
      content.content =
          K.room_who_invite_join_room([(Session.name), "${_room?['name']}"]);
      content.extra = json.encode({
        'type': 'invite_room',
        'name': _room?['name'],
        'prefix': _room?['prefix'],
        'icon': _room?['icon'],
        'tagName': _room?['tagValue'],
        'rid': _room?['rid'],
        'from': Session.uid
      });
      content.sentStatus = 'SENT';
      int? result = await Future.any([
        Im.sendMessage(
            isGroup ? ConversationType.Group : ConversationType.Private,
            item.uid.toString(),
            content),
        Future.delayed(const Duration(seconds: 2))
      ]);
      if (result != null) {
        inviteSuccess = true;
      }
    } else if (Util.parseInt(widget.musicId) > 0) {
      MessageContent content = MessageContent(
          'text', SendUser(Session.uid.toString(), Session.name, Session.icon));
      content.content = _musicInfo?['shareContent'] ?? '';
      content.extra = json.encode({
        'type': 'goodVoice',
        'musicId': '${widget.musicId}',
        'musicIcon': _musicInfo?['musicIcon'],
        'musicName': _musicInfo?['musicName'],
        'musicUser': _musicInfo?['musicUser'],
        'musicUrl': _musicInfo?['musicUrl'],
        'from': Session.uid
      });
      content.sentStatus = 'SENT';
      int? result = await Future.any([
        Im.sendMessage(
            isGroup ? ConversationType.Group : ConversationType.Private,
            item.uid.toString(),
            content),
        Future.delayed(const Duration(seconds: 2))
      ]);
      if (result != null) {
        inviteSuccess = true;
      }
      Tracker.instance
          .track(TrackEventJuben.good_voice_vodetailspage_share, properties: {
        'voice_id': widget.musicId,
        'way': item.isGroup ? 'group' : 'friends',
      });
    }
    if (inviteSuccess) {
      Toast.showCenter(context, K.room_had_send);
    } else {
      Toast.showCenter(context, K.room_send_fail_please_retry);
    }

    //点击分享或邀请通知
    String shareTag = 'inapp';
    eventCenter.emit(EventConstant.EventRoomInviteFriend, shareTag);
  }
}

class ShareInviteListView extends StatefulWidget {
  final Map<int, ShareInviteItem> selectedContact;
  final OnShareInviteClick onItemClick;
  final InviteFriendsListType type;
  final bool musicShare;

  const ShareInviteListView({
    super.key,
    required this.type,
    required this.selectedContact,
    required this.onItemClick,
    this.musicShare = false,
  });

  @override
  State<StatefulWidget> createState() => _ShareInviteListState();
}

class _ShareInviteListState extends State<ShareInviteListView> {
  final List<ShareInviteItem> _contactList = [];
  bool _loading = true;
  final int pageSize = 40;
  int pageIndex = 1;
  String? _error;

  bool _more = true;
  bool _lock = false;
  late final ScrollController _controller;
  late Map<int, ShareInviteItem> _selectedContact;
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
              hintText: BaseK.K.input_name_to_search,
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
    ShareInviteItem data = _contactList[index];
    bool selected = _selectedContact.containsKey(data.uid);

    return ShareInviteItemWidget(
      selected: selected,
      data: data,
      onRoomItemClick: _onItemClick,
      musicShare: widget.musicShare,
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Text(
        BaseK.K.no_result,
        style: TextStyle(color: R.color.secondTextColor, fontSize: 15),
      ),
    );
  }

  _loadCompanionRank(int page) async {
    try {
      Map<String, String> body = {};
      body['page'] = page.toString();
      body['uid'] = '${Session.uid}';
      XhrResponse response = await Xhr.getJson(
          '${System.domain}rank/degree?version=5',
          params: body,
          throwOnError: true);
      Map json = response.value();
      bool success = Util.parseBool(json['success']);
      _more = Util.parseBool(json['more']);
      if (page == 1) {
        _contactList.clear();
      }
      if (success) {
        List data = json['data'];

        Log.d('accompanydata:$data');
        for (var element in data) {
          ShareInviteItem friendItem = ShareInviteItem(
            uid: Util.parseInt(element["uid"], 0),
            name: Util.notNullStr(element["name"]),
            icon: Util.notNullStr(element["icon"]),
            titleNew: Util.parseInt(element["title_new"], 0),
          );
          _contactList.add(friendItem);
        }
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

    if (widget.type == InviteFriendsListType.CompanionRank) {
      await _loadCompanionRank(page);
      return;
    }

    try {
      String url = '${System.domain}go/yy/friend/data';
      final Map<String, String> params = {
        "type": widget.type == InviteFriendsListType.Group ? 'group' : 'friend',
        "page": page.toString(),
        "pageSize": pageSize.toString(),
        "query": _searchKey,
      };

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
            ShareInviteItem friend = ShareInviteItem.fromJson(item);
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
      String? jsonTempGroup = Config.get("${Session.uid}.message.tempgroup");
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
      String? jsonFamiliar = Config.get("${Session.uid}.message.familiar");
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
        ShareInviteItem friendItem = ShareInviteItem(
            uid: info.uid,
            memberIcons: info.members,
            mark: info.mark,
            name: info.name ?? '',
            icon: info.icon ?? '',
            titleNew: info.titleNew);
        if (conv.type == 'group') friendItem.isGroup = true;
        _contactList.add(friendItem);
      }
      if (mounted && traverseNum == _data.length) setState(() {});
    }
  }

  _onItemClick(ShareInviteItem item, bool selected) {
    if (selected && !_selectedContact.containsKey(item.uid)) {
      _selectedContact[item.uid] = item;
      widget.onItemClick(item, selected);
    }
  }
}

class ShareInviteItemWidget extends StatefulWidget {
  final bool selected;
  final ShareInviteItem data;
  final OnShareInviteClick onRoomItemClick;
  final bool musicShare;

  const ShareInviteItemWidget({
    super.key,
    required this.selected,
    required this.data,
    required this.onRoomItemClick,
    this.musicShare = false,
  });

  @override
  State<StatefulWidget> createState() => _ShareInviteItemWidgetState();
}

class _ShareInviteItemWidgetState extends State<ShareInviteItemWidget> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> icons = [];
    if (widget.data.members != null && widget.data.members!.isNotEmpty) {
      for (var member in widget.data.members!) {
        icons.add(member['icon']);
      }
    } else if (widget.data.memberIcons != null) {
      icons = widget.data.memberIcons!;
    }

    return InkWell(
      child: SizedBox(
        height: 76,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: icons.isNotEmpty
                  ? GroupIconCircle(icons: icons)
                  : CommonAvatar(
                      path: widget.data.icon, size: 52, shape: BoxShape.circle),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 6),
                    child:
                        _buildName(widget.data.markName, widget.data.titleNew),
                  ),
                  Row(
                    children: <Widget>[
                      R.img(
                        RoomAssets.chat_room$id_icon_svg,
                        height: 16,
                        width: 16,
                        color: R.color.mainTextColor.withOpacity(0.4),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 2),
                        child: Text(
                          '${widget.data.uid}',
                          style: R.textStyle.caption,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 12.0),
            InkWell(
              onTap: () {
                if (!_selected) {
                  setState(() {
                    _selected = !_selected;
                    widget.onRoomItemClick(widget.data, _selected);
                  });
                }
              },
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                width: 58.0,
                height: 32.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  gradient: LinearGradient(
                    colors: _selected
                        ? R.color.darkGradientColors
                        : R.color.mainBrandGradientColors,
                  ),
                ),
                child: Text(
                  _shareButtonTitle,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String get _shareButtonTitle {
    if (_selected) {
      if (widget.musicShare) {
        return K.room_good_voice_shared;
      } else {
        return K.room_share_invited;
      }
    } else {
      if (widget.musicShare) {
        return K.room_good_voice_share;
      } else {
        return K.room_share_invite;
      }
    }
  }

  Widget _buildName(String name, int titleNew) {
    return Text(
      name,
      style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ShareInviteItem {
  final int uid;
  final String roomIcon;
  final String roomPrefix;
  final String name;
  final String mark;
  final String icon;
  final String title;
  final String sign;
  final List? members;
  final int titleNew;

  List<String>? memberIcons;
  bool isGroup = false;
  int official = 0;

  String get markName {
    if (mark.isNotEmpty) {
      return mark;
    } else {
      return name;
    }
  }

  ShareInviteItem({
    required this.uid,
    required this.name,
    required this.icon,
    required this.titleNew,
    this.roomIcon = '',
    this.roomPrefix = '',
    this.mark = '',
    this.title = '',
    this.sign = '',
    this.members,
    this.memberIcons,
  }) : super();

  ShareInviteItem.fromJson(Map data)
      : uid = Util.parseInt(data['uid']),
        title = data['title'],
        name = data['name'],
        mark = data['mark'],
        icon = data['icon'],
        roomIcon = data['roomicon'],
        roomPrefix = data['room_prefix'] ?? '',
        sign = data['sign'],
        members = data['members'] ?? [],
        official = data['official'] ?? 0,
        titleNew = data['title_new'] ?? 0;

  @override
  bool operator ==(other) {
    return (other is ShareInviteItem) && other.uid == uid;
  }

  @override
  int get hashCode => uid;
}
