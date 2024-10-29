import 'package:chat_room/k.dart';
import 'package:chat_room/src/accompany/model/accompany_model.dart';
import 'package:chat_room/src/accompany/widget/accompany_effect_widget.dart';
import 'package:chat_room/src/accompany/widget/accompany_widget.dart';
import 'package:chat_room/src/auction/widget/auction_main_widget.dart';
import 'package:chat_room/src/base/page/roomPassword.dart';
import 'package:chat_room/src/base/room_event_show_anim_screen.dart';
import 'package:chat_room/src/base/widget/off_mic_user_list.dart';
import 'package:chat_room/src/base/widget/room_loading_page.dart';
import 'package:chat_room/src/base/widget/room_star_wish_pop_widget.dart';
import 'package:chat_room/src/base/widget/say_hi_page.dart';
import 'package:chat_room/src/base/widget/wish_gift_label.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/cross_pk_invite_dialog.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/cross_pk_invite_qualifying_dialog.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/cross_pk_main_widget.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/cross_pk_overtime_dialog.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/cross_pk_result_segment_dialog.dart';
import 'package:chat_room/src/biz_plugin/juke_music/juke_music_util.dart';
import 'package:chat_room/src/biz_plugin/trueword/widget/room_true_word_widget.dart';
import 'package:chat_room/src/cplink/widget/cplinkUserList.dart';
import 'package:chat_room/src/cplink/widget/hand_animation_widget.dart';
import 'package:chat_room/src/cplove/heart/cp_heart_room_widget.dart';
import 'package:chat_room/src/ktv/widget/ktv_pk_rank_anim_widget.dart';
import 'package:chat_room/src/live/live_main_v3.dart';
import 'package:chat_room/src/mic_link/mic_link_main_widget.dart';
import 'package:chat_room/src/music/widget/music_room_widget.dart';
import 'package:chat_room/src/my_house_room/my_house_room_widget.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:chat_room/src/talent/main/talent_main.dart';
import 'package:chat_room/src/talent_new/main/talent_main_new.dart';
import 'package:chat_room/src/wedding/room_wedding_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../chat_room.dart';
import 'accompany/widget/accompany_new_widget.dart';
import 'base/game_list/util/game_list_util.dart';
import 'base/game_list/widget/game_list_label.dart';
import 'base/new_room_privilege/new_room_privilege_entry.dart';
import 'base/page/achievement_unlock_dialog.dart';
import 'base/top_right_widgets/widgets/private_room_my_ship.dart';
import 'base/widget/private_room_panel_entry.dart';
import 'base/widget/user_mic_list.dart';
import 'birthday/birthdy_room_widget.dart';
import 'biz_plugin/crosspk/widget/cross_pk_apply_end_dialog.dart';
import 'biz_plugin/crosspk/widget/laya_cross_pk_tower.dart';
import 'biz_plugin/gpk/gpk_module.dart';
import 'biz_plugin/gpk/widget/gpk_main_widget.dart';
import 'biz_plugin/heartpass/heart_pass_mian_widget.dart';
import 'biz_plugin/juke_music/widget/juke_music_widget_uitl.dart';
import 'biz_plugin/vote/show/vote_main_widget.dart';
import 'cplink/widget/cplink_v2_widget.dart';
import 'cplink/widget/cplink_widget.dart';
import 'cplink/widget/sceneHeader.dart';
import 'dating_room/dating_room_page.dart';
import 'draw_guess/draw_guess_main_widget.dart';
import 'four_mic/four_mic_main_page.dart';
import 'heartrace/widget/heart_race_main_widget.dart';
import 'ktv/ktv_room_widget.dart';
import 'pia_drama/pia_drama_entrance.dart';
import 'under/game_under.dart';
import 'visitant/visitant_label.dart';
import 'wedding_business/room_wedding_business_widget.dart';

class ChatRoomPage extends StatefulWidget {
  final ChatRoomData? room;
  final VoidCallback? onPageLoad;

  const ChatRoomPage({Key? key, required this.room, this.onPageLoad}) : super(key: key);

  @override
  ChatRoomPageState createState() => ChatRoomPageState();
}

class ChatRoomPageState extends State<ChatRoomPage>
    with RoomSettingMixin<ChatRoomPage>, RoomFloatingBannerMixin<ChatRoomPage>, RoomTemplateMixin<ChatRoomPage> {
  ChatRoomData? _roomNullable;

  ChatRoomData get _room => _roomNullable!;

  final bool _displayEmoteAtMic = true;

  bool _onPageLoadChecked = false;

  // final GlobalKey _keyMessageList = GlobalKey();
  final GlobalKey _emoteIconKey = GlobalKey();
  final IRankManager _rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
  final IBASEGameRoomManager baseGameRoomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WEBGAME_ROOM);

  @override
  void initState() {
    super.initState();
    // 进房时有在播放启动音，需要关闭
    OpenScreenAd.stopLaunchAudio();
    _roomNullable = widget.room;
    eventCenter.addListener('Room.Admin', _onAdmin);
    eventCenter.addListener('Navigator.Page.Pop', _onPagePop);
    eventCenter.addListener(EventConstant.SessionChange, _onSessionChange);
    eventCenter.addListener(RoomConstant.Event_Room_Limit_Package, _onReceiveLimitPackage);
    eventCenter.addListener(RoomConstant.Event_Room_Achievement_Unlock, _onReceiveAchievementUnlock);
    eventCenter.addListener(EventConstant.EventLogout, _onLogout);
  }

  @override
  void didUpdateWidget(covariant ChatRoomPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _roomNullable = ChatRoomData.getInstance();
    if (_roomNullable != null) {
      _room.removeListener('${RoomConstant.Event_Prefix}cross.pk.invite', _onCrossPKInvite);
      _room.addListener('${RoomConstant.Event_Prefix}cross.pk.invite', _onCrossPKInvite);
      _room.removeListener('${RoomConstant.Event_Pb_Prefix}cross.pk.qualifying.affirm', _onCrossPKInviteQualifying);
      _room.addListener('${RoomConstant.Event_Pb_Prefix}cross.pk.qualifying.affirm', _onCrossPKInviteQualifying);
      _room.removeListener('${RoomConstant.Event_Prefix}cross.pk.overtime', _onCrossPKOvertime);
      _room.addListener('${RoomConstant.Event_Prefix}cross.pk.overtime', _onCrossPKOvertime);
      _room.removeListener('${RoomConstant.Event_Pb_Prefix}cross.pk.end.apply', _onCrossPKEndApply);
      _room.addListener('${RoomConstant.Event_Pb_Prefix}cross.pk.end.apply', _onCrossPKEndApply);
      _room.removeListener('${RoomConstant.Event_Pb_Prefix}cross.pk.result.segment', _onResultSegmentEvent);
      _room.addListener('${RoomConstant.Event_Pb_Prefix}cross.pk.result.segment', _onResultSegmentEvent);
      _room.removeListener('${RoomConstant.Event_Prefix}pop.draw.star.wish.commodity', _onStatWishEvent);
      _room.addListener('${RoomConstant.Event_Prefix}pop.draw.star.wish.commodity', _onStatWishEvent);
    }
  }

  @override
  void dispose() {
    eventCenter.removeListener('Room.Admin', _onAdmin);
    eventCenter.removeListener('Navigator.Page.Pop', _onPagePop);
    eventCenter.removeListener(EventConstant.SessionChange, _onSessionChange);
    eventCenter.removeListener(RoomConstant.Event_Room_Limit_Package, _onReceiveLimitPackage);
    eventCenter.removeListener(RoomConstant.Event_Room_Achievement_Unlock, _onReceiveAchievementUnlock);
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);
    _roomNullable?.removeListener('${RoomConstant.Event_Prefix}cross.pk.invite', _onCrossPKInvite);
    _roomNullable?.removeListener('${RoomConstant.Event_Pb_Prefix}cross.pk.qualifying.affirm', _onCrossPKInviteQualifying);
    _roomNullable?.removeListener('${RoomConstant.Event_Pb_Prefix}cross.pk.result.segment', _onResultSegmentEvent);
    _roomNullable?.removeListener('${RoomConstant.Event_Prefix}cross.pk.overtime', _onCrossPKOvertime);
    _roomNullable?.removeListener('${RoomConstant.Event_Pb_Prefix}cross.pk.end.apply', _onCrossPKEndApply);
    _roomNullable?.removeListener('${RoomConstant.Event_Prefix}pop.draw.star.wish.commodity', _onStatWishEvent);
    super.dispose();
  }

  _onLogout(String type, dynamic value) {
    /// 防止退到后台被别的设备挤下线，pop不生效导致房间的socket/心跳上报等嗨一直在
    _roomNullable?.dispose();
  }

  _onReceiveAchievementUnlock(String type, dynamic value) {
    if (value is! Map) return;

    AchievementUnlockDialog.show(context, icon: Util.notNullStr(value['icon']), name: Util.notNullStr(value['name']));
  }

  /// 限时礼包弹窗
  _onReceiveLimitPackage(String type, dynamic value) {
    IGiftManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    manager.showLimitPackageDialog(context);
  }

  _onPagePop(String type, dynamic value) {
    String? pageName = value;
    if (pageName != null && pageName.startsWith('/room') && _roomNullable != null) {
      _room.loadLiveConfig();
    }
  }

  _onSessionChange(String type, dynamic field) {
    String key = field;
    //刷新 首充礼包是否显示
    if (key == 'first_pay') {
      if (mounted) {
        setState(() {});
      }
    }
  }

  _onCrossPKInvite(String type, dynamic value) {
    CrossPKInviteDialog.show(context: context, rid: _room.rid, data: value);
  }

  _onCrossPKInviteQualifying(String type, dynamic value) {
    if (_room.isCreator || _room.isReception) {
      /// 房主/接待 才能收到排位赛 邀请dialog
      CrossPKInviteQualifyingDialog.show(context: context, rid: _room.rid, value: value);
    }
  }

  /// 段位结果通知
  _onResultSegmentEvent(String type, dynamic data) {
    CrossPKResultSegmentDialog.show(context, value: data);
  }

  _onCrossPKOvertime(String type, dynamic value) {
    CrossPKOvertimeDialog.show(context: context, rid: _room.rid, data: value);
  }

  /// PK 申请提前结束
  _onCrossPKEndApply(String type, dynamic value) {
    ///只有房主，接待，0号麦的人员弹结束框
    if (_room.isReception || Session.uid == _room.positions[0].uid || _room.isCreator) {
      CrossPKApplyEndDialog.show(context: context, rid: _room.rid, data: value);
    }
  }

  _onStatWishEvent(String type, dynamic data) {
    Map wishData = data as Map;
    RoomStarWishPopWidget.show(context,
        icon: Util.parseStr(wishData['icon']), name: Util.parseStr(wishData['name']), desc: Util.parseStr(wishData['desc']));
  }

  _onAdmin(String type, dynamic data) {
    String op = data;
    // Log.d("admin $op");
    // 只有continueDefend时发Room.Admin事件，删除事件
    if (op == 'continueDefend') {
      ChatRoomUtil.continueDefend(context, _room, 3);
    }
  }

  _onOrderWeekTap() {
    RoomNavUtil.openRoomAdminScreen(context,
        rid: _room.rid, purview: _room.purview, types: _room.config?.types, fullScreenDialog: true, uid: _room.createor?.uid ?? 0);
  }

  Widget _renderError() {
    return Scaffold(
      appBar: BaseAppBar(K.room_something_went_wrong),
      body: ErrorData(
          error: _room.displayErrorMsg,
          onTap: () {
            _room.initAll(_room.realRid, true);
          }),
    );
  }

  Widget _renderPassword() {
    return Scaffold(
      appBar: BaseAppBar(K.room_input_password),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoomPassword(
            onChanged: _room.setPassword,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
            child: Text(_room.displayErrorMsg),
          )
        ],
      ),
    );
  }

  void _showOnMicDialog(bool hasBosMic) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: K.room_notice,
          content: K.room_auto_queue_mic_tip,
          negativeButton: null,
          positiveButton: PositiveButton(text: K.room_on_mic, useGradientBg: true),
        );
      },
    );
    if (result == true) {
      final data = await RoomRepository.queue(_room.realRid, RoomConstant.Queue_Join,
          boss: hasBosMic, isAuction: false, needCertify: false, type: _room.needVerify, newType: _room.needVerifyNew);

      if (data != null && data.containsKey('certify') && data['certify'] == false) {
        // 未认证
        Fluttertoast.showCenter(msg: K.room_up_mic_unauth);
      }
    }
  }

  bool get _isLoading => _roomNullable == null || _roomNullable!.loading || _roomNullable!.config == null;

  Widget _renderBody(BuildContext context) {
    if (_isLoading) {
      return const RoomLoadingPage(index: RoomLoadingPage.room);
    }

    if (!_onPageLoadChecked) {
      _onPageLoadChecked = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_room.isSenderRoom &&
            !ChatRoomUtil.isCreatorOrAdmin(_room) &&
            ChatRoomUtil.noOneExceptReception(_room) &&
            !ChatRoomUtil.inMicQueue(_room)) {
          _showOnMicDialog(_room.positions.indexWhere((e) => ChatRoomUtil.isBossChair(e)) >= 0);
        }
        widget.onPageLoad?.call();
      });
    }

    if (_room.showCrossPK == 2) {
      return LayaCrossPkTower(room: _room, onSettingClick: _onSettingClick);
    }

    /// 任意房间都支持约战PK，优先展示约战PK UI
    if (_room.showCrossPK <= 0) {
      /// 婚礼房
      if (ChatRoomUtil.isWedding(_room.config)) {
        return RoomWeddingWidget(key: const ValueKey('room_wedding_main'), room: _room, onLoadCallback: _loadErrorCallback);
      }

      /// 一起听
      if (_room.isMusicRoom) {
        return MusicRoomWidget(room: _room, displayEmoteAtMic: _displayEmoteAtMic, onSettingClick: _onSettingClick);
      }

      /// 约会吧
      if (_room.isDating) {
        return DatingRoomPage(_room, _onSettingClick);
      }

      /// 麦序房
      if (ChatRoomUtil.isArtCenter(_room.config)) {
        return RoomTalentMainNewWidget(room: _room, onSettingClick: _onSettingClick);
      }

      /// 直播才艺厅
      if (ChatRoomUtil.isLiveTalent(_room.config)) {
        return RoomTalentMainWidget(room: _room, onSettingClick: _onSettingClick);
      }

      /// 画猜房-接龙
      if (_room.isGuessQueue) {
        IDrawGuessManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_DRAW_GUESS);
        return manager.getGuessQueueWidget(_room, _onSettingClick);
      }

      /// 狼人杀
      if (_room.config?.game == Games.Wolf) {
        IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
        return wereWolfManager.getWolfRoomPage(_room);
      }

      /// Laya游戏
      if (ChatRoomUtil.isLayaGame(_room.config)) {
        return baseGameRoomManager.buildRoomGamePage(gameType: _room.config!.originalRFT);
      }

      /// 画猜房-竞猜
      if (_room.config?.game == Games.Guess) {
        return DrawGuessMainWidget(_room, _onSettingClick);
      }

      /// KTV房
      if (_room.isKtvRoom) {
        return KtvRoomWidget(room: _room, onSettingClick: _onSettingClick);
      }

      /// 大哥房
      if (ChatRoomUtil.isMyHouse(_room.config)) {
        return MyHouseRoomWidget(room: _room, onSettingClick: _onSettingClick);
      }
    }

    bool isAuction = _room.config?.types == RoomTypes.Auction;

    bool isSceneType = _room.config?.isSceneType == true;

    bool isInGpkMode = RoomGPKModule.isInGpkMode(_room);

    bool showTrueWord =
        (_room.config?.configExpendData is AccompanyData) && ((_room.config?.configExpendData as AccompanyData).truthEnable);

    List<Widget> res = [];
    if (isSceneType) {
      res.add(SceneHeader(chatRoomData: _room));
    } else {
      res.add(RoomHeaderNormal(room: _room, onSettingClick: _onSettingClick));
    }

    /// 顶部各种排行榜入口占位高度
    res.add(_buildTopEntrance());

    if (_room.showCrossPK > 0) {
      res.add(CrossPKMainWidget(room: _room));
    } else if (_room.config?.game == Games.Under) {
      res.add(GameUnderWidget(room: _room, displayEmote: _displayEmoteAtMic));
    } else if (_room.canPk) {
      res.add(LiveMainV3(room: _room, displayEmoteAtMic: _displayEmoteAtMic, onOrderWeekTap: _onOrderWeekTap));
    } else if (isInGpkMode) {
      res.add(GPKMainWidget(room: _room));
    } else if (isAuction) {
      res.add(AuctionMainWidget(room: _room));
    } else if (isSceneType) {
      res.add(CpLinkUserList(room: _room, displayEmoteAtMic: _displayEmoteAtMic));
    } else if (_room.isCpLinkV2) {
      res.add(CpLinkV2Widget(room: _room, displayEmote: _displayEmoteAtMic));
    } else if (_room.isCpLink) {
      res.add(CpLinkWidget(room: _room, displayEmote: _displayEmoteAtMic));
    } else if (ChatRoomUtil.isAccompany(_room.config)) {
      res.add(AccompanyWidget(room: _room, displayEmote: _displayEmoteAtMic));
    } else if (_room.config?.factoryType == RoomFactoryType.BusinessPayVoice) {
      res.add(AccompanyPayWidget(room: _room, displayEmote: _displayEmoteAtMic));
    } else if (_room.isBusinessHeart) {
      res.add(CpHeartRoomWidget(room: _room));
    } else if (_room.isBusinessBirthday) {
      res.add(BirthdayRoomWidget(room: _room));
    } else if (_room.isBusinessNormal5) {
      res.add(FourMicUserList(_room));
    } else if (_room.isHeartRace) {
      res.add(HeartRaceMainWidget(room: _room));
    } else if (_room.isBusinessWedding) {
      res.add(RoomWeddingBusinessWidget(room: _room));
    } else if (_room.isMicLink) {
      res.add(MicLinkMainWidget(_room));
    } else {
      res.add(UserMicList(room: _room));
    }

    bool isPersonalRoom = _room.config?.property == RoomProperty.Vip;
    bool showOffMicList = isPersonalRoom && showOffMicUserList.contains(_room.config?.type) && !isSceneType && !isInGpkMode;

    showOffMicList = showOffMicList || (ChatRoomUtil.isAccompany(_room.config) && !Util.isCollectionEmpty(_room.offMicList));

    if (showOffMicList) {
      res.add(OffMicUserList(room: _room));
    }

    /// 是否支持心动闯关
    if (_room.heartPassEntrance != null) {
      res.add(HeartPassMainWidget(room: _room));
    }

    res.add(renderMessageList(_room));

    // 底部控制区
    res.add(RoomBottomController(room: _room, emoteIconKey: _emoteIconKey));

    double height = Util.height;
    double paddingTop = Util.statusHeight;

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        renderBg(context, _room),

        PositionedDirectional(
          start: 0.0,
          end: 0.0,
          top: 0.0,
          height: height - Util.iphoneXBottom,
          child: Column(
            children: res,
          ),
        ),

        /// 礼金设置入口
        if (JukeMusicUtil.supportJukeMusic(_room) && !isInGpkMode && _room.showCrossPK <= 0)
          ...JukeMusicWidgetUtil.renderJukeEntrance(context, _room, hasRightWidgets: _hasRightWidgets()),

        /// pia戏点本入口
        if (Util.parseInt(_room.generalSetting?.data.openPiaDramaJuben) == 1)
          PiaDramaEntrance.renderPiaDramaEntrance(context: context, room: _room, hasRightWidgets: _hasRightWidgets()),

        /// 投票插件
        if (_room.showVoteEntrance) Positioned.fill(child: VoteMainWidget(keyMessageList: messageListKey, room: _room)),

        if (showTrueWord)
          RoomTrueWordWidget(
            room: _room,
            msgKey: messageListKey,
          ),

        /// 小时、日、周排行榜
        // if (_room.showRankingList)
        //   PositionedDirectional(
        //     child: _rankManager.getRoomRankingList(_room.rid, roomEvent: _room),
        //   ),

        //房间贵宾 入口
        // PositionedDirectional(
        //   end: 12,
        //   top: paddingTop + 44.0,
        //   child: _getRightWidgets(),
        // ),

        /// 私密房入口
        if (_room.nest != null && Util.parseInt(_room.nest!['show']) == 1)
          PositionedDirectional(
            top: paddingTop + 74,
            start: 16,
            child: PrivateRoomPanelEntry(
              room: _room,
            ),
          ),

        // 1+1陪伴房特效
        if (ChatRoomUtil.isAccompany(_room.config))
          Positioned.fill(
            child: AccompanyEffectWidget(room: _room),
          ),

        PositionedDirectional(
          bottom: 54 + Util.iphoneXBottom,
          child: SayHiPage(room: _room),
        ),

        // 新人房间特权入口
        if (_room.showNewRoomPrivilege)
          PositionedDirectional(
            end: 9,
            bottom: 250.dp + paddingTop,
            child: NewRoomPrivilegeEntry(room: _room),
          ),

        /// 通过飘屏跳转的返回按钮
        if (_room.backRoomId != null && _room.backRoomId != 0 && _room.backRoomId != _room.rid)
          PositionedDirectional(
            start: -1,
            bottom: Util.bottomMargin + 82,
            child: SizedBox(
              width: 58,
              height: 28,
              child: GestureDetector(
                onTap: () {
                  IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
                  roomManager.openChatRoomScreenShow(context, _room.backRoomId!);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [const Color(0xFFB9AFEC).withOpacity(0.8), const Color(0xFF5B4AFF).withOpacity(0.8)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    border: Border.all(color: const Color(0xFFEEEFAB).withOpacity(0.8), width: 1),
                    borderRadius: const BorderRadiusDirectional.only(topEnd: Radius.circular(14), bottomEnd: Radius.circular(14)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '< ${K.room_back}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),

        // if (!isSceneType)
        //   PositionedDirectional(
        //     end: 0,
        //     bottom: preMadeRecruitBottom,
        //     child: buildFloatingBanner(_room),
        //   ),

        Positioned.fill(
          child: HandAnimationWidget(room: _room),
        ),
        const Positioned.fill(
          child: RoomEventShowAnimScreen(),
        ),
        Positioned.fill(
          child: KtvPkRankAnimWidget(room: _room),
        ),

        ...renderExtra(context, _room)
      ],
    );
  }

  /// 如果有顶部的一个功能组件，比如左侧的排行榜，和右侧的活动玩法等，让整体麦位向下移动26像素
  Widget _buildTopEntrance() {
    if (_room.showRankingList || _hasRightWidgets()) {
      return const SizedBox(height: 26);
    }

    return const SizedBox.shrink();
  }

  bool _hasRightWidgets() {
    bool result = (_room.roomWishGiftsData != null && _room.roomWishGiftsData!.show) ||
        ChatRoomUtil.isCanShowFansLabel(_room) ||
        GameListUtil.showRoomGameListLabel(_room) ||
        _room.isShowVisitantRank == true ||
        _room.showPrivateRoomEntry == true;
    Log.d('has right :$result');
    return result;
  }

  Widget _getRightWidgets() {
    List<Widget> children = [];

    /// 游戏玩法列表标签
    if (GameListUtil.showRoomGameListLabel(_room)) {
      children.add(GameListLabel(room: _room));
    }

    /// 贵宾榜
    if (_room.isShowVisitantRank == true) {
      children.add(Padding(
        padding: EdgeInsetsDirectional.only(start: children.isNotEmpty ? 4 : 0),
        child: VisitantLabel(room: _room),
      ));
    }

    /// 礼物心愿
    // if (_room.roomWishGiftsData != null) {
    //   children.add(Padding(
    //     padding: EdgeInsetsDirectional.only(start: children.isNotEmpty ? 4 : 0),
    //     child: WishGiftLabel(room: _room),
    //   ));
    // }

    /// 五星挑战
    // if (ChatRoomUtil.isCanShowFansLabel(_room)) {
    //   children.add(Padding(
    //     padding: EdgeInsetsDirectional.only(start: children.isNotEmpty ? 4 : 0),
    //     child: LiveFansLabel(room: _room),
    //   ));
    // }

    /// 情感小窝：我的飞船
    if (_room.showPrivateRoomEntry) {
      children.add(PrivateRoomMyShip(room: _room));
    }

    if (Util.isCollectionEmpty(children)) {
      return const SizedBox.shrink();
    }

    int max = (_room.showRankingList || ChatRoomUtil.isCanShowFansLabel(_room)) ? 2 : 3;

    /// 礼物心愿标签有可能显示空
    if (WishGiftLabel.notRealShow(_room)) {
      max++;
    }

    while (children.length > max) {
      children.removeAt(0);
    }

    List<Widget> row2 = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
        if (row2.isNotEmpty) const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: row2,
        ),
      ],
    );
  }

  /// 房间加载失败页面
  void _loadErrorCallback(String errorMsg) {
    if (!mounted) return;
    setState(() {
      _room.setErrorMsg(errorMsg);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_roomNullable != null && _roomNullable!.errorMsg != null) {
      if (_roomNullable!.requestPassword) {
        return _renderPassword();
      } else {
        return _renderError();
      }
    }
    return _renderBody(context);
  }

  void _onSettingClick() {
    onSettingClick(_room);
  }
}
