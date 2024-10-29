import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vip/src/dress/vip_dress_center_page.dart';
import 'package:vip/src/mount/page/mount_piece_bag_page.dart';
import 'package:vip/src/mount/page/mount_rank_page.dart';
import 'package:vip/src/mount/page/my_mount_page.dart';
import 'package:vip/src/mount/page/receive_mount_piece_dialog.dart';
import 'package:vip/src/mount/widget/personal_mount_widget.dart';
import 'package:vip/src/mount/widget/float_personal_mount_widget.dart';
import 'package:vip/src/nobility/double_eleven_activity_dialog.dart';
import 'package:vip/src/nobility/nobility_activity_dialog.dart';
import 'package:vip/src/nobility/nobility_center_screen.dart';
import 'package:vip/src/vip_mall/page/vip_mall_second_page.dart';
import 'package:vip/src/vip_mall/widget/buy_room_hot_panel.dart';
import 'package:vip/src/vip_mall/widget/commodity_list_item_top.dart';
import 'package:vip/src/vip_mall_v3/page/vip_mall_v3_screen.dart';
import 'package:vip/src/vip_mall_v3/widget/collection_buy_panel.dart';

import 'anchor_zone/anchor_zone_welfare.dart';
import 'bag/bag_page.dart';
import 'level/page/vip_popularity_page_new.dart';
import 'nobility/nobility_buy_dialog.dart';
import 'nobility/nobility_privilege_new_dialog.dart';
import 'nobility/xxxx_package_dialog.dart';
import 'vip_mall/widget/buy_panel.dart';
import 'vip_mall/widget/vip_mall_goods_item.dart';

class VipManager extends IVipManager {
  /// 打开新版会员商城页面
  @override
  Future show(BuildContext context,
      {String goToSecondType = '', int mainIndex = 0, int subIndex = 0}) async {
    IPremadeManager premadeManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PREMADE);
    bool intercept = await premadeManager.checkMatchAndIntercept();
    if (intercept) return;
    return VipMallV3Screen.show(context,
        mainIndex: mainIndex, subIndex: subIndex);
  }

  /// 打开新版会员商城二级页面
  ///
  /// [type] 物品类型
  /// [title] 物品类型名称
  @override
  Future showSecondPage(BuildContext context, String type, {String? title}) {
    return VipMallSecondPage.show(context, title, type);
  }

  @override
  Future showBagPage(BuildContext context, {String? tabType}) {
    return BagPage.show(context, tabType: tabType);
  }

  /// 我的等级
  @override
  Future showMyLevelScreen(BuildContext context,
      {Key? key,
      MyLevelTab initialTab = MyLevelTab.Popularity,
      int titleInitTab = 0}) {
    bool isShowNew =
        initialTab == MyLevelTab.Popularity || initialTab == MyLevelTab.Vip;
    Log.d("isShowNew:$isShowNew");
    if (isShowNew) {
      return VipPopularityPageNew.show(context, initialTab: initialTab);
    }
    return openNobilityCenterScreen(context);
  }

  @override
  Widget getMallGoodsItem(
      {required ShopMailCommodity commodity,
      VoidCallback? onBuy,
      String? from,
      Key? key}) {
    return VipMallGoodsItem(
        commodity: commodity, onBuy: onBuy, from: from, key: key);
  }

  @override
  Widget getCommodityListItemTop(
      {double ratio = 1.0, required IShopMailCommodity commodity}) {
    return Center(
        child: CommodityListItemTop(ratio: ratio, commodity: commodity));
  }

  @override
  Future showAnchorZoneWelfare(BuildContext context, int groupId) {
    return AnchorZoneWelfareScreen.launch(context, groupId);
  }

  @override
  Future openNobilityCenterScreen(BuildContext context,
      {VoidCallback? onPayed, int? defaultNobilityLevel}) {
    return NobilityCenterScreen.show(context,
        onPayed: onPayed, defaultNobilityLevel: defaultNobilityLevel);
  }

  @override
  Future openNobilityBuyDialog(BuildContext context) async {
    return NobilityBuyDialog.show(context);
  }

  @override
  Future openVipMallSecondPage(
      BuildContext context, String title, String type) {
    return VipMallSecondPage.show(context, title, type);
  }

  /// 打开购买面板
  ///
  @override
  Future<bool?> openBuyPanel(BuildContext context, int cid, String type,
      {int initNum = 1, String? consumeType}) {
    return BuyPanel.show(context,
        cid: cid, type: type, initNum: initNum, consumeType: consumeType);
  }

  @override
  Future<bool?> openCollectionPanel(BuildContext context, int bagId) {
    return CollectionBuyPanel.show(context, bagId);
  }

  @override
  Future<bool?> openBuyRoomHotPanel(BuildContext context, int rid) {
    return BuyRoomHotPanel.show(context, rid);
  }

  @override
  void openNobilityPrivilegeNewDialog(BuildContext context) {
    NobilityPrivilegeNewDialog.show(context);
  }

  @override
  Future openDressCenter(BuildContext context,
      {int? initCateId, int? initDressId}) {
    return VipDressCenterPage.show(context,
        initCateId: initCateId, initDressId: initDressId);
  }

  @override
  Future openReceiveMountPieceDialog(BuildContext context, List list) {
    return ReceiveMountPieceDialog.show(context, list);
  }

  @override
  Future openMyMountPage(BuildContext context, int uid,
      {int serialId = 0, String refer = ''}) {
    return MyMountPage.show(context, uid, serialId: serialId, refer: refer);
  }

  @override
  Widget getPersonalMountWidget(
      int uid, List<MountSerialProfile> mountSerialData) {
    return PersonalMountWidget(uid: uid, mountSerialData: mountSerialData);
  }

  @override
  Widget getFloatPersonalMountWidget(
      int uid, List<MountSerialProfile> mountSerialData) {
    return FloatPersonalMountWidget(uid: uid, mountSerialData: mountSerialData);
  }

  @override
  Widget getMountRankPage() {
    return const MountRankPage();
  }

  /// 打开座驾背包
  /// [serialId] 座驾系列id
  @override
  Future openMountPieceBagPage(BuildContext context, {int serialId = 0}) {
    return MountPieceBagPage.show(context, serialId: serialId);
  }

  /// 弹出爵位活动购买弹窗
  @override
  Future openNobilityActivityDialog(BuildContext context) {
    return Future.value();
    return NobilityActivityDialog.show(context);
  }

  /// 弹出双十一活动购买弹窗
  @override
  Future openDoubleElevenActivityDialog(BuildContext context) {
    return DoubleElevenActivityDialog.show(context);
  }

  /// 收到惺惺相惜礼包对话框
  @override
  Future openX4PackageDialog(BuildContext context) {
    return XXXXPackageDialog.show(context);
  }
}
