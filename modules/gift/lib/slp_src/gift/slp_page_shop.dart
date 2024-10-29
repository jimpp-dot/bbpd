import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

class SlpPageShop extends StatefulWidget {
  final List<BbGiftPanelShopCommodities>? data;
  final int curMoney;
  final GiftScene giftScene;
  final VoidCallback? onBuy;
  final int topicId;

  const SlpPageShop(
      {super.key,
      this.data,
      this.curMoney = 0,
      required this.giftScene,
      this.onBuy,
      this.topicId = 0});

  @override
  SlpPageShopState createState() {
    return SlpPageShopState();
  }
}

class SlpPageShopState extends State<SlpPageShop>
    with AutomaticKeepAliveClientMixin {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  int _selected = 0;
  int _num = 1;
  String _name = '';

  @override
  dispose() {
    _payManager.dispose('shop-buy');
    super.dispose();
  }

  bool get _isInRoom {
    return isGiftSceneInRoom(widget.giftScene);
  }

  void _onTapCommodity(int index) {
    _selected = index;
    setState(() {});
  }

  Widget vipCoupon(String num) {
    return Coupon(
      color: R.color.thirdBrightColor,
      child: Container(
        width: 24,
        height: 12,
        alignment: Alignment.center,
        child: Text(
          num,
          style: const TextStyle(
            fontSize: 9.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildCommodityNum(BbGiftPanelShopCoupon val) {
    String num = Util.parseInt(val.num) > 99 ? '99+' : val.num.toString();
    if (Util.parseInt(val.cid) > 0 && val.type == 'coupon') {
      return PositionedDirectional(
        end: 5,
        top: 5,
        child: vipCoupon(num),
      );
    }
    return Container();
  }

  double _getIconSize(String type) {
    Map<String, double> res = {
      'exp': 35.0,
      'box': 40.0,
      'header': 50.0,
      'mounts': 60.0,
      'title': 60.0,
      'defend': 60.0,
      'gift': 55.0,
      'key': 41.0,
      'radio-defend': 45.0,
      'coupon': 45,
      'piece': 75,
      'bubble': 50,
    };

    return res.containsKey(type) ? res[type] ?? 50.0 : 50.0;
  }

  List<Widget> _buildCommodities() {
    List<BbGiftPanelShopCommodities>? shopCommodities = widget.data;
    if (shopCommodities == null || shopCommodities.isEmpty) {
      return [];
    }

    BbGiftPanelShopCommodities? current =
        _selected >= 0 && shopCommodities.isNotEmpty
            ? shopCommodities[_selected]
            : null;
    if (current == null || widget.data?.isEmpty == true) return [];

    List<Widget> widgets = [];
    for (var commodity in shopCommodities) {
      int index = shopCommodities.indexOf(commodity);
      bool isSelect = _selected == index;
      Color nameTextColor =
          _isInRoom || darkMode ? Colors.white : R.color.mainTextColor;
      Color priceTextColor =
          _isInRoom || darkMode ? Colors.white60 : R.color.secondTextColor;
      double iconSize = _getIconSize(commodity.data.type);

      int price = Util.parseInt(commodity.data.price);
      int ductionMoney = current.data.cid == commodity.data.cid
          ? Util.parseInt(current.coupon.ductionMoney)
          : 0;

      widgets.add(
        InkWell(
          onTap: () {
            _onTapCommodity(index);
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            alignment: AlignmentDirectional.center,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserIconFrame(
                      size: iconSize,
                      frameUrl: commodity.data.image,
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      commodity.data.name,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: nameTextColor,
                      ),
                    ),
                    ductionMoney <= 0
                        ? Text(
                            '${MoneyConfig.moneyNum(price)}${MoneyConfig.moneyName1}',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: priceTextColor,
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${MoneyConfig.moneyNum(price - ductionMoney)}${MoneyConfig.moneyName1}',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: priceTextColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(
                                  '${MoneyConfig.moneyNum(price)}${MoneyConfig.moneyName1}',
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    decoration: TextDecoration.lineThrough,
                                    color: priceTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
                _buildCommodityNum(commodity.coupon),
                if (isSelect)
                  R.img(Assets.ic_gift_select_svg,
                      package: ComponentManager.MANAGER_GIFT,
                      fit: BoxFit.fill,
                      color: const Color(0xff7d2ee6)),
              ],
            ),
          ),
        ),
      );
    }

    return widgets;
  }

  void onCharge() {
    if (Session.isLogined) {
      ISettingManager? settingManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_SETTINGS);
      settingManager?.openBalanceScreen(context);
    } else {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
    }
  }

  void onAdd() {
    _num++;
    setState(() {});
  }

  void onMin() {
    if (_num > 1) _num--;
    setState(() {});
  }

  BbGiftPanelShopCommodities? buyShopCommodity;
  void _onBuy(BbGiftPanelShopCommodities current) async {
    _name = current.data.name;
    buyShopCommodity = current;

    if (widget.curMoney >=
        (Util.parseInt(buyShopCommodity?.data.price) * _num -
            Util.parseInt(buyShopCommodity?.coupon.ductionMoney))) {
      _tryUseAvailable = true;
      _pay('available');
    } else {
      _showPayBottomSheet();
    }
  }

  void _onPayed() {
    _tryUseAvailable = false;
    Fluttertoast.showToast(
        msg: BaseK.K.base_shop_payed_toast([_name, _num.toString()]),
        gravity: ToastGravity.CENTER);
    if (widget.onBuy != null) widget.onBuy!();
  }

  void _showPayBottomSheet() async {
    //查看用户是否有优惠券
    int ductionMoney = 0;
    if (buyShopCommodity?.coupon != null) {
      if (Util.parseInt(buyShopCommodity?.coupon.onlyNewpay) > 0 &&
          Util.parseInt(buyShopCommodity?.coupon.state) == 0) {
      } else {
        ductionMoney = Util.parseInt(buyShopCommodity?.coupon.ductionMoney);
      }
    }

    SheetCallback? result = await _payManager.showRechargeSheet(
        context,
        Util.parseInt(buyShopCommodity?.data.price) * _num -
            (ductionMoney ?? 0));
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      // 充值成功刷新余额
      if (widget.onBuy != null) {
        widget.onBuy!();
      }
      return;
    }

    _pay(result.value?.key);
  }

  void _pay(String? type) {
    //查看用户是否有优惠券
    int couponId = 0;
    int ductionMoney = 0;
    if (buyShopCommodity?.coupon != null) {
      if (Util.parseInt(buyShopCommodity?.coupon.onlyNewpay) > 0 &&
          Util.parseInt(buyShopCommodity?.coupon.state) == 0) {
//							Fluttertoast.showToast(msg: '您有一张' + _coupons[keyCid]['name'].toString() + '还未激活，本次购买将不会使用，请激活后使用', gravity: ToastGravity.CENTER);
      } else {
        couponId = Util.parseInt(buyShopCommodity?.coupon.id);
        ductionMoney = Util.parseInt(buyShopCommodity?.coupon.ductionMoney);
      }
    }
    _payManager.pay(context,
        key: 'shop-buy',
        type: type ?? '',
        refer: 'shop',
        args: {
          'money': Util.parseInt(buyShopCommodity?.data.price) * _num,
          'type': 'shop-buy',
          'params': {
            'num': _num,
            'cid': buyShopCommodity?.data.cid ?? 0,
            'price': buyShopCommodity?.data.price ?? 0,
            'coupon_id': couponId,
            'duction_money': ductionMoney,
            'version': 2,
            'gift_scene': _isInRoom ? 'room' : 'chat',
            if (Util.parseInt(widget.topicId) > 0)
              'topicid': '${widget.topicId}',
          }
        },
        onPayed: _onPayed,
        onError: _onPayError);
  }

  bool _tryUseAvailable = false;
  void _onPayError(bool isErrorCatch) {
    if (_tryUseAvailable) {
      _tryUseAvailable = false;
      _showPayBottomSheet();
    }
  }

  Widget _buildFooter() {
    double footerHeight = Util.iphoneXBottom + 80.0;
    double paddingBottom = Util.iphoneXBottom;

    List<BbGiftPanelShopCommodities>? shopCommodities = widget.data;
    BbGiftPanelShopCommodities? current =
        _selected >= 0 && shopCommodities?.isNotEmpty == true
            ? shopCommodities![_selected]
            : null;
    if (current == null) return Container();
    double price = Util.parseInt(current.data.price) * _num / 100;
    // 现有余额
    var curmoney = (widget.curMoney / 100);

    // 获取头像框对应的水晶
    String? keyName;
    if (current.data.type == 'header') {
      keyName = BoxUtil.getKeyNameByCid(Util.parseInt(current.data.extId));
    }

    Color mainTextColor =
        _isInRoom || darkMode ? Colors.white : R.color.mainTextColor;
    Color secondTextColor =
        _isInRoom || darkMode ? Colors.white60 : R.color.secondTextColor;

    Color iconColor = _isInRoom || darkMode
        ? Colors.white.withOpacity(0.4)
        : R.color.mainTextColor.withOpacity(0.4);
    return Container(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: paddingBottom,
      ),
      height: footerHeight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10.0),
          topEnd: Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      MoneyConfig.moneyIcon,
                      width: 16.0,
                      height: 16.0,
                    ),
                    const SizedBox(width: 1),
                    NumText(
                      MoneyConfig.moneyNum(Util.parseInt(price * 100)),
                      style: TextStyle(
                        color: mainTextColor,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                if (current.data.type == 'header')
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      '${K.gift_extra_tip}${keyName ?? K.gift_key}',
                      style: TextStyle(
                        color: secondTextColor,
                        fontSize: 11,
                      ),
                    ),
                  ),
                InkWell(
                  onTap: () {
                    onCharge();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          '${MoneyConfig.moneyNum(Util.parseInt(curmoney * 100))}${MoneyConfig.moneyName1}',
                          style: TextStyle(
                            color: secondTextColor,
                            fontSize: 13.0,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          color: secondTextColor,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(bottom: 1.5),
                          child: Text(
                            K.gift_recharge,
                            style: TextStyle(
                              color: R.color.mainBrandColor,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                        R.img(
                          Assets.ic_arrow_svg,
                          width: 16,
                          height: 16,
                          package: ComponentManager.MANAGER_GIFT,
                          color: R.color.mainBrandColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: onMin,
                child: Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  child: R.img(BaseAssets.ic_minus_svg,
                      width: 26,
                      height: 26,
                      package: ComponentManager.MANAGER_BASE_CORE,
                      color: iconColor),
                ),
              ),
              Container(
                constraints: const BoxConstraints(minWidth: 28),
                alignment: Alignment.center,
                child: Text(
                  _num.toString(),
                  style: TextStyle(
                      color: mainTextColor,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              InkWell(
                onTap: onAdd,
                child: Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  child: R.img(BaseAssets.ic_add_svg,
                      width: 26,
                      height: 26,
                      package: ComponentManager.MANAGER_BASE_CORE,
                      color: iconColor),
                ),
              ),
            ],
          ),
          const SizedBox(width: 6),
          Container(
            height: 28,
            width: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: R.color.mainBrandGradientColors,
              ),
              borderRadius: BorderRadius.circular(23),
            ),
            child: InkWell(
              onTap: () {
                _onBuy(current);
              },
              borderRadius: BorderRadius.circular(23),
              child: Center(
                child: Text(
                  K.gift_buy,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.data == null || widget.data?.isEmpty == true) {
      return const EmptyWidget();
    }
    return Column(
      children: <Widget>[
        Expanded(
          child: CustomScrollView(
            primary: true,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
                sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  children: _buildCommodities(),
                ),
              ),
            ],
          ),
        ),
        _buildFooter(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
