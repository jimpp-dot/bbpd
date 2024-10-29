import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/create_room/party_list_screen.dart';
import 'package:chat_room/src/base/page/room_push_page.dart';
import 'package:chat_room/src/base/widget/associated_room/associated_room_repo.dart';
import 'package:chat_room/src/base/widget/associated_room/associated_room_select_panel.dart';
import 'package:chat_room/src/base/widget/gift_media_widget.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/cross_pk_launch_sheet.dart';
import 'package:chat_room/src/biz_plugin/gpk/gpk_module.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/grab_hat_setting_dialog.dart';
import 'package:chat_room/src/biz_plugin/heartpass/model/heart_pass_repos.dart';
import 'package:chat_room/src/biz_plugin/vote/create/vote_create_page.dart';
import 'package:chat_room/src/bonus/widget/bonus_create_widget.dart';
import 'package:chat_room/src/lottery/lottery_manager.dart';
import 'package:chat_room/src/lottery/widget/lottery_create_screen.dart';
import 'package:chat_room/src/lottery/widget/lottery_records_screen.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:chat_room/src/visitant/rank/visitant_rank_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../birthday_housekeeper/views/birthday_party_page.dart';
import '../../heartrace/widget/heart_race_rank_page.dart';
import '../../invisible_man/views/invisible_man_suit_page.dart';
import '../../protobuf/generated/drainage.pb.dart';
import '../widget/gift_red_envelope/gift_red_envelope_panel.dart';
import 'constant.dart';
import '../../protobuf/generated/room_bottom_panel.pb.dart';

/// 房间更多按钮业务逻辑层
class RoomMoreMenuController {
  /// 是否显示更多总入口的小红点
  bool showMenuRedDot(ChatRoomData room) {
    return false;
  }

  /// 是否显示小红点
  bool showRedDot(ChatRoomData room, ResRoomPluginPanel_PanelItem item) {
    switch (item.key) {
      case ConstantMenu.GROUP_PK:
        return RoomGPKModule.showMenuRedDot(room);
      case ConstantMenu.GRAB_HAT:
        return item.inUse;
      default:
        return false;
    }
  }

  /// 处理点击更多选项,优先根据key响应特殊的点击事件，没有key则走通用跳转
  handleTapItem(ResRoomPluginPanel_PanelItem item, BuildContext context,
      ChatRoomData room) {
    Tracker.instance.track(
      TrackEvent.room_container_click,
      properties: {
        'click_page': item.name,
        'uid': Session.uid,
        'rid': room.rid,
        'factory_type': room.config?.originFactory,
      },
    );
    Log.d(
        tag: "room_menu_controller",
        'handleTapItem name,${item.name},key:${item.key},${item.jumpType},${item.url}');
    switch (item.key) {
      /// I类-互动玩法
      case ConstantMenu.INVISIBLE_MAN:
        _onInvisibleManClick(context, room);
        break;
      case ConstantMenu.HEART_PASS:
        _onClickHeartPass(context, room);
        break;
      case ConstantMenu.GRAB_HAT:
        _onGrabHatTaped(context, room, item);
        break;
      case ConstantMenu.GIFT_RED_PACKET:
        _onGiftRedPacketClick(context, room);
        break;

      /// II类-房间工具
      case ConstantMenu.ACTIVITY_CENTER:
        _onActivityCenterTaped(context, room);
        break;
      case ConstantMenu.BIRTH_PARTY:
        _onBirthdayPartyClick(context, room);
        break;
      case ConstantMenu.BONUS:
        _onGiftBonusTaped(context, room);
        break;
      case ConstantMenu.GIF_PIC:
        _onGiftAlbumTaped(context, room);
        break;
      case ConstantMenu.CROSS_PK:
        _onCrossPKTaped(context, room);
        break;
      case ConstantMenu.GROUP_PK:
        _onPKTaped(context, room);
        break;
      case ConstantMenu.VOTE:
        _onVoteTaped(context, room);
        break;
      case ConstantMenu.LOTTERY_PUB:
        _onClickLotteryPublic(context, room);
        break;
      case ConstantMenu.MESSAGE:
        _onClickChatFromBottom(context, room);
        break;
      case ConstantMenu.SPECIAL_EFFECT:
        break;
      case ConstantMenu.DRAINAGE:
        createPrivateRoom(context, room);
        break;
      case ConstantMenu.PUSH_ASSOCIATED_ROOM:
        _pushAssociatedRoom(context, room);
        break;

      /// III类-其他
      case ConstantMenu.VISITANT_RANK:
        _onVisitantRankTaped(context, room);
        break;
      case ConstantMenu.NEW_USER_RANK:
        _onNewUserRankTaped(context);
        break;
      case ConstantMenu.WEEK_STAR:
        _onWeeklyStarListClick(context, room);
        break;
      case ConstantMenu.HEART_RACE_RANK:
        _onHeartRaceRankClick(context, room);
        break;
      case ConstantMenu.SHARE_ROOM:
        _onShareRoomTaped(context);
        break;
      case ConstantMenu.CONFESS:
        _onConfessionClick(context, room);
        break;
      case ConstantMenu.CONFESS_V2:
        _onConfessV2Click(context, room);
        break;
      case ConstantMenu.BUYHOT:
        _onBuyRoomHotClick(context, room);
        break;
      default:
        Log.d(
            tag: "room_menu_controller",
            'not found,try custom:${item.key}，${item.jumpType},${item.url}');
        _onCustomMenuTaped(context, item, room);
        break;
    }
  }

  _onInvisibleManClick(BuildContext context, ChatRoomData room) {
    Navigator.of(context).pop();
    InvisibleManSuitPage.show(context);
  }

  _onGrabHatTaped(BuildContext context, ChatRoomData room,
      ResRoomPluginPanel_PanelItem item) {
    if (item.inUse) {
      Fluttertoast.showToast(msg: K.room_grabhat_tips1);
      return;
    }
    if (room.positions[0].uid != Session.uid) {
      Fluttertoast.showToast(msg: K.room_grabhat_tips2);
      return;
    }

    Navigator.of(context).pop();
    GrabHatSettingDialog.show(context, room);
  }

  _onGiftRedPacketClick(BuildContext context, ChatRoomData room) {
    Navigator.of(context).pop();
    Tracker.instance.track(TrackEvent.click,
        properties: {'click_page': 'click_gift_red_packet'});
    GiftRedEnvelopePanel.show(context, room);
  }

  _onBirthdayPartyClick(BuildContext context, ChatRoomData room) {
    Navigator.of(context).pop();
    Tracker.instance.track(TrackEvent.click,
        properties: {'click_page': 'click_birthdayparty'});
    BirthdayPartyPage.show(context, room);
  }

  _onActivityCenterTaped(BuildContext context, ChatRoomData room) {
    Navigator.of(context).pop();
    ActivityCenterScreen.showBottom(context);
  }

  _onHeartRaceRankClick(context, room) {
    Navigator.of(context).pop();
    HeartRaceRankPage.show(context: context);
  }

  _onVisitantRankTaped(BuildContext context, ChatRoomData room) {
    Navigator.of(context).pop();
    VisitantRankListWidget.openRoomBottomMenu(context, room);
  }

  _onShareRoomTaped(BuildContext context) {
    Tracker.instance.track(TrackEvent.room_recommend_click);
    RoomPushPage.show(context);
  }

  _onGiftBonusTaped(BuildContext context, ChatRoomData room) {
    Navigator.pop(context);
    BonusCreateWidget.show(System.context, room.rid);
  }

  /// 红包相册点击
  _onGiftAlbumTaped(BuildContext context, ChatRoomData room) {
    if (!Session.isLogined) {
      Fluttertoast.showToast(msg: K.room_dropped_relogin);
      return;
    }
    if (!room.config!.displayMessage) {
      Fluttertoast.showToast(msg: K.room_available_unless_msg_display);
      return;
    }
    Navigator.of(context).pop();

    MediaListWidget.show(
      context,
      room.rid,
      room.purview == Purview.Createor ||
          room.purview == Purview.Admin ||
          room.purview == Purview.SuperAdmin,
      room,
    );
  }

  _onPKTaped(BuildContext context, ChatRoomData room) {
    Tracker.instance.track(TrackEvent.pk_entry_click, properties: {
      'rid': room.rid,
      'room_type': room.config?.type,
      'room_property': describeEnum(room.config?.property),
      'room_channel': room.config?.types.toTypesString(),
    });

    RoomGPKModule.setMenuRedDotShow(false);
    if (!Session.isLogined) {
      Fluttertoast.showToast(msg: K.room_dropped_relogin);
      return;
    }
    Navigator.of(context).pop();
    int num = 0;
    for (var e in room.positions) {
      if (e.uid > 0) {
        num++;
      }
    }
    if (num < 2) {
      Fluttertoast.showCenter(msg: K.room_gpk_position_sum_limit);
      return;
    }
    RoomGPKModule.openCreateScreen(context, room);
  }

  _onNewUserRankTaped(context) {
    IProfileManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PROFILE);
    manager.bottomSheetShowNewUserRankPage(context);
  }

  void _onClickLotteryPublic(BuildContext context, ChatRoomData room) async {
    if (LotteryManager.instance.isLotteryOnGoing(room.rid)) {
      /// 抽奖活动正在进行，不可以创建新的抽奖活动
      await LotteryRecordsScreen.launch(context, room.rid);
      return;
    }
    var result = await LotteryCreateScreen.launch(context, room);
    if (result is bool && result) Navigator.of(context).pop();
  }

  /// 心动闯关点击
  _onClickHeartPass(BuildContext context, ChatRoomData room) async {
    HeartPassRepos.create(room.rid);
    Navigator.pop(context);
  }

  /// 消息
  void _onClickChatFromBottom(BuildContext context, ChatRoomData room) async {
    if (!Session.isLogined) {
      Fluttertoast.showToast(msg: K.room_dropped_relogin);
      return;
    }

    Tracker.instance.track(TrackEvent.game_room, properties: {
      'game_room_click': 'messagelist',
      'rid': room.realRid,
      'room_type': room.config?.type,
    });

    IMessageManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
    manager.openChatMessagePanel(context);
  }

  /// 跨房约战
  _onCrossPKTaped(BuildContext context, ChatRoomData room) {
    if (!Session.isLogined) {
      Fluttertoast.showToast(msg: K.room_dropped_relogin);
      return;
    }
    if (room.showCrossPK > 0) {
      // 正在约战中，不允许重复点击
      Fluttertoast.showToast(msg: K.cross_pk_ing);
      return;
    }
    Navigator.of(context).pop();
    CrossPKLaunchSheet.show(context: context, room: room);
  }

  /// 创建投票
  void _onVoteTaped(BuildContext context, ChatRoomData room) {
    Navigator.of(context).pop();
    VoteCreatePage.open(context, room);
  }

  /// 表白活动
  void _onConfessionClick(BuildContext context, ChatRoomData room) {
    Navigator.of(context).pop();
    RoomNavUtil.openVindicateActivityBottomSheetPage(context, room);
  }

  /// 恋爱旅行（表白活动v2）
  void _onConfessV2Click(BuildContext context, ChatRoomData room) {
    Navigator.of(context).pop();
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openConfessV2BottomSheet(context);
  }

  /// 周星榜
  void _onWeeklyStarListClick(BuildContext context, ChatRoomData room) {
    Navigator.of(context).pop();
    IRankManager rankManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
    rankManager.showRoomRankMainTabScreen(context,
        rid: room.rid, charmType: 'activity', tabType: 'week_star');
  }

  /// 购买房间热度
  Future<void> _onBuyRoomHotClick(
      BuildContext context, ChatRoomData room) async {
    Navigator.of(context).pop();
    IVipManager vipManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
    vipManager.openBuyRoomHotPanel(context, room.rid);
  }

  void _onCustomMenuTaped(BuildContext context,
      ResRoomPluginPanel_PanelItem item, ChatRoomData room) {
    Navigator.of(context).pop();
    if (Util.validStr(item.url)) {
      String url = item.url.contains("?")
          ? "${item.url}&rid=${room.rid}"
          : "${item.url}?rid=${room.rid}";
      String result = SchemeUrlHelper.instance().jump(
          item.url.startsWith("http") ? url : item.url,
          type: item.jumpType);
      if (Util.isStringEmpty(result)) {
        Fluttertoast.showCenter(msg: K.room_func_not_support);
      }
    }
  }

  /// 商业房创建关联个人房
  void createPrivateRoom(BuildContext context, ChatRoomData room) async {
    Navigator.of(context).pop();

    String? roomType = await PartyListScreen.showPartyList(context);
    if (Util.validStr(roomType)) {
      IGiftManager? giftManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      double maxHeight = 410.0;
      SelectGiftInfo? selectGiftInfo = await giftManager?.showChooseGiftPanel(
        System.context,
        room: room,
        maxHeight: maxHeight,
        title: K.room_drainage_set_gift,
        showNum: true,
        subTitle: K.room_drainage_set_gift_subtitle,
        cancelDialogContent: K.room_cancel_set_gift_content,
        selectNum: 1,
      );

      int giftId = selectGiftInfo?.id ?? 0;
      int giftNum = selectGiftInfo?.num ?? 0;

      ResDrainageCreate data = await RoomApi.createPrivateRoom(
          room.realRid, roomType ?? '', [], giftId, giftNum);

      if (data.success && data.data.rid > 0) {
        /// 创建房间成功,进新建的小房
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(
          System.context,
          data.data.rid,
          autoJoin: 1,
          matchRid: data.data.rid,
          refer: 'create_relative_room',
        );
      } else if (Util.validStr(data.message)) {
        Fluttertoast.showCenter(msg: data.message);
      }
    }
  }

  /// 推送关联房间
  Future<void> _pushAssociatedRoom(
      BuildContext context, ChatRoomData room) async {
    Navigator.of(context).pop();
    // 请求关联房间列表
    RoomChildrenRoomListRsp resp =
        await AssociatedRoomRepo.getAssociatedRoomList(room.rid);
    if (resp.success && resp.data.isNotEmpty) {
      // 选择要推送的id
      int? pushId =
          await AssociatedRoomSelectPanel.show(System.context, resp.data);
      if (pushId != null && pushId > 0) {
        // 请求推送指定id
        NormalNull pushResp = await AssociatedRoomRepo.sendPushAssociateRoom(
            parentRid: room.rid, id: pushId);
        if (pushResp.success) {
          Fluttertoast.showCenter(msg: K.associated_room_send_success);
        } else {
          Fluttertoast.showCenter(msg: K.associated_room_send_fail);
        }
      }
    } else {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }
}
