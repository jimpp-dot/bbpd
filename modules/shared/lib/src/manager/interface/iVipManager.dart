import 'package:shared/shared.dart';
import 'package:shared/src/manager/iResourceLoader.dart';
import 'package:flutter/widgets.dart';

abstract class IVipManager extends IResourceLoader {
  /// 打开新版会员商城页面
  void show(BuildContext context,
      {String goToSecondType = '', int mainIndex = 0, int subIndex = 0});

  /// 打开新版会员商城页面
  ///
  /// [type] 物品类型
  /// [title] 物品类型名称
  Future showSecondPage(BuildContext context, String type, {String? title});

  /// 打开我的背包页面
  Future showBagPage(BuildContext context, {String? tabType});

  /// 我的等级
  Future showMyLevelScreen(BuildContext context,
      {Key? key,
      MyLevelTab initialTab = MyLevelTab.Popularity,
      int titleInitTab = 0});

  /// 商城Widget
  Widget getMallGoodsItem(
      {required ShopMailCommodity commodity,
      VoidCallback? onBuy,
      String? from,
      Key? key});

  ///商城物品Widget
  Widget getCommodityListItemTop(
      {double ratio = 1.0, required IShopMailCommodity commodity});

  /// 主播专题福利
  Future showAnchorZoneWelfare(BuildContext context, int groupId);

  /// 贵族中心
  Future openNobilityCenterScreen(BuildContext context,
      {VoidCallback? onPayed, int? defaultNobilityLevel});

  /// 贵族购买弹窗
  Future openNobilityBuyDialog(BuildContext context);

  /// 商城二级页
  Future openVipMallSecondPage(BuildContext context, String title, String type);

  Future<bool?> openBuyPanel(BuildContext context, int cid, String type,
      {int initNum = 1, String? consumeType});

  ///甄选藏品购买面板
  Future<bool?> openCollectionPanel(BuildContext context, int bagId);

  Future<bool?> openBuyRoomHotPanel(BuildContext context, int rid);

  /// 贵族四项权益上新弹框
  void openNobilityPrivilegeNewDialog(BuildContext context);

  /// 打开装扮中心
  Future openDressCenter(BuildContext context,
      {int? initCateId, int? initDressId});

  /// 赠送座驾礼物收到碎片对话框
  Future openReceiveMountPieceDialog(BuildContext context, List list);

  /// 打开我的座驾
  Future openMyMountPage(BuildContext context, int uid,
      {int serialId = 0, String refer = ''});

  /// 个人页座驾系列Widget
  Widget getPersonalMountWidget(
      int uid, List<MountSerialProfile> mountSerialData);

  /// 房间个人资料卡座驾系列Widget
  Widget getFloatPersonalMountWidget(
      int uid, List<MountSerialProfile> mountSerialData);

  /// 座驾系列排行榜页面
  Widget getMountRankPage();

  /// 打开座驾背包
  /// [serialId] 座驾系列id
  Future openMountPieceBagPage(BuildContext context, {int serialId = 0});

  /// 弹出爵位活动购买弹窗
  Future openNobilityActivityDialog(BuildContext context);

  /// 弹出双十一活动购买弹窗
  Future openDoubleElevenActivityDialog(BuildContext context);

  /// 收到惺惺相惜礼包对话框
  Future openX4PackageDialog(BuildContext context);
}
