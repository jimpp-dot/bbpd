import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/gift_week/page/gift_week_rank_page.dart';
import 'package:rank/src/page/GameCategoryPage.dart';
import 'package:rank/src/page/companionRankPage.dart';
import 'package:rank/src/page/pk/pk_rank_screen.dart';
import 'package:rank/src/page/rank_rush_prize_sreen.dart';
import 'package:rank/src/page/superadmin_patrol_page.dart';
import 'package:rank/src/room_list/widget/room_list_tab_screen.dart';
import 'package:rank/src/util/fast_match_uitl.dart';
import 'package:rank/src/widget/companionValueWidget.dart';
import 'package:rank/src/widget/gift_rank_page.dart';
import 'package:rank/src/widget/loveItem.dart';
import 'package:rank/src/widget/room_item_widgetv2.dart';
import 'package:rank/src/widget/singer_rank_page.dart';
import 'package:rank/src/page/hours/rank_hours_entrance.dart';
import 'package:rank/src/page/hours/rank_hours_dialog.dart';

import 'anchor/anchor_zone_rank.dart';
import 'model/entity/skill_tab_item.dart';
import 'page/god_recommend/god_recommend_page.dart';
import 'page/rankScreen.dart';
import 'page/roomScreen.dart';
import 'page/search/room_search_page.dart';
import 'rankingList/widget/ranking_list_widget.dart';
import 'rankingList/widget/ranking_main_screen.dart';

class RankManager extends IRankManager {
  static const String PKG_NAME = 'rank';

  bool _withTabDynamic = true;

  bool _showDefendBuyEnter = true;

  @override
  Future<dynamic> showRank(BuildContext context, String? type,
      {String rankType = 'base', String? title, int subTabIndex = 0}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RankScreen(
          type: type,
          rankType: rankType,
          title: title,
          subTabIndex: subTabIndex,
        ),
        settings: const RouteSettings(name: '/rank'),
      ),
    );
  }

  @override
  Future showRoomList(BuildContext context,
      {List? tabs, String? title, bool showHead = false, String refer = ''}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: RoomScreen.routeName),
        builder: (BuildContext context) {
          return RoomScreen(
              tabs: tabs as List<TabItem>?,
              showHead: showHead,
              title: title,
              refer: refer);
        },
      ),
    );
  }

  @override
  Future<dynamic> showRankRushPrizeScreen(
      BuildContext context, List pageConfigList, int? selectTabIndex) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RankRushPrizeScreen(
            pageConfigList: pageConfigList as List<PageConfig>,
            selectTabIndex: selectTabIndex),
        settings: const RouteSettings(name: '/rankRushPrizeScreen'),
      ),
    );
  }

  @override
  Future<dynamic> showGiftRankScreen(
      BuildContext context, String pageType, int tabIndex,
      {int giftId = 0, bool isLastWeek = false}) {
    return GiftRankPage.show(context, pageType, tabIndex, giftId,
        isLastWeek: isLastWeek);
  }

  @override
  Widget getRoomListPageWithTab(List<TabItem> tabs) {
    return RoomScreen(
      tabs: tabs,
      showAppBar: false,
    );
  }

  @override
  Widget getRoomRankingList(int rid, {Events? roomEvent}) {
    return RankingListWidget(rid, roomEvent);
  }

  /// 打开排行榜主Tab页面，包含主播榜单，用户榜单，活动榜等
  @override
  Future<dynamic> showRoomRankMainTabScreen(BuildContext context,
      {required int rid,
      String? charmType,
      String? tabType = 'star_week'}) async {
    assert(
      rid != null || charmType != null,
      'rid or charmType all null!! check you code.',
    );
    return await RankingMainFullScreen.openScreen(context, rid, charmType,
        tabType: tabType);
  }

  static showRoom(BuildContext context, int rid) {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, rid);
  }

  static Future<dynamic> showImage(
      BuildContext context, dynamic uid, PageRefer? refer) {
    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    return personalDataManager.openImageScreen(context, Util.parseInt(uid),
        refer: refer);
  }

  @override
  void init({bool withTabDynamic = true, bool showDefendBuyEnter = true}) {
    _withTabDynamic = withTabDynamic;
    _showDefendBuyEnter = showDefendBuyEnter;
  }

  @override
  bool withTabDynamic() {
    return _withTabDynamic;
  }

  @override
  bool get showDefendBuyEnter {
    return _showDefendBuyEnter;
  }

  @override
  Widget getRoomListPage({Key? key, int? index, required String type}) {
    return RoomPage(key: key, index: index, type: type);
  }

  @override
  Widget getLoveItemWidget(
      {required int index, required Map data, required bool showRoomInfo}) {
    return LoveItemWidget(
      data: LoveItemData.fromJson(data),
      index: index,
      showRoomInfo: showRoomInfo,
    );
  }

  @override
  void showJoyRoom(BuildContext context) async {
    String url = '${System.domain}room/found?v=3';

    XhrResponse response = await Xhr.getJson(url, throwOnError: true);
    Map res = response.response as Map;
    if (res['success'] == true) {
      Map? data = res['data'];
      if (data == null) {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        return;
      }

      if (data['joy'] != null && data['joy']['display'] == true) {
        Map joy = data['joy']['tab'];
        List<TabItem> tabs = [];
        List joyKeys = joy.keys.toList();
        for (var key in joyKeys) {
          TabItem tab = TabItem(key, joy[key]);
          tabs.add(tab);
        }
        Navigator.of(context).pushNamed('/RoomScreen',
            arguments: RoomScreenArgs(tabs, false, R.string("fun_room")));
      } else {
        Fluttertoast.showToast(
            msg: R.string('enter_joy_room_failed'),
            gravity: ToastGravity.CENTER);
      }
    } else {
      Fluttertoast.showToast(
          msg: response.error.toString(), gravity: ToastGravity.CENTER);
    }
  }

  @override
  void showRoomSearchPage(BuildContext context) {
    RoomSearchPage.showRoomSearchPage(context);
  }

  @override
  Future<bool?> showCompanionRankPage(
      BuildContext context, int uid, String refer) {
    return CompanionRankPage.show(context, uid, refer);
  }

  @override
  Widget getCompanionValueWidget(int degree, int staySecs, {Color? textColor}) {
    return CompanionValueWidget(
      degree,
      staySecs,
      textColor: textColor,
    );
  }

  @override
  void openPkRank(BuildContext context, int rid, int? anchorUid,
      {int tabIndex = 0}) {
    PkRankScreen.openPkScreen(context, rid, anchorUid, tabIndex: tabIndex);
  }

  @override
  Future openGameCategoryPage(BuildContext context) {
    return GameCategoryPage.show(context);
  }

  @override
  Future<dynamic> showAnchorZoneRank(
      BuildContext context, int groupId, String? refer) async {
    return await AnchorZoneRankScreen.launch(context, groupId, refer);
  }

  @override
  Widget getRoomItemWidgetV2(
      {item, roomFrom, String? refer, VoidCallback? onItemClick}) {
    return RoomItemWidgetV2(
      item: item,
      roomFrom: roomFrom,
      refer: refer,
      onItemClick: onItemClick,
    );
  }

  @override
  void showSuperAdminPatrolPage(BuildContext context) {
    return SuperAdminPatrolPage.show(context);
  }

  @override
  Widget getRoomListTabScreen({Key? key}) {
    return RoomListTabScreen(
      key: key,
    );
  }

  @override
  Size getBoundingTextSize(BuildContext context, String? text, TextStyle? style,
      {int? maxLines = 2 ^ 31, double maxWidth = double.infinity}) {
    if (text == null || text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        locale: Localizations.localeOf(
          context,
        ),
        text: TextSpan(text: text, style: style),
        maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  @override
  void openGiftWeekRankPage(BuildContext context, int? rid) {
    GiftWeekRankPage.show(context, rid: rid);
  }

  @override
  void toFastMatch(BuildContext context, String type, String title) {
    FastMatchUtil.toFastMatch(context, type, title);
  }

  @override
  Future showSingerRankScreen(BuildContext context) {
    return SingerRankPage.show(context);
  }

  @override
  Widget? getRankHoursEntrance(
      int rid, Map<String, dynamic> data, ValueNotifier<int> tickNotifier) {
    return RankHoursEntrance(rid: rid, data: data, tickNotifier: tickNotifier);
  }

  @override
  Future showRankHoursDialog(BuildContext context, int rid) {
    return RankHoursDialog.show(context, rid);
  }

  @override
  Future showGodRecommendScreen(BuildContext context) {
    return GodRecommendPage.show(context);
  }
}
