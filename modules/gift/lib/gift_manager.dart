import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:gift/slp_src/gift/auction_room_bless_send_gift_panel.dart';
import 'package:gift/slp_src/gift/slp_gift_panel.dart';
import 'package:gift/k.dart';
import 'package:gift/slp_src/gift_suit/border_and_corner_setting_panel.dart';
import 'package:gift/slp_src/tag_gift_v2/slp_tag_gift_v2_screen.dart';
import 'package:gift/src/constellation_clap/constellation_clap_float_box.dart';
import 'package:gift/src/constellation_clap/constellation_clap_main_dialog.dart';
import 'package:gift/src/constellation_clap/constellation_clap_manager.dart';
import 'package:gift/src/constellation_clap/constellation_clap_result_dialog.dart';
import 'package:gift/src/gift_list_widget.dart';
import 'package:gift/src/model/super_pack_beans.dart';
import 'package:gift/src/recharge_packet_center/recharge_pack_center_screen.dart';
import 'package:gift/src/repo/gift_activity_repo.dart';
import 'package:gift/src/repo/super_pack_repo.dart';
import 'package:gift/src/super_pack/super_pack_dialog.dart';
import 'package:gift/src/super_pack/super_pack_receive_dialog.dart';
import 'package:gift/src/super_pack/super_pack_screen.dart';
import 'package:gift/src/wish_gift/slp_gift_choose_panel.dart';
import 'package:gift/src/wish_gift/gift_choose_panel.dart';
import 'package:gift/src/wish_gift/wish_gift_edit_panel.dart';
import 'package:gift/src/wish_gift/wish_gift_send_panel.dart';
import 'package:gift/src/widget/wolf_gift_row_widget.dart';

import 'slp_src/gift/slp_combine_gift_dialog.dart';
import 'slp_src/gift/slp_private_room_gift_select_panel.dart';
import 'slp_src/graffiti_gift/graffiti_gift_effect.dart';
import 'slp_src/widget/slp_enter_room_ticket_gift_widget.dart';
import 'src/intimate_interact/intimate_interact_invite_dialog.dart';
import 'src/intimate_interact/intimate_interact_public_screen_widget.dart';
import 'src/limit_package/limit_package_dialog.dart';
import 'src/limit_package/model/time_limit_package_model.dart';
import 'src/limit_package/repo/limit_package_repo.dart';
import 'src/widget/gift_skin_unlock_dialog.dart';

class GiftManager extends IGiftManager {
  @override
  Future showPrivateGiftPanel(
    BuildContext context, {
    int uid = 0,
    bool fromChat = false,
    int defaultId = -1,
    bool toLovers = false,
    bool gameWishGift = false,
    int topicId = 0,
    DisplayPage? defaultTab,
    String? refer,
    GiftScene? giftScene,
  }) {
    assert(uid > 0);
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1,
        settings: const RouteSettings(name: '/gift_panel'),
        builder: (BuildContext context) {
          return SlpGiftPanel(
            giftScene: giftScene ?? GiftScene.private,
            id: uid,
            fromChat: fromChat,
            defaultId: defaultId,
            toLovers: toLovers,
            gameWishGift: gameWishGift,
            topicId: topicId,
            defaultTab: defaultTab,
            refer: refer,
          );
        });
  }

  @override
  Future showGroupGiftPanel(
    BuildContext context, {
    int groupId = 0,
    int uid = 0,
    bool fromChat = false,
    int defaultId = -1,
    DisplayPage? defaultTab,
    GiftScene? giftScene,
  }) {
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1,
        settings: const RouteSettings(name: '/gift_panel'),
        builder: (BuildContext context) {
          return SlpGiftPanel(
            id: uid,
            groupId: groupId,
            giftScene: giftScene ?? GiftScene.private,
            fromChat: fromChat,
            defaultId: defaultId,
            defaultTab: defaultTab,
          );
        });
  }

  @override
  Future showOrderGiftPanel(BuildContext context, {int oid = 0}) {
    assert(oid > 0);
    return displayModalBottomSheet(
      context: context,
      settings: const RouteSettings(name: '/gift_panel'),
      builder: (BuildContext context) {
        return SlpGiftPanel(giftScene: GiftScene.order, id: oid);
      },
    );
  }

  @override
  Future showBagTabOnRoomGiftPanel(
    BuildContext context, {
    room,
    int uid = 0,
    int defaultId = -1,
    bool isCpLinkPromote = false,
    String? refer,
  }) {
    return showRoomGiftPanel(
      context,
      room: room,
      uid: uid,
      initialPage: 3,
      defaultId: defaultId,
      isCpLinkPromote: isCpLinkPromote,
      refer: refer ?? '',
    );
  }

  @override
  Future showRoomGiftPanel(
    BuildContext context, {
    room,
    int uid = 0,
    int initialPage = 0,
    int defaultId = -1,
    bool isCpLinkPromote = false,
    List<int>? mysteryPositions,
    List<int>? debatePKUsers,
    DisplayPage? defaultTab,
    String? refer,
  }) {
    assert(room != null && room is ChatRoomData);
    bool isInRoom = (room as ChatRoomData).rid > 0;

    return displayModalBottomSheet(
        context: context,
        defineBarrierColor: isInRoom ? Colors.black.withOpacity(0.01) : Colors.black54,
        maxHeightRatio: 1,
        settings: const RouteSettings(name: '/gift_panel'),
        builder: (BuildContext context) {
          return SlpGiftPanel(
            giftScene: refer == 'GiftBook'
                ? GiftScene.room_private
                : (uid <= 0 ? GiftScene.room_public : GiftScene.room_private),
            room: room,
            id: uid,
            initialPage: initialPage,
            defaultId: defaultId,
            isCpLinkPromote: isCpLinkPromote,
            mysteryPositions: mysteryPositions,
            debatePKUsers: debatePKUsers,
            defaultTab: defaultTab,
            refer: refer,
          );
        });
  }

  @override
  Future openSendGift(BuildContext context, {int cid = 0, int num = 0, String? name}) {
    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    return roomManager.showContactSelectScreen(context,
        (BuildContext context, List<int> uidList, List<bool> isGroupList, Map room) async {
      if (uidList.isEmpty) {
        Fluttertoast.showToast(msg: K.please_select_friend_to_give, gravity: ToastGravity.CENTER);
        return;
      }
      int targetUid = uidList[0];
      bool result = await BaseBagApi.onSendGift(cid, num, targetUid, name ?? '');
      if (result == true) Navigator.of(context).pop(true);
    }, hideGroupTab: true, onlySelectOne: true, title: K.give_gift);
  }

  @override
  Future selectPersonUseDefendGift(BuildContext context, {int cid = 0, int num = 0, String? name}) {
    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    return roomManager.showContactSelectScreen(context,
        (BuildContext context, List<int> uidList, List<bool> isGroupList, Map room) async {
      if (uidList.isEmpty) {
        Fluttertoast.showToast(msg: K.gift_please_select_friend_to_use, gravity: ToastGravity.CENTER);
        return;
      }
      int targetUid = uidList[0];
      bool result = await BaseBagApi.onUseDefend(cid, num, targetUid, name ?? '');
      if (result == true) Navigator.of(context).pop(true);
    }, hideGroupTab: true, onlySelectOne: true, title: K.gift_use_defend);
  }

  @override
  List<RoomPosition> getGiftUsers(room, {List<int>? mysteryPositions}) {
    List<RoomPosition> users;
    assert(room != null && room is ChatRoomData);
    ChatRoomData roomData = room;
    bool isLiveTalent = ChatRoomUtil.isLiveTalent(roomData.config);
    if (!isLiveTalent && !liveRewardAllUserSwitch && roomData.config?.types == RoomTypes.Live) {
      /// 直播间：
      /// 1.普通用户只能打赏主播
      /// 2.房主可以给所有用户打赏
      users = <RoomPosition>[];
      if (roomData.createor?.uid != Session.uid) {
        if (roomData.isEightPosition || roomData.positions.elementAt(0).uid == roomData.createor?.uid) {
          users.add(RoomPosition.fromCreator(roomData.createor!));
        }
      } else {
        users = roomData.positions.where((RoomPosition pos) {
          return pos.uid > 0 && pos.uid != Session.uid;
        }).toList();
        if (roomData.isEightPosition && roomData.createor?.uid != Session.uid) {
          users.insert(0, RoomPosition.fromCreator(roomData.createor!));
        }
      }
    } else if (ChatRoomUtil.isMusicRoom(room.config)) {
      /// 音乐房
      users = roomData.positions.where((RoomPosition pos) {
        return pos.uid > 0 && pos.uid != Session.uid;
      }).toList();
    } else if (roomData.isBusinessHeart && roomData.config?.cpState == CpLoveState.Switch) {
      /// 心动速配房，选择心动阶段，将选择的心动用户排到用户列表的第一位
      users = roomData.positions.where((RoomPosition pos) {
        return pos.uid > 0 && pos.uid != Session.uid;
      }).toList();

      RoomPosition? myPos = roomData.positions.firstWhereOrNull((RoomPosition pos) {
        return pos.uid == Session.uid && pos.position > 0 && pos.position < 9;
      });
      int cpMeTarget = myPos?.cpTarget ?? 0;
      if (cpMeTarget > 0) {
        RoomPosition? meTargetPos = roomData.positions.firstWhereOrNull(
          (pos) => pos.position == cpMeTarget,
        );
        int meTargetUid = meTargetPos?.uid ?? 0;
        if (meTargetUid > 0) {
          RoomPosition? targetPos = users.firstWhereOrNull(
            (user) => user.uid == meTargetUid,
          );
          if (targetPos != null) {
            users.remove(targetPos);
            users.insert(0, targetPos);
          }
        }
      }
    } else {
      users = roomData.positions.where((RoomPosition pos) {
        return pos.uid > 0 && pos.uid != Session.uid;
      }).toList();

      /// 开启房主位之后，（非房主视角）礼物面板要展示房主
      if (roomData.config != null && roomData.config!.showOwnerSeat && roomData.createor?.uid != Session.uid) {
        bool hasCreator = users.any((element) => element.uid == roomData.createor?.uid);
        if (!hasCreator) {
          users.insert(0, RoomPosition.fromCreator(roomData.createor!));
        }
      }
    }

    return users;
  }

  @override
  Future showGifPanel(
    BuildContext context, {
    dynamic room,
    int uid = 0,
    int initialPage = 0,
    int defaultId = -1,
    SupportUseCoin supportUseCoin = SupportUseCoin.BySession,
    GiftScene? giftScene,
    DisplayPage defaultTab = DisplayPage.gift,
  }) {
    var room0 = room;
    room0 ??= ChatRoomData.getInstance();

    assert(room0 != null && room0 is ChatRoomData);
    Log.d("giftScene = $giftScene", tag: "GiftManager");
    return displayModalBottomSheet(
        context: context,
        settings: const RouteSettings(name: '/gift_panel'),
        maxHeightRatio: 1,
        builder: (BuildContext context) {
          return SlpGiftPanel(
            giftScene: giftScene ?? ((uid <= 0) ? GiftScene.room_public : GiftScene.room_private),
            room: room,
            id: uid,
            initialPage: initialPage,
            defaultId: defaultId,
            supportUseCoin: supportUseCoin,
            defaultTab: defaultTab,
          );
        });
  }

  @override
  Future<Gift?> openGiftSelectPanel(BuildContext context, double height, [List<Gift>? gifts]) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      theme: Theme.of(System.context).copyWith(
        canvasColor: Colors.transparent,
        platform: Util.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      ),
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(12),
                topEnd: Radius.circular(12),
              ),
            ),
            child: GiftListWidget(
              gifts: gifts,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget showGiftPanelRow(BuildContext context, {dynamic room, int uid = 0}) {
    return WolfGiftRowWidget(uid, room);
  }

  @override
  Future showMarryGiftPanel(BuildContext context, {int mid = 0}) {
    assert(mid > 0);
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1,
        theme: Theme.of(System.context).copyWith(
          canvasColor: Colors.transparent,
          platform: Util.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
        ),
        builder: (BuildContext context) {
          return SlpGiftPanel(
            giftScene: GiftScene.private,
            room: ChatRoomData(),
            id: mid,
            initialPage: 0,
            defaultId: -1,
            toLovers: true,
          );
        });
  }

  @override
  Future showGoodVoiceGiftPanel(BuildContext context, {int tUid = 0, int vid = 0, int stageId = 0}) {
    assert(vid > 0);
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1,
        theme: Theme.of(System.context).copyWith(
          canvasColor: Colors.transparent,
          platform: Util.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
        ),
        builder: (BuildContext context) {
          return Container();
        });
  }

  @override
  Future showGiftSkinUnlockDialog(BuildContext context, String icon, String name) {
    return DialogQueue.root.enqueue(
      context: context,
      dialogBuilder: <T>(context) async {
        return GiftSkinUnlockDialog.show(context, icon, name);
      },
    );
  }

  /// 打开超级礼包
  @override
  Future<bool?> showSuperGiftPack(BuildContext context, {int from = 0}) {
    return SuperPackScreen.show(context, from: from);
  }

  @override
  Future<bool> showRechargePackCenter(BuildContext context, String type) {
    return RechargePackCenterScreen.show(context, type);
  }

  @override
  Future<bool?> showBottomRechargePackCenter(BuildContext context) {
    Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'package_center_icon'});

    return RechargePackCenterScreen.showBottom(context);
  }

  @override
  Future<bool> showSuperPackDialog(BuildContext context) async {
    SuperPackResp resp = await SuperPackRepo.getSuperPacks();
    if (resp.success == true && resp.data != null) {
      SuperPackDialog.show(context, resp.data!);
      return true;
    }
    return false;
  }

  @override
  bool superPackDialogShowed() {
    return Config.getInt(SuperPackDialog.getShowKey(), 0) == 1;
  }

  @override
  Future<bool?> showSuperGiftReceiveDialog(BuildContext context, Map<String, dynamic> jsonData) {
    try {
      SuperPackItem item = SuperPackItem.fromJson(jsonData);
      return SuperGiftReceiveDialog.show(context, item);
    } catch (e) {
      Log.d(e.toString());
    }
    return Future.value(false);
  }

  @override
  Future<SelectGiftInfo?> showChooseGiftPanel(
    BuildContext context, {
    room,
    double maxHeight = 0,
    String? title,
    bool showNum = true,
    String? subTitle,
    String? cancelDialogContent,
    int selectNum = 10,
  }) {
    return SlpWishGiftChoosePanel.show(
      context,
      room,
      maxHeight: maxHeight,
      title: title,
      showNum: showNum,
      subTitle: subTitle,
      cancelDialogContent: cancelDialogContent,
      selectNum: selectNum,
    );
  }

  @override
  Future showWishGiftEditPanel(BuildContext context, {room}) {
    return WishGiftEditPanel.show(context, room);
  }

  @override
  Future showWishGiftSendPanel(BuildContext context, {room}) {
    return WishGiftSendPanel.show(context, room);
  }

  /// 打开限时礼包弹窗
  @override
  Future<bool?> showLimitPackageDialog(BuildContext context, {ActivityPackData? data, int index = 0}) async {
    DataRsp<TimeLimitPackageModel> rsp = await LimitPackageRepo.getTimeLimitPackage();
    if (rsp.success == true && rsp.data != null) {
      return LimitPackageDialog.show(context, rsp.data!);
    }
    return false;
  }

  @override
  Future showIntimateInteractInviteDialog(BuildContext context) {
    return IntimateInteractInviteDialog.show(System.context);
  }

  @override
  Widget getIntimateInteractPublicScreenWidget(int status, String name) {
    return IntimateInteractPublicScreenWidget(status: status, name: name);
  }

  @override
  void oneKeySendNewbieComing(BuildContext context, int cid) {
    List<RoomPosition>? users = getGiftUsers(ChatRoomData.getInstance());
    if (users.isEmpty) {
      Fluttertoast.showToast(msg: K.gift_no_users_can_get_reward);
      return;
    }
    int totalPrice = 2 * users.length;

    IPayManager payManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    payManager.pay(context,
        key: 'gift',
        type: 'available',
        refer: 'gift',
        args: {
          'money': totalPrice,
          'type': 'package',
          'params': {
            'rid': ChatRoomData.getInstance()?.rid,
            'uids': users.map((e) => e.uid).join(','),
            'positions': users.map((e) => e.position).join(','),
            'position': users.map((e) => e.uid).firstWhereOrNull((element) => element == Session.uid) ?? -1,
            'giftId': '518',
            'giftNum': 1,
            'price': 2,
            'cid': cid,
            'ctype': 'gift',
            'duction_money': 0,
            'version': 2,
            'num': users.length,
            'gift_type': 'normal',
            'star': 0,
            'show_pac_man_guide': Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
            'refer': '${ChatRoomData.getInstance()?.refer}:room',
            'all_mic': 1,
          }
        },
        showLoading: false,
        onPayed: () => (_) {},
        onError: (isErrorCatch) => {},
        onPayAppOpen: () {});
  }

  @override
  Future<bool?> openPrivateRoomGiftSelectPanel({
    BuildContext? context,
    int giftId = 0,
    int giftNum = 0,
    int uid = 0,
    int rid = 0,
  }) {
    return SlpPrivateRoomGiftSelectPanel.show(context: context, giftId: giftId, giftNum: giftNum, uid: uid, rid: rid);
  }

  @override
  Future showRoomAuctionBlessGiftPanel(
    BuildContext context, {
    int rid = 0,
    int uid = 0,
    String? name,
    String? icon,
  }) {
    return displayModalBottomSheet(
        context: context,
        defineBarrierColor: Colors.black.withOpacity(0.01),
        maxHeightRatio: 1,
        settings: const RouteSettings(name: '/gift_panel_auction_bless'),
        builder: (BuildContext context) {
          return AuctionRoomBlessSendGiftPanel(
            rid: rid,
            uid: uid,
            icon: icon ?? '',
            name: name ?? '',
          );
        });
  }

  @override
  Widget getEnterRoomTicketGiftWidget(BuildContext context,
      {bool open = false, int selectGiftId = 0, Function(int giftId)? onGiftItemTap}) {
    return SlpEnterRoomTicketGiftWidget(open: open, selectGiftId: selectGiftId, onGiftItemTap: onGiftItemTap);
  }

  @override
  Future openCombineGiftDialog({BuildContext? context, int combineId = 0, int combineType = 0, String? combineName}) {
    return SlpCombineGiftDialog.show(
      context ?? System.context,
      room: ChatRoomData.getInstance()!,
      combineId: combineId,
      combineType: combineType,
      combineName: combineName ?? '',
    );
  }

  @override
  Future openImpressTagGiftScreen(BuildContext context) {
    return RoomTagGiftV2Screen.show(context);
  }

  @override
  Future openConstellationClapMainDialog(BuildContext context) {
    return ConstellationClapMainDialog.show(context);
  }

  @override
  Future openConstellationClapResultDialog(BuildContext context) {
    return ConstellationClapResultDialog.show(context);
  }

  @override
  Widget getConstellationClapFloatBox() {
    return const ConstellationClapFloatWrapper();
  }

  @override
  void constellationClapInit({bool firstLaunch = false}) {
    ConstellationClapManager.init(firstLaunch: firstLaunch);
  }

  @override
  Widget getGraffitiGiftEffect(String icon, List<Offset> points, VoidCallback onComplete) {
    return GraffitiGiftEffect(icon: icon, points: points, onComplete: onComplete);
  }

  @override
  Future openBorderAndCornerSettingPanel(BuildContext context, int rid) {
    return BorderAndCornerSettingPanel.show(context, rid);
  }

  @override
  Future<int> getOneKeyWakeNum(int giftId) async {
    final rsp = await GiftPackCenterRepo.getawakeInfo(giftId);
    if (rsp.success) {
      return rsp.data.giftNum;
    }
    return 0;
  }
}
