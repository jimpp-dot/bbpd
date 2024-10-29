import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/a.dart';
import 'package:message/assets.dart';
import 'package:message/src/message_pop_window.dart';
import 'package:provider/provider.dart';
import '../k.dart';
import 'friends_screen.dart';
import 'visitor/visitor_page.dart';

/// 通讯录
class ContactPage extends StatefulWidget {
  final ContactTab initialPage;
  final bool showFamily;
  final bool isStartNewChat;
  final bool onlySelectUser;
  final bool showFootprint;

  const ContactPage({
    super.key,
    this.initialPage = ContactTab.friend,
    this.showFamily = true,
    this.isStartNewChat = false,
    this.onlySelectUser = false,
    this.showFootprint = false,
  });

  static Future show(
    BuildContext context, {
    Key? key,
    ContactTab initialPage = ContactTab.friend,
    bool showFamily = true,
    bool isStartNewChat = false,
    bool onlySelectUser = false,
    bool showFootprint = false,
  }) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ContactPage(
        key: key,
        initialPage: initialPage,
        showFamily: showFamily,
        isStartNewChat: isStartNewChat,
        onlySelectUser: onlySelectUser,
        showFootprint: showFootprint,
      ),
      settings: const RouteSettings(name: 'contact'),
    ));
  }

  @override
  _ContactPageState createState() {
    return _ContactPageState();
  }
}

class _ContactPageState extends State<ContactPage>
    with SingleTickerProviderStateMixin {
  int _pageIndex = 0;
  final GlobalKey<FriendsPageState> _keyFriend = GlobalKey();
  final GlobalKey<FriendsPageState> _keyFollow = GlobalKey();
  final GlobalKey<FriendsPageState> _keyFan = GlobalKey();
  final GlobalKey<FriendsPageState> _keyCompanion = GlobalKey();
  final GlobalKey<FriendsPageState> _keyGroup = GlobalKey();
  final GlobalKey<RoomFootprintPageState> _keyRoomFootprint = GlobalKey();

  List<GlobalKey> _keys = [];
  late ExtendedTabController _tabController;
  final GlobalKey _addKey = GlobalKey();

  final List<String> _tabs = List.from(A.contact_tabs);
  final List<Widget> _tabsWidget = [];
  String _title = '';

  late ProfilePayload _profilePayload;

  @override
  void initState() {
    super.initState();
    _keys = [
      _keyFriend,
      _keyFollow,
      _keyFan,
      _keyCompanion,
      _keyGroup,
    ];

    // 在第一位置添加"房间足迹"列表
    if (widget.showFootprint) {
      _tabs.insert(0, K.msg_room_footprint);
      _keys.insert(0, _keyRoomFootprint);
    }

    for (int i = 0; i < _tabs.length; i++) {
      _tabsWidget.add(Tab(
        child: Text(_tabs[i], style: TextStyle(color: R.colors.mainTextColor)),
      ));
    }

    _pageIndex = widget.initialPage.index;
    _tabController = ExtendedTabController(
        initialIndex: _pageIndex, length: _keys.length, vsync: this)
      ..addListener(_onTabChanged);
    eventCenter.addListener(EventConstant.UserFollow, _onUserFollow);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _profilePayload = Provider.of<ProfilePayload>(context, listen: true);
    _updateTitle();
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.UserFollow, _onUserFollow);
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  _onUserFollow(String type, dynamic value) {
    if (_isPageIdxHoldForKey(_keyFollow)) {
      _reload();
    }
  }

  bool _isPageIdxHoldForKey(GlobalKey key) {
    return _pageIndex == _keys.indexOf(key);
  }

  _onTabChanged() {
    if (_pageIndex == _tabController.index) {
      return;
    }
    _pageIndex = _tabController.index;
    _keyFriend.currentState?.closeInput();
    for (int i = 0; i < _keys.length; i++) {
      if (_keys[i].currentState is FriendsPageState) {
        (_keys[i].currentState as FriendsPageState).isCurrentTab =
            _pageIndex == i;
      }
    }
    _reload();
    _updateTitle();
  }

  reload() {
    _reload();
  }

  _reload() {
    GlobalKey key = _keys[_tabController.index];
    if (key.currentState is FriendsPageState) {
      (key.currentState as FriendsPageState).reload(true);
    }
  }

  _updateTitle() {
    if (widget.isStartNewChat) {
      _title = K.msg_new_chat;
      return;
    }
    _title = _tabs[_pageIndex];
    if (_isPageIdxHoldForKey(_keyFriend)) {
      // 好友
      _title = _profilePayload.friends > 0
          ? '$_title(${_profilePayload.friends})'
          : _title;
    } else if (_isPageIdxHoldForKey(_keyFollow)) {
      // 关注
      _title = _profilePayload.follows > 0
          ? '$_title(${_profilePayload.follows})'
          : _title;
    } else if (_isPageIdxHoldForKey(_keyFan)) {
      // 粉丝
      _title = _profilePayload.fans > 0
          ? '$_title(${_profilePayload.fans})'
          : _title;
    } else if (_isPageIdxHoldForKey(_keyCompanion)) {
      // 陪伴榜
      _title = _profilePayload.accompany > 0
          ? '$_title(${_profilePayload.accompany})'
          : _title;
    } else if (_isPageIdxHoldForKey(_keyGroup)) {
      // 群组
      _title = _profilePayload.groups > 0
          ? '$_title(${_profilePayload.groups})'
          : _title;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        title: DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: R.colors.mainTextColor),
          child: Text(_title),
        ),
        actions: <Widget>[
          IconButton(
            key: _addKey,
            icon: R.img(
              'ic_add.webp',
              width: 24,
              color: R.colors.mainTextColor,
              package: ComponentManager.MANAGER_MESSAGE,
            ),
            onPressed: () {
              {
                CommonPopupWindow.showPopWindow(
                  context,
                  '',
                  _addKey,
                  popWidget: const CommonMessagePopWindow(
                      showRoom: false, refer: 'contacts_plus'),
                );
              }
            },
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: <Widget>[
            if (widget.isStartNewChat) _buildNewChatButton(),
            Container(
              height: 40,
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsetsDirectional.only(start: 10.0),
              margin: const EdgeInsets.only(bottom: 6.0),
              child: CommonTabBar(
                tabs: _tabsWidget,
                controller: _tabController,
                marginStart: 0,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const BoxDecoration(),
                labelStyle: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                unselectedLabelStyle:
                    TextStyle(color: R.colors.mainTextColor, fontSize: 14),
                indicatorColor: Colors.transparent,
                unselectedLabelColor: R.colors.thirdTextColor,
                isScrollable: true,
              ),
            ),
            Expanded(
                child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  double offset = notification.metrics.pixels;
                  double screenWidth = MediaQuery.of(context).size.width;
                  _tabController.scrollPosition = offset / screenWidth;
                }
                return false;
              },
              child: ExtendedTabBarView(
                controller: _tabController,
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  if (widget.showFootprint)
                    RoomFootprintPage(
                        key: _keyRoomFootprint,
                        pageRefer: 'room_footprint'), // 房间足迹
                  FriendsPage(
                    type: FriendsListType.Friend,
                    key: _keyFriend,
                    showSearchBar: true,
                    showPhoneFriend: true,
                    onItemTap: _onItemTap,
                  ),
                  FriendsPage(
                    type: FriendsListType.Follow,
                    key: _keyFollow,
                    showSearchBar: true,
                    onItemTap: _onItemTap,
                  ),
                  FriendsPage(
                    type: FriendsListType.Fan,
                    key: _keyFan,
                    showSearchBar: true,
                    onItemTap: _onItemTap,
                  ),
                  FriendsPage(
                    type: FriendsListType.Companion,
                    key: _keyCompanion,
                    onItemTap: _onItemTap,
                  ),
                  FriendsPage(
                    type: FriendsListType.Group,
                    key: _keyGroup,
                    onItemTap: _onItemTap,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    ).withCommonBg();
  }

  OnItemTap? get _onItemTap =>
      widget.onlySelectUser == true ? _onlySelectUserCallback : null;

  void _onlySelectUserCallback(int uid, String type) {
    Navigator.of(context).pop({'target': uid, 'type': type});
  }

  Widget _buildNewChatButton() {
    return GestureDetector(
      onTap: () async {
        IGroupManager groupManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_GROUP);
        bool result = await groupManager.checkCanCreateGroup();
        if (result) {
          groupManager.openGroupCreateScreenNew(Constant.context);
        }
        Tracker.instance.track(TrackEvent.create_group_start,
            properties: {'uid': Session.uid});
      },
      child: SizedBox(
        width: Util.width,
        height: 70,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8, end: 12),
              child: R.img(
                darkMode
                    ? Assets.assets_images_ic_create_group_dark_png
                    : Assets.assets_images_ic_create_group_png,
                width: 68,
                height: 68,
                package: ComponentManager.MANAGER_MESSAGE,
              ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.only(top: 15, bottom: 15),
                child: SizedBox(
                    child: Text(K.msg_start_group_chat,
                        style: TextStyle(
                            fontSize: 15, color: R.colors.mainTextColor)))),
          ],
        ),
      ),
    );
  }
}
