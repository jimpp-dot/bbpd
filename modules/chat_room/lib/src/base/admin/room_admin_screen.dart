import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/admin/admin_list_page.dart';
import 'package:chat_room/src/base/admin/admin_log_page.dart';
import 'package:chat_room/src/base/admin/forbidden_log_page.dart';
import 'package:chat_room/src/base/admin/online_list_page.dart';
import 'package:chat_room/src/base/admin/package_log_page.dart';
import 'package:chat_room/src/base/admin/rank_contribute_page.dart';
import 'package:chat_room/src/base/admin/rank_defend_page.dart';
import 'package:chat_room/src/base/admin/rank_fans_page.dart';
import 'package:chat_room/src/base/admin/rank_love_page.dart';
import 'package:chat_room/src/base/admin/rank_noble_page.dart';
import 'package:chat_room/src/base/admin/rank_reward_page.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/base/admin/room_tab_item.dart';
import 'package:chat_room/src/base/page/data/room_admin_data_page.dart';
import 'package:chat_room/src/base/page/data/room_data_transfer_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/util/common_util.dart';

import 'rank_nest_room.dart';

/// 房间管理页
class RoomAdminScreen extends StatefulWidget {
  final int rid;
  final Purview purview;
  final RoomTypes types;
  final int pos;
  final int uid; // 房主UID，获取房主的粉丝榜
  final String? defaultTab; // 默认展示TAB

  static const Event_Refresh_Rank_Switch = 'room.admin.refresh.rank.switch';

  const RoomAdminScreen({
    Key? key,
    required this.rid,
    required this.purview,
    required this.types,
    this.pos = -1,
    this.uid = 0,
    this.defaultTab,
  }) : super(key: key);

  @override
  _RoomAdminScreenState createState() {
    return _RoomAdminScreenState();
  }
}

class _RoomAdminScreenState extends State<RoomAdminScreen>
    with SingleTickerProviderStateMixin<RoomAdminScreen> {
  late TabController _tabController;
  final List<GlobalKey> _keys = [];
  final List<Widget> _pages = [];
  final List<RoomTabItem> _tabItems = [];
  final List<Tab> _tabs = [];

  bool _hideRank = false;

  bool isRadio = false; // 电台

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        RoomAdminScreen.Event_Refresh_Rank_Switch, _onRefreshRank);
    _init();
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        RoomAdminScreen.Event_Refresh_Rank_Switch, _onRefreshRank);
    _tabController.dispose();
    super.dispose();
  }

  void _onRefreshRank(String type, dynamic data) {
    if (mounted && data is bool && _hideRank != data) {
      setState(() {
        _hideRank = data;
      });
    }
  }

  void _init() {
    bool isRadioDefend = widget.types == RoomTypes.RadioDefend;
    bool isLive = widget.types == RoomTypes.Live;
    bool isBusiness = false;
    bool isSinger = false;
    bool showDataTab = false;
    bool isJuben = false;
    bool isLiveTalent = false; //直播才艺厅
    /// 开启了私密小窝，主房间可以看到私密小窝的榜单
    bool isShowNest = false;

    /// 在私密小窝,非接待不展示魅力榜和守护榜，因为小窝房间是重复使用的，防止看到之前其他GS的一些数据
    bool hideCharmInNestRoom = false;

    bool baba = false;

    /// 靓号房
    if (ChatRoomData.exists()) {
      isBusiness =
          ChatRoomData.getInstance()?.config?.property == RoomProperty.Business;
      isSinger =
          ChatRoomData.getInstance()?.config?.property == RoomProperty.Singer;
      showDataTab = ChatRoomData.getInstance()!.showRoomDataTab;
      isJuben =
          ChatRoomData.getInstance()?.config?.property == RoomProperty.Game &&
              ChatRoomData.getInstance()?.config?.type == 'juben';
      isLiveTalent =
          ChatRoomUtil.isLiveTalent(ChatRoomData.getInstance()?.config);
      isRadio = ChatRoomData.getInstance()?.config?.factoryType ==
          RoomFactoryType.BusinessRadio;
      isShowNest = ChatRoomData.getInstance()?.nest != null &&
          Util.parseInt(ChatRoomData.getInstance()?.nest?['show']) == 1;
      hideCharmInNestRoom =
          ChatRoomData.getInstance()?.config?.property == RoomProperty.Nest &&
              !_isAdmin;
      baba = ChatRoomData.getInstance()!.isBaba;
    }

    if (isRadioDefend) {
      // 真爱榜，电台厅把真爱榜放在最前面显示
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.love, K.room_tab_item_love));
      _pages.add(RankLovePage(key: key, rid: widget.rid));

      // 电台守护榜
      GlobalKey key2 = GlobalKey();
      _keys.add(key2);
      _tabItems.add(RoomTabItem(RoomTabItem.defend, K.room_tab_item_defend));
      _pages.add(RankDefendPage(key: key2, rid: widget.rid));
    }
    if (_isAdmin || (isLive && !isLiveTalent) || !isBusiness || isRadio) {
      // 非商业房+直播间(非才艺厅)，所有用户都展示【在线】Tab
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.online, K.room_tab_item_online));
      _pages.add(OnlineListPage(
          key: key, rid: widget.rid, purview: widget.purview, pos: widget.pos));
    }
    if (_isAdmin && (isBusiness || isSinger) && showDataTab) {
      // 数据
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.data, K.room_data));
      _pages.add(RoomAdminDataPage(widget.uid, widget.rid, key: key));
      // 新转
      GlobalKey key2 = GlobalKey();
      _keys.add(key2);
      _tabItems.add(RoomTabItem(RoomTabItem.transfer, K.room_new_transfer));
      _pages.add(RoomDataTransferPage(widget.rid, key: key2));

      if (isShowNest) {
        // 私密房
        GlobalKey key3 = GlobalKey();
        _keys.add(key3);
        _tabItems.add(RoomTabItem(RoomTabItem.nest, K.room_nest_room));
        _pages.add(RankNestRoom(rid: widget.rid, key: key3));
      }
    }
    if (_isAdmin && !showDataTab) {
      // 打赏日志
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.package, K.room_tab_item_package));
      _pages.add(PackageLogPage(key: key, rid: widget.rid));
    }
    if (_isAdmin) {
      // 操作日志
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.log, K.room_tab_item_log));
      _pages.add(AdminLogPage(key: key, rid: widget.rid));
    }
    if (!isJuben && widget.purview == Purview.Createor) {
      // 管理员列表
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.admin, K.room_tab_item_admin));
      _pages.add(AdminListPage(key: key, rid: widget.rid));
    }
    // if (widget.purview == Purview.Createor || ChatRoomData.getInstance()!.isMic) {
    //   /// 红包记录
    //   GlobalKey key = GlobalKey();
    //   _keys.add(key);
    //   _tabItems.add(RoomTabItem(RoomTabItem.red_packet, K.room_tab_item_red_packet));
    //   _pages.add(RedPacketPage(key: key, rid: widget.rid));
    // }
    // if (!isJuben && (isBusiness || isSinger) && !isRadioDefend) {
    //   // 合作房展示真爱榜(电台厅把真爱榜放在第一个，单独处理)
    //   GlobalKey key = GlobalKey();
    //   _keys.add(key);
    //   _tabItems.add(RoomTabItem(RoomTabItem.love, K.room_tab_item_love));
    //   _pages.add(RankLovePage(key: key, rid: widget.rid));
    // }
    if (isLive) {
      // 粉丝榜
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.fans, K.room_fans_list));
      _pages.add(RankFansPage(key: key, rid: widget.rid, uid: widget.uid));
    }
    if (!isJuben) {
      // 贡献榜
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.week, K.room_tab_item_week));
      _pages.add(RankContributePage(
          key: key, rid: widget.rid, contributeType: ContributeType.week));
    }

    /// 靓号房 + 房主/接待/麦上GS => 显示房间打赏tab
    if (baba &&
        (ChatRoomData.getInstance()!.isCreator ||
            ChatRoomData.getInstance()!.isReception ||
            (ChatRoomData.getInstance()!.isMic && Session.joinBroker))) {
      // 打赏
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.reward, K.room_reward));
      _pages.add(RankRewardPage(key: key, room: ChatRoomData.getInstance()!));
    }

    if (!isJuben && !isLive && !hideCharmInNestRoom) {
      // 魅力榜
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems
          .add(RoomTabItem(RoomTabItem.charm_week, K.room_tab_item_beauty));
      _pages.add(RankContributePage(
          key: key, rid: widget.rid, contributeType: ContributeType.charm));
      //
      // if (!isRadioDefend && !hideCharmInNestRoom) {
      //   // 甜蜜守护榜
      //   GlobalKey key2 = GlobalKey();
      //   _keys.add(key2);
      //   _tabItems.add(RoomTabItem(RoomTabItem.sweet, K.room_tab_item_defend));
      //   _pages.add(RankSweetPage(key: key2, rid: widget.rid));
      // }
    }
    if (!isJuben && !Util.needHideAllTitle()) {
      // 贵族榜
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.vip, K.room_tab_item_vip));
      _pages.add(RankNoblePage(key: key, rid: widget.rid));
    }
    if (!isJuben && _isAdmin) {
      // 封禁日志
      GlobalKey key = GlobalKey();
      _keys.add(key);
      _tabItems.add(RoomTabItem(RoomTabItem.forbidden, K.room_tab_item_forbin));
      _pages.add(ForbiddenLogPage(key: key, rid: widget.rid));
    }

    for (var item in _tabItems) {
      _tabs.add(Tab(child: Text(item.label)));
    }

    int initialIndex = 0;
    if (widget.defaultTab != null) {
      for (int i = 0; i < _tabItems.length; i++) {
        if (widget.defaultTab == _tabItems[i].type) {
          initialIndex = i;
          break;
        }
      }
    }
    _tabController = TabController(
        initialIndex: initialIndex, length: _tabs.length, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  bool get _isAdmin {
    return widget.purview == Purview.Createor ||
        widget.purview == Purview.Admin ||
        widget.purview == Purview.SuperAdmin;
  }

  void _onTabChanged() {
    _reload();
    if (mounted) {
      setState(() {});
    }
  }

  void _reload() {
    if (mounted &&
        !_tabController.indexIsChanging &&
        _keys[_tabController.index].currentContext != null) {
      if (_keys[_tabController.index].currentState is RefreshMixin) {
        (_keys[_tabController.index].currentState as RefreshMixin).refresh();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];
    if (widget.types == RoomTypes.RadioDefend &&
        _tabItems[_tabController.index].type == 'defend') {
      actions.add(MaterialButton(
        onPressed: () {
          eventCenter.emit('Room.Admin', 'continueDefend');
        },
        child: Text(
          K.room_open_protect,
          style: TextStyle(color: R.color.mainBrandColor),
        ),
      ));
    }

    return Scaffold(
      appBar: BaseAppBar.custom(
        leading: const SizedBox.shrink(),
        title: Text(widget.purview == Purview.Normal
            ? K.roon_rank_list
            : K.room_manage),
        actions: actions,
        statusBrightness: Brightness.dark,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            alignment: AlignmentDirectional.center,
            child: CommonTabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: _tabs,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const ClampingScrollPhysics(),
              children: _pages,
            ),
          ),
          if (_tabItems.isNotEmpty &&
              _tabItems[_tabController.index].type != RoomTabItem.data &&
              _tabItems[_tabController.index].type != RoomTabItem.nest)
            _renderHideRank(),
        ],
      ),
    );
  }

  Widget _renderHideRank() {
    int currentNobility = NobilityUtil.currentIntNobility(
        oldNobility: Session.title, newNobility: Session.titleNew);
    int startNobility = NobilityUtil.currentIntNobility(
        oldNobility: NobilityUtil.getInt(NobilityType.Earl),
        newNobility: NobilityUtil.getInt(NobilityType.Duke));

    bool showHideRank = currentNobility >= startNobility;

    /// 包厢Tab下不显示榜单隐身开关
    if (_tabItems[_tabController.index].type == RoomTabItem.cubicle) {
      showHideRank = false;
    }

    if (showHideRank) {
      return Container(
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        child: SizedBox(
          height: 50.0,
          child: Container(
            padding: const EdgeInsetsDirectional.only(start: 16.0, bottom: 5),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: R.color.dividerColor, width: 0.0),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    K.room_stealth_in_rank,
                    style: TextStyle(color: R.color.mainTextColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 15.0),
                  child: Switch(
                    inactiveTrackColor: const Color(0x08682917),
                    activeColor: Colors.white,
                    activeTrackColor: const Color.fromRGBO(132, 211, 13, 1),
                    value: _hideRank,
                    onChanged: (bool checked) {
                      EasyDebounce.debounce(
                          'my-debouncer',                 // <-- An ID for this particular debouncer
                          const Duration(milliseconds: 300),    // <-- The debounce duration
                              () => changeValue(checked)                // <-- The target method
                      );

                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }


  Future<void> changeValue(checked) async {
    bool suc = await RoomRepository.hideRank(widget.rid, checked);
    if (suc == true && mounted) {
      setState(() {
        Log.d('checked: $checked');
        _hideRank = checked;
      });
      _reload();
    }
  }
}
