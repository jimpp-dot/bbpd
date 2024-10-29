import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift/k.dart';
import 'package:gift/slp_src/gift/ExpcardUseDialog.dart';
import 'package:gift/slp_src/gift/slp_intimate_pay_mixin.dart';
import 'package:gift/slp_src/gift/widget/slp_balance_widget.dart';
import 'package:gift/slp_src/gift_api.dart';
import 'package:gift/slp_src/gift_suit/gift_suit_reward_panel.dart';
import 'package:gift/slp_src/gift_suit/gift_suit_tips_widget.dart';
import 'package:gift/slp_src/graffiti_gift/graffiti_gift_top_bar.dart';
import 'package:gift/slp_src/util/gift_util.dart';
import 'package:gift/slp_src/widget/slp_gift_guess_gift_widget.dart';
import 'package:gift/slp_src/widget/slp_gift_naming_tips_widget.dart';
import 'package:gift/slp_src/widget/slp_gift_reward_widget.dart';
import 'package:gift/slp_src/widget/slp_gift_top_activity_tip.dart';
import 'package:gift/slp_src/widget/slp_gift_top_input_text.dart';
import 'package:gift/slp_src/widget/slp_random_box_top_tips.dart';
import 'package:gift/slp_src/widget/slp_random_box_widget.dart';
import 'package:gift/src/super_pack/super_pack_screen.dart';
import 'package:gift/src/widget/gift_skin_tips_widget.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart' hide Gift;

import '../../assets.dart';
import '../../src/recharge_packet_center/recharge_pack_center_screen.dart';
import '../model/pb/slp_gift_extension.dart';
import '../widget/slp_achievement_guide_widget.dart';
import '../widget/slp_gift_confess_widget.dart';
import '../widget/slp_gift_love_travel_tips_widget.dart';
import '../widget/slp_special_play_bar.dart';
import '../widget/slp_throne_top_tips.dart';
import 'slp_page_bag.dart';
import 'slp_page_decorate.dart';
import 'slp_page_gift.dart';
import 'slp_page_pk.dart';
import 'slp_page_shop.dart';

Color roomBackgroundColor = const Color(0xFF171621).withOpacity(0.7);

/// 礼物面板
class SlpGiftPanel extends StatefulWidget {
  final String? refer; // 打开来源
  final GiftScene giftScene;
  final int id; // chat: uid  room: 单人打赏的id, rid从room中取  order: oid
  final int? groupId;
  final int? initialPage;
  final ChatRoomData? room;
  final int? defaultId; // 初次展示默认选中礼物ID，不设置默认不用传参
  final bool fromChat;
  final SupportUseCoin supportUseCoin;
  final bool isCpLinkPromote; //连连看麦位助力打赏
  final bool toLovers; //给伴侣送礼
  final bool gameWishGift; //是否通过心愿调起礼物面板送礼
  final int topicId;
  final List<int>? mysteryPositions;

  /// 蒙面互动：蒙面GS麦位顺序
  final List<int>? debatePKUsers;

  /// DebatePK（情侣PK） 红蓝方标识
  final DisplayPage? defaultTab; //默认显示的tab页，推荐使用此参数、不用initialPage参数

  SlpGiftPanel({
    Key? key,
    required this.giftScene,
    this.id = 0,
    this.groupId = 0,
    this.initialPage = 0,
    this.room,
    this.defaultId = -1,
    this.fromChat = false,
    this.supportUseCoin = SupportUseCoin.BySession,
    this.isCpLinkPromote = false,
    this.toLovers = false,
    this.gameWishGift = false,
    this.topicId = 0,
    this.mysteryPositions,
    this.debatePKUsers,
    this.defaultTab,
    this.refer,
  })  : assert(() {
          if (isGiftSceneInRoom(giftScene) && room == null) {
            throw ArgumentError('ChatRoomData should not be null!');
          }
          return true;
        }()),
        super(key: key);

  static SlpGiftPanelState? of(BuildContext context) {
    return context.findAncestorStateOfType<SlpGiftPanelState>();
  }

  @override
  SlpGiftPanelState createState() {
    return SlpGiftPanelState();
  }
}

// 缓存礼物面板数据，避免每次展示loading
Map<String, dynamic> _cachedData = {};

/// 直播房Pk状态中多增加一个pk面板
const String _cacheKeyRoomLiveInPk = 'room_live_in_pk';

/// 生日房，生日房礼物都是较大金额的，需单独缓存
const String _cacheKeyRoomBirthday = 'room_birthday';

class SlpGiftPanelState extends State<SlpGiftPanel> with TickerProviderStateMixin<SlpGiftPanel> {
  DisplayPage _displayPage = DisplayPage.gift;

  BbGiftPanelData? _data;

  GlobalKey _giftGlobalKey = GlobalKey();
  TabController? _tabController;
  final List<GiftTabConfig> _defaultTabs = <GiftTabConfig>[
    GiftTabConfig(name: K.gift, type: DisplayPage.gift),
    // GiftTabConfig(name: K.gift_privilege, type: DisplayPage.privilege),
    // GiftTabConfig(name: K.gift_decorate, type: DisplayPage.decorate),
    GiftTabConfig(name: K.gift_bag, type: DisplayPage.bag),
    GiftTabConfig(name: K.gift_shop, type: DisplayPage.shop),
  ];

  List<GiftTabConfig>? _tabs;

  int _selectTabIndex = 0;

  // room 相关
  List<RoomPosition>? _users; // 所有的麦上用户
  final Map<int, bool> _checked = {}; // 麦上用户是否被选中打赏
  final List<int> _positions = []; // 被打赏人的麦序
  List<int> _uids = []; // 被打赏人的uid
  bool _selectAllUsers = false; //所有麦上用户都被选中打赏
  bool _selectAllUsersForGPKRed = false; // 团战PK红队全麦打赏
  bool _selectAllUsersForGPKBlue = false; // 团战PK蓝队全麦打赏
  BbGiftPanelGift? _selectGift;
  final Map<int, BbGiftPanelSpecialPlayItem> _specialPlayItemMap = {};
  int _selectGiftNum = 1; // 打赏礼物数量

  bool _bagPageShowMicUsers = false; // 背包界面是否展示麦上用户列表，用以赠送礼物

  final Map<DisplayPage, GlobalKey<SlpPageGiftState>> _keys = {};

  final GlobalKey<SlpGiftTopInputTextState> _topInputKey = GlobalKey<SlpGiftTopInputTextState>();

  int get _defaultId => widget.defaultId ?? 0;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener("Session.Changed", _onSessionChange);
    eventCenter.addListener(EventConstant.EventUserMoneyChange, _onMoneyChange);
    SlpGiftTopInputTextState.lastText = '';
    _keys[DisplayPage.pubDrink] = GlobalKey<SlpPageGiftState>();
    _keys[DisplayPage.gift] = GlobalKey<SlpPageGiftState>();
    _keys[DisplayPage.privilege] = GlobalKey<SlpPageGiftState>();
    _keys[DisplayPage.interact] = GlobalKey<SlpPageGiftState>();
    _keys[DisplayPage.special_play] = GlobalKey<SlpPageGiftState>();
    _keys[DisplayPage.tower] = GlobalKey<SlpPageGiftState>();

    WidgetsBinding.instance.addPostFrameCallback((duration) {
      if (Session.firstPay == 0) {
        IGiftManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

        /// 没有展示过，才展示
        // if (!manager.superPackDialogShowed()) {
        //   manager.showSuperPackDialog(context);
        // }
      }
    });

    Session.sync({'lucky': true});
    _getCache();
    _initUsers();
    _load(firstLoadData: true);
  }

  @override
  void dispose() {
    _disposeTabController();
    eventCenter.removeListener("Session.Changed", _onSessionChange);
    eventCenter.removeListener(EventConstant.EventUserMoneyChange, _onMoneyChange);
    if (Get.isRegistered<SlpIntimatePayController>()) {
      SlpIntimatePayController payController = Get.find<SlpIntimatePayController>();
      payController.resetIntimatePay();
    }
    super.dispose();
  }

  void _disposeTabController() {
    if (_tabController != null) {
      _tabController!.removeListener(_onTabChanged);
      _tabController!.dispose();
      _tabController = null;
    }
  }

  void _initTab({bool firstLoadData = false}) {
    List<GiftTabConfig> newTabs;
    if (_data?.tabConfig != null && _data?.tabConfig.isNotEmpty == true) {
      newTabs = _data!.tabConfig.map((e) => e.toGiftTabConfig).toList();
    } else {
      if (widget.toLovers) {
        newTabs = [_defaultTabs[0]];
      } else {
        newTabs = _defaultTabs;
      }
    }
    bool firstInit = null == _tabs;

    _tabs = newTabs;
    bool tabChanged = true;
    if (firstInit || firstLoadData) {
      if (widget.defaultTab != null) {
        _displayPage = widget.defaultTab!;
      } else {
        int defaultIndex = widget.initialPage ?? 0;
        if (Util.validList(_tabs) && _tabs?[0].type == DisplayPage.interact) {
          if (defaultIndex > 0 || _defaultId > 0) {
            defaultIndex++;
          } else {
            defaultIndex = _data?.extend.tabIndex ?? 0;
          }
        }
        _displayPage = _getDisplayPage(defaultIndex);
      }

      if ((widget.room?.showCrossPK ?? 0) == 2) {
        /// laya塔防
        _displayPage = DisplayPage.tower;
      }

      _selectTabIndex = _getPageIndex(_displayPage);
    }
    if (!firstInit) {
      ListEquality leq = const ListEquality();
      tabChanged = leq.equals(_tabs, newTabs);
    }

    if (tabChanged && mounted) {
      _disposeTabController();
      safeRun(() {
        _removeTabs();
        _tabController = TabController(initialIndex: _selectTabIndex, length: (_tabs?.length ?? 0), vsync: this);
        _tabController!.addListener(_onTabChanged);
      });
    }
  }

  _removeTabs() {
    // _tabs?.removeWhere((e) => e.type == DisplayPage.privilege);
    _tabs?.removeWhere((e) => e.type == DisplayPage.shop);
    _tabs?.removeWhere((e) => e.type == DisplayPage.decorate);
    _tabs?.removeWhere((e) => e.type == DisplayPage.pk);
    _tabs?.removeWhere((e) => e.type == DisplayPage.pubDrink);
    _tabs?.removeWhere((e) => e.type == DisplayPage.luckyGift);
    _tabs?.removeWhere((e) => e.type == DisplayPage.interact);
    _tabs?.removeWhere((e) => e.type == DisplayPage.special_play);
    _tabs?.removeWhere((e) => e.type == DisplayPage.relationship);
    _tabs?.removeWhere((e) => e.type == DisplayPage.tower);
  }

  _onTabChanged() {
    if (_tabController?.indexIsChanging == true) return;
    _selectTabIndex = _tabController!.index;

    _displayPage = _getDisplayPage(_selectTabIndex);
    GlobalKey<SlpPageGiftState>? key = _keys[_displayPage];
    if (key != null && key.currentState != null) {
      _selectGift = key.currentState!.getSelectGift();
    } else {
      _selectGift = null;
    }
    String pageName = '';
    if (_displayPage == DisplayPage.gift) {
      pageName = 'gift_tab';
    } else if (_displayPage == DisplayPage.bag) {
      pageName = 'backpack';
    } else if (_displayPage == DisplayPage.decorate) {
      pageName = 'decorate';
    } else if (_displayPage == DisplayPage.privilege) {
      pageName = 'privilege';
    } else if (_displayPage == DisplayPage.shop) {
      pageName = 'shop';
    } else if (_displayPage == DisplayPage.pk) {
      pageName = 'pk';
    } else if (_displayPage == DisplayPage.pubDrink) {
      pageName = 'pub_drink';
    } else if (_displayPage == DisplayPage.interact) {
      pageName = 'interact';
    } else if (_displayPage == DisplayPage.special_play) {
      pageName = 'special_play';
    } else if (_displayPage == DisplayPage.tower) {
      pageName = 'tower';
    }
    Tracker.instance.track(TrackEvent.room_gift_control, properties: {
      'room_gift_click': pageName,
      'rid': widget.room?.rid ?? 0,
    });
    if (mounted) setState(() {});
  }

  _initUsers() {
    if (_isInRoom) {
      // _users
      IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      _users = giftManager.getGiftUsers(widget.room, mysteryPositions: widget.mysteryPositions) as List<RoomPosition>;

      // _checked
      if (widget.id > 0) {
        _checked[widget.id] = true;
      } else {
        bool defaultValue = true;
        if (_users?.isNotEmpty == true) {
          for (RoomPosition roomPosition in _users!) {
            // 直播：默认只勾选主播
            // 其他：全选
            bool isTalent = ChatRoomUtil.isLiveTalent(widget.room?.config);
            if (!isTalent &&
                widget.room?.config?.types == RoomTypes.Live &&
                roomPosition.uid > 0 &&
                roomPosition.uid == widget.room?.createor?.uid) {
              _checked[roomPosition.uid] = defaultValue;
              break;
            } else {
              if (roomPosition.uid > 0) {
                _checked[roomPosition.uid] = defaultValue;
              }
            }
          }
        }
      }
      _refreshSelectedUsers();
    }
  }

  _refreshSelectedUsers() {
    _uids.clear();
    _selectAllUsers = true;
    _checked.forEach((int uid, bool ok) {
      if (ok) {
        _uids.add(uid);
      } else {
        _selectAllUsers = false;
      }
    });

    // 团战pk全麦flag更新
    if (widget.room?.gpkEnable == true && widget.room?.config?.gpkRoomPkData != null) {
      _selectAllUsersForGPKRed = true;
      _selectAllUsersForGPKBlue = true;
      if (widget.room?.config?.gpkRoomPkData?.leftSide?.list.isNotEmpty == true) {
        for (var i in widget.room!.config!.gpkRoomPkData!.leftSide!.list) {
          if (!_checked.containsKey(i.uid) || (_checked.containsKey(i.uid) && _checked[i.uid] != true)) {
            _selectAllUsersForGPKRed = false;
            break;
          }
        }
      }
      if (widget.room?.config?.gpkRoomPkData?.rightSide?.list.isNotEmpty == true) {
        for (var i in widget.room!.config!.gpkRoomPkData!.rightSide!.list) {
          if (!_checked.containsKey(i.uid) || (_checked.containsKey(i.uid) && _checked[i.uid] != true)) {
            _selectAllUsersForGPKBlue = false;
            break;
          }
        }
      }
    }

    // _positions
    _positions.clear();
    _users?.forEach((RoomPosition p) {
      if (_checked.containsKey(p.uid) && (_checked[p.uid] ?? false)) {
        _positions.add(p.position);
      }
    });

    if (mounted && selectThroneGift) {
      setState(() {});
    }
  }

  DisplayPage _getDisplayPage(int pageIndex) {
    if (pageIndex >= 0 && _tabs?.isNotEmpty == true && pageIndex < _tabs!.length) {
      return _tabs![pageIndex].type!;
    }
    return _defaultTabs[0].type!;
  }

  int _getPageIndex(DisplayPage displayPage) {
    int index = _tabs?.indexWhere((element) => element.type == displayPage) ?? 0;
    if (index == -1) {
      index = 0;
    }
    return index;
  }

  _getCache() {
    String key = _getCacheKey();
    Uint8List? res = _cachedData.containsKey(key) ? _cachedData[key] : null;
    if (res != null) {
      _parseData(res);
      _initTab();
    }
  }

  _saveCache(Uint8List data) {
    _cachedData[_getCacheKey()] = data;
  }

  String _getCacheKey() {
    if (_isRoomLiveInPk) {
      return _cacheKeyRoomLiveInPk;
    } else if (_isRoomBirthday) {
      return _cacheKeyRoomBirthday;
    } else {
      return describeEnum(widget.giftScene) + ((_isInRoom && (widget.room?.isBusiness ?? false)) ? 'business' : '');
    }
  }

  _onSessionChange(String type, dynamic field) {
    String key = field;
    if (key == '_money') {
      _load();
    }

    //刷新 首充礼包是否显示
    if (key == 'first_pay') {
      if (mounted) {
        setState(() {});
      }
    }
  }

  _onMoneyChange(String type, dynamic field) {
    _load();
  }

  /// 选中礼物事件
  _onGiftTaped(BbGiftPanelGift gift) {
    _selectGift = gift;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _buildGiftPanel();
  }

  Widget _buildGiftPanel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!_isDataInvalid()) ...[
          _buildMostTopTips(),
          _buildTopTips(),
          if (_showMicUsers) _buildMicUsers(),
        ],
        // Transform(
        //   transform: Matrix4.translationValues(0, -8.0, 0.0),
        //   child: Container(
        //     height: 1,
        //     color: Colors.black,
        //   ),
        // ),
        SizedBox(
          height: _getGiftPanelHeight(),
          // decoration: BoxDecoration(
          //   color: !widget.fromChat
          //       ? const Color(0xFF171621).withOpacity(0.7)
          //       : (darkMode ? const Color(0xFF171621) : R.color.mainBgColor),
          //   borderRadius: const BorderRadiusDirectional.only(
          //     topStart: Radius.circular(16),
          //     topEnd: Radius.circular(16),
          //   ),
          // ),
          child: _buildBody(),
        ),
      ],
    );
  }

  bool get _isInRoom {
    return isGiftSceneInRoom(widget.giftScene) && (widget.room?.rid ?? 0) > 0;
  }

  /// 选中麦上宝座礼物
  bool get selectThroneGift {
    return Util.validStr(_selectGift?.jumpPage) &&
        Util.validList(_selectGift?.specialPlayItems) &&
        _selectGift?.specialPlayItems[0].type == 'throne';
  }

  bool get _showMicUsers {
    DisplayPage page = _getDisplayPage(_selectTabIndex);
    return needShowMicUserPage(page) ||
        (page == DisplayPage.bag && _bagPageShowMicUsers) ||
        // 如果礼物面板在互动Tab，并且不是组合礼物，则显示麦上用户
        (page == DisplayPage.interact && !Util.parseBool(_selectGift?.hasCombineGift()));
  }

  /// 礼物面板顶部是否显示成就引导条
  bool get _showAchieveTips => Util.validStr(_data?.banner.achieveTips);

  /// 动态计算礼物面板的高度
  double _getGiftPanelHeight() {
    double height = 336 * Util.ratio;
    if (widget.giftScene == GiftScene.auction) {
      height += 44;
    }

    /// 礼物冠名奖励横幅
    if (_selectGift != null && (_selectGift!.isChangeColor || _selectGift!.isChangeVoice)) {
      height += 76;
    }

    height += Util.iphoneXBottom;
    return height;
  }

  Widget _buildMostTopTips() {
    /// 礼物冠名奖励横幅
    if (_selectGift != null && _selectGift!.weekNaming.userIcon.isNotEmpty) {
      return SlpGiftRewardWidget(weekStar: _selectGift!.weekNaming);
    }
    if (_showAchieveTips) {
      /// 解锁新成就引导
      return SlpAchievementGuideWidget(tips: _data?.banner.achieveTips ?? '');
    }
    return const SizedBox.shrink();
  }

  Widget _buildTopTips() {
    if (_selectGift != null) {
      var boxInfo = GiftUtil.getSelectBoxInfo(_data?.outstandingBox.boxInfo, _selectGift!.id);

      /// 随机礼盒单独的礼物顶部提示栏
      if (boxInfo != null) {
        return SlpRandomBoxTopTips(
          boxInfo: boxInfo,
          icons: GiftUtil.getBoxGiftIcons(boxInfo.loopGifts, boxInfo.boxId),
          rankUrl: _data?.outstandingBox.rankingList,
          onButtonTap: () async {
            /// 跳转二级页
            IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
            bool? send = await SlpRandomBoxWidget.show(
              context,
              giftScene: widget.giftScene,
              gift: _selectGift!,
              totalMoney: _data?.extend.totalMoney ?? 0,
              inMicUids:
                  _isInRoom ? giftManager.getGiftUsers(widget.room, mysteryPositions: widget.mysteryPositions) as List<RoomPosition> : [],
              chooseNumConfig: _data?.chooseBoxNumConfig ?? [],
              rid: _isInRoom ? widget.room!.rid : 0,
              refer: _isInRoom ? widget.room!.refer : '',
              id: Util.parseInt(widget.id),
              isRisk: false,
              room: widget.room,
              fromChat: widget.fromChat,
              showIntimate: _data?.showIntimate == true && _isInRoom,
            );

            if (Util.parseBool(send) && (ModalRoute.of(context)?.isCurrent ?? false)) {
              Navigator.of(context).pop(true);
            }
          },
        );
      }
    }

    if (_selectGift != null && _selectGift!.showGiftSkin && !widget.toLovers) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 4),
        child: wrapBlurBg(
          GiftSkinTipsWidget(
            icon: _selectGift!.skin.icon,
            tips: _selectGift!.skin.tips,
            inRoom: _isInRoom,
            current: _selectGift!.skin.skinCurrent,
            total: _selectGift!.skin.skinTotal,
          ),
          radius: BorderRadius.circular(12),
        ),
      );
    }

    if (_selectGift != null && _selectGift!.showTips && _showMicUsers) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 8.0),
        child: VipTopTips(
          isTitle: _selectGift!.isTitleGift,
          isVip: _selectGift!.isVipGift,
          isKa: _selectGift!.isKaGift,
          jumpPage: _selectGift!.jumpPage,
          jumpPath: _selectGift!.privilege.jumpScheme,
          icon: _selectGift!.privilegeIcon,
          tips: _selectGift!.privilege.description.isNotEmpty ? _selectGift!.privilege.description : _selectGift!.description,
          isInRoom: _isInRoom,
          rid: _isInRoom ? widget.room!.rid : null,
          btnName: _selectGift!.privilege.jumpTips,
          isKnightGift: _selectGift!.isKnightGift,
          ownerIcon: _selectGift!.privilege.ownerIcon,
          ownerUid: _selectGift!.privilege.ownerUid,
        ),
      );
    }

    if (_selectGift?.giftSuit.titleContent.isNotEmpty == true) {
      return GiftSuitTipsWidget(
        key: ValueKey(_selectGift!.id),
        gift: _selectGift!,
        onTap: () async {
          IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
          bool? send = await GiftSuitRewardPanel.show(
            context,
            giftScene: widget.giftScene,
            gift: _selectGift!,
            totalMoney: _data?.extend.totalMoney ?? 0,
            inMicUids:
                _isInRoom ? giftManager.getGiftUsers(widget.room, mysteryPositions: widget.mysteryPositions) as List<RoomPosition> : [],
            chooseNumConfig: _data?.chooseNumConfig ?? [],
            rid: _isInRoom ? widget.room!.rid : 0,
            refer: _isInRoom ? widget.room!.refer : '',
            id: Util.parseInt(widget.id),
            room: widget.room,
            fromChat: widget.fromChat,
            page: _displayPage,
            showIntimate: _data?.showIntimate == true && _isInRoom,
          );
          if (send == true && (ModalRoute.of(context)?.isCurrent ?? false)) {
            Navigator.of(context).pop(true);
          }
        },
      );
    }

    /// 爱的旅行机票顶部提示条
    if (!Util.isCollectionEmpty(_selectGift?.specialPlayItems) &&
        Util.validStr(_selectGift?.description) &&
        _selectGift?.specialPlayItems.first.type == 'travel') {
      BbGiftPanelSpecialPlayItem? specialPlayItem = _selectGift?.specialPlayItems.first;
      if (Util.validStr(specialPlayItem?.description)) {
        return SlpGiftLoveTravelTipsWidget(
          tips: specialPlayItem?.description ?? '',
          icon: specialPlayItem?.giftIcon ?? '',
          jumpPage: specialPlayItem?.jumpPage ?? '',
        );
      }
    }

    /// 通用玩法顶部提示条
    if (!Util.isCollectionEmpty(_selectGift?.specialPlayItems) && Util.validStr(_selectGift?.description)) {
      return SpecialPlayTopTips(
        tips: _selectGift?.description ?? '',
        icon: selectGiftIconWithSuffix,
      );
    }

    if (_selectGift != null && _selectGift!.showDesc) {
      List<String> icons = _selectGift!.icons;
      return Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 8.0),
        child: TopDescribeTips(
          jumpPage: _selectGift!.jumpPage,
          icons: icons,
          tips: _selectGift!.description,
          showAppleDisclaimer: _isLuckyEgg(_selectGift!.id),
        ),
      );
    }

    if (_showInputBlessWords()) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 8.0),
        child: SlpGiftTopInputText(key: _topInputKey, text: widget.room?.config?.blessWords ?? ''),
      );
    }

    if (_selectGift != null && _selectGift!.category == 'graffiti' && _isInRoom) {
      // 涂鸦礼物
      return GraffitiGiftTopBar(icon: _selectGift!.activityBanner.icon, room: widget.room!, uid: widget.id);
    }

    /// 通用礼物提示 一张图片
    if (_selectGift != null && _selectGift!.hasActivityBanner()) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 8, start: 8, end: 8),
        child: SlpGiftTopActivityTip(_selectGift!.activityBanner, width: Util.width - 8 * 2),
      );
    }

    /// 开启CP之旅浮层
    if (Util.validStr(_selectGift?.description) && Util.validStr(_selectGift?.jumpPage) && _selectGift?.category == 'ad') {
      return SlpGiftConfessWidget(
          tips: _selectGift?.description ?? '', icon: selectGiftIconWithSuffix, jumpPage: _selectGift?.jumpPage ?? '');
    }

    /// 礼物猜猜乐
    if (Util.validStr(_selectGift?.description) && Util.validStr(_selectGift?.jumpPage) && _selectGift?.category == 'guess_gift') {
      return SlpGiftGuessGiftWidget(
          title: _selectGift?.name ?? '',
          tips: _selectGift?.description ?? '',
          icon: selectGiftIconWithSuffix,
          jumpPage: _selectGift?.jumpPage ?? '');
    }

    /// 麦上宝座礼物tips
    if (selectThroneGift) {
      return SlpThroneTopTips(
        giftId: _selectGift?.id ?? 0,
        giftIcon: selectGiftIconWithSuffix,
        selectUids: _uids,
        jumpPage: _selectGift?.jumpPage ?? '',
      );
    }

    /// 高光之星礼物tips
    if (_selectGift != null && _selectGift!.gloryBanner.description.isNotEmpty) {
      return SlpGiftNamingTipsWidget(data: _selectGift!.gloryBanner, room: widget.room);
    }

    Log.d(
        '_selectGift:${_selectGift == null},_data?.exclusive.giftId:${_data?.exclusive.giftId},_data?.exclusive.next.uid:${_data?.exclusive.next.uid}');

    /// 房间专属礼物浮层 -> 此层优先级最低
    // if (_selectGift != null && (_data?.exclusive.giftId ?? 0) > 0 &&
    //     (_data?.exclusive.next.uid ?? 0) > 0) {
    //   return SlpGiftExclusiveWidget(data: _data?.exclusive, room: widget.room);
    // }

    return const SizedBox();
  }

  /// 判断某个礼物是否为幸运蛋（钻石玩法）
  bool _isLuckyEgg(int giftId) {
    if (Util.parseInt(_data?.luckEgg.giftId) <= 0) {
      return false;
    }

    return Util.parseInt(_data?.luckEgg.giftId) == giftId;
  }

  String get selectGiftIconWithSuffix {
    if (_selectGift == null) {
      return '';
    }
    return _selectGift!.giftIcon + Util.getGiftUrlSuffix();
  }

  bool _showInputBlessWords() =>
      _isInRoom && (widget.room?.isBusinessBirthday ?? false) && _selectGift != null && (_selectGift?.price ?? 0) * _selectGiftNum >= 52000;

  /// 房间内打赏的用户列表
  Widget _buildMicUsers() {
    if (ChatRoomUtil.isUidOnPosition(widget.id) || widget.room?.createor?.uid == widget.id) {
      //礼物图鉴：用户不在麦位上，不展示麦位信息
      if (_users == null || (_users?.isEmpty == true)) {
        return const SizedBox.shrink();
      }
      // 礼物图鉴：用户在麦位上，需要排到首位
      for (RoomPosition position in _users!) {
        if (position.uid == widget.id && _users![0].uid != widget.id) {
          // 是第一个就不用排序了
          _users!.remove(position);
          _users!.insert(0, position);
        }
      }
    } else {
      if (!_isInRoom || widget.room == null || _users == null || (_users?.isEmpty == true) || (widget.id > 0) /*单人打赏*/) {
        return Container();
      }
    }
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
        // child: wrapBlurBg(
        //   Container(
        //     height: 60,
        //     width: Util.width - 16,
        //     alignment: AlignmentDirectional.centerStart,
        //     padding: const EdgeInsets.symmetric(horizontal: 10),
        //     decoration: BoxDecoration(
        //       color: const Color(0xFF171621).withOpacity(0.7),
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //     child: Row(
        //       children: <Widget>[
        //         // 团战pk有两个全麦选项
        //         if (widget.room?.gpkEnable == true) ...[
        //           Text(
        //             K.gift_send,
        //             style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13),
        //           ),
        //           const SizedBox(width: 6),
        //           _renderSelectAllForGPKRed(),
        //           _renderSelectAllForGPKBlue(),
        //           Expanded(
        //             child: SizedBox(
        //               height: 38,
        //               child: ListView.builder(
        //                 scrollDirection: Axis.horizontal,
        //                 itemCount: _users?.length ?? 0,
        //                 shrinkWrap: true,
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return _buildMicAvatar(index);
        //                 },
        //               ),
        //             ),
        //           ),
        //         ] else ...[
        //           Text(
        //             K.gift_send,
        //             style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13),
        //           ),
        //           const SizedBox(width: 6),
        //           Expanded(
        //             child: SizedBox(
        //               height: 38,
        //               child: ListView.builder(
        //                 scrollDirection: Axis.horizontal,
        //                 itemCount: _users?.length ?? 0,
        //                 shrinkWrap: true,
        //                 itemBuilder: (BuildContext context, int index) {
        //                   return _buildMicAvatar(index);
        //                 },
        //               ),
        //             ),
        //           ),
        //           const SizedBox(width: 12),
        //           _renderSelectAll(),
        //         ],
        //       ],
        //     ),
        //   ),
        //   radius: BorderRadius.circular(12),
        // ),
        child: Container(
          height: 60,
          width: Util.width - 16,
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // decoration: BoxDecoration(
          //   color: const Color(0xFF171621).withOpacity(0.7),
          //   borderRadius: BorderRadius.circular(12),
          // ),
          child: Row(
            children: <Widget>[
              // 团战pk有两个全麦选项
              if (widget.room?.gpkEnable == true) ...[
                Text(
                  K.gift_send,
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13),
                ),
                const SizedBox(width: 6),
                _renderSelectAllForGPKRed(),
                _renderSelectAllForGPKBlue(),
                Expanded(
                  child: SizedBox(
                    height: 38,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _users?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildMicAvatar(index);
                      },
                    ),
                  ),
                ),
              ] else ...[
                Text(
                  K.gift_send,
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: SizedBox(
                    height: 38,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _users?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildMicAvatar(index);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                _renderSelectAll(),
              ],
            ],
          ),
        ));
  }

  Widget _buildMicAvatar(int index) {
    RoomPosition? user = _users?.elementAt(index);
    String image = user?.icon ?? '';

    //标准八麦房主显示房间封面
    if ((widget.room?.isEightPosition ?? false) &&
        (widget.room?.createor?.uid == user?.uid) &&
        widget.room?.config?.icon != null &&
        widget.room!.config!.icon.isNotEmpty) {
      image = widget.room!.config!.icon;
    }

    bool showDebatePK = false;
    List<Color> pkBgColors = [];
    if (!Util.isCollectionEmpty(widget.debatePKUsers) && widget.debatePKUsers?.length == 2) {
      if (widget.debatePKUsers![0] > 0 && widget.debatePKUsers![0] == user?.uid) {
        showDebatePK = true;
        pkBgColors = [const Color(0xFF9068FE), const Color(0xFFFF6CE1)];
      }
      if (widget.debatePKUsers![1] > 0 && widget.debatePKUsers![1] == user?.uid) {
        showDebatePK = true;
        pkBgColors = [const Color(0xFF60C8FF), const Color(0xFF79E2FF)];
      }
    }

    bool? selected = _checked.containsKey(user?.uid) ? _checked[user?.uid] : false;
    return GestureDetector(
      onTap: () {
        Tracker.instance.track(TrackEvent.room_gift_control, properties: {
          'room_gift_click': 'mic_user',
          'rid': widget.room?.rid ?? 0,
        });
        setState(() {
          if (user?.uid != null) {
            if (_checked.containsKey(user!.uid)) {
              _checked[user.uid] = !(_checked[user.uid]!);
            } else {
              _checked[user.uid] = true;
            }
          }
          _refreshSelectedUsers();
        });
      },
      child: Container(
        height: 38,
        width: 32,
        margin: const EdgeInsetsDirectional.only(start: 6.0, end: 6.0),
        alignment: AlignmentDirectional.center,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(color: (selected ?? false) ? R.color.mainBrandColor : Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: CommonAvatar(
                key: ValueKey(image),
                size: 32,
                path: image,
                shape: BoxShape.circle,
                suffix: image.contains('ic_mystery.png') ? '' : '!head150',
              ),
            ),
            PositionedDirectional(
              end: -2,
              top: -2,
              child: IgnorePointer(
                child: (selected ?? false) ? _buildSelectMic() : null,
              ),
            ),
            if (_showHeartLabel(user?.uid ?? 0))
              PositionedDirectional(
                bottom: -2,
                child: _buildHeartLabel(),
              ),
            if (showDebatePK)
              PositionedDirectional(
                bottom: -2,
                child: _buildDebatePKLabel(pkBgColors),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectMic() {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: R.color.mainBrandGradientColors,
        ),
        shape: BoxShape.circle,
      ),
      alignment: AlignmentDirectional.center,
      child: R.img(
        Assets.ic_mic_select_svg,
        package: ComponentManager.MANAGER_GIFT,
        width: 14,
        height: 14,
        color: Colors.black,
      ),
    );
  }

  _changeAllUserSelect(bool select) {
    _checked.updateAll((key, value) => select);
    _refreshSelectedUsers();
  }

  Widget _renderSelectAll() {
    return GestureDetector(
      onTap: () {
        Tracker.instance.track(TrackEvent.room_gift_control, properties: {
          'room_gift_click': 'mic_all',
          'rid': widget.room?.rid ?? 0,
        });
        setState(() {
          _changeAllUserSelect(!_selectAllUsers);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // gradient: _selectAllUsers ? null : LinearGradient(colors: R.color.mainBrandGradientColors),
          color: _selectAllUsers ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.2),
        ),
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        alignment: AlignmentDirectional.center,
        child: Text(
          _selectAllUsers ? K.gift_cancel_all : K.gift_all_mic,
          style: TextStyle(fontSize: 13, color: _selectAllUsers ? Colors.white : const Color(0xffD4FF68)),
        ),
      ),
    );
  }

  /// 团战PK红队全麦打赏
  Widget _renderSelectAllForGPKRed() {
    return GestureDetector(
      onTap: () {
        Tracker.instance.track(TrackEvent.room_gift_control, properties: {
          'room_gift_click': 'mic_all',
          'rid': widget.room?.rid ?? 0,
        });
        setState(() {
          if (_selectAllUsersForGPKRed) {
            widget.room?.config?.gpkRoomPkData?.leftSide?.list.forEach((e) {
              if (_checked.containsKey(e.uid)) {
                _checked[e.uid] = false;
              }
            });
          } else {
            widget.room?.config?.gpkRoomPkData?.leftSide?.list.forEach((e) {
              if (_checked.containsKey(e.uid)) {
                _checked[e.uid] = true;
              }
            });
          }
          _refreshSelectedUsers();
        });
      },
      child: Container(
        height: 38,
        width: 32,
        margin: const EdgeInsetsDirectional.only(start: 6.0, end: 6.0),
        alignment: AlignmentDirectional.center,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(color: _selectAllUsersForGPKRed ? R.color.mainBrandColor : Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFF03030),
              ),
              alignment: Alignment.center,
              child: Text(
                _selectAllUsersForGPKRed ? K.gift_cancel_all : K.gift_all_mic,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            PositionedDirectional(
              end: -2,
              top: -2,
              child: IgnorePointer(
                child: _selectAllUsersForGPKRed ? _buildSelectMic() : null,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 团战PK蓝队全麦打赏
  Widget _renderSelectAllForGPKBlue() {
    return GestureDetector(
      onTap: () {
        Tracker.instance.track(TrackEvent.room_gift_control, properties: {
          'room_gift_click': 'mic_all',
          'rid': widget.room?.rid ?? 0,
        });
        setState(() {
          if (_selectAllUsersForGPKBlue) {
            widget.room?.config?.gpkRoomPkData?.rightSide?.list.forEach((e) {
              if (_checked.containsKey(e.uid)) {
                _checked[e.uid] = false;
              }
            });
          } else {
            widget.room?.config?.gpkRoomPkData?.rightSide?.list.forEach((e) {
              if (_checked.containsKey(e.uid)) {
                _checked[e.uid] = true;
              }
            });
          }
          _refreshSelectedUsers();
        });
      },
      child: Container(
        height: 38,
        width: 32,
        margin: const EdgeInsetsDirectional.only(start: 6.0, end: 6.0),
        alignment: AlignmentDirectional.center,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(color: _selectAllUsersForGPKBlue ? R.color.mainBrandColor : Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFF1F5BD4),
              ),
              alignment: Alignment.center,
              child: Text(
                _selectAllUsersForGPKBlue ? K.gift_cancel_all : K.gift_all_mic,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            PositionedDirectional(
              end: -2,
              top: -2,
              child: IgnorePointer(
                child: _selectAllUsersForGPKBlue ? _buildSelectMic() : null,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitleBar() {
    return SizedBox(
      height: 44,
      width: Util.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            K.gift_join_the_auction,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          PositionedDirectional(
            end: 16,
            child: Text.rich(TextSpan(children: <InlineSpan>[
              TextSpan(text: K.gift_has_send, style: const TextStyle(color: Color(0xB2FFFFFF), fontSize: 14)),
              TextSpan(
                  text: MoneyConfig.moneyNum(_data?.extend.auctionMoney ?? 0),
                  style: const TextStyle(color: Color(0xFFFDA252), fontSize: 14)),
              TextSpan(text: MoneyConfig.moneyName1, style: const TextStyle(color: Color(0xB2FFFFFF), fontSize: 14)),
            ])),
          )
        ],
      ),
    );
  }

  Widget _buildTabItem(GiftTabConfig tabConfig) {
    return Tab(
      text: tabConfig.name ?? '',
    );
  }

  Widget _buildPage(DisplayPage? page) {
    if (page == DisplayPage.interact) {
      return SlpPageGift(
        key: _keys[page],
        giftScene: widget.giftScene,
        page: page,
        id: widget.id,
        groupId: widget.groupId,
        data: _data,
        gifts: _data?.interactGift ?? [],
        room: widget.room,
        defaultId: _defaultId,
        fromChat: widget.fromChat,
        gameWishGift: widget.gameWishGift,
        toLovers: widget.toLovers,
        getSelectUids: () {
          return _uids;
        },
        onGiftTaped: _onGiftTaped,
        isCpLinkPromote: widget.isCpLinkPromote,
        firstShow: true,
        refreshCallback: refresh,
        queryBlessWords: _queryBlessWords,
        onGiftNumChanged: _onGiftNumChanged,
        mysteryPositions: widget.mysteryPositions,
        refer: widget.refer ?? '',
      );
    } else if (page == DisplayPage.special_play) {
      return SlpPageGift(
        key: _keys[page],
        giftScene: widget.giftScene,
        id: widget.id,
        groupId: widget.groupId,
        data: _data,
        gifts: _data?.specialPlays ?? [],
        room: widget.room,
        defaultId: _defaultId,
        fromChat: widget.fromChat,
        gameWishGift: widget.gameWishGift,
        toLovers: widget.toLovers,
        getSelectUids: () {
          return _uids;
        },
        onGiftTaped: _onGiftTaped,
        isCpLinkPromote: widget.isCpLinkPromote,
        firstShow: true,
        refreshCallback: refresh,
        queryBlessWords: _queryBlessWords,
        onGiftNumChanged: _onGiftNumChanged,
        topicId: widget.topicId,
        specialPlayItemMap: _specialPlayItemMap,
        mysteryPositions: widget.mysteryPositions,
        refer: widget.refer ?? '',
        page: page,
      );
    } else if (page == DisplayPage.gift) {
      return SlpPageGift(
        key: _keys[page],
        giftScene: widget.giftScene,
        id: widget.id,
        groupId: widget.groupId,
        data: _data,
        height: _getGiftPanelHeight(),
        gifts: _data?.gift ?? [],
        room: widget.room,
        defaultId: _defaultId,
        fromChat: widget.fromChat,
        gameWishGift: widget.gameWishGift,
        toLovers: widget.toLovers,
        getSelectUids: () {
          return _uids;
        },
        onGiftTaped: _onGiftTaped,
        isCpLinkPromote: widget.isCpLinkPromote,
        firstShow: true,
        refreshCallback: refresh,
        queryBlessWords: _queryBlessWords,
        onGiftNumChanged: _onGiftNumChanged,
        topicId: widget.topicId,
        mysteryPositions: widget.mysteryPositions,
        refer: widget.refer ?? '',
        page: page,
      );
    } else if (page == DisplayPage.privilege) {
      return SlpPageGift(
        key: _keys[page],
        page: page,
        giftScene: widget.giftScene,
        id: widget.id,
        groupId: widget.groupId,
        data: _data,
        gifts: _data?.privilegeGift ?? [],
        room: widget.room,
        defaultId: _defaultId,
        fromChat: widget.fromChat,
        isPrivilege: true,
        getSelectUids: () {
          return _uids;
        },
        onGiftTaped: _onGiftTaped,
        isCpLinkPromote: widget.isCpLinkPromote,
        refreshCallback: refresh,
        queryBlessWords: _queryBlessWords,
        onGiftNumChanged: _onGiftNumChanged,
        topicId: widget.topicId,
        mysteryPositions: widget.mysteryPositions,
        refer: widget.refer ?? '',
      );
    } else if (page == DisplayPage.decorate) {
      return SlpPageDecorate(
        giftScene: widget.giftScene,
        data: _data,
        list: _data?.decorates,
        id: widget.id,
        room: widget.room,
        fromChat: widget.fromChat,
        getSelectUids: () {
          return _uids;
        },
        topicId: widget.topicId,
      );
    } else if (page == DisplayPage.bag) {
      return SlpPageBag(
        giftScene: widget.giftScene,
        data: _data,
        refreshCallback: refresh,
        room: widget.room,
        defaultId: _defaultId,
        showMicUsersCallback: _onPageBagShowMicUsers,
        isCpLinkPromote: widget.isCpLinkPromote,
        getSelectUids: () {
          return _uids;
        },
        topicId: widget.topicId,
      );
    } else if (page == DisplayPage.shop) {
      return SlpPageShop(
        data: _data?.shopCommodities,
        giftScene: widget.giftScene,
        curMoney: _data?.extend.totalMoney ?? 0,
        onBuy: refresh,
        topicId: widget.topicId,
      );
    } else if (page == DisplayPage.pk) {
      return SlpPagePK(
        giftScene: widget.giftScene,
        id: widget.id,
        data: _data,
        room: widget.room,
        defaultId: _defaultId,
      );
    } else if (page == DisplayPage.tower) {
      return SlpPageGift(
        key: _keys[page],
        giftScene: widget.giftScene,
        id: widget.id,
        data: _data,
        gifts: _data?.towerGift ?? [],
        room: widget.room,
        defaultId: _defaultId,
        fromChat: widget.fromChat,
        isPrivilege: true,
        getSelectUids: () {
          return _uids;
        },
        onGiftTaped: _onGiftTaped,
        isCpLinkPromote: widget.isCpLinkPromote,
        refreshCallback: refresh,
        queryBlessWords: _queryBlessWords,
        onGiftNumChanged: _onGiftNumChanged,
        topicId: widget.topicId,
        mysteryPositions: widget.mysteryPositions,
        refer: widget.refer ?? '',
        page: page,
      );
    } else {
      return Container();
    }
  }

  bool _isDataInvalid() => _data == null || _data?.gift == null || _data?.gift.isEmpty == true;

  Widget _buildBody() {
    if (_isDataInvalid()) {
      return const Center(child: CupertinoActivityIndicator());
    }

    if (_isInRoom) {
      // return wrapBlurBg(_buildPanel());
      return _buildPanel();
    } else {
      return _buildPanel();
    }
  }

  Widget _buildPanel() {
    if (widget.giftScene == GiftScene.theOneSpecialGift) {
      return SlpPageGift(
        giftScene: widget.giftScene,
        id: widget.id,
        data: _data,
        gifts: _data?.gift ?? [],
        room: widget.room,
        defaultId: _defaultId,
        fromChat: widget.fromChat,
        gameWishGift: widget.gameWishGift,
        getSelectUids: () {
          return _uids;
        },
        onGiftTaped: _onGiftTaped,
        isCpLinkPromote: widget.isCpLinkPromote,
        firstShow: true,
        refreshCallback: refresh,
        topicId: widget.topicId,
        refer: widget.refer ?? '',
      );
    }

    _removeTabs();

    double ratio = min(Util.ratio, 1);

    // double numMaxWidth =
    // _selectGift?.isCombo == 1 ? 68 * Util.ratio : 168 * Util.ratio;

    double numMaxWidth = 200;

    int realTotalMoney = _data?.extend.totalMoney ?? 0;

    bool supportSlpIntimate = (true) && _isInRoom && _data?.showIntimate == true;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (widget.giftScene == GiftScene.auction) _buildTitleBar(),
        if (_selectGift != null && (_selectGift!.isChangeColor || _selectGift!.isChangeVoice))
          SlpSpecialPlayBar(
            selectGift: _selectGift!,
            specialPlayItemMap: _specialPlayItemMap,
            onSelect: (item) {
              setState(() {
                _specialPlayItemMap[_selectGift!.id] = item;
              });
            },
          ),
        Row(
          children: [
            Container(
              alignment: AlignmentDirectional.centerStart,
              height: 44,
              // width: Util.width - (AppConfig.showGiftPack ? 57 : 0),
              child: CommonTabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CommonUnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: !widget.fromChat || darkMode ? Colors.white : R.color.mainTextColor),
                  insets: const EdgeInsetsDirectional.only(bottom: 4),
                  wantWidth: 16,
                  draggingWidth: 12.0,
                ),
                indicatorWeight: 0,
                indicatorColor: !widget.fromChat || darkMode ? Colors.white : R.color.mainTextColor,
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: !widget.fromChat || darkMode ? Colors.white : R.color.mainTextColor,
                  fontWeight: FontWeight.w600,
                ),
                labelColor: !widget.fromChat || darkMode ? Colors.white : R.color.mainTextColor,
                unselectedLabelColor: !widget.fromChat || darkMode ? Colors.white.withOpacity(0.4) : R.color.thirdTextColor,
                unselectedLabelStyle: TextStyle(
                  fontSize: 15,
                  color: !widget.fromChat || darkMode ? Colors.white.withOpacity(0.4) : R.color.thirdTextColor,
                  fontWeight: FontWeight.w600,
                ),
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                tabs: _tabs?.map((_) => _buildTabItem(_)).toList() ?? [],
              ),
            ),
            if (AppConfig.showGiftPack) ...[
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
                decoration: commonBoxDecorationWithParams([Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.1)], 19),
                child: SlpBalanceWidget(
                  ratio: ratio,
                  numMaxWidth: numMaxWidth,
                  selfMoney: realTotalMoney,
                  showIntimate: supportSlpIntimate,
                  // 亲密付按钮
                  dark: darkMode || !widget.fromChat,
                ),
              ),
              _buildFirstPayWidget(),
            ]
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _tabs?.isNotEmpty == true ? _tabs!.map((_) => _buildPage(_.type)).toList() : [],
          ),
        ),
      ],
    );
  }

  _buildFirstPayWidget() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Log.d('showGiftPack===>${AppConfig.showGiftPack}');
        if (AppConfig.showGiftPack) {
          /// 优先新充值礼包(包含每日充值和首充)
          Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'package_center_icon'});
          RechargePackCenterScreen.showBottom(context);
        } else if (Session.pckVersion >= 3) {
          SuperPackScreen.show(context);
        } else {
          FirstChargePackage.show(context);
        }
      },
      child: Container(
        width: 57,
        alignment: AlignmentDirectional.center,
        child: R.img(Assets.ic_gift_pack_webp, width: 40, height: 40, package: ComponentManager.MANAGER_GIFT),
      ),
    );
  }

  refresh() async {
    _load();
  }

  _load({bool firstLoadData = false}) async {
    if (widget.giftScene == GiftScene.order) {
      _loadOrder(firstLoadData: firstLoadData);
    } else {
      String type = isGiftSceneInRoom(widget.giftScene) && !_fromGroupChat ? 'room' : 'chat';
      _loadNormal(type, firstLoadData: firstLoadData);
    }
  }

  bool get _fromGroupChat => (widget.room?.rid ?? 0) <= 0 && (widget.room?.chatGroupId ?? 0) > 0;

  _parseData(Uint8List? bodyBytes) {
    if (bodyBytes == null) {
      return;
    }
    try {
      _data = ResBbGiftPanel.fromBuffer(bodyBytes).data;
      eventCenter.emit(EventConstant.EventGiftPanelDataDidRefreshNotice, _data);
    } catch (e) {
      Log.d(e.toString());
    }
  }

  void _clearGiftImageCacheIfNeed(int giftVersion) {
    const String KEY_GIFT_VERSION = 'gift.version';
    int savedGiftVersion = Config.getInt(KEY_GIFT_VERSION, 0);
    if (giftVersion != savedGiftVersion) {
      Config.set(KEY_GIFT_VERSION, giftVersion.toString());

      if (_data != null && _data?.gift != null) {
        for (var gift in _data!.gift) {
          int giftId = gift.id;
          String url = '${System.imageDomain}static/$giftSubDir/$giftId.png';
          _deleteImageCacheFile(url);
          url = '${System.imageDomain}static/$giftSubDir/$giftId.s.png';
          _deleteImageCacheFile(url);
          url = '${System.imageDomain}static/$giftSubDir/$giftId.e.png';
          _deleteImageCacheFile(url);
        }
        if (mounted) {
          setState(() {
            _giftGlobalKey = GlobalKey();
          });
        }
      }
    }
  }

  void _deleteImageCacheFile(String url) {
    CachedImageManager cacheManager = CachedImageManager.instance();
    File imageFile = cacheManager.getFileByUrl(url);

    //remove from existsCache
    cacheManager.evictExistsCache(imageFile.path);

    //remove from memory
    FileImage fileImage = FileImage(imageFile);
    imageCache.evict(fileImage);

    //remove from disk
    if (imageFile.existsSync()) {
      imageFile.deleteSync();
    }
  }

  /// 礼物配置接口
  _loadNormal(String type, {bool firstLoadData = false}) async {
    bool supportCoin = Session.supportCoinUse;
    if (widget.supportUseCoin == SupportUseCoin.NO) {
      supportCoin = false;
    } else if (widget.supportUseCoin == SupportUseCoin.YES) {
      supportCoin = true;
    }

    String useCoin = supportCoin ? "1" : "0";

    String unityRocketVersion = '1';

    /// 道具体验卡： version=8 by 2022.10.27
    /// 礼物猜猜乐： version=13 by 2023.8.29
    /// 通用礼物banner： version=15 by 2023.10.18
    /// 全服喇叭： version=17 by 2023.11.8
    /// 恋爱旅行： version=18 by 2023.11.17
    /// 甜蜜相册： version=19 by 2023.12.11
    /// 印象标记： version=19 by 2023.12.14
    /// 星座拍拍： version=20 by 2024.2.27
    /// 涂鸦礼物:  version=21 by 2024.3.25
    String url =
        "${System.domain}go/yy/gift/panel?version=21&type=$type&support_coin_use=$useCoin&act_version=2&unity_rocket_version=$unityRocketVersion";
    if (widget.giftScene == GiftScene.theOneSpecialGift) {
      /// 非诚勿扰特殊面板礼物
      url = '${System.domain}go/yy/gift/theone?version=2&type=$type&support_coin_use=$useCoin&act_version=2';
    }

    if (isGiftSceneInRoom(widget.giftScene) && !_fromGroupChat) {
      url = "$url&rid=${widget.room?.rid}&tower=${widget.room?.showCrossPK == 2 ? 1 : 0}";
    }
    XhrResponse? response;
    try {
      response = await Xhr.get(url, pb: true, throwOnError: true);
    } catch (e) {
      Log.d(e.toString());
    }

    if (response == null) return;

    _saveCache(response.bodyBytes);
    _parseData(response.bodyBytes);
    _initTab(firstLoadData: firstLoadData);
    int giftVersion = _data?.extend.giftVersion ?? 0;
    _clearGiftImageCacheIfNeed(giftVersion);

    /// 加载完数据需要更新下selectGift
    if (_selectGift != null) {
      if (_getDisplayPage(_selectTabIndex) == DisplayPage.gift && _data?.gift != null && _data?.gift.isNotEmpty == true) {
        for (BbGiftPanelGift i in _data!.gift) {
          if (_selectGift!.id == i.id) {
            _selectGift = i;
            break;
          }
        }
      } else if (_getDisplayPage(_selectTabIndex) == DisplayPage.privilege &&
          _data?.privilegeGift != null &&
          _data?.privilegeGift.isNotEmpty == true) {
        for (BbGiftPanelGift i in _data!.privilegeGift) {
          if (_selectGift!.id == i.id) {
            _selectGift = i;
            break;
          }
        }
      }
    }
    if (mounted) setState(() {});
    Future.delayed(const Duration(milliseconds: 200)).then((value) {
      GlobalKey<SlpPageGiftState>? key = _keys[_displayPage];
      if (key != null && key.currentState != null) {
        key.currentState?.refreshSelectGift();
      }

      /// 判断体验卡是否满足条件 弹框提示
      if (_checkExpcardFlag) {
        _checkExpcardFlag = false;
        showExpcardDialog();
      }
    });
  }

  bool _checkExpcardFlag = true;

  /// 仅第一次显示礼物面板时检测

  void showExpcardDialog() async {
    BbGiftPanelCommodities? item = _checkExpcard();
    if (item != null) {
      ApiExpCardCheckResponse resp = await GiftApi.checkExpcard(item.cid, widget.room?.realRid ?? 0);
      if (resp.success) {
        int? result = await ExpcardUseDialog.show(context, item, resp.data.panelGift);
        if (result != null && result > 0) {
          if (result == 2) {
            int targetUid = widget.id;
            if (targetUid <= 0) {
              targetUid = resp.data.target;
            }
            if (targetUid <= 0) {
              return;
            }

            /// 有对应的体验卡礼物   =>  送礼流程
            _displayPay(resp.data.panelGift, targetUid);
          } else if (result == 1) {
            /// 没有对应的体验卡礼物  =>  直接使用
            NormalNull resp = await GiftApi.useExpcard(item.cid, widget.room?.realRid ?? 0);
            if (resp.success) {
              Fluttertoast.showCenter(msg: K.gift_prop_use_success);
            } else {
              Fluttertoast.showCenter(msg: resp.msg);
            }
            Navigator.of(context).pop();
          }
        }
      }
    }
  }

  BbGiftPanelCommodities? _checkExpcard() {
    if (widget.room?.isBusinessAuction == true) {
      if (Util.isStringEmpty(widget.refer)) return null;
      switch (widget.refer) {
        case 'auction_start_0': // 拍卖体验卡（cid=5）
          // 判断背包中是否有 拍卖体验卡
          return _data?.commodities.firstWhereOrNull((e) => (e.cid == 5 && e.num > 0));
        case 'auction_start_1': // 自定义拍卖体验卡（cid=6）
          // 判断背包中是否有 自定义拍卖体验卡
          return _data?.commodities.firstWhereOrNull((e) => (e.cid == 6 && e.num > 0));
        case 'auction_diy': // 自定义关系体验卡（cid=7）
          // 判断背包中是否有 自定义关系体验卡
          return _data?.commodities.firstWhereOrNull((e) => (e.cid == 7 && e.num > 0));
        default:
          break;
      }
    }
    return null;
  }

  /// 体验卡礼物
  BbGiftPanelGift? item;

  _displayPay(BbGiftPanelGift gift, int targetUid) async {
    item = gift;
    IPayManager payManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result = await payManager.showRechargeSheet(context, item!.price);
    if (result == null || result.reason == SheetCloseReason.Active || result.value?.key == IPayManager.pTRecharge) {
      return;
    }
    _pay(result.value?.key ?? '', targetUid);
  }

  void _pay(String type, int targetUid) {
    ChatRoomData? room = widget.room;
    IPayManager payManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    payManager.pay(context,
        key: 'gift',
        type: type,
        args: {
          'money': item?.price,
          'type': 'package',
          'params': {
            'rid': room?.rid,
            'uids': '$targetUid',
            'positions': '${ChatRoomUtil.getPositionByUid(widget.id)?.position ?? ''}',
            'position': '${ChatRoomUtil.getPositionByServer()?.position ?? ''}',
            'giftId': item?.id,
            'giftNum': _selectGiftNum,
            'price': item?.price,
            'cid': 0,
            'ctype': '',
            'duction_money': 0,
            'version': 2,
            'num': _selectGiftNum,
            'gift_type': 'normal',
            'refer': '${room?.refer}:room',

            /// 进房refer
            'gift_refer': widget.refer ?? '',

            /// 打开礼物面板本身的refer
          }
        },
        showLoading: (type != IPayManager.pTAvailable),
        onPayed: () => _onPayed(),
        onError: _onPayError);
  }

  void _onPayError(bool isErrorCatch) {}

  void _onPayed() {
    ChatRoomData? room = widget.room;
    Map<String, dynamic> properties = <String, dynamic>{
      'scene': 'room',
      'rid': room?.rid,
      'gift_name': item?.name,
      'gift_id': item?.id,
      'gift_price': item?.price,
      'gift_num': _selectGiftNum,
      'user_num': 1,
      'total_price': item?.price,
      'gift_type': 'normal',
      'chat_room_type': room?.config?.type,
      'chat_room_property': room?.config?.property.toString(),
      'chat_room_types': room?.config?.types.toString(),
      'is_combo': 2,
      if (!Util.isNullOrEmpty(room?.config?.typeName)) 'type_label': room?.config?.typeName,
      if (!Util.isNullOrEmpty(room?.config?.originalRFT)) 'room_factory_type': room?.config?.originalRFT,
      if (!Util.isNullOrEmpty(room?.config?.settlementChannel)) 'settlement_channel': room?.config?.settlementChannel,
    };
    String? roomType = room?.config?.type;
    properties['time'] = DateTime.now().millisecondsSinceEpoch;
    properties['room_type'] = roomType;

    properties['to_uid'] = widget.id;
    Tracker.instance.track(TrackEvent.send_gift, properties: properties);

    Fluttertoast.showToast(msg: K.reward_suc, gravity: ToastGravity.BOTTOM);

    eventCenter.emit("Gift.SendSuccess");
    Navigator.of(context).pop();
  }

  /// 订单追加打赏
  _loadOrder({bool firstLoadData = false}) async {
    String url = "${System.domain}go/yy/gift/panel?type=order&display=order&version=8&act_version=2&oid=${widget.id}";

    XhrResponse? response;
    try {
      response = await Xhr.get(url, pb: true, throwOnError: true);
    } catch (e) {
      Log.d(e.toString());
    }

    if (!mounted || response == null) return;

    setState(() {
      _saveCache(response!.bodyBytes);
      _parseData(response.bodyBytes);
      _initTab(firstLoadData: firstLoadData);
    });
  }

  void _onPageBagShowMicUsers(bool show, bool se) {
    if (_bagPageShowMicUsers != show) {
      _bagPageShowMicUsers = show;
      if (se) {
        setState(() {});
      }
    }
  }

  bool get _isRoomLiveInPk =>
      _isInRoom &&
      widget.room != null &&
      (widget.room?.isLiveRoom ?? false) &&
      (widget.room?.config?.liveDataV3?.pkConfigV3?.isInPk() ?? false);

  bool get _isRoomBirthday => _isInRoom && widget.room != null && (widget.room?.isBusinessBirthday ?? false);

  Widget _buildHeartLabel() {
    return Container(
      height: 12,
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(colors: [Color(0xFFFC5897), Color(0xFFFF6AFD)]),
      ),
      child: Center(
        child: Text(
          K.gift_heart_beat,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            height: 1.3,
          ),
        ),
      ),
    );
  }

  Widget _buildDebatePKLabel(List<Color> colors) {
    return Container(
      width: 26,
      height: 12,
      alignment: AlignmentDirectional.center,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        gradient: LinearGradient(colors: colors),
      ),
      child: const Center(
        child: Text(
          'PK',
          style: TextStyle(
            color: Colors.white,
            fontSize: 8,
            height: 1.3,
          ),
        ),
      ),
    );
  }

  /// 心动速配房，选择心动阶段，将选择的心动用户排到用户列表的第一位，并显示心动标签
  bool _showHeartLabel(int uid) {
    if (uid <= 0) {
      return false;
    }

    if (!(widget.room?.isBusinessHeart ?? false)) {
      return false;
    }

    if (widget.room?.config?.cpState != CpLoveState.Switch) {
      return false;
    }

    RoomPosition? pos = widget.room?.positions.firstWhereOrNull((RoomPosition pos) {
      return pos.uid == Session.uid && pos.position > 0 && pos.position < 9;
    });

    /// 我选的是几号麦位
    int cpMeTarget = pos?.cpTarget ?? 0;

    if (cpMeTarget <= 0) {
      return false;
    }

    RoomPosition? meTargetPos = widget.room?.positions.firstWhereOrNull((pos) => pos.position == cpMeTarget);

    return meTargetPos?.uid == uid;
  }

  String _queryBlessWords() {
    if (_showInputBlessWords()) {
      return _topInputKey.currentState?.getText() ?? '';
    }
    return '';
  }

  void _onGiftNumChanged(int num) {
    _selectGiftNum = num;
    if (mounted) setState(() {});
  }
}

Widget wrapBlurBg(Widget child, {BorderRadius? radius}) {
  return ClipRRect(
    borderRadius: radius ?? const BorderRadius.vertical(top: Radius.circular(16)),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
      child: child,
    ),
  );
}

class SpecialPlayTopTips extends StatelessWidget {
  final String tips;
  final String icon;

  const SpecialPlayTopTips({
    Key? key,
    required this.tips,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsetsDirectional.only(start: 4, end: 12),
      margin: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF171621).withOpacity(0.7),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: icon,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              tips,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
