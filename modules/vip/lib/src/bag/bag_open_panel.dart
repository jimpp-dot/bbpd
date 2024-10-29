import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/k.dart';
import 'package:vip/src/bag/bag_api.dart';
import 'package:vip/src/bag/bag_break_widget.dart';
import 'package:vip/src/bag/model/bag_bean.dart';
import 'package:vip/src/vip_mall/page/vip_mall_second_page.dart';
import 'package:vip/src/vip_mall/widget/commodity_preview_widget.dart';

import 'model/pb/generated/open_games_box.pb.dart';
import 'widget/killer_commodity_sell_dialog.dart';

/// 背包商品弹窗
///
class BagOpenPanel extends StatefulWidget {
  final int id;
  final String goodsType;

  const BagOpenPanel(this.id, this.goodsType, {super.key});

  @override
  _BagOpenPanelState createState() => _BagOpenPanelState();

  static Future<bool?> show(BuildContext context, int id, String type) async {
    return displayModalBottomSheet<bool?>(
      context: context,
      maxHeightRatio: 1,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return BagOpenPanel(id, type);
      },
    );
  }
}

class _BagOpenPanelState extends State<BagOpenPanel> {
  bool _loading = true;
  String? _error;
  BagGoods? _bagGoods;

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  _loadData() async {
    setState(() {
      _loading = true;
      _error = null;
      _bagGoods = null;
    });
    DataRsp<BagGoods> response =
        await BagApi.getBagGoodsDetail(widget.id, widget.goodsType);
    if (response.success == true) {
      _bagGoods = response.data;
    } else {
      _error = response.msg;
    }
    _loading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: R.colors.bottomBarColor,
        borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(20), topEnd: Radius.circular(20)),
      ),
      child: _renderBody(),
    );
  }

  Widget _renderBody() {
    if (_loading) {
      return Container(
        height: 300,
        alignment: AlignmentDirectional.center,
        child: const Loading(),
      );
    }

    if (_error != null || _bagGoods == null) {
      return Container(
        height: 300,
        alignment: AlignmentDirectional.center,
        child: ErrorData(
            error: _error,
            fontColor: R.colors.mainTextColor,
            onTap: _loadData,
            top: 0,
            bottom: 0),
      );
    }
    return _renderContent();
  }

  Widget _renderContent() {
    /// 使用过就不能分解了
    bool showBreakBtn = (_bagGoods!.canBreak == 1 && _bagGoods!.used != 1);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommodityPreviewWidget(
          commodity: _bagGoods!,
          extra: _bagGoods!.extra,
          expireDate: _bagGoods!.expires,
          using: _bagGoods!.using == 1 && _bagGoods!.expired != 1,
          expireJumpPage: _bagGoods!.expireDatePage,
          canBreak: showBreakBtn,
          goBreakCallback: _onBreakAction,
          gradeIcon: _bagGoods!.gradeIcon,
          breakTips: _bagGoods!.tips,
        ),
        Container(
          alignment: AlignmentDirectional.topStart,
          padding: EdgeInsetsDirectional.only(
              start: 20, end: 20, top: 20, bottom: 10 + Util.iphoneXBottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      _bagGoods!.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: R.colors.mainTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(width: 10),
                  _renderNameRightWidget(),
                ],
              ),
              if (_bagGoods!.desc != null && _bagGoods!.desc!.isNotEmpty)
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8),
                  child: Text(
                    _bagGoods!.desc ?? '',
                    style: TextStyle(
                        fontSize: 13, color: R.colors.secondTextColor),
                  ),
                ),
              if (_bagGoods!.explain.isNotEmpty)
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8),
                  child: Text(
                    _bagGoods!.explain,
                    style: TextStyle(
                        fontSize: 13, color: R.colors.secondTextColor),
                  ),
                ),
              const SizedBox(height: 20),
              _renderBtn(),
            ],
          ),
        ),
      ],
    );
  }

  // 商品名称右边文案
  Widget _renderNameRightWidget() {
    String text;
    Color bgColor = R.colors.chargeBorderColor.withOpacity(0.1);
    Color textColor = R.colors.chargeBorderColor;
    if ([
      ShopMailCommodityType.Gift,
      ShopMailCommodityType.Box,
      ShopMailCommodityType.Key,
      ShopMailCommodityType.Coupon,
      ShopMailCommodityType.Piece
    ].contains(_bagGoods!.commodityType)) {
      text = K.vip_left_count(['${_bagGoods!.num}']);
    } else {
      text = _bagGoods!.leftTime;
      if (_bagGoods!.expired == 1 || _bagGoods!.useUp == 1) {
        bgColor = R.colors.mainTextColor.withOpacity(0.1);
        textColor = R.colors.secondTextColor;
      }
    }
    return text.isNotEmpty
        ? Container(
            padding: const EdgeInsetsDirectional.only(
                start: 10, end: 10, top: 3, bottom: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11), color: bgColor),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w500, color: textColor),
            ),
          )
        : const SizedBox.shrink();
  }

  /// 底部按钮
  /// 如果是优惠券和礼物，'去使用'，装饰类"穿戴"、"取消穿戴"、"已过期"
  Widget _renderBtn() {
    /// 表情优惠券不显示
    if (_bagGoods!.commodityType == ShopMailCommodityType.Coupon &&
        _bagGoods!.couponType == CouponType.EmojiDiscount) {
      return const SizedBox.shrink();
    }

    VoidCallback? onTap;
    String btnText = '';
    bool showPresentBtn = false; // 是否显示赠送按钮
    if (_bagGoods!.commodityType == ShopMailCommodityType.Title ||
        _bagGoods!.commodityType == ShopMailCommodityType.MysteryCard) {
      // 爵位只能使用和赠送，使用后背包就不会再显示
      btnText = K.use;
      showPresentBtn = _bagGoods!.canGive == 1;
      onTap = _onDressOnAction;
    } else if (_bagGoods!.jumpPath?.isNotEmpty == true) {
      btnText = K.goto_use;
      showPresentBtn = false;
      onTap = _onJumpAction;
    } else if (_bagGoods!.commodityType == ShopMailCommodityType.Coupon) {
      btnText = K.goto_use;
      showPresentBtn = false;
      onTap = _onUseCouponAction;
    } else if ([
      ShopMailCommodityType.Frame,
      ShopMailCommodityType.Bubble,
      ShopMailCommodityType.Decorate,
      ShopMailCommodityType.Mounts,
      ShopMailCommodityType.MicrophoneEffect,
      ShopMailCommodityType.EnterEffect,
      ShopMailCommodityType.DummyHonor,
      ShopMailCommodityType.DummyMedal,
      ShopMailCommodityType.BubbleTail,
      ShopMailCommodityType.CardDecorate,
      ShopMailCommodityType.DummyPretty,
    ].contains(_bagGoods!.commodityType)) {
      if (_bagGoods!.expired == 1) {
        showPresentBtn = false;
        btnText = K.vip_expired;
      } else if (_bagGoods!.useUp == 1) {
        showPresentBtn = false;
        btnText = K.vip_use_up;
      } else if (_bagGoods!.using == 1) {
        // 正在使用中不能再赠送了
        showPresentBtn = false;
        onTap = _onDressOffAction;
        btnText = K.vip_wear_cancel;
      } else {
        // 使用过就不能赠送了
        showPresentBtn = _bagGoods!.canGive == 1 && _bagGoods!.used != 1;
        btnText = K.vip_wear;
        onTap = _onDressOnAction;
      }
    } else if (_bagGoods!.commodityType == ShopMailCommodityType.Piece) {
      // 使用过就不能赠送了
      showPresentBtn = false;
      btnText = K.vip_go_exchange;
      onTap = () {
        Navigator.pop(context);
        // 跳转到碎片商城
        VipMallSecondPage.show(context, K.vip_piece_mall, 'piece');
      };
    } else if (_bagGoods!.commodityType == ShopMailCommodityType.Gift) {
      // 跳转房间的礼物，跳转到白名单房间
      if (_bagGoods!.jumpType == 'room' && _bagGoods!.jumpRid > 0) {
        btnText = K.goto_use;
        showPresentBtn = false;
        onTap = _onJumpRoom;
      } else {
        return const SizedBox.shrink();
      }
    } else if (_bagGoods!.commodityType ==
        ShopMailCommodityType.BroadcastTicket) {
      btnText = K.goto_use;
      showPresentBtn = false;
      onTap = _onJumpMomentBroadcast;
    } else if (_bagGoods!.commodityType == ShopMailCommodityType.VisitorBook) {
      if (_bagGoods!.used == 0) {
        //未使用状态
        btnText = K.use;
        showPresentBtn = false;
        onTap = _onDressOnAction;
      } else {
        return const SizedBox.shrink();
      }
    } else if (_bagGoods!.commodityType == ShopMailCommodityType.GamesBox) {
      btnText = K.vip_free_open;
      showPresentBtn = false;
      onTap = _onUseGamesBoxAction;
    } else if (_bagGoods!.commodityType ==
            ShopMailCommodityType.TreasureTicket ||
        _bagGoods!.commodityType == ShopMailCommodityType.TreasureCrystal) {
      if (AppConfig.treasureUrl.isEmpty) {
        return const SizedBox.shrink();
      }

      btnText = K.vip_go_treasure;
      showPresentBtn = false;
      onTap = () {
        Navigator.pop(context);
        BaseWebviewScreen.show(context, url: AppConfig.treasureUrl);
        Tracker.instance.track(TrackEvent.treasure_exposure,
            properties: {'uid': Session.uid, 'source_type': '3'});
      };
    } else if (_bagGoods!.commodityType == ShopMailCommodityType.GuideCard) {
      btnText = K.goto_use;
      showPresentBtn = false;
      onTap = () {};
    } else if (_bagGoods!.commodityType == ShopMailCommodityType.Trumpet) {
      btnText = K.use;
      onTap = () {
        Fluttertoast.showToast(
            msg: K.vip_trumpet_only_in_room_tip, gravity: ToastGravity.CENTER);
      };
    } else {
      // 不识别的类型不显示任何操作按钮
      return const SizedBox.shrink();
    }

    List<Widget> btnWidgets = [];
    // 显示赠送按钮
    if (showPresentBtn) {
      btnWidgets.add(
        Expanded(
          child: GestureDetector(
            onTap: _onSendAction,
            child: Container(
              height: 52,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.colors.mainBrandGradientColors),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                K.vip_goto_send,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: R.colors.brightTextColor),
              ),
            ),
          ),
        ),
      );
      btnWidgets.add(const SizedBox(width: 15));
    }

    // 可售卖
    if ((_bagGoods?.salePearl ?? 0) == 1) {
      btnWidgets.add(
        Expanded(
          child: GestureDetector(
            onTap: _onSellAction,
            child: Container(
              height: 52,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: R.colors.minorBgColor,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                K.vip_killer_sell,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: R.colors.mainTextColor),
              ),
            ),
          ),
        ),
      );
      btnWidgets.add(const SizedBox(width: 15));
    }

    // 使用按钮样式不同
    if (showPresentBtn) {
      btnWidgets.add(
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 52,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: R.colors.minorBgColor,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                btnText,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: R.colors.mainTextColor),
              ),
            ),
          ),
        ),
      );
    } else {
      bool gray = (_bagGoods!.expired == 1 || _bagGoods!.useUp == 1);
      btnWidgets.add(
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 52,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                // 过期和用完显示灰色
                gradient: gray
                    ? LinearGradient(colors: [
                        R.colors.mainTextColor.withOpacity(0.1),
                        R.colors.mainTextColor.withOpacity(0.1)
                      ])
                    : LinearGradient(colors: R.colors.mainBrandGradientColors),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                btnText,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: gray
                      ? R.colors.secondTextColor
                      : R.colors.brightTextColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: btnWidgets,
      ),
    );
  }

  /// 分解
  _onBreakAction() async {
    bool? result = await BagBreakWidget.show(context, bagGoods: _bagGoods!);
    if (result == true) {
      Navigator.pop(context, true);
    }
  }

  /// 赠送
  _onSendAction() async {
    if (ShopMailCommodityType.DummyPretty == _bagGoods!.commodityType) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.showContactSelectScreen(context, (BuildContext context,
          List<int>? uidList, List<bool> isGroupList, Map room) async {
        if (uidList == null || uidList.isEmpty) {
          return;
        }
        Navigator.of(context).pop();
        bool result = await BaseBagApi.onMateCommoditySend(_bagGoods!.id,
            _bagGoods?.type ?? '', 1, uidList[0], _bagGoods?.name ?? '');
        if (result) {
          Navigator.of(System.context).pop(true);
        }
      }, hideGroupTab: true, title: '选择赠送对象', onlySelectOne: true);
    } else {
      IGiftManager giftManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      dynamic result = await giftManager.openSendGift(context,
          cid: Util.parseInt(_bagGoods!.id),
          num: 1,
          name: _bagGoods!.name ?? '');
      if (result == true) {
        Navigator.pop(context, true);
      }
    }
  }

  /// 出售
  _onSellAction() async {
    showDialog(
        context: System.context,
        builder: (BuildContext context) {
          return KillerCommoditySellDialog(
            bagGoods: _bagGoods!,
          );
        });
  }

  /// 使用 头像框、气泡、麦上光圈、入场特效、主页装扮、坐骑等装饰类
  /// 第一次穿戴和再次穿戴调用不同的接口处理
  _onDressOnAction() async {
    bool success = false;
    if (_bagGoods!.used == 1) {
      success = await BaseBagApi.onHeaderOn(
          _bagGoods!.id, _bagGoods?.name ?? '',
          type: _bagGoods!.type);
    } else {
      success = await BaseBagApi.onHeaderUse(
          _bagGoods!.id, _bagGoods?.name ?? '',
          type: _bagGoods!.type);
    }
    if (success) {
      if (_bagGoods!.commodityType == ShopMailCommodityType.Frame) {
        //如果是头像框
        eventCenter.emit(EventConstant.EventCurrentHeaderFrameChanged);
      }
      Navigator.pop(context, true);
    }
  }

  /// 取消使用 头像框、气泡、麦上光圈、入场特效、主页装扮、坐骑
  _onDressOffAction() async {
    bool success = await BaseBagApi.onHeaderOff(
        _bagGoods!.id, _bagGoods?.name ?? '',
        type: _bagGoods!.type);
    if (success) {
      if (_bagGoods!.commodityType == ShopMailCommodityType.Frame) {
        //如果是头像框
        eventCenter.emit(EventConstant.EventCurrentHeaderFrameChanged);
      }
      Navigator.pop(context, true);
    }
  }

  /// 优惠券使用
  _onUseCouponAction() {
    CouponType couponType = _bagGoods!.couponType;
    switch (couponType) {
      case CouponType.Title:
        Navigator.of(context).pop();
        IVipManager vipManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        vipManager.showMyLevelScreen(context, initialTab: MyLevelTab.Title);
        break;
      case CouponType.Gift:
      case CouponType.Discount:
      case CouponType.Knight:
      case CouponType.VipMic:
      case CouponType.RadioDefend:
        _jumpToHomePage();
        break;
      case CouponType.Defend:
        Navigator.of(context).pop();
        IMainManager mainManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
        mainManager.openMessageScreen(context);
        break;

      case CouponType.Key:
        Navigator.of(context).pop();

        /// 跳转到商城
        IVipManager vipManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        vipManager.show(context);
        break;
      default:
        Navigator.of(context).pop();

        /// 跳转到商城
        IVipManager vipManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
        vipManager.show(context);
        break;
    }
  }

  _jumpToHomePage() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
    eventCenter.emit('HomePage.JumpToHomePage'); // 先跳首页
    eventCenter.emit('HomePage.JumpToHomeTab', 'tabFriend'); // 切到指定tab
  }

  /// 使用礼包宝箱操作
  _onUseGamesBoxAction() async {
    try {
      EasyLoading.show(maskType: EasyLoadingMaskType.clear);
      XhrResponse response = await Xhr.post(
          "${System.domain}go/games/commodity/openBox",
          {'cid': "${_bagGoods!.cid}", 'num': "1"},
          throwOnError: false,
          pb: true);
      EasyLoading.dismiss();
      CommodityResp resp = CommodityResp.fromBuffer(response.bodyBytes);
      if (resp.success == true && resp.openBoxResp.items.isNotEmpty) {
        eventCenter.emit(EventConstant.BagItemNumChanged);

        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    width: 254,
                    height: 245,
                    padding:
                        const EdgeInsetsDirectional.only(top: 20, bottom: 25),
                    decoration: BoxDecoration(
                      gradient: const RadialGradient(
                          colors: [Color(0xff313A4B), Color(0xff1C2235)]),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Column(
                      children: [
                        Text(
                          K.vip_congratulation_get_gain,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        CachedNetworkImage(
                          imageUrl: Util.getRemoteImgUrl(
                              resp.openBoxResp.items.first.icon),
                          width: 64,
                          height: 64,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '${resp.openBoxResp.items.first.name} * ${resp.openBoxResp.items.first.num}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 155,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: R.color.mainBrandColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                K.vip_i_known,
                                style: TextStyle(
                                    color: R.color.mainTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ))
                      ],
                    ),
                  ),
                ));
      } else {
        Fluttertoast.showToast(msg: K.vip_open_box_failed);
      }
    } catch (e) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: K.vip_open_box_failed);
    }
  }

  /// 跳转操作
  _onJumpAction() {
    Navigator.of(context).pop();
    SchemeUrlHelper.instance()
        .checkSchemeUrlAndGo(Constant.context, _bagGoods!.jumpPath);
  }

  _onJumpRoom() {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, _bagGoods!.jumpRid,
        from: RoomFrom.gift_panel, refer: 'bag_gift');
    Navigator.of(context).pop();
  }

  _onJumpMomentBroadcast() {
    Navigator.of(context).pop();
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentPublishScreen(context,
        from: 'globalMoment', showGroupSelect: false);
  }
}
