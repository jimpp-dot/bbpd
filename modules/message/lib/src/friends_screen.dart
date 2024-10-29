import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base;
import 'package:shared/model/friend_bean.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:shared/model/companion_model.dart';
import 'package:message/assets.dart';
import 'package:message/src/phone_friend_screen.dart';
import 'package:provider/provider.dart';
import '../k.dart';

typedef OnItemTap = void Function(int targeId, String type);

/// 通讯录好友、关注、粉丝列表页
class FriendsPage extends StatefulWidget {
  final String type;
  final String? subType;
  final bool showSearchBar;
  final bool showPhoneFriend; //通讯录好友
  final OnItemTap? onItemTap;

  const FriendsPage({
    super.key,
    required this.type,
    this.subType,
    this.showSearchBar = false,
    this.showPhoneFriend = false,
    this.onItemTap,
  });

  @override
  FriendsPageState createState() {
    return FriendsPageState();
  }
}

class FriendsPageState extends State<FriendsPage>
    with AutomaticKeepAliveClientMixin<FriendsPage> {
  final int pageSize = 20;

  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();

  Timer? _cancelTimer;
  final List _data = [];
  bool _loading = true;
  bool _first = true;

  int pageIndex = 1;
  String? _error;

  bool _more = true;
  bool _lock = false;
  late ScrollController _controller;
  late IChatManager _chatManager;
  late IRankManager _rankManager;
  String _searchKey = '';
  final GlobalKey<SearchBarState> _inputKey = GlobalKey<SearchBarState>();

  int _firstIndex = -1; //当前屏幕内可见的第一个条目索引
  int _lastIndex = -1; //当前屏幕内可见的最后一个条目索引
  final Map<int, UserConfig> _configMap = {}; //列表中用户状态信息
  final Map<int, UserConfig> _groupConfigMap = {}; //列表中Group状态信息
  Timer? _loadOnlineTimer;
  bool _isCurrentTab = true;
  bool _showDeleteUserTips = false;
  final List<int> _hasRefreshUid = [];

  set isCurrentTab(bool isCurrent) {
    _isCurrentTab = isCurrent;
    if (_isCurrentTab) {
      _restartLoadOnlineTimer();
    } else {
      _loadOnlineTimer?.cancel();
    }
  }

  bool get isCurrentTab => _isCurrentTab;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    _chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    _rankManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
    _controller = ScrollController();
    _controller.addListener(_onScroll);
    _load(1);
    _restartLoadOnlineTimer();
  }

  _restartLoadOnlineTimer() {
    _loadOnlineTimer?.cancel();
    _loadOnlineTimer = Timer.periodic(const Duration(seconds: 3), _loadOnline);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    _cancelTimer?.cancel();
    closeInput();
    _loadOnlineTimer?.cancel();
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
    if (_inputKey.currentState != null) {
      _inputKey.currentState!.close();
    }
  }

  Future<void> reload([bool force = false]) async {
    Log.d("friend view reload ${widget.type}");
    closeInput();
    if (_first && !force) {
      _first = false;
      return;
    }
    if (_key.currentState != null) await _key.currentState!.show();
  }

  //重置数据并刷行界面
  resetData() {
    _data.clear();
    _configMap.clear();
    _groupConfigMap.clear();
    setState(() {});
  }

  _load(int page) async {
    _lock = true;

    String url = '${System.domain}go/yy/friend/data';

    Map<String, String> params = {
      "type": widget.subType == 'tempgroup' ? 'tempgroup' : widget.type,
      "page": page.toString(),
      "pageSize": pageSize.toString(),
      "query": _searchKey
    };

    try {
      XhrResponse response;
      if (widget.type == FriendsListType.Companion) {
        url = '${System.domain}rank/degree?version=5';
        params = {
          "page": page.toString(),
          "uid": Session.uid.toString(),
        };
        response = await Xhr.getJson(url, params: params, throwOnError: true);
      } else {
        response = await Xhr.postJson(url, params,
            throwOnError: true, formatJson: true);
      }
      Map res = response.value();
      List? list = res['data'];
      if (page == 1) {
        _data.clear();
        _configMap.clear();
        _hasRefreshUid.clear();
        _groupConfigMap.clear();
        _showDeleteUserTips = widget.type == FriendsListType.Fan &&
            Util.parseBool(res['have_forbidden']);
      }

      if (list != null && list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          Map item = list[i];
          try {
            if (widget.type == FriendsListType.Companion) {
              CompanionRankModel companion =
                  CompanionRankModel.fromJson(item as Map<String, dynamic>);
              _data.add(companion);
            } else {
              FriendItem friend = FriendItem.fromJson(item);
              if ((friend.uid) > 0) {
                _data.add(friend);
              }
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
      _error = null;
    } catch (e) {
      Log.d(e);
      _error = e.toString();
      _more = false;
    }

    _loading = false;
    _lock = false;
    if (mounted) {
      setState(() {});
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
          style: TextStyle(fontSize: 13.0, color: R.colors.secondTextColor),
        ),
      ),
    );
  }

  void _onTap(FriendItem item) {
    String type = widget.type == FriendsListType.Group ? "group" : "private";

    if (widget.onItemTap != null) {
      widget.onItemTap!(item.uid, type);
      return;
    }

    item.redpoint = 0;
    _chatManager.openUserChatScreen(
      context,
      type: type,
      targetId: item.uid,
      title: item.name,
      official: item.official ?? 0,
      extType: item.extType,
    );
    Tracker.instance
        .track(TrackEvent.chat, properties: {'refer': 'create_new_chat'});
  }

  Widget _renderRoom(Object item) {
    if (item is FriendItem) {
      UserConfig? config =
          item.isGroup ? _groupConfigMap[item.uid] : _configMap[item.uid];
      bool inRoom = false;
      int rid;
      if (config != null && config.room != null && config.room! > 0) {
        inRoom = true;
        rid = config.room ?? 0;
      } else {
        inRoom = (item.room ?? 0) > 0;
        rid = item.room ?? 0;
      }
      if (inRoom) {
        return InkWell(
          child: Container(
            padding: const EdgeInsetsDirectional.only(
              start: 8.0,
              end: 8.0,
            ),
            decoration: BoxDecoration(
              color: R.colors.mainBrandColor,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  item.roomPrefix ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 3.0),
                  child: Image.asset(
                    R.imagePath("living_small.webp",
                        package: ComponentManager.MANAGER_BASE_CORE),
                    width: 16.0,
                    height: 16.0,
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            RoomFrom from;
            if (widget.type == FriendsListType.Fan) {
              from = RoomFrom.fans_list;
            } else if (widget.type == FriendsListType.Follow) {
              from = RoomFrom.follow_list;
            } else {
              from = RoomFrom.friend_list;
            }

            IRoomManager roomManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            roomManager.openChatRoomScreenShow(context, rid,
                from: from, refer: 'contact');
          },
        );
      }
    }
    return Container();
  }

  Widget _buildFriendItem(FriendItem item) {
    String statusStr = '';
    UserConfig? config = item.userConfig;
    int rid = item.room ?? 0;
    int online = item.online ?? 0;
    if (_hasRefreshUid.contains(item.uid)) {
      config = _configMap[item.uid];
      config ??= UserConfig.fromJson({});
      rid = config.room ?? 0;
      online = config.online ?? 0;
    }
    if (rid > 0) {
      statusStr = K.msg_patrying;
    } else if (online == 1) {
      statusStr = K.msg_online_text;
    } else if (online == 2) {
      statusStr = K.message_invisible;
    } else {
      statusStr = item.onlineDiffStr ?? '';
    }
    return GestureDetector(
      onTap: () {
        _onTap(item);
      },
      behavior: HitTestBehavior.translucent,
      child: Rext.themeCardContainer(
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 10),
        cornerRadius: 8.0,
        padding:
            const EdgeInsetsDirectional.only(top: 10, bottom: 10, start: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StatusAvatar(
              roomName: config?.roomTypeName ?? '',
              roomIcon: config?.acuteIcon ?? '',
              colors: config?.bgColors,
              roomTagBorderColor: Colors.transparent,
              userAvatar: item.icon,
              uid: item.uid,
              rid: rid,
              online: online == 1,
              refer: 'contact',
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: _buildTitle(
                              item.markName ?? '', item.titleNew ?? 0),
                        ),
                        if (item.official == 1)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 4),
                            child: R.img('ic_official.png',
                                width: 23,
                                height: 14,
                                package: ComponentManager.MANAGER_BASE_CORE),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    statusStr,
                    style: R.textStyle.regular12
                        .copyWith(color: R.colors.thirdTextColor),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // if (item.online == 1 && item.room == 0)
            //   GestureDetector(
            //     onTap: () {
            //       IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
            //       roomManager.createRoomAndInviteFriend(context, item.uid, refer: 'contact_list_room_prompt');
            //     },
            //     child: Padding(
            //       padding: const EdgeInsetsDirectional.only(end: 4.0),
            //       child: R.img(
            //           darkMode
            //               ? Assets.assets_images_invite_into_room_dark_png
            //               : Assets.assets_images_invite_into_room_png,
            //           width: 48,
            //           height: 48,
            //           package: ComponentManager.MANAGER_MESSAGE),
            //     ),
            //   )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String name, int titleNew) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: R.colors.mainTextColor,
          fontSize: 14,
          fontFamily: Util.fontFamily),
    );
  }

  Widget _buildGroup(FriendItem item) {
    List<String> icons = [];
    if (item.members != null) {
      for (var member in item.members!) {
        icons.add(member['icon']);
      }
    }

    List<Widget> widgets = [
      Center(
          child: Container(
              padding: const EdgeInsetsDirectional.only(end: 12.0),
              child: GroupIconCircle(icons: icons))),
    ];

    if ((item.redpoint ?? 0) > 0) {
      widgets.add(
        PositionedDirectional(
          top: 10.0,
          end: 0.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            child: Container(
              width: 8.0,
              height: 8.0,
              color: Colors.red,
            ),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        _onTap(item);
      },
      child: Rext.themeCardContainer(
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 10),
        cornerRadius: 8.0,
        padding:
            const EdgeInsetsDirectional.only(top: 10, bottom: 10, start: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: widgets,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.markName ?? '',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16.0, color: R.colors.mainTextColor),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 160.0),
                    child: Text(
                      item.uid.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: R.colors.secondTextColor, fontSize: 12.0),
                    ),
                  )
                ],
              ),
            ),
            _renderRoom(item)
          ],
        ),
      ),
    );
  }

  Widget _buildCompanion(int index) {
    CompanionRankModel item = _data[index];

    Widget renderIndex() {
      if (index <= 2) {
        return R.img(
          'packages/message/assets/images/ic_rank_${index + 1}.png',
          width: 30,
          height: 33,
          package: ComponentManager.MANAGER_RANK,
        );
      } else {
        return NumText(
          "${index + 1}",
          textScaleFactor: 1.0,
          style: R.textStyle.subCaption
              .copyWith(fontSize: 20, color: R.colors.thirdTextColor),
        );
      }
    }

    String? iconUrl = Util.getUserIconUrl(item.icon);

    Widget rightStatusWidget() {
      if ((item.rid ?? 0) > 0 && item.tagInfo != null) {
        return GestureDetector(
            onTap: () {
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openChatRoomScreenShow(context, item.rid ?? 0,
                  from: RoomFrom.companion_list, refer: 'companionlist');
            },
            child: Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: InRoomTag(
                  label: item.tagInfo?.label ?? '',
                  gradientBgColors: item.tagInfo?.bgColors),
            ));
      } else {
        return Container();
      }
    }

    return InkWell(
      onTap: () {
        String type = "private";

        if (widget.onItemTap != null) {
          widget.onItemTap!(Util.parseInt(item.uid), type);
          return;
        }

        _chatManager.openUserChatScreen(
          context,
          type: type,
          targetId: Util.parseInt(item.uid),
          title: item.name,
        );
      },
      child: Rext.themeCardContainer(
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 10),
        cornerRadius: 8.0,
        padding:
            const EdgeInsetsDirectional.only(top: 10, bottom: 10, start: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            showRankByKey(accompanyKey)
                ? Container(
                    width: 50,
                    padding: const EdgeInsets.only(bottom: 4),
                    alignment: AlignmentDirectional.center,
                    child: renderIndex(),
                  )
                : const Padding(padding: EdgeInsetsDirectional.only(start: 16)),
            GestureDetector(
              onTap: () {
                IPersonalDataManager personalDataManager = ComponentManager
                    .instance
                    .getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(
                    context, Util.parseInt(item.uid),
                    refer: const PageRefer('CompanionRankPage'));
              },
              child: ClipOval(
                //使用CommonAvatar CachedNetworkImage在滑动删除时会闪一下
                child: Container(
                  width: 52,
                  height: 52,
                  color: R.colors.secondBgColor,
                  child: (iconUrl == null)
                      ? Container()
                      : Image(
                          image: NetworkImage(
                              Util.getUserIconUrl(item.icon) ?? ''),
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flexible(
                              child: _buildTitle(
                                  item.name ?? '', item.titleNew ?? 0),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            UserSexAndAgeWidget(
                              sex: item.sex,
                              age: item.age,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            RelationWidget(
                              relation: item.relation ?? 0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[rightStatusWidget()],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  _rankManager.getCompanionValueWidget(
                      item.degree ?? 0, item.stay_secs ?? 0,
                      textColor: R.colors.thirdTextColor)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneFriend() {
    if (widget.type == FriendsListType.Friend && widget.showPhoneFriend) {
      return GestureDetector(
        onTap: () async {
          if (!Config.getBool(BBConfigKey.hasShowContactsRedDot, false)) {
            Config.setBool(BBConfigKey.hasShowContactsRedDot, true);
            if (mounted) {
              setState(() {});
            }
          }
          PhoneFriendScreen.show(context);
        },
        child: Rext.themeCardContainer(
          margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
          padding: const EdgeInsetsDirectional.only(end: 10),
          height: 72,
          cornerRadius: 8,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              R.img(
                  darkMode
                      ? Assets.assets_images_message_contact_dark_png
                      : Assets.assets_images_message_contact_png,
                  width: 68,
                  height: 68,
                  package: ComponentManager.MANAGER_MESSAGE),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      K.msg_find_address_book_friend,
                      style: R.textStyle.regular14
                          .copyWith(color: R.colors.mainTextColor),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      K.msg_find_friend_use_app([Util.appName]),
                      style: R.textStyle.regular12
                          .copyWith(color: R.colors.thirdTextColor),
                    )
                  ],
                ),
              ),
              if (!Config.getBool(BBConfigKey.hasShowContactsRedDot, false))
                const RedDot(
                  width: 10,
                  height: 10,
                  showBorder: false,
                ),
              _buildContactsRed(),
              const SizedBox(
                width: 2,
              ),
              R.img(Assets.assets_images_ic_next_small_webp,
                  color: R.colors.secondTextColor,
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_MESSAGE)
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildSearchBar() {
    if ((widget.type == FriendsListType.Friend ||
            widget.type == FriendsListType.Follow ||
            widget.type == FriendsListType.Fan) &&
        widget.showSearchBar) {
      return Container(
        margin: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 8, bottom: 14),
        child: SearchBar(
          _onQueryChanged,
          key: _inputKey,
          height: 32,
          hintText: base.K.input_name_to_search,
          suppDark: true,
        ),
      );
    } else {
      return Container();
    }
  }

  /// 通讯录红点
  Widget _buildContactsRed() {
    return Consumer<ProfilePayload>(builder: (_, bean, __) {
      if (bean.contactsNew <= 0) {
        return Container();
      }
      return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: R.colors.thirdBrightColor),
        constraints: const BoxConstraints(
          minWidth: 16,
        ),
        alignment: AlignmentDirectional.center,
        child: Center(
            child: Text(bean.contactsNew.toString(),
                style: R.textStyle.medium12
                    .copyWith(fontSize: 10, color: Colors.white))),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        Expanded(child: _buildBody()),
      ],
    );
  }

  Widget _buildBody() {
    if (_error != null && pageIndex == 1) {
      return Center(
        child: ErrorData(
          error: _error,
          onTap: () {
            _load(pageIndex);
          },
          fontColor: R.colors.secondTextColor,
        ),
      );
    }

    bool searchResultEmpty = false;

    if (_searchKey.isNotEmpty && pageIndex == 1 && _data.isEmpty) {
      searchResultEmpty = true;
    }
    List<Widget> slivers = [
      SliverToBoxAdapter(
        child: _buildSearchBar(),
      ),
      SliverToBoxAdapter(
        child: _buildPhoneFriend(),
      ),
    ];
    if (_loading && pageIndex == 1) {
      slivers.add(const SliverFillRemaining(
        child: Loading(),
      ));
    } else {
      if (searchResultEmpty) {
        slivers.add(
          SliverToBoxAdapter(
            child: _buildEmpty(),
          ),
        );
      } else {
        if (_data.isEmpty || !showRankListByKey(accompanyKey)) {
          slivers.add(
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 120.0),
                child: ErrorData(
                  error: base.K.no_data,
                  fontColor: R.colors.secondTextColor,
                  onTap: () {
                    setState(() {
                      _loading = true;
                    });
                    _load(pageIndex);
                  },
                ),
              ),
            ),
          );
        } else {
          slivers.addAll([
            if (_showDeleteUserTips) const DeletedUserTips(),
            SliverList(
              delegate: FixedExtentSliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                if (widget.type == FriendsListType.Companion) {
                  return _buildCompanion(index);
                }
                FriendItem item = _data.elementAt(index);
                if (widget.type == FriendsListType.Group) {
                  if (ChatUtil.isGroupId(Util.parseInt(item.uid)) &&
                      item.members?.isNotEmpty == true) {
                    return _buildGroup(item);
                  }
                }
                return _buildFriendItem(item);
              },
                  childCount: _data.length,
                  onPositionChanged: _handlePositionChanged),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _buildLoadMore(),
                ],
              ),
            ),
          ]);
        }
      }
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
            slivers: slivers,
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
        style: TextStyle(color: R.colors.secondTextColor, fontSize: 15),
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

  void _handlePositionChanged(int firstIndex, int lastIndex) {
    Log.d(
        'FriendsPageState._handlePositionChanged firstIndex = $firstIndex, lastIndex = $lastIndex');
    _firstIndex = firstIndex;
    _lastIndex = lastIndex;
  }

  /// 获取对应数据的用户或者群组的状态信息
  _loadOnline(Timer timer) async {
    if (!isCurrentTab) return;
    if (widget.type == FriendsListType.Companion) return;
    if (_firstIndex == -1 ||
        _lastIndex == -1 ||
        (_firstIndex == 0 && _lastIndex == 0)) {
      return;
    }

    List<String> uids = [];
    List<String> gids = [];
    for (int i = _firstIndex; i <= _lastIndex; i++) {
      if (_firstIndex < 0 || _lastIndex >= _data.length) continue;
      FriendItem item = _data[i];
      String id = item.uid.toString();
      if (item.isGroup) {
        gids.add(id);
      } else {
        uids.add(id);
        if (_configMap.containsKey(item.uid)) {
          _configMap.remove(item.uid);
        }
      }
    }

    if (uids.isNotEmpty || gids.isNotEmpty) {
      try {
        await BaseRequestManager.cloudAll(uids,
            groudIds: gids,
            roomConfig: _configMap,
            groupConfig: _groupConfigMap);

        for (var element in uids) {
          int uid = Util.parseInt(element);
          if (!_hasRefreshUid.contains(uid)) {
            _hasRefreshUid.add(uid);
          }
        }

        if (!mounted) return;
        setState(() {});
      } catch (e) {
        Log.d(e);
      }
    }
  }
}
