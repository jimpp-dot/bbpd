import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/top_right_widgets/room_top_right_widget_manager.dart';
import 'package:chat_room/src/base/widget/avatarGiftLayout.dart';
import 'package:chat_room/src/base/widget/chat_room_bg_screen.dart';
import 'package:chat_room/src/base/widget/displayGift.dart';
import 'package:chat_room/src/base/widget/gift_combo/gift_combo_owner_widget.dart';
import 'package:chat_room/src/base/widget/gifting_guide.dart';
import 'package:chat_room/src/base/widget/gobalRoomMessage.dart';
import 'package:chat_room/src/base/widget/large_welcome_widget.dart';
import 'package:chat_room/src/base/widget/wish_gift_label.dart';
import 'package:chat_room/src/biz_plugin/birthday_sprite/birthday_sprite_plugin.dart';
import 'package:chat_room/src/biz_plugin/pendant/room_topmost_effect.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'game_list/util/game_list_util.dart';
import 'widget/chat_room_wedding_bg.dart';
import 'widget/common_message_list/common_message_list_main_view.dart';
import 'widget/hot_anim_widget.dart';

/// 房间通用的组件集合
mixin RoomTemplateMixin<T extends StatefulWidget> on State<T> {
  GlobalKey messageListKey = GlobalKey();
  GlobalKey<ComboFullEffectWidgetState> comboEffectKey = GlobalKey();
  final IBASEGameRoomManager _baseGameRoomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WEBGAME_ROOM);
  final IRankManager _rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);

  /// 房间通用widget
  List<Widget> renderExtra(BuildContext context, ChatRoomData room, {bool showGift = true}) {
    final room0 = room;
    return [
      // if (room0.showPKSuperMatch)
      //   Positioned.fill(child: PKSuperMatchMainWidget(messageKey: messageListKey, rid: room0.realRid)),
      // if (room0.showAnnualCelebration)
      //   Positioned.fill(child: AnnualCelebrationMainWidget(messageKey: messageListKey, rid: room0.realRid)),
      Positioned.fill(child: BirthdaySpritePlugin(rid: room0.rid)),
      Positioned.fill(
        child: GiftComboOwnerWidget(comboEffectKey: comboEffectKey, messageKey: messageListKey),
      ),

      // 连击礼物特殊数字全屏动画
      Positioned.fill(
        child: ComboFullEffectWidget(key: comboEffectKey),
      ),

      const Positioned.fill(child: LargeWelcomeWidget()),

      // 热度动效
      PositionedDirectional(
        start: 0.0,
        end: 0.0,
        top: Util.statusHeight,
        height: kToolbarHeight,
        child: HotAnimWidget(room: room0),
      ),

      Positioned.fill(child: _baseGameRoomManager.buildRoomGamePluginPanel()),

      PositionedDirectional(
        end: 0,
        bottom: 42 + Util.iphoneXBottom,
        child: GiftingGuide(key: GlobalKey(), room: room0),
      ),

      // 礼物
      if (showGift == true)
        Positioned.fill(
          child: DisplayGift(room: room0, getPositionByUid: getGiftPositionByUid),
        ),

      // 全局飘屏
      PositionedDirectional(
        start: 0.0,
        end: 0.0,
        top: Util.statusHeight + 34.0,
        child: GlobalRoomMessage(room: room0),
      ),

      // 最顶层动效
      Positioned.fill(child: RoomTopmostEffect(room: room0)),

      Positioned.fill(
        child: AvatarGiftLayout(roomData: room0, getPositionByUid: getGiftPositionByUid),
      ),
    ];
  }

  PositionOffset getGiftPositionByUid(int uid) => ChatRoomUtil.getPointByUid(uid);

  /// 房间背景
  Widget renderBg(BuildContext context, ChatRoomData room) {
    if (room.isBusinessWedding) {
      return const ChatRoomWeddingBg();
    }

    return Positioned.fill(
      child: ChatRoomBgScreen(
        roomBackGroundInfo: room.config?.roomBackground,
        size: Size(Util.width, Util.height),
      ),
    );
  }

  ///公屏消息
  Widget renderMessageList(ChatRoomData room) {
    return CommonMessageListMainVew(
      key: messageListKey,
      room: room,
      comboEffectKey: comboEffectKey,
    );
  }

  /// 头部
  Widget renderRoomHeader(
    ChatRoomData room,
    VoidCallback? settingClick, {
    bool? showHelp,
    String? helpUrl,
    String? helpTitle,
    Widget? normalHeader,
  }) {
    return normalHeader ??
        RoomHeaderNormal(
          room: room,
          onSettingClick: settingClick,
          showHelp: showHelp,
          helpUrl: helpUrl,
          helpTitle: helpTitle,
        );
  }

  /// 底部工具条
  Widget renderController(ChatRoomData room) {
    return RoomBottomController(room: room);
  }

  /// 小时、日、周排行榜
  Widget renderRankingList(BuildContext context, ChatRoomData room) {
    if (room.showRankingList) {
      return _rankManager.getRoomRankingList(room.rid, roomEvent: room);
    }
    return const SizedBox.shrink();
  }

  Widget renderWeekStar(ChatRoomData room) {
    return const SizedBox.shrink();
  }

  /// 房间右上角是否有组件
  bool templateMixinHasTopRightWidgets(ChatRoomData room) {
    bool result = (room.roomWishGiftsData != null && room.roomWishGiftsData!.show) ||
        ChatRoomUtil.isCanShowFansLabel(room) ||
        GameListUtil.showRoomGameListLabel(room) ||
        room.isShowVisitantRank == true ||
        room.showPrivateRoomEntry == true;
    return result;
  }

  /// 房间右上角功能按钮
  Widget templateMixinGetTopRightWidgets(ChatRoomData room) {
    bool theOneNotShowRank = room.config?.types == RoomTypes.TheOne && !room.showRankingList;
    int max = (room.showRankingList || (theOneNotShowRank) || ChatRoomUtil.isCanShowFansLabel(room)) ? 2 : 3;

    /// 礼物心愿标签有可能显示空
    if (WishGiftLabel.notRealShow(room)) {
      max++;
    }

    /// 按优先级排序。
    /// 优先级顺序：心愿礼物 > 和TA的任务 > 与TA共舞 > 贵宾榜 > 五星挑战 > 游戏玩法列表标签
    final manager = RoomTopRightWidgetsManager(room: room, maxCount: max);
    // /// 创建一个BannerItem
    // String _bannerIndex1 = _manager.createBannerItem();

    /// 礼物心愿
    manager.addItem(RoomTopRightItemType.wishGift);

    /// 贵宾榜
    manager.addItem(RoomTopRightItemType.visitantRank);

    /// 五星挑战
    manager.addItem(RoomTopRightItemType.liveFans);

    /// 游戏玩法列表标签
    manager.addItem(RoomTopRightItemType.gameList);

    return manager.getTopRightWidget();
  }

  /// 左上角按钮
  Widget templateMixinTopLeftWidgets(BuildContext context, ChatRoomData room) {
    List<Widget> res = [];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: res,
    );
  }

  Widget renderTopActivityRow(BuildContext context, ChatRoomData room) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          templateMixinTopLeftWidgets(context, room),
          const Spacer(),
          if (templateMixinHasTopRightWidgets(room)) templateMixinGetTopRightWidgets(room),
        ],
      ),
    );
  }
}
