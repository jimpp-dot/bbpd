import 'dart:math' as math;

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import 'buy_panel.dart';
import 'commodity_list_item_top.dart';
import 'popular_privilege_image_dialog.dart';
import 'package:provider/provider.dart' hide Selector;

/// 商品item
class VipMallGoodsItem extends StatelessWidget {
  final ShopMailCommodity commodity;
  final VoidCallback? onBuy;
  final String?
      from; // 商城一级界面first ，二级界面second, 联盟银币商城shop_union_silver, 联盟特权shop_union_privilege

  const VipMallGoodsItem(
      {super.key, required this.commodity, this.onBuy, this.from = 'first'});

  /// 商品点击
  static onItemTaped(BuildContext context, String? from,
      ShopMailCommodity commodity, VoidCallback? onBuy) async {
    _reportPageClickEvent(from, commodity);

    if (ShopMailCommodityType.RoomBackground == commodity.commodityType) {
      PopularPrivilegeImageDialog.show(context, commodity.imagePop ?? '',
          commodity.name ?? '', commodity.content ?? '', !commodity.isLimitBuy);
    } else {
      bool? isBuy = await BuyPanel.show(context,
          cid: commodity.cid, type: commodity.type);
      if (isBuy != null && isBuy) {
        context.read<ProfilePayload>().loadBagRedPoint();
        if (onBuy != null) {
          onBuy();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTaped(context, from, commodity, onBuy),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double ratio = constraints.maxWidth / 104;
          return Container(
            width: constraints.maxWidth,
            height: 139 * ratio,
            decoration: BoxDecoration(
              color: R.color.mainBgColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.04),
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildContent(ratio),
                if (commodity.isLimitBuy) _buildLimitBuyMask(ratio),
                ShopMailCommodityType.RoomBackground == commodity.commodityType
                    ? PositionedDirectional(
                        top: 6,
                        end: -35,
                        child: Transform.rotate(
                          angle: math.pi / 4,
                          child: Container(
                            width: 108,
                            height: 24,
                            alignment: AlignmentDirectional.center,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xffA16EFF),
                                Color(0xff687CFF)
                              ]),
                            ),
                            child: Text(
                              K.vip_popularity_private,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 11),
                            ),
                          ),
                        ),
                      )
                    : _buildCorner(ratio),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(double ratio) {
    return Column(
      children: [
        _buildBackground(ratio),
        Expanded(
          child: Container(
            alignment: AlignmentDirectional.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    commodity.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 13, color: R.color.mainTextColor),
                  ),
                ),
                SizedBox(height: 1 * ratio),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _buildDesc(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildMoneyTypeIcon(String moneyType, double size) {
    if ('union_gold' == moneyType) {
      return R.img('ic_union_gold_money.webp',
          width: size,
          height: size,
          package: ComponentManager.MANAGER_BASE_CORE);
    } else if ('union_silver' == moneyType) {
      return R.img('ic_union_silver_money.webp',
          width: size,
          height: size,
          package: ComponentManager.MANAGER_BASE_CORE);
    } else if ('coin' == moneyType) {
      return R.img('ic_coin.png',
          width: size,
          height: size,
          package: ComponentManager.MANAGER_BASE_CORE);
    } else if ('money' == moneyType) {
      return R.img(MoneyConfig.moneyIcon,
          width: size, height: size, wholePath: true);
    } else if ('bean' == moneyType) {
      return R.img(MoneyConfig.goldBeanIcon,
          width: size, height: size, wholePath: true);
    }
    return const SizedBox(
      width: 16.0,
      height: 16.0,
    );
  }

  static void _reportPageClickEvent(String? from, ShopMailCommodity commodity) {
    TrackEvent event;
    if (from == 'second') {
      event = TrackEvent.shop_secondpage;
    } else {
      event = TrackEvent.shop_firstpage;
    }

    Tracker.instance.track(event, properties: {
      'shop_page_click': 'item_card',
      'item_type': commodity.type ?? '',
      'item_id': '${commodity.cid}',
    });
  }

  Widget _buildDesc() {
    String descStr = commodity.desc ?? '';
    if ('money' == commodity.moneyType) {
      descStr =
          '${MoneyConfig.moneyNum(commodity.price)}${MoneyConfig.moneyName1}';
    } else if ('bean' == commodity.moneyType) {
      descStr = '${commodity.price}${K.vip_gold_bean}';
    }
    return Text(
      descStr,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 12, color: R.color.thirdTextColor),
    );
  }

  Widget _buildLimitBuyMask(double ratio) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.black.withOpacity(0.6),
      ),
      alignment: AlignmentDirectional.topStart,
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 93 * ratio - 16 - 4, start: 4),
        child: R.img('ic_lock.svg',
            width: 16, height: 16, package: ComponentManager.MANAGER_BASE_CORE),
      ),
    );
  }

  Widget _buildCorner(double ratio) {
    if (commodity.isLimitBuy) {
      return PositionedDirectional(
        end: 4,
        top: 0,
        child: CachedNetworkImage(
          imageUrl: commodity.cornerIcon,
          height: 24,
          cachedHeight: 24.px,
          fit: BoxFit.fitHeight,
        ),
      );
    }

    if (commodity.cornerIcon != null && commodity.cornerIcon!.isNotEmpty) {
      return PositionedDirectional(
        start: 4,
        top: 93 * ratio - 18 - 4,
        child: CachedNetworkImage(
          imageUrl: commodity.cornerIcon,
          height: 18,
          cachedHeight: 18.px,
          fit: BoxFit.fitHeight,
        ),
      );
    } else if (commodity.cornerDesc != null &&
        commodity.cornerDesc!.isNotEmpty) {
      return PositionedDirectional(
        start: 4,
        top: 93 * ratio - 18 - 4,
        child: Container(
          height: 18,
          padding: const EdgeInsets.symmetric(horizontal: 7),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFF202020),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(
            commodity.cornerDesc ?? '',
            style: const TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildBackground(double ratio) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          child: CachedNetworkImage(
            imageUrl:
                (ShopMailCommodityType.RoomBackground == commodity.commodityType
                        ? commodity.image
                        : commodity.itemCover) ??
                    '',
            width: 104 * ratio,
            height: 93 * ratio,
            cachedWidth: (104 * ratio).px,
            cachedHeight: (93 * ratio).px,
            fit: BoxFit.cover,
          ),
        ),
        if (ShopMailCommodityType.RoomBackground != commodity.commodityType)
          CommodityListItemTop(ratio: ratio, commodity: commodity),
        if (!Util.isStringEmpty(commodity.gradeIcon)) _buildLevel(),
      ],
    );
  }

  Widget _buildLevel() {
    return PositionedDirectional(
      start: 4,
      top: 4,
      child: CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(commodity.gradeIcon ?? ''),
        height: 14,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class EmptyCommodityWidget extends StatelessWidget {
  const EmptyCommodityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double ratio = constraints.maxWidth / 104;
        return Container(
          width: constraints.maxWidth,
          height: 139 * ratio,
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.04),
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 104 * ratio,
                height: 93 * ratio,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [Color(0xFF6B6B6E), Color(0xFF434147)],
                  ),
                ),
                child: R.img('mall/ic_gift.svg',
                    package: ComponentManager.MANAGER_VIP,
                    width: 80 * ratio,
                    height: 80 * ratio),
              ),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          '暂无该级\n 别物品',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13, color: R.color.mainTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
