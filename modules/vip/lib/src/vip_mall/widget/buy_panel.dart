import 'dart:math';

import 'package:chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:shared/assets.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:vip/assets.dart';
import 'package:vip/k.dart';
import 'package:vip/src/mount/model/mount_buy_panel_data.dart';
import 'package:vip/src/mount/page/mount_piece_bag_page.dart';
import 'package:vip/src/vip_mall/model/commodity_bean.dart';
import 'package:vip/src/vip_mall/widget/commodity_animate_widget.dart';
import 'package:vip/src/vip_mall/widget/num_select_widget.dart';
import 'package:vip/src/vip_mall_v3/widget/price_widget.dart';

import '../api.dart';
import 'commodity_preview_widget.dart';
import 'send_gift_contacts_panel.dart';

part 'buy_panel.part.dart';

/// 购买物品面板
///
class BuyPanel extends StatefulWidget {
  final int cid; // 物品id
  final String? type;
  final int initNum; // 购买的初始数量，默认1
  final bool autoPlay;
  final MountBuyPanelData? mountData;
  final String? consumeType;

  /// return 是否购买成功
  static Future<bool?> show(BuildContext context,
      {Key? key,
      required int cid,
      String? type,
      int initNum = 1,
      bool autoPlay = false,
      MountBuyPanelData? mountData,
      String? consumeType}) {
    return displayModalBottomSheet(
      context: context,
      builder: (context) {
        return BuyPanel(
          key: key,
          cid: cid,
          type: type,
          initNum: initNum,
          autoPlay: autoPlay,
          mountData: mountData,
          consumeType: consumeType,
        );
      },
      defineBarrierColor: Colors.black.withOpacity(0.4),
      maxHeightRatio: 1,
      disableTapDismissible: true,
      settings: const RouteSettings(name: '/BuyPanel'),
    );
  }

  const BuyPanel(
      {super.key, required this.cid, required this.type, this.initNum = 1, required this.autoPlay, this.mountData, this.consumeType});

  @override
  State<StatefulWidget> createState() {
    return _BuyPanelState();
  }
}

class _BuyPanelState extends State<BuyPanel> {
  static int minPayMoney = 1;

  bool _loading = true;
  String? _errorMessage;

  int _selectIndex = 0;
  int _num = 1;
  final GlobalKey<NumSelectWidgetState> _numKey = GlobalKey();

  final IPayManager _payManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  CommodityBuyInfo? _data;

  Item? _selectItem;
  bool useCoupon = false;

  int _totalMoney = 0; // 原价
  int _totalScore = 0; // 积分
  int _reduceMoney = 0; // 优惠金额

  String _buyType = 'shop-buy';

  @override
  void initState() {
    super.initState();
    _num = widget.initNum;
    _loadData();
  }

  @override
  void dispose() {
    _payManager.dispose(_buyType);
    super.dispose();
  }

  _loadData({bool reload = false}) async {
    DataRsp<CommodityBuyInfo> response = await Api.getCommodityBuyInfo(widget.cid);
    if (response.success == true) {
      _data = response.data;
      if (_data != null && _displayItems != null && _displayItems!.isNotEmpty) {
        if (reload != true) {
          _selectItem = _displayItems![0];
          _buyType = _data!.buyType;
          _calcPrice();

          if (widget.autoPlay && _data!.extra is Map && _data!.extra['type'] == 'gift') {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              GiftConfig config = GiftConfig.fromJson(_data!.extra);
              CommodityAnimateWidget.show(context, config);
            });
          }
        }
      } else {
        _errorMessage = K.vip_commodity_info_error;
      }
    } else {
      _errorMessage = response.msg;
    }
    _loading = false;
    if (mounted) setState(() {});
  }

  Future<void> _onReload() async {
    if (mounted) {
      setState(() {
        _errorMessage = null;
        _loading = true;
        _loadData();
      });
    }
  }

  /// 获取金币 or 充值
  void _onCharge() {
    if (_isScoreCommodity()) return;
    Navigator.of(context).pop();
    if (Session.isLogined) {
      if (_data!.isGoldCoin()) {
        MissionManager.gotoMissionCenter(context);
      } else if (_data!.isMoney()) {
        ISettingManager? settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager?.openRechargeScreen(context, refer: 'shop');
      } else if (_data!.isBean()) {
        ISettingManager? settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager?.showExchangeBeanScreen(context, refer: 'shop');
      } else {
        if (_data!.pieceJumpPage.isEmpty) return;
        BaseWebviewScreen.show(context, url: _data!.pieceJumpPage);
      }

      Tracker.instance.track(TrackEvent.item_card, properties: {
        'item_card_click': _data!.moneyType ?? '',
        'item_id': '${_data!.cid}',
        'item_type': widget.type ?? '',
      });
    } else {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
    }
  }

  void _onBuyTaped() async {
    if (_data!.isLimitBuy) {
      Fluttertoast.showToast(msg: _data!.limitDesc);
      return;
    }

    if (_isScoreCommodity()) {
      ///积分购买
      NormalNull rsp = await Api.scoreBuy(_selectItem!.cid, num: _num);
      if (rsp.success) {
        _onPayed();
        // Fluttertoast.showToast(msg: K.vip_buy_success, gravity: ToastGravity.CENTER);
      } else {
        Fluttertoast.showToast(msg: rsp.msg, gravity: ToastGravity.CENTER);
      }
    } else if (_data!.isMoney()) {
      _showPayBottomSheet();
    } else {
      _payManager.pay(
        context,
        key: _buyType,
        type: 'available',
        refer: 'shop',
        args: {
          'money': _totalMoney,
          'type': _buyType,
          'params': {
            'num': _num,
            'cid': _selectItem!.cid,
            'price': _selectItem!.unitPrice,
            'coupon_id': (!useCoupon || _selectItem!.isNewPayInvalid()) ? 0 : _selectItem!.couponId,
            'duction_money': _reduceMoney,
            'version': 2,
            'money_type': _data!.moneyType ?? '',
            'duction_rate': _selectItem!.ductionRate,
            if (widget.mountData != null) 'consume_type': 'buy-mount-serial',
            if (Util.validStr(widget.consumeType)) 'consume_type': widget.consumeType,
          }
        },
        onPayed: _onPayed,
        onError: _onPayError,
      );
    }
  }

  void _showPayBottomSheet() async {
    if (_data?.isLightScore() == true) {
      minPayMoney = 0;
    }
    int discountPrice = max(_totalMoney - _reduceMoney, minPayMoney);
    SheetCallback? result = await _payManager.showRechargeSheet(context, discountPrice);
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      // 充值成功，刷新余额
      _loadData(reload: true);
      return;
    }

    int couponId = _selectItem!.couponId;
    int ductionMoney = _reduceMoney;
    if (useCoupon && _selectItem!.isNewPayInvalid()) {
      ductionMoney = 0;
      couponId = 0;
    }

    _payManager.pay(
      context,
      key: _buyType,
      type: result.value?.key ?? '',
      refer: 'shop',
      args: {
        'money': _totalMoney,
        'type': _buyType,
        'params': {
          'num': _num,
          'cid': _selectItem!.cid,
          'price': _selectItem!.unitPrice,
          if (_data!.isLightScore()) 'light_score': _totalScore,
          'coupon_id': couponId,
          'duction_money': ductionMoney,
          'version': 2,
          'gift_scene': 'shop',
          'money_type': _data!.moneyType ?? '',
          'duction_rate': _selectItem!.ductionRate,
          if (widget.mountData != null) 'consume_type': 'buy-mount-serial',
          if (_data!.isLightScore()) 'consume_type': 'light_score',
          if (Util.validStr(widget.consumeType)) 'consume_type': widget.consumeType,
        }
      },
      onPayed: _onPayed,
      onError: _onPayError,
    );
  }

  void _onPayError(bool isErrorCatch) {
    Tracker.instance.track(TrackEvent.item_card, properties: {
      'item_card_click': _data!.moneyType ?? '',
      'item_id': '${_data!.cid}',
      'item_type': widget.type ?? '',
      'item_status': 'others',
    });
  }

  void _onPayed() {
    eventCenter.emit('Vip.BuyPanel.Payed');
    Navigator.of(context).pop(true);
    Tracker.instance.track(TrackEvent.item_card, properties: {
      'item_card_click': _data!.moneyType ?? '',
      'item_id': '${_data!.cid}',
      'item_type': widget.type ?? '',
      'item_status': 'success',
    });
    if (_data!.type == 'cloud_game_card') {
      Fluttertoast.showToast(msg: K.vip_cloud_game_buy_tips([_data!.name ?? '', _num.toString()]), gravity: ToastGravity.CENTER);
    } else {
      // 座驾系列开通不需要toast
      if (widget.mountData == null) {
        Fluttertoast.showToast(
            msg: Util.isNullOrEmpty(_data!.toastMsg) ? K.shop_payed_toast([_data!.name ?? '', _num.toString()]) : _data!.toastMsg,
            gravity: ToastGravity.CENTER);
      }
    }
  }

  _onItemSelect(int index) {
    _selectIndex = index;
    _selectItem = _displayItems![_selectIndex];
    _calcPrice();
    if (mounted) setState(() {});
  }

  List<Item>? get _displayItems {
    if (Util.isCollectionEmpty(_data!.items) || _selectTabIndex == 1) {
      return _data?.itemsByScore;
    }

    return _data!.items;
  }

  bool _isScoreCommodity() {
    return _data!.isScore() || _selectTabIndex == 1;
  }

  _onValueChanged(int num) {
    _num = num;
    _calcPrice();
    setState(() {});
  }

  void _calcPrice() {
    // 商品总价
    _totalMoney = _selectItem!.unitPrice * _num;
    _totalScore = _selectItem!.lightScore * _num;
    _reduceMoney = 0; // 优惠价格
    int couponReduce = 0;
    // 优惠券减免
    if (_selectItem!.couponId > 0 && _selectItem!.couponMoney > 0) {
      couponReduce = _selectItem!.couponMoney;
      _reduceMoney = couponReduce;
      useCoupon = true;
    }

    // 类别选择 只能选一个
    if (_data!.isCategorySelect) {
      // 折扣价
      if (_selectItem!.ductionRate > 0) {
        int reducePrice = (_selectItem!.unitPrice * (100 - _selectItem!.ductionRate) / 100).floor();
        if (reducePrice >= couponReduce) {
          _reduceMoney = reducePrice;
          useCoupon = false;
        }
      }
    } else {
      // 折扣价
      if (_selectItem!.ductionRate > 0 && _num >= _selectItem!.ductionLimitMin) {
        int discountNum = _num;
        if (_selectItem!.ductionLimitMax > 0) {
          discountNum = min(discountNum, _selectItem!.ductionLimitMax);
        }
        int reduceMoney = (_selectItem!.unitPrice * discountNum * (100 - _selectItem!.ductionRate) / 100).floor();

        if (reduceMoney >= couponReduce) {
          _reduceMoney = reduceMoney;
          useCoupon = false;
        }
      }
    }

    // 折上折
    if (_isValidCoupon()) {
      int currentPrice = _totalMoney - _reduceMoney;
      _reduceMoney += (currentPrice * _selectItem!.couponDiscount / 100).floor();
      useCoupon = true;
    }
  }

  void _onTabTaped(int index) {
    if (index == _selectTabIndex) return;
    _selectTabIndex = index;

    _onItemSelect(0);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _numKey.currentState?.unFocus(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!_loading && _errorMessage == null && _data != null && _data!.isLimitBuy)
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 4.0),
              child: VipTopTips(
                isTitle: _data!.isTitleLimit,
                isVip: _data!.isVipLimit,
                tips: _data!.limitDesc,
                icon: _data!.limitIcon,
                jumpPath: _data!.jumpPath,
                jumpPage: _data!.jumpPage,
              ),
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              color: R.colors.bottomBarColor,
            ),
            constraints: const BoxConstraints(minHeight: 300),
            child: _buildBody(),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }

  bool _isValidCoupon() {
    return _selectItem!.couponDiscount > 0 && _selectItem!.couponDiscount <= 100;
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(error: _errorMessage, fontColor: R.colors.mainTextColor, onTap: _onReload);
    }

    if (_data == null) {
      return ErrorData(error: K.vip_get_commodity_info_failed, fontColor: R.colors.mainTextColor, onTap: _onReload);
    }

    Widget preview = CommodityPreviewWidget(
      commodity: _data!,
      extra: _data!.extra,
      expireDate: _data!.expireDate,
      expireJumpPage: _data!.expireDatePage,
      gradeIcon: _selectItem?.gradeIcon,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.mountData == null
            ? preview
            : Stack(
                children: [
                  preview,
                  PositionedDirectional(
                    top: 12,
                    end: 12,
                    child: InkWell(
                      child: R.img(
                        BaseAssets.titlebar_ic_titlebar_question_svg,
                        color: Colors.white,
                        width: 24,
                        height: 24,
                        package: ComponentManager.MANAGER_BASE_CORE,
                      ),
                      onTap: () {
                        BaseWebviewScreen.show(context, url: widget.mountData!.helpUrl, title: K.vip_mount_series_desc);
                      },
                    ),
                  ),
                ],
              ),
        Container(
          padding: EdgeInsetsDirectional.only(top: 10, bottom: 10 + Util.iphoneXBottom),
          decoration: BoxDecoration(color: R.colors.bottomBarColor),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _wrapWithPadding(_buildNameAndTag()),
              const SizedBox(height: 8),
              _wrapWithPadding(Text(
                _data!.desc ?? '',
                style: TextStyle(color: R.colors.secondTextColor, fontSize: 13, fontWeight: FontWeight.w500),
              )),
              SizedBox(height: _data!.showActivity ? 20 : 12),
              if (_data!.showActivity) _wrapWithPadding(_ActivityBtn(jumpPage: _data!.jumpPage)) else _buildCommodityPanel(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _wrapWithPadding(Widget child) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: child,
    );
  }

  Widget _buildCommodityPanel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_data!.isCategorySelect) _wrapWithPadding(_buildCategory(_displayItems!)) else _wrapWithPadding(_buildUnitPrice(_selectItem)),
        const SizedBox(height: 9),
        if (_isValidCoupon()) _CouponTips(_selectItem!),
        const SizedBox(height: 9),
        _wrapWithPadding(_buildBottomPanel()),
      ],
    );
  }

  Widget _buildNameAndTag() {
    if (widget.mountData != null) {
      bool hasMount = widget.mountData!.hasMount;
      Color lightText = darkMode ? const Color(0xFF71EAD3) : const Color(0xFF6113CA);
      return Row(
        children: [
          Text(
            '${widget.mountData!.serialName}-${_data!.name ?? ''}',
            style: TextStyle(color: R.colors.mainTextColor, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 6),
          Text(
            '(${hasMount ? K.vip_i_owned : K.vip_i_not_own})',
            style: TextStyle(color: hasMount ? lightText : R.colors.secondTextColor, fontSize: 13),
          ),
          const Spacer(),
          if (widget.mountData!.piecePrice > 0)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                MountPieceBagPage.show(System.context, serialId: widget.mountData!.serialId);
              },
              child: Text(
                hasMount
                    ? K.vip_piece_left_n(['${widget.mountData!.pieceNum}'])
                    : K.vip_piece_n_per_n(['${widget.mountData!.pieceNum}', '${widget.mountData!.piecePrice}']),
                style: TextStyle(color: lightText, fontSize: 13, decoration: TextDecoration.underline),
              ),
            ),
        ],
      );
    }
    return Row(
      children: [
        Text(
          _data!.name ?? '',
          style: TextStyle(color: R.colors.mainTextColor, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        if (_data!.tags.isNotEmpty) ..._data!.tags.map((e) => _buildTag(e)).toList(),
        _buildSubTab(),
      ],
    );
  }

  Widget _buildSubTab() {
    if (Util.isCollectionEmpty(_data?.items) || Util.isCollectionEmpty(_data?.itemsByScore)) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        Container(
          width: 102,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: R.colors.dividerColor, width: 1),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTabItem(BaseK.K.base_money_diamond_w, _selectTabIndex == 0, 0),
            _buildTabItem(K.vip_score, _selectTabIndex == 1, 1),
          ],
        ),
      ],
    );
  }

  int _selectTabIndex = 0;

  Widget _buildTabItem(String name, bool select, int index) {
    return GestureDetector(
      onTap: () => _onTabTaped(index),
      child: Container(
        width: 51,
        height: 32,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: select ? R.colors.chargeBorderColor : Colors.transparent,
          borderRadius: select ? BorderRadius.circular(4) : null,
        ),
        child: Text(
          name,
          style: TextStyle(
            color: select ? R.colors.brightTextColor : R.colors.mainTextColor.withOpacity(0.4),
            fontSize: 14,
            fontWeight: select ? FontWeight.w500 : null,
          ),
        ),
      ),
    );
  }

  /// 单价and 数量加减
  Widget _buildUnitPrice(Item? item) {
    if (item == null) return const SizedBox.shrink();
    String discountDesc = '';

    if (useCoupon) {
      discountDesc = item.ductionIconCouponDesc;
    } else if (item.ductionRate > 0) {
      discountDesc = item.ductionIconMultiDesc;
    }

    String unitPrice;
    if (_isScoreCommodity()) {
      unitPrice = item.unitPrice.toString();
    } else if (_data!.isMoney()) {
      unitPrice = MoneyConfig.moneyNum(item.unitPrice);
    } else {
      unitPrice = item.unitPrice.toString();
    }

    String unitStr;
    if (_isScoreCommodity()) {
      unitStr = K.vip_score + K.vip_money_per_num_new;
    } else if (_data!.isGoldCoin()) {
      unitStr = K.vip_gold_per_num;
    } else if (_data!.isMoney()) {
      unitStr = MoneyConfig.moneyName1 + K.vip_money_per_num_new;
    } else if (_data!.isBean()) {
      unitStr = K.vip_gold_bean + K.vip_money_per_num_new;
    } else {
      unitStr = _data!.pieceDesc;
    }

    return Row(
      children: [
        if (_data!.isLightScore() == false)
          Container(
            height: 42,
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NumText(
                      unitPrice,
                      style: TextStyle(
                        color: R.colors.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      unitStr,
                      style: TextStyle(color: R.colors.mainTextColor, fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 8),
                    _DiscountCornerText(text: discountDesc)
                  ],
                ),
                if (Util.validStr(item.ductionDesc) && !useCoupon)
                  Text(
                    item.ductionDesc,
                    style: TextStyle(color: R.colors.thirdTextColor, fontSize: 11),
                  ),
              ],
            ),
          ),
        const Spacer(),
        // 联盟特权里的联盟宝箱，是跳页面选赠送人选个数
        if (!(_data!.shopType == 'union_privilege' && _data!.type == 'union_box'))
          NumSelectWidget(
            _onValueChanged,
            key: _numKey,
            initValue: _num,
            supportDark: darkMode,
          ),
      ],
    );
  }

  /// 标签
  Widget _buildTag(String tag) {
    if (tag.isEmpty) return const SizedBox.shrink();
    return Container(
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      margin: const EdgeInsetsDirectional.only(start: 8),
      decoration: BoxDecoration(
        color: R.colors.chargeBorderColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(11),
      ),
      alignment: Alignment.center,
      child: Text(
        tag,
        style: TextStyle(color: R.colors.chargeBorderColor, fontSize: 11),
      ),
    );
  }

  Widget _buildCategory(List<Item> items) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildGoodsNum(items[index], index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 11);
        },
        itemCount: items.length,
      ),
    );
  }

  Widget _buildGoodsNum(Item item, int index) {
    bool select = index == _selectIndex;
    String discountDesc = '';

    if (useCoupon) {
      discountDesc = item.ductionIconCouponDesc;
    } else if (item.ductionRate > 0) {
      discountDesc = item.ductionIconMultiDesc;
    }

    int column = widget.mountData == null ? 3 : 4;
    double width = (Util.width - 32 - (column - 1) * 12) / column;
    return GestureDetector(
      onTap: () => _onItemSelect(index),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width,
            height: 46,
            margin: const EdgeInsetsDirectional.only(top: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: select ? R.colors.chargeBorderColor : R.colors.dividerColor),
              color: select ? R.colors.chargeBorderColor.withOpacity(0.06) : null,
            ),
            child: Text(
              item.period,
              style: TextStyle(
                color: select ? R.colors.mainTextColor : R.colors.thirdTextColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          PositionedDirectional(
            end: 0,
            top: 0,
            child: _DiscountCornerText(text: discountDesc),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPanel() {
    String extra = _selectItem!.ductionExtra;
    if (263 <= _selectItem!.cid && 265 >= _selectItem!.cid) {
      extra = '${K.vip_extra_tip}${BoxUtil.getKeyNameByCid(_selectItem!.cid)}';
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGoodsPrice(),
            const SizedBox(height: 2),
            if (extra.isNotEmpty)
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 2.0),
                child: Text(
                  extra,
                  style: TextStyle(color: R.colors.thirdTextColor, fontSize: 11.0),
                ),
              ),
            if (_data!.isMoney()) _buildMyMoney(),
          ],
        ),
        widget.mountData != null
            ? _buildBuyButton()
            : Flexible(
                child: _selectItem?.canBeGive == 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildSendButton(),
                          const SizedBox(width: 8),
                          _buildBuyButton(),
                        ],
                      )
                    : _buildBuyButton()),
      ],
    );
  }

  // 商品价格
  Widget _buildGoodsPrice() {
    if (_data?.isLightScore() == true) {
      // 点亮积分没有折扣，不展示余额
      minPayMoney = 0;
      return PriceWidget(priceType: PriceType.diamond_score, price: _totalMoney, subPrice: _totalScore, fixPrice: false);
    }

    int discountPrice = max(_totalMoney - _reduceMoney, minPayMoney);

    Widget icon = const SizedBox.shrink();
    String pricesStr = Util.removeDecimalZeroFormat(discountPrice / 1);
    String reduceStr = Util.removeDecimalZeroFormat(_totalMoney / 1);

    if (_isScoreCommodity()) {
      icon = const SizedBox.shrink();
    } else if (_data!.isGoldCoin()) {
      icon = R.img('ic_coin.png', width: 16, height: 16, package: ComponentManager.MANAGER_BASE_CORE);
    } else if (_data!.isMoney()) {
      icon = Image.asset(MoneyConfig.moneyIcon, width: 16.0, height: 16.0);
      pricesStr = MoneyConfig.moneyNum(discountPrice);
      reduceStr = MoneyConfig.moneyNum(_totalMoney);
    } else if (_data!.isBean()) {
      icon = Image.asset(MoneyConfig.goldBeanIcon, width: 16.0, height: 16.0);
    } else if (_data!.isPearl()) {
      //珍珠
      if (_data!.pearlIcon.isNotEmpty) {
        icon = CachedNetworkImage(
          imageUrl: _data!.pearlIcon,
          width: 16.0,
          height: 16.0,
        );
      }
    } else {
      if (_data!.pieceIcon.isNotEmpty) {
        icon = CachedNetworkImage(
          imageUrl: _data!.pieceIcon,
          width: 16.0,
          height: 16.0,
        );
      }
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        // 折扣价
        NumText(
          pricesStr,
          style: TextStyle(
            color: R.colors.mainTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        if (_isScoreCommodity())
          Text(
            K.vip_score,
            style: TextStyle(color: R.colors.secondTextColor, fontSize: 16),
          ),
        if (_reduceMoney != 0)
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 4),
            child: Text(
              '${K.vip_origin_price}$reduceStr',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: R.colors.secondTextColor,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
      ],
    );
  }

  // 我的余额
  Widget _buildMyMoney() {
    String myMoney;
    String getText = K.vip_get;
    if (_data!.isMoney()) {
      getText = K.vip_recharge;
    } else if (_data!.isBean()) {
      getText = K.vip_coin_exchange;
    }
    if (_isScoreCommodity()) {
      myMoney = '${_data!.score}${K.vip_score}';
    } else if (_data!.isGoldCoin()) {
      myMoney = '${_data!.goldCoin}${K.gift_coin_unit}';
    } else if (_data!.isMoney()) {
      myMoney = '${MoneyConfig.moneyNum(_data!.money)}${MoneyConfig.moneyName1}';
    } else if (_data!.isBean()) {
      myMoney = '${_data!.goldBean}${K.vip_gold_bean}';
    } else if (_data!.isPearl()) {
      myMoney = '${_data!.pearlBalance}${_data!.pearlDesc}';
    } else {
      myMoney = '${_data!.pieceBalance}${_data!.pieceDesc}';
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onCharge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            myMoney,
            style: TextStyle(color: R.colors.thirdTextColor, fontSize: 13.0, fontWeight: FontWeight.w500),
          ),
          if ((_data!.isMoney() || _data!.isBean() || _data!.isGoldCoin() || _data!.showJumpPage()) && !_isScoreCommodity())
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 1.dp,
                  height: 12.dp,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  color: R.colors.thirdTextColor,
                ),
                Text(
                  getText,
                  style: TextStyle(color: R.colors.tagTextV2Color, fontSize: 13.0, fontWeight: FontWeight.w500),
                ),
                R.img(
                  Assets.vip$mall_ic_arrow_svg,
                  width: 16.dp,
                  height: 16.dp,
                  color: R.colors.tagTextV2Color,
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _buildSendButton() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        Tracker.instance.track(TrackEvent.item_card, properties: {
          'item_card_click': 'action_send',
          'item_id': '${_data!.cid}',
          'item_type': widget.type ?? '',
        });
        bool? result = await SendGiftContactsPanel.show(context, _data!, _selectItem!, widget.cid, widget.type, _num);
        if (result == true) {
          Navigator.of(context).pop(true);
        }
      },
      child: Container(
        width: 80,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.5),
          color: R.colors.minorBgColor,
        ),
        alignment: Alignment.center,
        child: Text(
          K.send,
          style: TextStyle(color: R.colors.mainTextColor, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildBuyButton() {
    String btnText;
    if (_selectItem?.canBeGive == 1) {
      btnText = (_data!.isMoney() || _data!.isBean()) ? K.buy : K.vip_coin_exchange;
    } else {
      btnText = (_data!.isMoney() || _data!.isBean()) ? K.vip_buy_now : K.vip_exchange_now;
    }
    bool isMountSeries = widget.mountData != null;
    if (isMountSeries) {
      btnText = widget.mountData!.buyBntText;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onBuyTaped,
      child: Container(
        constraints: isMountSeries ? null : (_selectItem?.canBeGive == 1 ? null : const BoxConstraints(maxWidth: 160, minWidth: 100)),
        height: 52,
        width: isMountSeries ? null : (_selectItem?.canBeGive == 1 ? 80 : null),
        padding: isMountSeries ? const EdgeInsets.symmetric(horizontal: 20) : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.5),
          gradient: LinearGradient(
              colors: R.colors.mainBrandGradientColors, begin: AlignmentDirectional.topStart, end: AlignmentDirectional.bottomEnd),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(color: R.colors.brightTextColor, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
