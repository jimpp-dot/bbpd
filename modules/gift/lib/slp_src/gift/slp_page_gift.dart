import 'dart:math';

import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:gift/a.dart';
import 'package:gift/k.dart';
import 'package:gift/slp_src/diy_gift/slp_diy_gift_panel.dart';
import 'package:gift/slp_src/gift/slp_intimate_pay_mixin.dart';
import 'package:gift/slp_src/graffiti_gift/graffiti_gift_panel.dart';
import 'package:gift/slp_src/tag_gift/slp_tag_gift_screen.dart';
import 'package:gift/slp_src/util/gift_util.dart';
import 'package:gift/slp_src/widget/slp_gift_num_select_widget.dart';
import 'package:gift/slp_src/widget/slp_money_not_enough_dialog.dart';
import 'package:gift/slp_src/widget/slp_page_gift_item.dart';
import 'package:gift/slp_src/widget/slp_page_gift_simple_item.dart';
import 'package:gift/src/common.dart';
import 'package:gift/src/widget/normal_combo_gift_widget.dart';
import 'package:shared/k.dart' as base_k;
import 'package:shared/shared.dart' hide Gift;

import '../../src/repo/gift_activity_repo.dart';
import '../model/pb/slp_gift_extension.dart';
import '../widget/slp_page_gift_interation_item.dart';
import 'slp_combine_gift_dialog.dart';
import 'slp_receiver_lock_gift.dart';

typedef OnSelectMicChanged = List<int> Function();
typedef OnGiftTaped = void Function(BbGiftPanelGift gift);
typedef QueryBlessWords = String Function();

/// 礼物页
class SlpPageGift extends StatefulWidget {
  final GiftScene giftScene;
  final int id;
  final int? groupId;
  final ChatRoomData? room; // room data
  final int defaultId; // 初次展示默认选中礼物ID，不设置默认不用传参
  final BbGiftPanelData? data;
  final bool fromChat;
  final List<BbGiftPanelGift> gifts;
  final OnSelectMicChanged? getSelectUids;
  final OnGiftTaped? onGiftTaped;
  final DisplayPage? page;
  final bool isPrivilege; // 特权礼物
  final bool isCpLinkPromote; //连连看麦位助力打赏
  final bool firstShow; // 第一次创建回调选中礼物
  final bool toLovers; //给伴侣送礼
  final bool gameWishGift; //是否通过心愿调起礼物面板送礼
  final VoidCallback? refreshCallback;
  final QueryBlessWords? queryBlessWords;
  final ValueChanged<int>? onGiftNumChanged;
  final int topicId;
  final Map<int, BbGiftPanelSpecialPlayItem>? specialPlayItemMap;

  /// 蒙面互动：蒙面GS麦位顺序
  final List<int>? mysteryPositions;
  final String refer; // 打开来源

  final double? height;

  const SlpPageGift({
    Key? key,
    required this.giftScene,
    required this.id,
    this.groupId,
    this.data,
    required this.gifts,
    required this.refer,
    this.page,
    this.room,
    this.defaultId = -1,
    this.fromChat = false,
    this.getSelectUids,
    this.isPrivilege = false,
    this.onGiftTaped,
    this.isCpLinkPromote = false,
    this.firstShow = false,
    this.toLovers = false,
    this.gameWishGift = false,
    this.refreshCallback,
    this.queryBlessWords,
    this.onGiftNumChanged,
    this.topicId = 0,
    this.specialPlayItemMap,
    this.mysteryPositions,
    this.height,
  }) : super(key: key);

  @override
  SlpPageGiftState createState() {
    return SlpPageGiftState();
  }
}

class SlpPageGiftState extends State<SlpPageGift> with AutomaticKeepAliveClientMixin, SlpIntimatePayMixin {
  final IPayManager _payManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  IGiftManager giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

  int _giftId = 0;
  BbGiftPanelGift? _selectGift;
  int _selectGiftNum = 1; // 打赏礼物数量
  SpecialGiftSendInfo? specialGiftSendInfo; //特殊礼物的购买状态（总数量、对象等）

  // room 相关
  List<RoomPosition>? _users; // 所有的麦上用户

  bool _isFriend = true; //亲密度是否大于5000
  bool _isRisk = false; //要打赏的用户是否存在风险

  ScrollController? controller;
  int crossAxisCount = 4;
  double childAspectRatio = 0.9;
  double horizontalPadding = 5.0;
  final GlobalKey _selectNumKey = GlobalKey();
  bool _showCombo = false;
  final GlobalKey<NormalComboGiftWidgetState> _comboWidgetKey = GlobalKey();
  bool _isPaying = false;

  bool get _isInRoom {
    return isGiftSceneInRoom(widget.giftScene) && (widget.room?.rid ?? 0) > 0;
  }

  bool get _giftAllowCombo {
    return _isInRoom &&
        !Util.parseBool(widget.room?.config?.closeHit) &&
        !GiftUtil.isBoxGift(widget.data?.outstandingBox.boxInfo, _giftId) &&
        !(_selectGift?.closeHit ?? false);
  }

  // 选中的uids
  List<int> _getSelectUid() {
    if (specialGiftSendInfo != null) {
      return specialGiftSendInfo!.selectUserId;
    }

    List<int> uids = widget.getSelectUids != null ? widget.getSelectUids!() : [];

    return uids;
  }

  int getGiftNum() {
    if (specialGiftSendInfo != null) {
      return specialGiftSendInfo?.giftNum ?? 0;
    }

    return _selectGiftNum;
  }

  int getTotalNum() {
    if (specialGiftSendInfo != null) {
      return specialGiftSendInfo?.totalNum ?? 0;
    }

    return _totalNum;
  }

  int getTotalPrice() {
    if (specialGiftSendInfo != null) {
      return _giftPrice * (specialGiftSendInfo?.totalNum ?? 0);
    }

    return _totalPrice;
  }

  BbGiftPanelGift? getSelectGift() {
    return _selectGift;
  }

  void refreshSelectGift() {
    bool hasSelectedGift = false;
    for (var element in widget.gifts) {
      if (element.id == _selectGift?.id) {
        hasSelectedGift = true;
        _selectGift = element;
      }
    }
    if (!hasSelectedGift) {
      //有些物品只有券 打赏完了就从礼物面板消失了
      _changeSelectGift(widget.gifts.first);
    }
  }

  // 选中的麦序
  List<int> _getSelectPosition() {
    List<int> positions = [];
    if (_users?.isNotEmpty == true) {
      for (int i = 0; i < _users!.length; ++i) {
        RoomPosition p = _users![i];
        if (_getSelectUid().contains(p.uid)) {
          positions.add(p.position);
        }
      }
    }

    return positions;
  }

  // 我的麦序
  int _getMyPosition() {
    int myPosition = -1;

    if (widget.room != null) {
      for (var position in widget.room!.positions) {
        int uid = position.uid;
        if (uid > 0 && uid == Session.uid) {
          myPosition = position.position;
        }
      }
    }

    return myPosition;
  }

  bool _isAllMic() {
    //全麦
    if (!_isInRoom) return false;
    bool allMic = true;
    if (widget.room?.positions.isNotEmpty == true) {
      for (RoomPosition position in widget.room!.positions) {
        if (position.uid == Session.uid) {
          continue;
        }
        if (position.uid == 0 || !_getSelectUid().contains(position.uid)) {
          allMic = false;
          break;
        }
      }
    }
    return allMic;
  }

  /// 是否显示亲密付入口
  @override
  bool get supportSlpIntimate =>
      ([DisplayPage.gift, DisplayPage.privilege, DisplayPage.interact].contains(widget.page)) &&
      _isInRoom &&
      widget.data?.showIntimate == true;

  @override
  void initState() {
    super.initState();
    _queryRisk();
    if (widget.gifts.isNotEmpty) {
      _selectGift = widget.gifts[0];
      _giftId = _selectGift?.id ?? 0;

      if (widget.defaultId >= 0) {
        int index = widget.gifts.indexWhere((element) => element.id == widget.defaultId);
        // 有初始选中的礼物，需要自适应默认GridView滑动距离
        if (index != -1) {
          int scrollIndex = 0;
          if (widget.gifts.length <= 2 * crossAxisCount || index < crossAxisCount) {
            // 所有礼物不超过一页不用滚动，（部分手机显示不到3行）
            // 选中礼物在第一屏内不用滚动
            scrollIndex = 0;
          } else {
            scrollIndex = index ~/ crossAxisCount;
          }
          double initialScrollOffset = scrollIndex * (((Util.width - 2 * horizontalPadding) / crossAxisCount / childAspectRatio) + 10);
          controller = ScrollController(initialScrollOffset: initialScrollOffset);
          _selectGift = widget.gifts[index];
          _giftId = _selectGift?.id ?? 0;
        }
      }
    }

    if (widget.firstShow) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (widget.onGiftTaped != null && getSelectGift() != null) {
          widget.onGiftTaped!(getSelectGift()!);
        }
      });
    }

    _initUsers();
  }

  _initUsers() {
    if (_isInRoom) {
      _users = giftManager.getGiftUsers(widget.room, mysteryPositions: widget.mysteryPositions) as List<RoomPosition>;
    }
  }

  @override
  void dispose() {
    _payManager.dispose('gift');
    controller?.dispose();
    super.dispose();
  }

  /// 查询用户风险信息
  _queryRisk() async {
    if (!_isGiftSceneNeedShowCheat()) return;

    XhrResponse response = await Xhr.postJson("${System.domain}friend/risk", {'uids': widget.id.toString()}, throwOnError: false);
    if (response.error == null) {
      Map res = response.response as Map;
      if (res['success'] == true) {
        List<Map> results = List<Map>.from(res['data']);
        if (results.isNotEmpty) {
          _isFriend = Util.parseInt(results[0]['friend']) > 0;
          _isRisk = Util.parseInt(results[0]['modify']) > 0;
          if (!mounted) {
            return;
          }
          setState(() {});
        }
      } else {
        Log.d(res['msg']);
      }
    } else {
      Log.d(response.error.toString());
    }
  }

  void _changeSelectGift(BbGiftPanelGift gift) {
    _selectGift = gift;
    _giftId = gift.id;
    _showCombo = false;

    if (_showBoxNum(gift) && _selectGiftNum > 10) {
      _selectGiftNum = 10; // 如果切换到了箱子礼物，数量最多10个
    }
    _comboWidgetKey.currentState?.endCombo();
    if (mounted) {
      setState(() {});
      if (widget.onGiftNumChanged != null) {
        widget.onGiftNumChanged!(_selectGiftNum);
      }
    }

    //切换到标签礼物，自动弹出标签礼物二级页面
    if (widget.room == null) return;
    List<RoomPosition> users = giftManager.getGiftUsers(widget.room, mysteryPositions: widget.mysteryPositions) as List<RoomPosition>;
    if (_selectGift != null && _selectGift!.isTagGift && users.isNotEmpty) {
      RoomTagGiftScreen.show(context, users, widget.data, _selectGift!, (SpecialGiftSendInfo? sendInfo) {
        specialGiftSendInfo = sendInfo;
      }, (List<int> tagsId) {
        _submit(_showCombo, extraParams: {'impress_ids': tagsId.join(',')});
      });
    }
  }

  Widget _buildGiftItem(BbGiftPanelGift gift) {
    int giftId = gift.id;
    if (gift.id == _selectGift?.id) {
      _selectGift = gift;
      _giftId = giftId;
    }
    bool selected = _giftId == giftId;
    if (widget.toLovers) {
      return SlpGiftSimpleItem(
        selected: selected,
        giftId: giftId,
        gift: gift,
        onGiftTaped: (BbGiftPanelGift gift) async {
          _changeSelectGift(gift);
          if (widget.onGiftTaped != null) {
            widget.onGiftTaped!(gift);
          }
        },
      );
    }

    String exclusiveName = '';
    if (gift.id == widget.data?.exclusive.giftId && widget.data?.exclusive.cur.name.isNotEmpty == true) {
      exclusiveName = widget.data!.exclusive.cur.name;
    }
    return SlpPageGiftItem(
        key: ValueKey('$giftId'),
        gift: gift,
        isPrivilege: widget.isPrivilege,
        isInRoom: _isInRoom,
        selected: selected,
        exclusiveName: exclusiveName,
        specialPlayItemMap: widget.specialPlayItemMap,
        randomBoxPriceStr: GiftUtil.getSelectBoxInfo(widget.data?.outstandingBox.boxInfo, giftId)?.priceTxt ?? '',
        onGiftTaped: (BbGiftPanelGift gift) async {
          Tracker.instance.track(TrackEvent.room_gift_control, properties: {
            'room_gift_click': 'gift',
            'rid': widget.room != null ? widget.room!.rid : 0,
            'item_id': gift.id,
            'item_name': gift.name,
            'is_combo': gift.isCombo == 1 ? 1 : 2,
            if (widget.room != null) 'room_factory_type': widget.room!.config?.originalRFT,
          });
          _changeSelectGift(gift);
          if (widget.onGiftTaped != null) {
            widget.onGiftTaped!(gift);
          }

          if (gift.isReceiverLock) {
            /// 按打赏对象解锁礼物
            openBbReceiverLockGiftPanel(gift);
            return;
          }

          if (gift.isDiyGift && !gift.isLocked && !gift.isUnity && widget.data != null) {
            bool? send = await SlpDiyGiftPanel.show(context,
                accountMoney: widget.data!.extend,
                gifts: gift.diyGift,
                inMicUids: giftManager.getGiftUsers(widget.room, mysteryPositions: widget.mysteryPositions) as List<RoomPosition>,
                chooseNumConfig: widget.data!.chooseNumConfig,
                rid: widget.room?.rid ?? 0,
                refer: widget.room?.refer ?? '',
                fromChat: widget.fromChat,
                showIntimate: widget.data!.showIntimate == true && _isInRoom,
                myPosition: _getMyPosition());

            if (send == true && (ModalRoute.of(context)?.isCurrent ?? false)) {
              Navigator.of(context).pop(true);
            }
            return;
          }
        });
  }

  ///互动礼物
  Widget _buildInteractionGiftItem(BbGiftPanelGift gift) {
    int giftId = gift.id;
    if (gift.id == _selectGift?.id) {
      _selectGift = gift;
      _giftId = giftId;
    }
    bool selected = _giftId == giftId;
    return SlpPageGiftInteractionItem(
      key: ValueKey('$giftId'),
      gift: gift,
      isInRoom: _isInRoom,
      selected: selected,
      onGiftTaped: (BbGiftPanelGift gift) async {
        Tracker.instance.track(TrackEvent.room_gift_control, properties: {
          'room_gift_click': 'gift',
          'rid': widget.room != null ? widget.room!.rid : 0,
          'item_id': gift.id,
          'item_name': gift.name,
          'is_combo': gift.isCombo == 1 ? 1 : 2,
        });
        _changeSelectGift(gift);
        if (widget.onGiftTaped != null) {
          widget.onGiftTaped!(gift);
        }

        if (gift.isDiyGift && !gift.isLocked && !gift.isUnity && widget.data != null) {
          bool? send = await SlpDiyGiftPanel.show(context,
              accountMoney: widget.data!.extend,
              gifts: gift.diyGift,
              inMicUids: giftManager.getGiftUsers(widget.room, mysteryPositions: widget.mysteryPositions) as List<RoomPosition>,
              chooseNumConfig: widget.data!.chooseNumConfig,
              rid: widget.room?.rid ?? 0,
              refer: widget.room?.refer ?? '',
              fromChat: widget.fromChat,
              showIntimate: widget.data!.showIntimate == true && _isInRoom,
              myPosition: _getMyPosition());

          if (send == true && (ModalRoute.of(context)?.isCurrent ?? false)) {
            Navigator.of(context).pop(true);
          }
        }
      },
    );
  }

  ///互动礼物面板
  Widget _buildInteractionGiftPanel() {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        itemBuilder: (ctx, index) {
          return _buildInteractionGiftItem(widget.gifts[index]);
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(width: 8);
        },
        itemCount: widget.gifts.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.gifts.isEmpty) {
      return const SizedBox.shrink();
    }
    Widget content;
    if (widget.page == DisplayPage.interact) {
      // 互动
      content = _buildInteractionGiftPanel();
    } else {
      content = GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 0,
        crossAxisCount: crossAxisCount,
        shrinkWrap: true,
        childAspectRatio: childAspectRatio,
        controller: controller,
        padding: EdgeInsetsDirectional.only(
          start: horizontalPadding,
          end: horizontalPadding,
          // bottom: Util.validStr(_selectGift?.description) ? 40 : 0,
          bottom: 52,
        ),
        children: widget.gifts.map((gift) {
          return _buildGiftItem(gift);
        }).toList(),
      );
    }
    double topHeight = widget.height ?? 0;
    if (topHeight > 0) {
      topHeight = topHeight - 140;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          content,
          PositionedDirectional(
            bottom: 0,
            end: 0,
            width: Util.width,
            child: Container(
              // height: 52,
              color: Colors.transparent,
              margin: EdgeInsets.only(top: topHeight),
              // decoration: BoxDecoration(
              //   border: _isInRoom ? null : Border(top: BorderSide(color: R.color.dividerColor, width: 0.5)),
              // ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildAntiCheat(),
                  _buildHandleBar(),
                ],
              ),
            ),
          ),
          if (_showCombo)
            PositionedDirectional(
              end: 12,
              width: 60,
              height: 60,
              bottom: Util.iphoneXBottom,
              child: NormalComboGiftWidget(
                _comboFinished,
                _comboPay,
                key: _comboWidgetKey,
              ),
            ),
        ],
      ),
    );
  }

  _comboFinished() {
    _showCombo = false;
    if (mounted) {
      setState(() {});
    }
  }

  _comboPay() {
    _submit(true);
  }

  bool _showBoxNum(BbGiftPanelGift? gift) {
    return GiftUtil.isBoxGift(widget.data?.outstandingBox.boxInfo, gift?.id ?? 0);
  }

  /// 大额礼物防诈骗提示，未关注 && 大于100时提示
  Widget _buildAntiCheat() {
    if (!_needShowCheat(false) || _isFriend == true) return const SizedBox.shrink();

    return Container(
      color: _isInRoom || darkMode ? const Color(0xFF171621).withOpacity(0.7) : Colors.white,
      width: Util.width,
      padding: const EdgeInsets.only(left: 16, top: 11, right: 16, bottom: 11),
      child: Text(
        base_k.K.base_anti_cheat,
        style: TextStyle(fontSize: 13, color: R.color.thirdBrightColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildBottomTips() {
    return GiftUtil.isBoxGift(widget.data?.outstandingBox.boxInfo, _selectGift?.id ?? 0)
        ? const SizedBox.shrink()
        : buildOpenBoxTips(context, widget.giftScene, '', description: _selectGift?.description ?? '');
  }

  _switchNum() async {
    bool showOneKeyAwake = false;
    int onekeyAwakeNum = 0;
    try {
      if (_selectGift?.awakeInfo == null || _selectGift?.awakeInfo.icon.isEmpty == true) {
        // 没有觉醒，请求
        AutoWakeInfoRsp autoWakeInfoRsp = await GiftPackCenterRepo.getawakeInfo(_selectGift?.id ?? 0);
        if (autoWakeInfoRsp.success) {
          if (autoWakeInfoRsp.data.giftNum > 0) {
            // 没有手动觉醒，达到觉醒数了，也不展示
            showOneKeyAwake = true;
            onekeyAwakeNum = autoWakeInfoRsp.data.giftNum;
          }
        }
      }
    } catch (e) {
      Log.d('======== GiftPackCenterRepo.getawakeInfo $e');
    }

    RenderBox rowRenderBox = _selectNumKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = rowRenderBox.localToGlobal(Offset(rowRenderBox.size.width / 2.0, -20));

    List<BbGiftPanelChooseNumConfig>? chooseNumConfig =
        _showBoxNum(_selectGift) ? widget.data?.chooseBoxNumConfig : widget.data?.chooseNumConfig;
    int userNum = _isInRoom ? _getSelectUid().length : 1;
    BbGiftPanelChooseNumConfig awakeNumConfig = BbGiftPanelChooseNumConfig();
    awakeNumConfig.num = onekeyAwakeNum;
    awakeNumConfig.desc = K.one_key_awakening;
    if (userNum == 1 && showOneKeyAwake) {
      // 移除desc为K.one_key_awakening的配置项
      chooseNumConfig?.removeWhere((config) => config.desc == K.one_key_awakening);
      // 然后添加新的awakeNumConfig
      chooseNumConfig?.add(awakeNumConfig);
    } else {
      // 只移除desc为K.one_key_awakening的配置项
      chooseNumConfig?.removeWhere((config) => config.desc == K.one_key_awakening);
    }

    SlpGiftNumSelectWidget.show(context, chooseNumConfig, _selectGiftNum, offset,
            selectGift: _selectGift, totalMoney: widget.data?.extend.totalMoney ?? 0)
        .then((value) {
      int count = Util.parseInt(value?[0]);
      if (count > 0) {
        if (mounted) {
          setState(() {
            _selectGiftNum = count;
            if (_showBoxNum(_selectGift) && _selectGiftNum > 10) {
              _selectGiftNum = 10; // 如果切换到了箱子礼物，数量最多10个
            }
          });
          if (widget.onGiftNumChanged != null) {
            widget.onGiftNumChanged!(_selectGiftNum);
          }
        }
        // 如果是一键登录选项，点击二次弹出确认后，直接发送，不再点击赠送
        if (value!.length > 1) {
          _submit(_showCombo);
        }
      }
    });
  }

  /// 操作条
  Widget _buildHandleBar() {
    List<Widget> widgets = [];

    if (_giftId <= 0) return Container();

    double ratio = min(Util.ratio, 1);

    if (_selectGift == null) return Container();

    double numMaxWidth = _selectGift!.isCombo == 1 ? 68 * Util.ratio : 168 * Util.ratio;
    int realTotalMoney = widget.data?.extend.totalMoney ?? 0;

    widgets = [
      // SlpBalanceWidget(
      //   ratio: ratio,
      //   numMaxWidth: numMaxWidth,
      //   selfMoney: realTotalMoney,
      //   showIntimate: supportSlpIntimate,
      //   // 亲密付按钮
      //   dark: darkMode || !widget.fromChat,
      // ),
    ];

    if (Util.validStr(_selectGift!.name) &&
        Util.validStr(_selectGift!.jumpPage) &&
        (_selectGift!.category == 'ad' ||
            _selectGift!.category == 'ad_v2' ||
            _selectGift!.category == 'sweet_album' ||
            _selectGift!.category == 'guess_gift' ||
            _selectGift!.category == 'horn' ||
            _selectGift!.category == 'impress_tag' ||
            _selectGift!.category == 'graffiti')) {
      widgets.addAll([
        const Spacer(),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 150, maxHeight: 52),
          child: GestureDetector(
            onTap: () {
              if (_selectGift!.category == 'graffiti') {
                // 涂鸦礼物需要传递额外的参数,不能使用通用的scheme跳转
                if (_isInRoom) {
                  GraffitiGiftPanel.show(context, widget.room!, widget.id);
                }
              } else {
                SchemeUrlHelper.instance().checkSchemeUrlAndGo(
                  System.context,
                  SchemeUrlHelper.instance().concatSchemeUrl(_selectGift!.jumpPage, SchemeUrlHelper.scheme_path_common_redirect),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFFC5BBFD), Color(0xFFC172FC)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _selectGift!.name,
                style: TextStyle(color: Colors.white, fontSize: 13 * ratio, fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ]);
    } else if (Util.parseBool(_selectGift!.hasCombineGift())) {
      // 如果是：互动礼物 && 组合礼物，则需要展示"赠送礼物"按钮
      widgets.addAll([
        const Spacer(),
        GestureDetector(
          onTap: () {
            List<RoomPosition> positions = List.from(widget.room?.positions ?? []);
            positions.retainWhere((element) => element.uid > 0);
            int userNum = _isInRoom ? positions.length : 0;
            if (userNum <= 0) {
              Fluttertoast.showCenter(msg: K.gift_no_user_to_select);
              return;
            }
            if (widget.room != null) {
              SlpCombineGiftDialog.show(
                context,
                room: widget.room!,
                combineId: _selectGift!.combineGift.combineId,
                combineName: _selectGift!.combineGift.combineName,
                combineType: _selectGift!.combineGift.combineType,
              );
            }
          },
          child: Container(
            width: 84,
            height: 30,
            alignment: AlignmentDirectional.center,
            decoration:
                BoxDecoration(gradient: LinearGradient(colors: R.color.mainBrandGradientColors), borderRadius: BorderRadius.circular(15)),
            child: Text(
              K.give_gift,
              style: TextStyle(color: Colors.white, fontSize: 14 * ratio, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ]);
    } else if (_selectGift!.isLocked) {
      widgets.addAll([
        const Spacer(),
        // 提示文案
        GestureDetector(
          onTap: () {
            if (_selectGift!.privilege.jumpScheme.isNotEmpty) {
              Navigator.of(context).pop();
              SchemeUrlHelper.instance().checkSchemeUrlAndGo(System.context, _selectGift!.privilege.jumpScheme);
              if (_selectGift!.privilege.jumpScheme.contains('page=constellation_clap')) {
                Tracker.instance.track(TrackEvent.unlock_botton_click, properties: {'uid': Session.uid, 'rid': widget.room?.rid ?? 0});
              }
              return;
            }
            if (_selectGift!.jumpPage.isNotEmpty) {
              BaseWebviewScreen.show(context, url: _selectGift!.jumpPage);
              return;
            }

            if (_selectGift!.isVipGift) {
              jumpToVipScreen(context, widget.room?.rid ?? 0);
            } else if (_selectGift!.isKnightGift) {
              Navigator.of(context).pop();
              IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openBuyKnightScreen(context);
            } else if (_selectGift!.isKaGift) {
              // ka跳转客服
              jumpToChatService();
            } else {
              jumpToPrivilegeScreen(context, widget.room?.rid ?? 0);
            }
          },
          child: Container(
            height: 30 * ratio,
            padding: EdgeInsets.symmetric(horizontal: 19 * ratio),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFF5D39F), Color(0xFFF6C068)]),
              borderRadius: BorderRadius.circular(15 * ratio),
            ),
            child: Text(
              _selectGift!.privilege.unlockTips,
              style: TextStyle(color: const Color(0xFF613113), fontSize: 13 * ratio, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ]);
    } else if (_selectGift!.isReceiverLock) {
      /// 按打赏对象解锁礼物
      widgets.addAll([
        const Spacer(),
        // 提示文案
        GestureDetector(
          onTap: () async {
            openBbReceiverLockGiftPanel(_selectGift!);
          },
          child: Container(
            height: 30 * ratio,
            padding: EdgeInsets.symmetric(horizontal: 19 * ratio),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFF2AF83), Color(0xFFFFEAC7)]),
              borderRadius: BorderRadius.circular(15 * ratio),
            ),
            child: Text(
              K.gift_receiver_lock_tips([_selectGift!.privilege.receiverTag]),
              style: TextStyle(color: const Color(0xFF613113), fontSize: 13 * ratio, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ]);
    } else {
      widgets.addAll([
        const Spacer(),
        if (!_showCombo) ...[
          // GestureDetector(
          //   onTap: _switchNum,
          //   child: Container(
          //     width: 60 * ratio,
          //     height: 30 * ratio,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: R.color.mainBrandColor, width: 1),
          //       borderRadius: BorderRadiusDirectional.only(
          //         topStart: Radius.circular(16 * ratio),
          //         bottomStart: Radius.circular(16 * ratio),
          //       ),
          //     ),
          //     alignment: Alignment.center,
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: <Widget>[
          //         Padding(
          //           padding: EdgeInsetsDirectional.only(end: 4 * ratio),
          //           child: Text(
          //             "x$_selectGiftNum",
          //             style: TextStyle(
          //               color: R.color.mainBrandColor,
          //               fontSize: 13 * ratio,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //         ),
          //         R.img(Assets.ic_up_arrow_svg,
          //             width: 16 * ratio,
          //             height: 16 * ratio,
          //             color: R.color.mainBrandColor,
          //             package: ComponentManager.MANAGER_GIFT,
          //             key: _selectNumKey),
          //       ],
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              _submit(false);
            },
            child: Container(
              width: 90 * ratio,
              height: 40 * ratio,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFEBFF0F), Color(0xFFC1FF25)]),
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(25 * ratio),
                  bottomEnd: Radius.circular(25 * ratio),
                  bottomStart: Radius.circular(25 * ratio),
                  topStart: Radius.circular(25 * ratio),
                ),
              ),
              child: Text(
                K.give_something,
                style: TextStyle(color: Colors.black, fontSize: 16 * ratio, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ]);
    }

    return Container(
      padding: EdgeInsets.only(left: 16 * ratio, right: 16 * ratio),
      height: 52,
      alignment: Alignment.center,
      child: Row(
        children: widgets,
      ),
    );
  }

  void openBbReceiverLockGiftPanel(BbGiftPanelGift gift) async {
    List<RoomPosition> inMicUids;
    if (widget.room != null) {
      inMicUids = giftManager.getGiftUsers(widget.room, mysteryPositions: widget.mysteryPositions) as List<RoomPosition>;
    } else {
      inMicUids = [];
    }
    bool? send = await SlpReceiverLockGift.show(
      context,
      accountMoney: widget.data?.extend,
      gift: gift,
      inMicUids: inMicUids,
      chooseNumConfig: widget.data?.chooseNumConfig,
      rid: widget.room != null ? widget.room!.rid : 0,
      refer: widget.room != null ? widget.room!.refer : '',
      myPosition: _getMyPosition(),
      id: widget.id,
      isInRoom: _isInRoom,
      fromChat: widget.fromChat,
      showIntimate: widget.data!.showIntimate == true && _isInRoom,
    );

    if (send == true && (ModalRoute.of(context)?.isCurrent ?? false)) {
      Navigator.of(context).pop(true);
    }
  }

  bool _tryUseAvailable = false; // 尝试使用余额支付
  int _cid = 0; // 背包礼物id
  String _ctype = ''; // // 背包礼物类型
  int _ductionMoney = 0; // 优惠金额
  int _onlyNewPay = 0; // 是否限制为仅新支付账户可用
  int _state = 0; // 券状态，只有账户充值后，才能使用优惠券，避免小号刷券
  int _totalNum = 0;
  int _giftPrice = 0; // 礼物单价
  int _totalPrice = 0; // 礼物总价
  String? _giftType; // 礼物类型：normal、coin（金币礼物,只能用金币赠送）、bean(金豆礼物)
  int _xxxStar = 0; //是否xxx类型礼物

  _submit(
    bool isCombo, {
    Map? extraParams,
  }) async {
    if (_giftId <= 0) return;
    if (specialGiftSendInfo == null && !(ModalRoute.of(context)?.isCurrent ?? false)) return;
    BbGiftPanelGift? gift = _selectGift;
    if (gift == null) return;

    if (gift.id == widget.data?.exclusive.giftId &&
        (widget.data?.exclusive.cur.uid ?? 0) > 0 &&
        widget.data?.exclusive.cur.uid != Session.uid) {
      /// 专属礼物
      Fluttertoast.showCenter(msg: K.gift_exclusive_send_tip([(widget.data?.exclusive.cur.name ?? '')]));
      return;
    }

    int userNum = (_isInRoom) ? _getSelectUid().length : 1;
    if (userNum <= 0) {
      Fluttertoast.showToast(msg: K.please_selecet_a_target_at_least, gravity: ToastGravity.CENTER);
      return;
    }
    int finalGiftNum = getGiftNum();
    if (finalGiftNum <= 0) {
      Fluttertoast.showToast(msg: K.please_select_a_gift_num, gravity: ToastGravity.CENTER);
      return;
    }

    _xxxStar = gift.star;

    _giftType = gift.giftType;

    if (widget.id > 0) {
      bool checkResult = await _checkCheat(widget.id, isCombo);
      if (!checkResult) return;
    }

    _giftPrice = gift.price.round();

    // 客户端不做拦截，服务端判断礼物价格为0走背包逻辑
    // if (_giftPrice <= 0) return;

    _ctype = gift.ctype;
    _cid = gift.cid;
    int cnum = gift.cnum; // 如果背包有该礼物，则返回礼物数量
    Log.d('_submit:$cnum');
    // 重置
    _ductionMoney = 0;
    _onlyNewPay = 0;
    _state = 0;

    if (_cid > 0 &&
        (((_ctype == 'gift' || _ctype == 'key' || _ctype == 'pub_drink') && cnum >= finalGiftNum * userNum) ||
            (_ctype == 'coupon' && cnum >= 1))) {
      _ductionMoney = gift.ductionMoney;
      _onlyNewPay = gift.onlyNewpay;
      _state = gift.state;
    } else {
      _cid = 0;
      _ctype = '';
    }

    _totalPrice = _giftPrice * finalGiftNum * userNum;

    _totalNum = _cid > 0 && ((_ctype == 'key') && cnum >= finalGiftNum * userNum) ? 0 : finalGiftNum * userNum;

    int realTotalMoney = widget.data?.extend.totalMoney ?? 0;

    if (GiftUtil.isBoxGift(widget.data?.outstandingBox.boxInfo, _selectGift?.id ?? 0)) {
      // 甄选礼盒总花费需要按照礼盒最大价格计算
      var total = GiftUtil.getMaybeMaxCost(userNum, finalGiftNum, widget.data?.outstandingBox.boxInfo, _selectGift?.id ?? 0);
      if (useIntimateCardPay && intimateCardInfo!.leftMoney < total) {
        _isPaying = false;
        Fluttertoast.showCenter(msg: K.gift_intimate_money_not_enough);
        return;
      } else if (realTotalMoney < total) {
        bool recharge = await SlpMoneyNotEnoughDialog.show(context, total);
        if (recharge) {
          _isPaying = false;
          // 充值成功刷新余额
          if (widget.refreshCallback != null) {
            widget.refreshCallback!();
          }
        }
        return;
      }
    }

    if (gift.giftType == 'coin' || gift.giftType == 'bean') {
      // 金币礼物，客户端不做金币和背包是否有足够的判断，错误提示由后台返回
      _pay('available', isCombo, extraParams: extraParams ?? {});
      return;
    } else if (_cid > 0 && _ctype == 'coupon') {
      if (Util.isAndroid && !Util.isLocale) {
        if ((_onlyNewPay <= 0 || _state > 0) && (widget.data?.extend.totalMoney ?? 0) + _ductionMoney >= getTotalPrice() ||
            useIntimateCardPay) {
          _tryUseAvailable = true;
          _pay('available', isCombo, extraParams: extraParams ?? {});
          return;
        } else {
          _displayDiscount(isCombo, extraParams: extraParams ?? {});
        }
      } else {
        if ((_onlyNewPay <= 0 || _state > 0) && (widget.data?.extend.totalMoney ?? 0) + _ductionMoney >= getTotalPrice() ||
            useIntimateCardPay) {
          _tryUseAvailable = true;
          _pay('available', isCombo, extraParams: extraParams ?? {});
        } else {
          _displayPay(isCombo, extraParams: extraParams ?? {});
        }
      }
    } else if (realTotalMoney >= getTotalPrice() ||
        (_cid > 0 && (_ctype == 'gift' || _ctype == 'pub_drink')) ||
        getTotalNum() == 0 ||
        useIntimateCardPay) {
      // getTotalNum == 0时，表示背包有足够的钥匙，可以直接支付
      _tryUseAvailable = !useIntimateCardPay;
      _pay('available', isCombo, extraParams: extraParams ?? {});
    } else {
      _displayPay(isCombo, extraParams: extraParams ?? {});
    }
  }

  ///是否显示防诈骗信息，私聊页打赏或者非合作房一对一打赏时为true
  bool _isGiftSceneNeedShowCheat() {
    return widget.giftScene == GiftScene.private ||
        (widget.giftScene == GiftScene.room_private && widget.room?.config?.property != RoomProperty.Business);
  }

  /// 是否显示防诈骗信息
  /// [_buildAntiCheat] 大额订单防诈骗提醒
  /// [_checkCheat] 大额订单弹窗
  bool _needShowCheat(bool isCombo) {
    if (!_isGiftSceneNeedShowCheat()) return false;

    BbGiftPanelGift? gift = _selectGift;
    if (gift == null || gift.giftType == 'coin' || gift.giftType == 'bean') {
      return false;
    }

    if (gift.price * _selectGiftNum >= 100 * 100) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _checkCheat(int uid, bool isCombo) async {
    if (!_needShowCheat(isCombo) || _isRisk != true) return true;

    bool result = await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: base_k.K.base_warm_prompt,
        content: base_k.K.gift_risk_dialog_content,
        positiveButton: PositiveButton(text: base_k.K.gift_risk_dialog_button_sure),
        negativeButton: NegativeButton(text: base_k.K.base_go_back),
      ),
    );
    return result;
  }

  _displayDiscount(bool isCombo, {Map? extraParams}) async {
    SheetCallback? result = await _payManager.showRechargeSheet(context, getTotalPrice() - _ductionMoney);
    if (result == null || result.reason == SheetCloseReason.Active) {
      _isPaying = false;
      return;
    }

    if (result.value?.key == null) {
      _isPaying = false;
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      _isPaying = false;
      // 充值成功刷新余额
      if (widget.refreshCallback != null) {
        widget.refreshCallback!();
      }
      return;
    }

    _pay(result.value?.key, isCombo, extraParams: extraParams ?? {});
  }

  _displayPay(bool isCombo, {Map? extraParams}) async {
    SheetCallback? result = await _payManager.showRechargeSheet(context, getTotalPrice() - _ductionMoney);
    if (result == null || result.reason == SheetCloseReason.Active) {
      _isPaying = false;
      return;
    }

    if (_onlyNewPay == 1 && _state == 0 && result.value?.key == 'available') {
      _isPaying = false;
      Toast.showCenter(context, K.please_recharge_first);
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      _isPaying = false;
      // 充值成功刷新余额
      if (widget.refreshCallback != null) {
        widget.refreshCallback!();
      }
      return;
    }

    _pay(result.value?.key, isCombo, extraParams: extraParams ?? {});
  }

  _pay(String? type, bool isCombo, {Map? extraParams}) {
    int finalGiftNum = getGiftNum();
    if (_isPaying) return;

    _isPaying = true;
    if (_isInRoom) {
      Map params = {
        'rid': widget.room?.rid,
        'uids': _getSelectUid().join(','),
        'positions': _getSelectPosition().join(','),
        'position': _getMyPosition(),
        'giftId': (widget.specialPlayItemMap != null && widget.specialPlayItemMap![_giftId] != null)
            ? widget.specialPlayItemMap![_giftId]!.newGiftId
            : _giftId,
        'giftNum': finalGiftNum,
        'price': _giftPrice,
        'cid': _cid,
        'ctype': _ctype,
        'duction_money': _ductionMoney,
        'version': 2,
        'num': getTotalNum(),
        'gift_type': _giftType,
        'star': _xxxStar,
        'show_pac_man_guide': Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
        if (isCombo) 'combo_id': _giftId,
        if (widget.isCpLinkPromote) 'is_cplink_aid': true,
        'refer': '${widget.room?.refer}:room',
        'all_mic': _isAllMic() ? 1 : 0,
        if (!Util.isStringEmpty(widget.queryBlessWords?.call(), trim: true))
          'bless_words': widget.queryBlessWords != null ? widget.queryBlessWords!() : '',
        if (Util.parseInt(widget.topicId) > 0) 'topicid': '${widget.topicId}',
        'gift_tab': widget.page != null ? describeEnum(widget.page) : '',

        /// 打开礼物面板本身的refer
        'gift_refer': widget.refer,
        // 亲密卡id
        if (intimateCardInfo != null) 'intimate_card_id': '${intimateCardInfo!.cardId}'
      };
      if (extraParams != null && extraParams.isNotEmpty) {
        params.addAll(extraParams);
      } else {
        //标签礼物可直接在面板赠送，服务端要求，标签礼物赠送时，需要传一个空参数来帮助识别
        if (_selectGift?.isTagGift ?? false) {
          params.addAll({'impress_ids': ''});
        }
      }

      _payManager.pay(context,
          key: 'gift',
          type: type ?? '',
          refer: 'gift',
          args: {'money': getTotalPrice(), 'type': 'package', 'params': params},
          showLoading: type != IPayManager.pTAvailable,
          onPayed: () => _onPayed(isCombo),
          onError: (isErrorCatch) => _onPayError(isErrorCatch, isCombo),
          onPayAppOpen: () {
            _isPaying = false;
          });
    } else if (widget.giftScene == GiftScene.private) {
      if (widget.toLovers) {
        String argType;
        if (_giftType == 'coin') {
          argType = 'coin-marry-wish';
        } else {
          argType = 'marry-wish';
        }
        _payManager.pay(context,
            key: 'gift',
            type: type ?? '',
            refer: 'marry',
            args: {
              'money': getTotalPrice(),
              'type': argType,
              'params': {
                'mid': widget.id,
                'giftId': _giftId,
                'giftNum': finalGiftNum,
                'cid': _cid,
                'ctype': _ctype,
                'duction_money': _ductionMoney,
                'version': 2,
                'num': getTotalNum(),
                'gift_type': _giftType,
                'star': _xxxStar,
                if (Util.parseInt(widget.topicId) > 0) 'topicid': '${widget.topicId}',
                if (intimateCardInfo != null) 'intimate_card_id': '${intimateCardInfo!.cardId}'
              }
            },
            onPayed: () => _onPayed(isCombo),
            onError: (isErrorCatch) => _onPayError(isErrorCatch, isCombo),
            onPayAppOpen: () {
              _isPaying = false;
            });
      } else {
        _payManager.pay(context,
            key: 'gift',
            type: type ?? '',
            refer: 'gift',
            args: {
              'money': getTotalPrice(),
              'type': 'chat-gift',
              'params': {
                'notify_group_id': widget.room?.chatGroupId ?? 0,
                'to': widget.id,
                'giftId': _giftId,
                'giftNum': finalGiftNum,
                'cid': _cid,
                'ctype': _ctype,
                'duction_money': _ductionMoney,
                'version': 2,
                'num': getTotalNum(),
                'gift_type': _giftType,
                'star': _xxxStar,
                'show_pac_man_guide': Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
                if (isCombo) 'combo_id': _giftId,
                'all_mic': _isAllMic() ? 1 : 0,
                if (Util.parseInt(widget.topicId) > 0) 'topicid': '${widget.topicId}',
                'gift_tab': widget.page != null ? describeEnum(widget.page) : '',
                if (intimateCardInfo != null) 'intimate_card_id': '${intimateCardInfo!.cardId}'
              }
            },
            onPayed: () => _onPayed(isCombo),
            onError: (isErrorCatch) => _onPayError(isErrorCatch, isCombo),
            onPayAppOpen: () {
              _isPaying = false;
            });
      }
    } else if (widget.giftScene == GiftScene.room_private && (widget.room?.chatGroupId ?? 0) > 0) {
      _payManager.pay(context,
          key: 'gift',
          type: type ?? '',
          refer: 'gift',
          args: {
            'money': getTotalPrice(),
            'type': 'chat-gift',
            'params': {
              'notify_group_id': widget.room?.chatGroupId ?? 0,
              'to': widget.id,
              'giftId': _giftId,
              'giftNum': finalGiftNum,
              'cid': _cid,
              'ctype': _ctype,
              'duction_money': _ductionMoney,
              'version': 2,
              'num': getTotalNum(),
              'gift_type': _giftType,
              'star': _xxxStar,
              'show_pac_man_guide': Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
              if (Util.parseInt(widget.topicId) > 0) 'topicid': '${widget.topicId}',
              if (intimateCardInfo != null) 'intimate_card_id': '${intimateCardInfo!.cardId}'
            }
          },
          onPayed: () => _onPayed(isCombo),
          onError: (isErrorCatch) => _onPayError(isErrorCatch, isCombo),
          onPayAppOpen: () {
            _isPaying = false;
          });
    } else {
      _isPaying = false;
      Fluttertoast.showToast(msg: K.wrong_purchase_option, gravity: ToastGravity.CENTER);
    }
  }

  void _onPayed(bool isCombo) {
    _isPaying = false;
    int finalGiftNum = getGiftNum();
    if (widget.fromChat == true) {
      bool toDate = false; // 是否是回复"右滑首页卡片打招呼"的消息
      Map orderSayHiUids = Im.orderSayHiUids;
      String targetId = widget.id.toString();
      if (orderSayHiUids.containsKey(targetId)) {
        toDate = true;
        orderSayHiUids.remove(targetId);
      }

      Tracker.instance.track(TrackEvent.chat, properties: {
        'target_uid': widget.id,
        'message_type': 'gift',
        'ref': Im.refer,
        if (toDate) 'to_date': true,
      });
    }

    ChatRoomData? room0 = _isInRoom ? ChatRoomData.getInstance() : null;

    Map<String, dynamic> properties = <String, dynamic>{
      'scene': _isInRoom
          ? 'room'
          : widget.giftScene == GiftScene.private
              ? 'private'
              : 'order',
      'rid': _isInRoom ? widget.room?.rid : 0,
      'gift_name': _selectGift?.name,
      'gift_id': _giftId,
      'gift_price': _giftPrice,
      'gift_num': finalGiftNum,
      'user_num': _isInRoom ? _getSelectUid().length : 1,
      'total_price': _giftPrice * finalGiftNum,
      'gift_type': _giftType,
      'is_combo': isCombo ? 1 : 2,
      'gift_award_id': _selectGift?.isGiftReward == true ? _selectGift?.skin.awardId : 0,
      'gift_award_name': _selectGift?.isGiftReward == true ? _selectGift?.skin.awardName : '',
      'gift_award_type': _selectGift?.isGiftReward == true ? _selectGift?.skin.awardType : '',
      'award_progress': _selectGift?.isGiftReward == true ? _selectGift?.skin.skinCurrent : 0,
      if (room0 != null) 'chat_room_type': room0.config?.type,
      if (room0 != null) 'chat_room_property': room0.config?.property.toString(),
      if (room0 != null) 'chat_room_types': room0.config?.types.toString(),
      if (!Util.isNullOrEmpty(room0?.config?.typeName)) 'type_label': room0?.config?.typeName,
      if (!Util.isNullOrEmpty(room0?.config?.originalRFT)) 'room_factory_type': room0?.config?.originalRFT,
      if (!Util.isNullOrEmpty(room0?.config?.settlementChannel)) 'settlement_channel': room0?.config?.settlementChannel,
      if (Util.parseInt(widget.topicId) > 0) 'topicid': '${widget.topicId}',
    };

    if (isCombo) {
      properties['combo_num'] = 1;
    }
    if (_isInRoom) {
      ChatRoomData? room = ChatRoomData.getInstance();
      String roomType = room?.config?.type ?? '';
      properties['time'] = DateTime.now().millisecondsSinceEpoch;
      properties['room_type'] = roomType;
      properties['refer'] = room?.refer ?? '';
      properties['is_pk'] = room?.gpkEnable ?? false;
      if (room?.config?.game == Games.Wolf) {
        IWereWolfManager wereWolfManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_WERE_WOLF);
        properties['game_type'] = wereWolfManager.getGameType();
      }
    }

    if (_isInRoom) {
      _getSelectUid().forEach((element) {
        properties['to_uid'] = element;
        Tracker.instance.track(TrackEvent.send_gift, properties: properties);
      });
    } else {
      if (widget.id > 0) {
        properties['to_uid'] = widget.id;
      }
      Tracker.instance.track(TrackEvent.send_gift, properties: properties);
    }

    if (widget.gameWishGift && widget.defaultId == _giftId) {
      Map<String, dynamic> map = <String, dynamic>{
        'to_uid': widget.id,
        'cid': _giftId,
        'money': getTotalPrice() - _ductionMoney,
        'consume_money': getTotalPrice(),
        'subsidy_money': _ductionMoney,
      };
      Tracker.instance.track(TrackEvent.send_gift_game, properties: map);
    }

    if (isCombo) {
      Map<String, dynamic> map = {
        'rid': widget.room?.rid,
        'gift_id': _giftId,
        'gift_name': _selectGift?.name,
        'gift_type': _giftType,
        'room_type': widget.room?.config?.type,
        'room_types': describeEnum(widget.room?.config?.types),
        'room_property': describeEnum(widget.room?.config?.property),
        'gift_price': _giftPrice,
        'recipient_num': _getSelectUid().length
      };
      Tracker.instance.track(TrackEvent.gift_combo, properties: map);
    }

    if (intimateCardInfo != null) {
      refreshIntimateCard(); // 刷新亲密卡余额
    }

    _tryUseAvailable = false;
    //箱子礼物要收起面板
    if (_showBoxNum(_selectGift)) {
      if (ModalRoute.of(context)?.isCurrent ?? false) {
        Navigator.of(context).pop(true);
      }
    } else {
      if (isCombo) {
      } else {
        Fluttertoast.showToast(msg: K.reward_suc, gravity: ToastGravity.BOTTOM);
        if (_giftAllowCombo) {
          if (mounted) {
            setState(() {
              _showCombo = true;
            });
          }
        }
      }
    }
    eventCenter.emit("Gift.SendSuccess");
  }

  void _onPayError(bool isErrorCatch, bool isCombo) {
    _isPaying = false;
    if (_tryUseAvailable) {
      _tryUseAvailable = false;
      _displayPay(isCombo);
    }
  }

  @override
  bool get wantKeepAlive => true;
}

Map<int, String> titles = {
  1: A.gift_title_array[0],
  2: A.gift_title_array[1],
  3: A.gift_title_array[2],
  4: A.gift_title_array[3],
  5: A.gift_title_array[4],
};
