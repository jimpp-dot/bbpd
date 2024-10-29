import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'chat_bubble_widget.dart';

/// 商品列表item top
class CommodityBreakItemTop extends StatelessWidget {
  final double ratio;
  final IShopMailCommodity commodity;

  const CommodityBreakItemTop(
      {super.key, this.ratio = 1.0, required this.commodity});

  @override
  Widget build(BuildContext context) {
    switch (commodity.commodityType) {
      case ShopMailCommodityType.Title:
      case ShopMailCommodityType.Gift:
      case ShopMailCommodityType.Coupon:
      case ShopMailCommodityType.Defend:
      case ShopMailCommodityType.RadioDefend:
      case ShopMailCommodityType.Decorate:
      case ShopMailCommodityType.EnterEffect:
        return _buildEnterEffect();
      case ShopMailCommodityType.Frame:
      case ShopMailCommodityType.Bubble:
        return _buildBubble();
      case ShopMailCommodityType.MicrophoneEffect:
        return _buildMicroPhone();
      case ShopMailCommodityType.Unknown:
      default:
        return _buildGift();
    }
  }

  Widget _buildGift() {
    return Center(
      child: CachedNetworkImage(
        imageUrl: commodity.commodityImage,
        width: 70 * ratio,
        height: 70 * ratio,
        cachedWidth: 70.px,
        cachedHeight: 70.px,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildFrame() {
    return Center(
      child: SizedBox(
        width: 70 * ratio,
        height: 70 * ratio,
        child: CachedNetworkImage(
          key: ValueKey('frame-${commodity.commodityImage}'),
          imageUrl: commodity.commodityImage,
          width: 70 * ratio,
          height: 70 * ratio,
          cachedWidth: 70.px,
          cachedHeight: 70.px,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBubble() {
    return Center(
      child: Stack(
        children: [
          ChatBubbleWidget(
            image: commodity.commodityImage,
            text: commodity.commodityBubbleDesc,
            color: commodity.commodityBubbleFontColor,
            showText: ratio > 80 / 104,
            liveOnly: commodity.commodityLiveOnly,
            liveLabel: commodity.commodityLiveLabel,
          ),
        ],
      ),
    );
  }

  Widget _buildEnterEffect() {
    return Center(
      child: CachedNetworkImage(
        imageUrl: commodity.commodityImage,
        height: 25 * ratio,
        width: 70 * ratio,
        cachedHeight: 25.px,
        cachedWidth: 70.px,
      ),
    );
  }

  /// 麦上光圈
  Widget _buildMicroPhone() {
    return Center(
      child: SizedBox(
        width: 70 * ratio,
        height: 70 * ratio,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            RepaintBoundary(
              child: CachedNetworkImage(
                key: ValueKey('MicroPhone-${commodity.commodityImage}'),
                imageUrl: commodity.commodityImage,
                width: 72 * ratio,
                height: 72 * ratio,
                cachedWidth: 72.px,
                cachedHeight: 72.px,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
