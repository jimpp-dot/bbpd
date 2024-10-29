import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/live/model/live_pk_invite_friend_model_v3.dart';
import 'package:chat_room/src/live/model/live_repository_v3.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';

import 'live_pk_search_v3.dart';
import 'live_pk_setting_v3.dart';
import 'live_pk_sub_page_v3.dart';

/// 发起PK弹窗
class LivePkLaunchWidgetV3 extends StatefulWidget {
  final int rid;
  final int anchorUid;
  final int tabIndex;

  const LivePkLaunchWidgetV3(
      {super.key,
      required this.rid,
      required this.anchorUid,
      this.tabIndex = 0});

  @override
  _LivePkLaunchWidgetV3State createState() => _LivePkLaunchWidgetV3State();

  static Future show(BuildContext context, int rid, int anchorUid) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsetsDirectional.only(
              top: 12, bottom: 10 + Util.iphoneXBottom, start: 16, end: 16),
          child: LivePkLaunchWidgetV3(rid: rid, anchorUid: anchorUid),
        );
      },
    );
  }
}

enum LivePKSubPageType {
  inviteFriend, //邀请好友
  recommend, // 推荐对手
  recentMatch, // 最近匹配
}

class _LivePkLaunchWidgetV3State extends State<LivePkLaunchWidgetV3>
    with TickerProviderStateMixin {
  bool _loadSuccess = false;
  late ExtendedTabController _tabController;
  List<Widget> _pages = [];
  List<String> _tabTitles = [];
  List<Widget> _tabWidgets = [];
  List<LivePKInviteFriendItem> _searchResult = []; //搜索结果
  @override
  void initState() {
    super.initState();
    _loadSuccess = true;
    _init();
  }

  _init() {
    _pages = [
      LivePkSubPage(
        pageType: LivePKSubPageType.inviteFriend,
        rid: widget.rid,
      ),
      LivePkSubPage(
        pageType: LivePKSubPageType.recentMatch,
        rid: widget.rid,
      ),
    ];
    _tabTitles = [K.room_invite_friend, K.room_pk_recent_match];

    _tabController = ExtendedTabController(
        initialIndex: widget.tabIndex, length: _pages.length, vsync: this);
    _tabWidgets = [];

    for (int i = 0; i < _tabTitles.length; i++) {
      Tab tab = Tab(
        child: Container(
          height: 32,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Text(_tabTitles[i]),
        ),
      );
      _tabWidgets.add(tab);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: R.img(
                RoomAssets.chat_room$livev3_icon_left_pk_setting_webp,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 13, bottom: 13),
          child: Text(
            K.room_launch_pk,
            style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF313131),
                fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  IRankManager rankManager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_RANK);
                  rankManager.openPkRank(context, widget.rid, widget.anchorUid);
                },
                child: R.img(
                  RoomAssets.chat_room$live_live_pk_rank_webp,
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  LivePkSettingPanelWidget.show(context, widget.rid);
                },
                child: R.img(
                  RoomAssets.chat_room$live_live_pk_setting_webp,
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_loadSuccess) {
      return const SizedBox(height: 506, child: Loading());
    }

    return SizedBox(
      height: 506,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBar(),
          LivePkSearch(_onTextChanged, onSubmitted: _onSubmitted),
          if (_searchResult.isNotEmpty)
            Expanded(
              child: LivePkSubPage(
                rid: widget.rid,
                pageType: LivePKSubPageType.inviteFriend,
                inviteData: _searchResult,
              ),
            )
          else ...[
            _RandomMatchBanner(widget.rid),
            const SizedBox(height: 20),
            // Container(
            //   height: 1,
            //   color: Colors.black.withOpacity(0.05),
            // ),
            _renderBody(),
          ]
        ],
      ),
    );
  }

  void _onTextChanged(String text) {
    if (text.isEmpty) {
      _searchResult.clear();
      refresh();
    }
  }

  void _onSubmitted(String text) {
    _search(text);
  }

  /// 请求搜索接口
  _search(String value) async {
    _searchResult = await LiveRepositoryV3.searchLivePKList(widget.rid, value);
    refresh();
  }

  Widget _renderBody() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTab(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab() {
    return _tabTitles.isNotEmpty
        ? Container(
            height: 36.0,
            margin: const EdgeInsetsDirectional.only(bottom: 2.0, top: 2.0),
            // Util.isUseAnimTabBar()
            child: false
                ? AnimTabBar(
                    controller: _tabController,
                    titles: _tabTitles,
                    selectedFontColor: const Color(0xFF313131),
                    unselectedFontColor: const Color(0x99313131),
                    selectedFontSize: 14,
                    unselectedFontSize: 13,
                  )
                : IntrinsicWidth(
                    child: CommonTabBar(
                      showSplash: false,
                      labelPadding: const EdgeInsetsDirectional.only(end: 2),
                      controller: _tabController,
                      isScrollable: true,
                      tabs: _tabWidgets,
                      labelColor: const Color(0xFF313131),
                      unselectedLabelColor: const Color(0x99313131),
                      labelStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w400),
                      indicator: const CommonUnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 3.0, color: Color(0xFF9EFF4E)),
                        wantWidth: 16,
                        draggingWidth: 4,
                      ),
                    ),
                  ),
          )
        : const SizedBox.shrink();
  }
}

/// 随机匹配
class _RandomMatchBanner extends StatelessWidget {
  final int rid;

  const _RandomMatchBanner(this.rid);

  void _startMatch(BuildContext context) async {
    BaseResponse rsp = await LiveRepositoryV3.startMatch(rid);
    if (rsp.success != true) {
      Fluttertoast.showCenter(msg: rsp.msg);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 0, bottom: 0),
      decoration: commonBoxDecorationWithParamsBeginAndEnd([
        const Color(0xFF6A87FF).withOpacity(0.1),
        const Color(0xFFF17A7A).withOpacity(0.1)
      ], 15, Alignment.centerLeft, Alignment.centerRight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          R
              .img(
                'livev3/room_live_pk.webp',
                width: 216 / 5,
                height: 300.0 / 5,
                package: ComponentManager.MANAGER_BASE_ROOM,
              )
              .paddingOnly(left: 10, right: 16, top: 6, bottom: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(K.fast_start,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF313131),
                      fontWeight: FontWeight.w600)),
              Text(
                K.pick_a_random_anchor_close_to_your_level,
                style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFB8B8B8),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => _startMatch(context),
            child: Container(
              height: 30,
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: R.colors.darkGradientColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                K.room_pk_random_match,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    height: 1.35,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }
}
