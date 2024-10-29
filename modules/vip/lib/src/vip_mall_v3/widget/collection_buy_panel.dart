import 'dart:math';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/assets.dart';
import 'package:vip/k.dart';
import 'package:vip/src/pb/generated/rpc_shop.pb.dart';
import 'package:vip/src/pb/generated/slp_shop_resp.pb.dart';
import 'package:vip/src/vip_mall/model/commodity_bean.dart';
import 'package:vip/src/vip_mall/widget/commodity_preview_widget.dart';
import 'package:vip/src/vip_mall_v3/mall_api.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../theme/vip_theme.dart';

class CollectionBuyPanel extends StatefulWidget {
  final int bagId;

  const CollectionBuyPanel({super.key, required this.bagId});

  @override
  State<CollectionBuyPanel> createState() => _CollectionBuyPanelState();

  /// return 是否购买成功
  static Future<bool?> show(BuildContext context, int bagId) {
    return displayModalBottomSheet(
      context: context,
      builder: (context) {
        return CollectionBuyPanel(
          bagId: bagId,
        );
      },
      defineBarrierColor: Colors.black.withOpacity(0.3),
      maxHeightRatio: 1,
      disableTapDismissible: true,
      settings: const RouteSettings(name: '/CollectionPanel'),
    );
  }
}

class _CollectionBuyPanelState extends State<CollectionBuyPanel>
    with TickerProviderStateMixin {
  TabController? _tabController;
  final _currentIndex = 0.obs;
  ShopBagDetailResp? _shopBagDetail;
  bool _isLoading = false;

  final owners = [].obs;

  Map commodityInfoMap = {};

  @override
  void initState() {
    super.initState();
    _requestData();
    _requestOwnerData();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height - max(44, Util.statusHeight),
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(20), topEnd: Radius.circular(20)),
        color: darkMode ? R.colors.homeBgColor : Colors.white,
      ),
      child: _buildBody(),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: ErrorData(
        error: _shopBagDetail?.msg ?? '',
        fontColor: darkMode ? Colors.white : Colors.grey,
        onTap: () {
          _requestData();
          if (mounted) {
            setState(() {});
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: Loading());
    } else {
      if (!(_shopBagDetail?.success ?? false)) {
        return _errorWidget();
      }
    }

    return Stack(children: [
      PositionedDirectional(
          top: 0,
          start: 0,
          end: 0,
          child: ClipRRect(
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(20), topEnd: Radius.circular(20)),
            child: R.img(
              darkMode
                  ? Assets.vip$mall_collection_buy_bg_dark_webp
                  : Assets.vip$mall_collection_buy_bg_webp,
              width: Util.width,
              fit: BoxFit.fitWidth,
            ),
          )),
      SizedBox(
        width: Util.width,
        height: Util.height - max(44, Util.statusHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 6.dp,
            ),
            Center(
              child: Container(
                height: 5.dp,
                width: 28.dp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.dp),
                  color: darkMode
                      ? Colors.white.withOpacity(0.06)
                      : Colors.black.withOpacity(0.06),
                ),
              ),
            ),
            SizedBox(
              height: 21.dp,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: GradientText(
                _shopBagDetail?.data.name ?? '',
                gradient: LinearGradient(
                  colors: darkMode
                      ? const [Color(0xffBB24F1), Color(0xffF279FF)]
                      : const [Color(0xff830BAF), Color(0xffEC5DE3)],
                  begin: AlignmentDirectional.bottomStart,
                  end: AlignmentDirectional.topEnd,
                ),
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, top: 9, bottom: 20),
              child: Text(
                _shopBagDetail?.data.bDesc ?? '',
                style: TextStyle(
                  fontSize: 13,
                  color: darkMode
                      ? Colors.white.withOpacity(0.5)
                      : Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _buildGiftPackDetailWidget(),
            SizedBox(
              height: 24.dp,
            ),
            Expanded(child: _buildOwnerWidget()),
            SizedBox(
              height: 14.dp,
            ),
            _buildBottomPanel(),
            SizedBox(
              height: 10 + Util.iphoneXBottom,
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _buildOwnerWidget() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
            child: Text(
              K.mall_collection_owner,
              style: TextStyle(
                  fontSize: 18,
                  color: darkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsetsDirectional.only(
                  start: 16.dp, end: 16.dp, top: 12.dp),
              alignment: Alignment.center,
              constraints: BoxConstraints(
                maxHeight: 210.dp,
              ),
              width: Util.width - 32.dp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: darkMode
                      ? const Color(0xff0E183D)
                      : const Color(0xff7D2EE6).withOpacity(0.06)),
              child: owners.isEmpty
                  ? Text(
                      K.mall_first_owner,
                      style: TextStyle(
                          fontSize: 12.dp,
                          color: darkMode
                              ? Colors.white.withOpacity(0.5)
                              : Colors.black.withOpacity(0.5)),
                    )
                  : ListView.builder(
                      padding: const EdgeInsetsDirectional.all(0),
                      itemCount: owners.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        BagPayUserInfo userInfo = owners[index];
                        return Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: 12.dp, start: 16.dp, end: 16.dp),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14.dp),
                                child: CachedNetworkImage(
                                    imageUrl:
                                        Util.getRemoteImgUrl(userInfo.icon),
                                    width: 28.dp,
                                    height: 28.dp),
                              ),
                              SizedBox(
                                width: 6.dp,
                              ),
                              Expanded(
                                child: Text(
                                  userInfo.name,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: darkMode
                                          ? Colors.white.withOpacity(0.9)
                                          : Colors.black.withOpacity(0.9)),
                                ),
                              ),
                              NumText(
                                DateFormat('yyyy/MM/dd HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        userInfo.getTime * 1000)),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: darkMode
                                        ? Colors.white.withOpacity(0.9)
                                        : Colors.black.withOpacity(0.9)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          )
        ],
      );
    });
  }

  Widget _buildGiftPackDetailWidget() {
    return Obx(() {
      if (_shopBagDetail!.data.goods.isEmpty) return const SizedBox.shrink();
      double width = Util.width / min(_shopBagDetail!.data.goods.length, 4);
      List<Widget> tabs = [];
      List<Widget> tabPages = [];
      for (int i = 0; i < _shopBagDetail!.data.goods.length; i++) {
        BagGoods goodData = _shopBagDetail!.data.goods[i];
        if (goodData.bType == ShopBagGoodsType.ShopGoodsTypeBagCidSType) {
          tabs.add(Tab(
            child: _tabItemWidget(goodData.commodity.name, i, width),
          ));
          tabPages.add(_tabContentItemWidget(goodData));
        } else if (goodData.bType == ShopBagGoodsType.ShopGoodsTypeBagMedal) {
          tabs.add(Tab(
            child: _tabItemWidget(goodData.badge.title, i, width),
          ));
          tabPages.add(_tabContentItemWidget(goodData));
        } else if (goodData.bType == ShopBagGoodsType.ShopPretendTypeBagMedal) {
          tabs.add(Tab(
            child: _tabItemWidget(goodData.pretend.name, i, width),
          ));
          tabPages.add(_tabContentItemWidget(goodData));
        }
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTabBar(
            tabs: tabs,
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
            marginStart: 0,
            labelPadding: const EdgeInsetsDirectional.all(0),
            labelColor: const Color(0xffA953E6),
            labelStyle: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
            unselectedLabelColor:
                darkMode ? const Color(0x99FFFFFF) : const Color(0x99000000),
            unselectedLabelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0x99FFFFFF)),
          ),
          SizedBox(
            height: 12.dp,
          ),
          SizedBox(
            height: 210,
            child: TabBarView(
              controller: _tabController,
              children: tabPages,
            ),
          ),
        ],
      );
    });
  }

  Widget _tabItemWidget(String name, int index, double width) {
    return Container(
      constraints: BoxConstraints(
        minWidth: width,
      ),
      height: 44.dp,
      padding: EdgeInsetsDirectional.only(start: 5.dp, end: 5.dp),
      alignment: Alignment.center,
      decoration: _currentIndex.value == index
          ? BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(16), topEnd: Radius.circular(16)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: darkMode
                    ? [const Color(0xff221B5B), const Color(0xff080A31)]
                    : [Colors.white, Colors.white.withOpacity(0)],
              ),
              border: GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  const Color(0xFFA953E6),
                  const Color(0xffA953E6).withOpacity(0)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                width: 1,
              ),
            )
          : null,
      child: Text(
        name,
      ),
    );
  }

  Widget _tabContentItemWidget(BagGoods goodData) {
    String bgUrl = '';
    String image = '';
    String cidString = '';
    if (goodData.bType == ShopBagGoodsType.ShopGoodsTypeBagCidSType) {
      bgUrl = Util.getRemoteImgUrl(goodData.commodity.imageBg);
      image = Util.getRemoteImgUrl(goodData.commodity.image);
      cidString = goodData.commodity.cid.toString();
    } else if (goodData.bType == ShopBagGoodsType.ShopGoodsTypeBagMedal) {
      bgUrl = Util.getRemoteImgUrl(goodData.badge.imageBg);
      image = Util.getRemoteImgUrl(goodData.badge.icon);
    } else if (goodData.bType == ShopBagGoodsType.ShopPretendTypeBagMedal) {
      image = Util.getRemoteImgUrl(goodData.pretend.urlSource);
    }
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      child: (cidString.isNotEmpty && commodityInfoMap[cidString] != null)
          ? Stack(
              alignment: Alignment.center,
              children: [
                CommodityPreviewWidget(
                  commodity: commodityInfoMap[cidString],
                  extra: commodityInfoMap[cidString].extra,
                  expireDate: commodityInfoMap[cidString].expireDate,
                  expireJumpPage: commodityInfoMap[cidString].expireDatePage,
                  isAllBorderRadius: true,
                  borderRadius: 16.dp,
                ),
                if ((_shopBagDetail?.data.userPayNum ?? 0) > 0)
                  PositionedDirectional(
                    top: 8.dp,
                    start: 8.dp,
                    child: Container(
                      padding:
                          EdgeInsetsDirectional.only(start: 6.dp, end: 6.dp),
                      height: 18.dp,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9.dp)),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                          K.mall_single_limit(
                              ["${_shopBagDetail?.data.userPayNum}"]),
                          style: TextStyle(
                              color: const Color(0xFF9482D3),
                              fontSize: 12.dp,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
              ],
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.dp),
                  child: CachedNetworkImage(
                    imageUrl: bgUrl,
                    width: Util.width - 32.dp,
                    height: 210,
                    cachedHeight: 210.px,
                    cachedWidth: (Util.width - 32.dp).px,
                    fit: BoxFit.cover,
                  ),
                ),
                PositionedDirectional(
                    child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 210,
                    maxWidth: Util.width - 32.dp,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    width: 193,
                    height: 193,
                    cachedWidth: 193.px,
                    cachedHeight: 193.px,
                    fit: BoxFit.fitWidth,
                  ),
                )),
                if ((_shopBagDetail?.data.userPayNum ?? 0) > 0)
                  PositionedDirectional(
                    top: 8.dp,
                    start: 8.dp,
                    child: Container(
                      padding:
                          EdgeInsetsDirectional.only(start: 6.dp, end: 6.dp),
                      height: 18.dp,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9.dp)),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                          K.mall_single_limit(
                              ["${_shopBagDetail?.data.userPayNum}"]),
                          style: TextStyle(
                              color: const Color(0xFF9482D3),
                              fontSize: 12.dp,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildBottomPanel() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGoodsPrice(),
              const SizedBox(height: 2),
              _buildMyMoney(),
            ],
          ),
          Flexible(
            child: _buildBuyButton(),
          ),
        ],
      ),
    );
  }

  // 我的余额
  Widget _buildMyMoney() {
    String getText = K.vip_recharge;

    String myMoney =
        '${MoneyConfig.moneyNum(_shopBagDetail?.data.userMoney ?? 0)}${MoneyConfig.moneyName1}';
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onCharge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            myMoney,
            style: TextStyle(
                color: R.colors.thirdTextColor,
                fontSize: 13.0,
                fontWeight: FontWeight.w500),
          ),
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
                style: TextStyle(
                    color: R.colors.tagTextV2Color,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500),
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

  void _onCharge() {
    Navigator.of(context).pop();
    if (Session.isLogined) {
      ISettingManager settingManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_SETTINGS);
      settingManager.openRechargeScreen(context, refer: 'shop');

      // Tracker.instance.track(TrackEvent.item_card, properties: {
      //   'item_card_click': _data.moneyType ?? '',
      //   'item_id': '${_data.cid}',
      //   'item_type': widget.type ?? '',
      // });
    } else {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
    }
  }

  // 商品价格
  Widget _buildGoodsPrice() {
    Widget icon = const SizedBox.shrink();
    String pricesStr =
        Util.removeDecimalZeroFormat((_shopBagDetail?.data.price ?? 0) / 1);
    icon = Image.asset(MoneyConfig.moneyIcon, width: 16.0, height: 16.0);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        NumText(
          pricesStr,
          style: TextStyle(
            color: R.colors.mainTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildBuyButton() {
    String btnText = K.vip_buy_now;
    bool isSoldOut = (_shopBagDetail?.data.totalPayNum ?? 0) > 0 &&
        (_shopBagDetail?.data.totalAlreadyPayNum ?? 0) >=
            (_shopBagDetail?.data.totalPayNum ?? 0);
    if (isSoldOut) {
      //卖完了
      btnText = K.vip_sold_out_title;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onBuyTaped,
      child: Container(
        height: 52,
        constraints: BoxConstraints(maxWidth: 160.dp, minWidth: 100.dp),
        padding: EdgeInsetsDirectional.only(start: 20.dp, end: 20.dp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: LinearGradient(
              colors: isSoldOut
                  ? VipTheme.colors.disabledColor
                  : R.colors.mainBrandGradientColors,
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
              color: R.colors.brightTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _onBuyTaped() async {
    if ((_shopBagDetail?.data.totalPayNum ?? 0) > 0 &&
        (_shopBagDetail?.data.totalAlreadyPayNum ?? 0) >=
            (_shopBagDetail?.data.totalPayNum ?? 0)) {
      //卖完了
      Fluttertoast.showCenter(msg: K.mall_bag_sold_out);
      return;
    }

    int discountPrice = _shopBagDetail?.data.price ?? 0;
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

    SheetCallback? result =
        await payManager.showRechargeSheet(context, discountPrice);
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      // 充值成功，刷新余额
      _requestData();
      return;
    }

    payManager.pay(
      context,
      key: 'shop-buy-bag',
      type: result.value?.key ?? '',
      refer: 'shop',
      args: {
        'money': discountPrice.toString(),
        'type': 'shop-buy-bag',
        'params': {
          'bag_id': widget.bagId.toString(),
          'num': '1',
        }
      },
      onPayed: _onPayed,
      onError: _onPayError,
    );
  }

  void _onPayed() {
    Fluttertoast.showCenter(msg: K.mall_purchase_succeed);
    Navigator.of(context).pop(true);
    Tracker.instance.track(TrackEvent.item_card, properties: {
      'item_id': '${widget.bagId}',
      'item_type': 'collection_bag',
      'item_status': 'success',
    });
  }

  void _onPayError(bool isErrorCatch) {
    Tracker.instance.track(TrackEvent.item_card, properties: {
      'item_id': '${widget.bagId}',
      'item_type': 'collection_bag',
      'item_status': 'others',
    });
  }

  Future<void> _requestData() async {
    _isLoading = true;
    _shopBagDetail = await MallApi.getBags(widget.bagId);
    _isLoading = false;

    if (_shopBagDetail != null && _shopBagDetail!.success) {
      safeRun(() {
        ///主要用于防止后续bType增加类型导致无法解析
        int count = 0;
        for (int i = 0; i < _shopBagDetail!.data.goods.length; i++) {
          BagGoods goods = _shopBagDetail!.data.goods[i];
          if (goods.bType == ShopBagGoodsType.ShopGoodsTypeBagCidSType ||
              goods.bType == ShopBagGoodsType.ShopGoodsTypeBagMedal ||
              goods.bType == ShopBagGoodsType.ShopPretendTypeBagMedal) {
            count = count + 1;
          }
        }
        _tabController = TabController(length: count, vsync: this);
        _tabController?.addListener(() {
          if (_currentIndex.value != _tabController?.index) {
            _currentIndex.value = _tabController?.index ?? 0;
          }
        });
      });
      _requestCommodityInfo();
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _requestOwnerData() async {
    GetPayUserListResp resp =
        await MallApi.getCollectionOwnerData(widget.bagId);
    if (resp.success) {
      owners.value = resp.data;
    }
  }

  /// 请求老的数据结构，用来显示物品的动效
  Future<void> _requestCommodityInfo() async {
    if (_shopBagDetail == null || _shopBagDetail!.data.goods.isEmpty) return;
    String cidString = '';
    for (BagGoods goods in _shopBagDetail!.data.goods) {
      if (goods.bType == ShopBagGoodsType.ShopGoodsTypeBagCidSType) {
        cidString = '$cidString${goods.commodity.cid},';
      } else if (goods.bType == ShopBagGoodsType.ShopPretendTypeBagMedal) {
        cidString = '$cidString${goods.pretend.id},';
      }
    }
    if (cidString.isNotEmpty) {
      cidString = cidString.substring(0, cidString.length - 1);
      DataRsp<Map<String, dynamic>> commodityMap =
          await MallApi.getCollectionCommodityInfo(cidString);
      if (commodityMap.success == true && commodityMap.data != null) {
        try {
          for (String key in commodityMap.data!.keys) {
            commodityInfoMap[key] = CommodityBuyInfo.fromJson(
                (commodityMap.data![key]) as Map<String, dynamic>);
          }
          if (mounted) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {});
            });
          }
        } catch (e) {}
      }
    }
  }
}
