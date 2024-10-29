import 'dart:math';

import 'package:shared/shared.dart' hide SliverAppBar;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moment/src/api/api.dart';
import 'package:moment/src/circle/model/circle_detail_resp.dart';
import 'package:moment/src/circle/model/circle_join_resp.dart';
import 'package:moment/src/circle/widget/circle_friend_avatar_widget.dart';

import '../../../k.dart';
import 'circle_friends_playing_screen.dart';
import 'circle_moment_page.dart';

typedef RefreshCallback = void Function();

/// 圈子详情
class CircleDetailScreen extends StatefulWidget {
  static const String CIRCLE_DETAIL_ROUTE = '/circle_detail_screen';
  final int circleId;
  final String? circleName;
  final RefreshCallback callback;
  final String? from;

  const CircleDetailScreen(
      this.circleId, this.circleName, this.callback, this.from,
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return CircleDetailState();
  }

  static Future openCircleDetailScreen(BuildContext context, int circleId,
      String? circleName, RefreshCallback callback, String from,
      {Key? key}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: CIRCLE_DETAIL_ROUTE),
        builder: (context) {
          return CircleDetailScreen(circleId, circleName, callback, from,
              key: key);
        },
      ),
    );
  }
}

class CircleDetailState extends State<CircleDetailScreen>
    with TickerProviderStateMixin, TabStateMixin {
  static const STATE_LOADING = 1;
  static const STATE_ERROR = 2;
  static const STATE_LOADED = 3;
  int _state = STATE_LOADING;

  final ScrollController _scrollController = ScrollController();
  TabController? _tabController;
  int tabIndex = 0;
  bool _isInTop = true;
  late double photoHeaderHeight;
  late double cornerHeight;
  CircleDetailData? data;
  final GlobalKey _topSectionKey = GlobalKey();
  bool _requesting = false;

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.net_detail_page,
        properties: {'from': widget.from, 'net': widget.circleName});
    photoHeaderHeight = 220;
    cornerHeight = 16;
    _scrollController.addListener(_onScroll);
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
  }

  void _onTabChanged() {
    if (_tabController == null || _tabController!.indexIsChanging) return;

    Tracker.instance.track(TrackEvent.net_detail_page, properties: {
      'tab_id': data!.tabList[_tabController!.index].id,
      'net_name': data!.name ?? '',
    });
    tabIndex = _tabController!.index;
    setState(() {});
  }

  void _loadData() async {
    if (mounted) {
      setState(() {
        _state = STATE_LOADING;
      });
    }
    DataRsp<CircleDetailData> rsp =
        await Api.getCircleDetailResponse(widget.circleId);
    if (rsp.success == true) {
      if (mounted) {
        setState(() {
          _state = STATE_LOADED;
          data = rsp.data;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _state = STATE_ERROR;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data?.tabList != null &&
        data!.tabList.isNotEmpty &&
        _tabController == null) {
      tabIndex = data!.tabList.indexWhere((element) => element.selected == 1);
      tabIndex = max(0, tabIndex);
      safeRun(() {
        _tabController = TabController(
            initialIndex: tabIndex, length: data!.tabList.length, vsync: this);
        _tabController!.addListener(_onTabChanged);
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_state == STATE_LOADING && data == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (_state == STATE_ERROR && data == null) {
      return ErrorData(
        error: K.moment_something_went_wrong,
        onTap: () {
          _loadData();
        },
      );
    } else {
      return Stack(
        children: <Widget>[
          CommonNestedScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                _buildAppBar(_isInTop, context),
                SliverToBoxAdapter(
                  child: _buildTopSection(context),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate:
                      CustomSliverPersistentHeaderDelegate(_buildTabBar(), 44),
                )
              ];
            },
            body: TabBarView(
              physics: const ClampingScrollPhysics(),
              controller: _tabController,
              children: data!.tabList
                  .map(
                    (tabItem) => NestedScrollViewInnerScrollPositionKeyWidget(
                      Key('${tabItem.id}'),
                      CircleMomentPage(data!.id, tabItem.id, widget.callback,
                          widget.circleName ?? ''),
                    ),
                  )
                  .toList(),
            ),
            pinnedHeaderSliverHeightBuilder: () {
              return MediaQuery.of(context).padding.top + kToolbarHeight + 44;
            },
            innerScrollPositionKeyBuilder: () {
              return Key('${data!.tabList[_tabController!.index].id}');
            },
          ),
          _buildPublishBtn()
        ],
      );
    }
  }

  Widget _buildPublishBtn() {
    return PositionedDirectional(
      bottom: 32,
      end: 4,
      child: GestureDetector(
        onTap: _onPublishTaped,
        child: R.img(
          'ic_moment_publish.webp',
          width: 92,
          height: 92,
          package: ComponentManager.MANAGER_MOMENT,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// 发布动态
  _onPublishTaped() {
    Tracker.instance
        .track(TrackEvent.net_detail_page, properties: {'publish': data!.name});
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentPublishScreen(context,
        isTwoStep: true, tag: data!.name, from: widget.circleName);
  }

  /// 圈友在玩
  _buildTopSection(BuildContext context) {
    List<Widget> children = [];
    children.add(
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _goCircleFriendsPage(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                K.moment_circle_friends_playing,
                style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              R.img(
                'circle/ic_rush_circle_next.svg',
                width: 16,
                height: 16,
                color: R.color.thirdTextColor,
                package: ComponentManager.MANAGER_MOMENT,
              )
            ],
          ),
        ),
      ),
    );
    if (data?.friendList != null && data!.friendList.isNotEmpty) {
      children.add(_buildCircleFriendsList());
    }
    if (data?.activityList != null && data!.activityList.isNotEmpty) {
      children.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: _buildActivityList(),
      ));
    }
    children.add(const SizedBox(
      height: 14,
    ));
    children.add(Container(
      height: 8,
      color: R.color.dividerColor,
    ));
    return Container(
      key: _topSectionKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildCircleFriendsList() {
    List<Widget> childList = [];
    for (int i = 0; i < data!.friendList.length; i++) {
      if (i == 0) {
        childList.add(const SizedBox(
          width: 20,
        ));
      }
      childList.add(GestureDetector(
        onTap: () {
          Tracker.instance.track(
            TrackEvent.net_detail_page,
            properties: {
              'playcard':
                  (data!.friendList[i].isInRoom == 1 ? 'room' : 'no_room')
            },
          );
          if (data!.friendList[i].isInRoom == 1) {
            IRoomManager roomManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            roomManager.openChatRoomScreenShow(
                context, data!.friendList[i].rid);
            //跳房间
          } else {
            //跳个人主页
            IPersonalDataManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            manager.openImageScreen(context, data!.friendList[i].uid,
                refer: const PageRefer(CircleDetailScreen.CIRCLE_DETAIL_ROUTE));
          }
        },
        child: Container(
          width: 94,
          height: 118,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: R.color.dividerColor, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 8,
              ),
              CircleFriendAvatarWidget(
                data!.friendList[i],
                52,
                onlineIndicatorSize: 8,
                onlineIndicatorBorderWidth: 1,
                onlineIndicatorEndMargin: 5,
                onlineIndicatorBottomMargin: -1,
              ),
              const SizedBox(
                height: 8,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 78,
                ),
                child: Text(
                  data!.friendList[i].name ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.0,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: R.color.mainTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 20,
                width: 58,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: R.color.dividerColor),
                alignment: Alignment.center,
                child: LimitedBox(
                  maxWidth: 58,
                  child: Text(
                    data!.friendList[i].roomTag ?? '',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 11,
                        color: R.color.thirdTextColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
      if (i != data!.friendList.length - 1) {
        childList.add(const SizedBox(
          width: 8,
        ));
      } else {
        childList.add(const SizedBox(
          width: 20,
        ));
      }
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: childList,
      ),
    );
  }

  Widget _buildActivityList() {
    List<Widget> child = [];
    child.add(const SizedBox(
      height: 6,
    ));
    for (int i = 0; i < data!.activityList.length; i++) {
      child.add(GestureDetector(
        onTap: () {
          Tracker.instance.track(TrackEvent.net_detail_page,
              properties: {'event': data!.activityList[i].name});
          IMomentManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_MOMENT);
          manager.openTagListScreenScreen(
            context,
            tagId: data!.activityList[i].id,
            title: data!.activityList[i].name ?? '',
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 38,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                alignment: Alignment.center,
                child: Text(
                  K.moment_activity,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              R.img('circle/ic_rush_circle_tag.svg',
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_MOMENT),
              const SizedBox(
                width: 4,
              ),
              Flexible(
                child: Text(
                  data!.activityList[i].name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: child,
    );
  }

  _onScroll() {
    if (!_scrollController.hasClients) return;
    double max = photoHeaderHeight - kToolbarHeight - 20;
    if (_isInTop == true && _scrollController.offset >= max) {
      setState(() {
        _isInTop = false;
      });
    } else if (_isInTop == false && _scrollController.offset < max) {
      setState(() {
        _isInTop = true;
      });
    }
    setState(() {});
  }

  _scrollToTop() {
    Log.d('_scrollToTop');
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  SliverAppBar _buildAppBar(bool isTop, BuildContext context) {
    return SliverAppBar(
      // brightness: isTop ? Brightness.dark : Brightness.light,
      backgroundColor: R.color.mainBgColor,
      automaticallyImplyLeading: false,
      iconTheme: isTop
          ? Theme.of(context).iconTheme.copyWith(color: R.color.mainBgColor)
          : Theme.of(context).iconTheme,
      elevation: 0.0,
      title: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onDoubleTap: () {
          _scrollToTop();
        },
        child: SizedBox(
          width: 200,
          height: 40,
          child: !isTop
              ? Center(
                  child: Text(
                    data!.name ?? '',
                    style: R.textStyle.title,
                  ),
                )
              : Container(),
        ),
      ),
      expandedHeight: photoHeaderHeight - MediaQuery.of(context).padding.top,
      pinned: true,
      floating: false,
      snap: false,
      leading: IconButton(
        icon: Container(
          width: 36.0,
          height: 36.0,
          alignment: Alignment.center,
          child: Center(
            child: R.img(
              "ic_titlebar_back.svg",
              width: 24,
              height: 24,
              color: isTop ? Colors.white : R.color.mainTextColor,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: _buildActions(isTop),
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
              width: MediaQuery.of(context).size.width,
              height: photoHeaderHeight,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: photoHeaderHeight,
                child: Stack(
                  children: <Widget>[
                    (data?.backgroundImageUrl != null &&
                            data!.backgroundImageUrl!.isNotEmpty)
                        ? CachedNetworkImage(
                            imageUrl: data!.backgroundImageUrl,
                            width: MediaQuery.of(context).size.width,
                            height: photoHeaderHeight,
                            fit: BoxFit.cover,
                          )
                        : R.img('bg_topic_default.webp',
                            width: MediaQuery.of(context).size.width,
                            height: photoHeaderHeight,
                            fit: BoxFit.cover,
                            package: ComponentManager.MANAGER_MOMENT),
                    Container(
                      height: photoHeaderHeight,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xFF08032B)
                          .withOpacity(0.85)
                          .withOpacity(0.6),
                    ),
                    PositionedDirectional(
                      start: 20,
                      bottom: 40,
                      child: ClipOval(
                        child: Stack(
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: data!.icon,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.4),
                                    width: 2,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 108,
                      bottom: 79,
                      child: Text(
                        data!.name ?? '',
                        style: TextStyle(
                            fontSize: 22,
                            color: R.color.mainBgColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    PositionedDirectional(
                      start: 108,
                      bottom: 51,
                      child: Text(
                        K.moment_joined_number([data!.userNum.toString()]),
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFF6F7F9)),
                      ),
                    ),
                    if (data!.isJoin == 0)
                      PositionedDirectional(
                        end: 20,
                        bottom: 51,
                        child: GestureDetector(
                          onTap: _changeJoinState,
                          child: Container(
                            width: 80,
                            height: 36,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              gradient: LinearGradient(
                                colors: R.color.mainBrandGradientColors,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                R.img('circle/ic_rush_add_circle.svg',
                                    package: ComponentManager.MANAGER_MOMENT,
                                    width: 10,
                                    height: 10),
                                Text(
                                  K.moment_circle_join,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ))),
      bottom: isTop
          ? PreferredSize(
              preferredSize: Size.fromHeight(cornerHeight),
              child: SizedBox(
                height: cornerHeight,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    PositionedDirectional(
                      start: 0,
                      end: 0,
                      bottom: 0,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          _goCircleFriendsPage(context);
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: cornerHeight,
                            decoration: BoxDecoration(
                              color: R.color.mainBgColor,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20.0),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: SizedBox(
                height: 0,
              ),
            ),
    );
  }

  List<Widget> _buildActions(bool isTop) {
    if (isTop) {
      return <Widget>[
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsetsDirectional.only(end: 12),
          child: IconButton(
            padding: const EdgeInsets.all(0.0),
            icon: Container(
              width: 36.0,
              height: 36.0,
              alignment: Alignment.center,
              child: R.img(
                'circle/ic_others_profile.svg',
                package: ComponentManager.MANAGER_MOMENT,
                width: 30,
                height: 30,
                color: isTop ? null : R.color.mainTextColor,
              ),
            ),
            onPressed: () {
              Tracker.instance.track(TrackEvent.net_detail_page,
                  properties: {'click': 'more'});
              _onMoreTapped(context);
            },
          ),
        )
      ];
    } else {
      return <Widget>[
        if (data!.isJoin == 0)
          Container(
              margin: const EdgeInsetsDirectional.only(end: 20),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: _changeJoinState,
                child: Container(
                  width: 50,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: LinearGradient(
                      colors: R.color.mainBrandGradientColors,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Stack(
                    children: <Widget>[
                      PositionedDirectional(
                        start: 8,
                        top: 7,
                        child: R.img('circle/ic_rush_add_circle.svg',
                            package: ComponentManager.MANAGER_MOMENT,
                            width: 10,
                            height: 10),
                      ),
                      PositionedDirectional(
                        end: 8,
                        top: 3.2,
                        child: Text(
                          K.moment_circle_join,
                          style: const TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ))
      ];
    }
  }

  Widget _buildTabBar() {
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    MomentThemeConfig? theme = manager.themeConfig;

    List<Widget> tabs = [];
    for (int i = 0; i < data!.tabList.length; i++) {
      tabs.add(Tab(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Text(
            data!.tabList[i].name ?? '',
          ),
        ),
      ));
    }
    return CommonTabBar(
      tabs: tabs,
      controller: _tabController,
      isScrollable: true,
      labelStyle: theme.labelStyle ??
          TextStyle(
              color: R.color.mainTextColor,
              fontSize: 22,
              fontWeight: FontWeight.w600),
      unselectedLabelStyle: theme.unselectedLabelStyle ??
          TextStyle(color: R.color.mainTextColor, fontSize: 15),
      indicatorColor: R.color.mainTextColor,
      unselectedLabelColor:
          theme.unselectedLabelColor ?? R.color.thirdTextColor,
      indicatorWeight: 6,
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }

  _changeJoinState() async {
    if (_requesting) {
      return;
    }
    _requesting = true;
    DataRsp<CircleOpResult> response;
    if (data!.isJoin == 1) {
      response = await Api.getQuitCircleResponse(data!.id);
    } else {
      response = await Api.getJoinCircleResponse(data!.id);
    }
    if (response.success == true && response.data?.result == 'success') {
      if (data!.isJoin == 1) {
        Tracker.instance.track(TrackEvent.net_detail_page,
            properties: {'exit': widget.circleName});
      } else {
        Tracker.instance.track(TrackEvent.net_detail_page,
            properties: {'join': widget.circleName});
      }
      Fluttertoast.showToast(
          msg: data!.isJoin == 0
              ? K.moment_join_circle_success
              : K.moment_quit_circle_success,
          gravity: ToastGravity.CENTER);
      setState(() {
        if (data!.isJoin == 1) {
          data!.isJoin = 0;
        } else {
          data!.isJoin = 1;
        }
      });
      widget.callback.call();
      _requesting = false;
    } else {
      _requesting = false;
      Fluttertoast.showToast(msg: K.moment_net_error);
    }
  }

  /// 点击圈友在玩
  _goCircleFriendsPage(BuildContext context) {
    Tracker.instance.track(TrackEvent.net_detail_page,
        properties: {'more': widget.circleName});
    CircleFriendsPlayingScreen.openCircleFriendsPlayingScreen(context,
        circleId: data!.id, fromDetail: true);
  }

  _onMoreTapped(BuildContext context) async {
    List<SheetItem> res = [];
    if (data!.isJoin == 0) {
      res.add(SheetItem(K.moment_join_circle_more, 'join'));
    } else {
      res.add(SheetItem(K.moment_quit_circle_more, 'quit'));
    }
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
            data: res,
          );
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    if (result.value?.key == 'join' || result.value?.key == 'quit') {
      _changeJoinState();
    }
  }
}
