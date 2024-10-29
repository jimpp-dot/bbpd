import 'package:shared/model/tab_item.dart';
import 'package:shared/src/events.dart';
import 'package:shared/src/manager/model/listTabHeadItem.dart';
import 'package:flutter/material.dart';

import '../iResourceLoader.dart';

abstract class IRankManager extends IResourceLoader {
  Future<dynamic> showRank(BuildContext context, String? type,
      {String rankType = 'base', String? title, int subTabIndex = 0});

  Future<dynamic> showRankRushPrizeScreen(
      BuildContext context, List pageConfigList, int? selectTabIndex);

  Future<dynamic> showGiftRankScreen(
      BuildContext context, String pageType, int tabIndex,
      {int giftId = 0, bool isLastWeek = false});

  Future showRoomList(BuildContext context,
      {List? tabs, String? title, bool showHead = false, String refer = ''});

  Widget getRoomListPageWithTab(List<TabItem> tabs);

  Widget getRoomRankingList(int rid, {Events? roomEvent});

  /// rid/charmType必传一个
  Future showRoomRankMainTabScreen(BuildContext context,
      {required int rid, String charmType, String? tabType = 'star_week'});

  void showJoyRoom(BuildContext context);

  void init({bool withTabDynamic = true, bool showDefendBuyEnter = true});

  bool withTabDynamic();

  bool get showDefendBuyEnter;

  Widget getRoomListPage({Key? key, int? index, required String type});

  Widget getLoveItemWidget(
      {required int index, required Map data, required bool showRoomInfo});

  void showRoomSearchPage(BuildContext context);

  Future<bool?> showCompanionRankPage(
      BuildContext context, int uid, String refer);

  Widget getCompanionValueWidget(int degree, int staySecs, {Color? textColor});

  void openPkRank(BuildContext context, int rid, int? anchorUid,
      {int tabIndex = 0});

  /// 主播专区排行榜
  Future<dynamic> showAnchorZoneRank(
      BuildContext context, int groupId, String? refer);

  Future openGameCategoryPage(BuildContext context);

  Widget getRoomItemWidgetV2(
      {dynamic item,
      dynamic roomFrom,
      String? refer,
      VoidCallback? onItemClick});

  /// 超管巡房列表
  void showSuperAdminPatrolPage(BuildContext context);

  /// 获取房间列表
  Widget getRoomListTabScreen({Key? key});

  /// 获取文字size
  Size getBoundingTextSize(BuildContext context, String? text, TextStyle? style,
      {int maxLines = 2 ^ 31, double maxWidth = double.infinity});

  /// 跳转礼物周星榜页面
  /// [rid] 房间id,可为空，为空则不显示房间大人物tab
  void openGiftWeekRankPage(BuildContext context, int? rid);

  void toFastMatch(BuildContext context, String type, String title);

  /// 歌手榜单
  Future showSingerRankScreen(BuildContext context);

  /// 获取房间小时榜入口
  Widget? getRankHoursEntrance(
      int rid, Map<String, dynamic> data, ValueNotifier<int> tickNotifier);

  /// 显示房间小时榜
  Future showRankHoursDialog(BuildContext context, int rid);

  /// 游戏主播推荐
  Future showGodRecommendScreen(BuildContext context);
}
