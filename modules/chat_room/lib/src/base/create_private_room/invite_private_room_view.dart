import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:get/get.dart';
import '../../../k.dart';
import 'invite_private_room_list.dart';
import 'invite_private_room_logic.dart';

/// 商业房创建关联小房：邀请用户列表
class InvitePrivateRoomPage extends StatefulWidget {
  /// 主房间rid
  final int rid;
  //// 小房间rid
  final int targetRid;
  const InvitePrivateRoomPage({
    Key? key,
    required this.rid,
    required this.targetRid,
  }) : super(key: key);

  static Future<void> show(BuildContext context, int rid, int targetRid) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => InvitePrivateRoomPage(
        rid: rid,
        targetRid: targetRid,
      ),
      settings: const RouteSettings(name: '/InvitePrivateRoomPage'),
    ));
  }

  @override
  _InvitePrivateRoomPageState createState() => _InvitePrivateRoomPageState();
}

class _InvitePrivateRoomPageState extends State<InvitePrivateRoomPage>
    with TickerProviderStateMixin {
  late InvitePrivateRoomLogic logic;
  final GlobalKey<SearchBarState> _inputKey = GlobalKey<SearchBarState>();

  TabController? _tabController;

  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    logic = Get.put(InvitePrivateRoomLogic(
      rid: widget.rid,
      targetRid: widget.targetRid,
    ));

    safeRun(() {
      /// 根据是否设置礼物/是否隐藏未赠礼Tab时，不需要_tabController
      _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
      _tabController?.addListener(_onTabChange);
    });
  }

  @override
  void dispose() {
    Get.delete<InvitePrivateRoomLogic>();
    _closeInput();
    _tabController?.removeListener(_onTabChange);
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(
        K.room_private_invite,
      ),
      body: GestureDetector(
        onTap: _closeInput,
        child: Column(
          children: [
            if (Session.joinBroker) _buildSearchBar(),
            Expanded(
              child: _buildContent(),
            ),
            _buildStartParty(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return GetBuilder<InvitePrivateRoomLogic>(builder: (_) {
      if (logic.isLoading) {
        return const Loading();
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTab(),
            Expanded(child: _buildList()),
          ],
        );
      }
    });
  }

  Widget _buildTab() {
    late Widget tab;
    if (logic.isMultiTab) {
      List<Tab> tabs = [
        Tab(
          text: K.room_has_not_send_gift_tab,
        ),
        Tab(
          text: K.room_has_send_gift_tab,
        )
      ];
      tab = CommonTabBar(
        showSplash: false,
        labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        controller: _tabController,
        isScrollable: true,
        tabs: tabs,
        labelColor: R.color.mainTextColor,
        unselectedLabelColor: R.color.secondTextColor,
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        indicator: CommonUnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
          insets: const EdgeInsetsDirectional.only(bottom: 5),
          wantWidth: 12,
        ),
      );
    } else {
      String title =
          logic.hasGift ? K.room_has_send_gift_tab : K.room_main_room_user;
      tab = Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: R.color.mainTextColor,
        ),
      );
    }

    return SizedBox(
      width: Util.width,
      height: 44,
      child: Row(
        children: [
          SizedBox(width: logic.isMultiTab ? 10 : 20),
          Expanded(
            child: tab,
          ),
          _buildAllSelect(),
        ],
      ),
    );
  }

  Widget _buildList() {
    if (logic.isMultiTab) {
      return TabBarView(
        controller: _tabController,
        children: const [
          InvitePrivateList(hasPermissionTab: false),
          InvitePrivateList(hasPermissionTab: true),
        ],
      );
    }

    return const InvitePrivateList(hasPermissionTab: true);
  }

  Widget _buildAllSelect() {
    bool hasPermission =
        !logic.isMultiTab ? true : (tabIndex == 0 ? false : true);
    bool hasSelectAll = logic.isSelectAll(hasPermission);

    return GestureDetector(
      onTap: () {
        logic.selectAll(hasPermission, !hasSelectAll);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          hasSelectAll
              ? CheckBoxChecked(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:
                        LinearGradient(colors: R.color.mainBrandGradientColors),
                  ),
                )
              : CheckBoxUnchecked(
                  color: R.color.mainTextColor.withOpacity(0.2)),
          const SizedBox(width: 4),
          Text(
            K.room_select_all,
            style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 4, bottom: 6),
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        logic.onQueryChanged,
        key: _inputKey,
        height: 36,
        hintText: K.room_search_by_name_id,
      ),
    );
  }

  Widget _buildStartParty() {
    return GestureDetector(
      onTap: logic.invitePrivateRoom,
      child: Container(
        height: 56,
        width: Util.width,
        alignment: AlignmentDirectional.center,
        margin: EdgeInsetsDirectional.only(
          top: 12,
          start: 20,
          end: 20,
          bottom: Util.isIphoneX ? Util.iphoneXBottom : 12,
        ),
        decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            gradient: LinearGradient(colors: R.color.mainBrandGradientColors)),
        child: Text(
          K.room_private_invite_button,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  _onTabChange() {
    if ((_tabController?.indexIsChanging ?? false)) {
      return;
    }

    /// 全选逻辑更新
    setState(() {
      tabIndex = _tabController?.index ?? 0;
    });
  }

  _closeInput() {
    _inputKey.currentState?.close();
  }
}
