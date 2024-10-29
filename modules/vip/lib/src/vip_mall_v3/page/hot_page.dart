import 'dart:math';
import 'dart:ui' as ui;
import 'dart:async';

import 'package:shared/dart_extensions/widget/box_extension.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall_v3/mall_api.dart';
import 'package:vip/src/vip_mall_v3/page/vip_more_screen.dart';
import 'package:vip/src/vip_mall_v3/widget/vip_mall_v3_bags_item.dart';

import '../../../assets.dart';
import '../../../k.dart';
import '../../pb/generated/rpc_shop.pb.dart';
import '../../pb/generated/slp_shop_resp.pb.dart';
import '../../vip_mall/mixin/bag_item_mixin.dart';
import '../../vip_mall/widget/mall_goods_widget.dart';
import '../widget/collection_buy_panel.dart';
import '../widget/mall_banner.dart';
import '../widget/vip_mall_v3_goods_item.dart';

class HotPage extends StatefulWidget {
  const HotPage({super.key});

  @override
  State<StatefulWidget> createState() => HotPageState();
}

class HotPageState extends State<HotPage>
    with BaseScreenStateMixin, AutomaticKeepAliveClientMixin {
  final String _tag = "HotPageState";
  late ShopIndexResp rsp;
  final double padding = 16.dp;
  final ValueNotifier<int> _elapsedTime = ValueNotifier(0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    rsp = await MallApi.getHot();
    if (rsp.success) {
      setScreenReady();
      bool hasCountDown = false;
      for (int i = 0; i < rsp.data.bagList.length; i++) {
        if (rsp.data.bagList[i].countDown > 0) {
          hasCountDown = true;
        }
      }
      if (hasCountDown) {
        _startTimer();
      }
    } else {
      setScreenError(errorMsg: rsp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    _load();
  }

  void _startTimer() {
    _destroyTimer();
    _elapsedTime.value = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _elapsedTime.value = _elapsedTime.value + 1;
    });
  }

  void _destroyTimer() {
    if (_timer?.isActive == true) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildStatusContent();
  }

  @override
  Widget buildContent() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: rsp.data.bagList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _buildBanner(rsp.data.banner);
        } else if (rsp.data.bagList[index - 1].bType ==
            ShopBagType.SelectGiftType) {
          List<ShopGoods> list = rsp.data.bagList[index - 1].list;
          if (list.isNotEmpty && list[0].cType == ShopType.GiftBagType) {
            ///甄选藏品只能是礼包
            return _buildSelection(rsp.data.bagList[index - 1].name, list[0]);
          } else {
            return const SizedBox.shrink();
          }
        }
        return _buildGoods(index - 1,
            showMore: rsp.data.bagList[index - 1].subset.isNotEmpty);
      },
    );
  }

  ///甄选藏品
  Widget _buildSelection(String name, ShopGoods goods) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: padding, end: padding, top: 12.dp, bottom: 12.dp),
      child: Column(
        children: [
          _buildTitle(name),
          SizedBox(height: 10.dp),
          ClipRRect(
              borderRadius: BorderRadius.circular(12.dp),
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return GestureDetector(
                    onTap: () async {
                      bool succeed = await CollectionBuyPanel.show(
                              context, goods.bag.bagId) ??
                          false;
                      if (succeed == true) {
                        _load();
                      }
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        R.img(Util.getRemoteImgUrl(goods.bag.imageBg),
                            width: constraints.maxWidth, fit: BoxFit.fitWidth),
                        R.img(Util.getRemoteImgUrl(goods.bag.image),
                            width: 149, fit: BoxFit.fitWidth),
                        PositionedDirectional(
                          bottom: 0.dp,
                          height: 60.dp,
                          width: constraints.maxWidth,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: BackdropFilter(
                              filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                  alignment: AlignmentDirectional.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFAC96EB)
                                          .withOpacity(0.4)),
                                  padding: EdgeInsetsDirectional.only(
                                      start: 12.dp, end: 12.dp),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              goods.bag.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.dp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Row(
                                              children: [
                                                R.img(MoneyConfig.moneyIcon,
                                                    height: 10.dp,
                                                    wholePath: true,
                                                    fit: BoxFit.fitHeight),
                                                NumText(
                                                  "${goods.bag.price}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      if (goods.bag.totalPayNum > 0 &&
                                          goods.bag.totalPayNum >=
                                              goods.bag.totalAlreadyPayNum)
                                        Container(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 6.dp, end: 6.dp),
                                          height: 18.dp,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6.dp)),
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Text(
                                              goods.bag.totalAlreadyPayNum == 0
                                                  ? K.mall_selection_limit([
                                                      "${goods.bag.totalPayNum}"
                                                    ])
                                                  : K.mall_selection_last([
                                                      "${goods.bag.totalPayNum - goods.bag.totalAlreadyPayNum}",
                                                      "${goods.bag.totalPayNum}"
                                                    ]),
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xFF9482D3),
                                                  fontSize: 12.dp,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ));
              })),
        ],
      ),
    );
  }

  /// banner
  Widget _buildBanner(List<ShopBanner> bannerList) {
    if (bannerList.isNotEmpty) {
      return MallBannerWidget(datas: bannerList);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildGoods(int index, {bool showMore = false}) {
    if (index >= rsp.data.bagList.length) {
      return const SizedBox.shrink();
    }
    Widget title = _buildTitle(rsp.data.bagList[index].name,
        showMore: showMore,
        count: rsp.data.bagList[index].countDown, onTap: () {
      VipMoreScreen.show(context, rsp.data.bagList[index].subset,
          title: rsp.data.bagList[index].name);
    });
    return Padding(
        padding: EdgeInsetsDirectional.only(start: padding, end: padding),
        child: _buildGoodsList(rsp.data.bagList[index].list, title));
  }

  Widget _buildTitle(String title,
      {bool showMore = false, int count = 0, VoidCallback? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 16.dp,
                color: R.colors.mainTextColor,
                fontWeight: FontWeight.w600)),
        SizedBox(width: 10.dp),
        if (count > 0) _buildTimer(count),
        const Spacer(),
        if (showMore)
          GestureDetector(
              onTap: () async {
                onTap?.call();
              },
              child: Row(
                children: [
                  Text(K.mall_more,
                      style: TextStyle(
                          fontSize: 12.dp,
                          color: R.colors.mainTextColor.withOpacity(0.5),
                          fontWeight: FontWeight.w400)),
                  R.img(Assets.vip$ic_next_small_svg,
                      height: 14.dp,
                      color: R.colors.mainTextColor.withOpacity(0.5)),
                ],
              ))
      ],
    );
  }

  Widget _buildTimer(int timeLast) {
    if (timeLast <= 0) {
      return const SizedBox.shrink();
    }
    return ValueListenableBuilder<int>(
        valueListenable: _elapsedTime,
        builder: (context, value, child) {
          int realTime = max(timeLast - _elapsedTime.value, 0); //实际剩余的时间
          if (realTime <= 0) {
            _destroyTimer();
          }
          int day = realTime ~/ (3600 * 24);
          int hour = (realTime ~/ 3600) % 24;
          int minute = (realTime % 3600) ~/ 60;
          int seconds = realTime % 60;
          var styleNum = TextStyle(
              fontSize: 14,
              color: const Color(0xFFFD5F7D),
              fontWeight: FontWeight.w900,
              fontFamily: Util.numFontFamily,
              package: ComponentManager.MANAGER_BASE_CORE);
          var styleTime = const TextStyle(
              fontSize: 8,
              color: Color(0xFFFD5F7D),
              fontWeight: FontWeight.w600);
          return RichText(
            text: TextSpan(children: [
              TextSpan(text: "$day", style: styleNum),
              TextSpan(text: K.mall_bonus_countdown_day, style: styleTime),
              TextSpan(text: "$hour", style: styleNum),
              TextSpan(text: K.mall_bonus_countdown_hour, style: styleTime),
              TextSpan(text: "$minute", style: styleNum),
              TextSpan(text: K.mall_bonus_countdown_minute, style: styleTime),
              TextSpan(text: "$seconds", style: styleNum),
              TextSpan(text: K.mall_bonus_countdown_second, style: styleTime),
            ]),
          );
        });
  }

  Widget _buildGoodsList(List<ShopGoods> list, Widget title) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 10.dp, bottom: 10.dp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          const SizedBox(height: 12),
          GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 8,
              childAspectRatio: 104 / 139,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                if (list.isEmpty)
                  const EmptyCommodityV3Widget()
                else
                  ...list.map((e) => _renderItem(e)).toList(),
              ]),
        ],
      ),
    );
  }

  Widget _renderItem(ShopGoods item) {
    if (item.cType == ShopType.CommodityType) {
      return VipMallV3GoodsItem(commodity: item.commodity, onBuy: () {});
    } else if (item.cType == ShopType.GiftBagType) {
      return VipMallV3BagsItem(bag: item.bag);
    }
    return const EmptyCommodityV3Widget();
  }

  @override
  void dispose() {
    super.dispose();
    _destroyTimer();
  }

  @override
  bool get wantKeepAlive => true;
}
