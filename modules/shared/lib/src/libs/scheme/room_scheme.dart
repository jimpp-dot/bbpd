import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'base_scheme.dart';

IRoomManager _manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);

/// 房间热度购买
class RoomBuyHotScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.showBuyHotPage(System.context, rid: Util.parseInt(qps['rid']));
    return super.jumpToPage(context, qps);
  }
}

/// 房间亲密互动
class RoomIntimateScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.showIntimatePage(System.context);
    return super.jumpToPage(context, qps);
  }
}

/// 投票
class RoomVoteScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.showVotePage(System.context);
    return super.jumpToPage(context, qps);
  }
}

/// 页面栈退回到RoomPageScreen
class RoomPopUtilScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.popUtilRoom();
    return super.jumpToPage(context, qps);
  }
}

/// 打开帽子榜单
class RoomRankScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.showHatRank(System.context);
    return super.jumpToPage(context, qps);
  }
}

/// 跳转到房间页面并打开礼物面板定位到指定礼物
/// [rid] 房间id
/// [tab] 礼物面板tab
/// [gift_id] 礼物id/商品cid(如果tab是背包)
class RoomGiftPanelScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    int rid = Util.parseInt(qps['rid']);
    int giftId = Util.parseInt(qps['gift_id']);
    String? tab = Util.parseStr(qps['tab']);
    DisplayPage? defaultTab;
    if (tab != null && tab.isNotEmpty) {
      defaultTab = stringToEnum<DisplayPage>(tab, enumValues: DisplayPage.values);
    }
    _manager.openRoomWithGiftPanel(System.context, rid, giftId: giftId, tab: defaultTab);
    return super.jumpToPage(context, qps);
  }
}

/// 恋爱旅行（表白玩法v2）
class ConfessV2Scheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.openConfessV2BottomSheet(System.context);
    return super.jumpToPage(context, qps);
  }
}

/// 隐形侠
class InvisibleManScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.openInvisibleManSuitPage(context);
    return super.jumpToPage(context, qps);
  }
}

/// 甜蜜相册房间半弹层主操作面板
class SweetAlbumMainPanelScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.openSweetAlbumMainPanel(System.context);
    return super.jumpToPage(context, qps);
  }
}

/// 印象标记房间半弹层主操作面板
class ImpressTagMainPanelScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.openImpressTagGiftScreen(System.context);
    return super.jumpToPage(context, qps);
  }
}

/// 跳转到房间页面并打开全服喇叭面板选中指定喇叭
class RoomHornPanelScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    int rid = Util.parseInt(qps['rid']);
    int hornId = Util.parseInt(qps['horn_id']);
    _manager.openRoomWithHornPanel(System.context, rid, hornId: hornId);
    return super.jumpToPage(context, qps);
  }
}

/// 跳转房间礼物红包
class RoomGiftRedPacketScheme extends BaseScheme {
  @override
  String jumpToPage(BuildContext context, Map<String, String> qps) {
    _manager.showGiftRedEnvelopeGrabPanel(context, Util.parseInt(qps['rid']));
    return super.jumpToPage(context, qps);
  }
}
