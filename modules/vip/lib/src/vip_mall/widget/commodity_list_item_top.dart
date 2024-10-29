import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'chat_bubble_widget.dart';
import 'mall_goods_widget.dart';

/// 商品列表item top
class CommodityListItemTop extends StatelessWidget {
  final double ratio;
  final IShopMailCommodity commodity;

  const CommodityListItemTop({Key? key, this.ratio = 1.0, required this.commodity}) : super(key: key);

  String get _avatar => Util.isStringEmpty(commodity.commodityAvatar) ? Session.icon : commodity.commodityAvatar;

  @override
  Widget build(BuildContext context) {
    switch (commodity.commodityType) {
      case ShopMailCommodityType.EnterEffect:
        return _buildEnterEffect();
      case ShopMailCommodityType.Frame:
        return HeaderFrameWidget(
          _avatar,
          commodity.commodityImage,
          80 * ratio,
          commodityLiveOnly: commodity.commodityLiveOnly,
          commodityLiveLabel: commodity.commodityLiveLabel,
        );
      case ShopMailCommodityType.Bubble:
        return _buildBubble();
      case ShopMailCommodityType.MicrophoneEffect:
        return MicEffectWidget(_avatar, commodity.commodityImage, 90 * ratio);
      case ShopMailCommodityType.RoomListDecorate:
        return RoomListDecorate(_avatar, commodity.commodityImage, 96 * ratio);
      default:
        return _buildNormalWidget();
    }
  }

  Widget _buildNormalWidget() {
    // 道具和爵位宽度小点
    double height = (commodity.commodityType == ShopMailCommodityType.MysteryCard || commodity.commodityType == ShopMailCommodityType.Title)
        ? 45 * ratio
        : 90 * ratio;
    return CachedNetworkImage(
      imageUrl: commodity.commodityImage,
      width: 90 * ratio,
      height: height,
      fit: BoxFit.contain,
    );
  }

  Widget _buildBubble() {
    return ChatBubbleWidget(
      image: commodity.commodityImage,
      text: commodity.commodityBubbleDesc,
      color: commodity.commodityBubbleFontColor,
      liveOnly: commodity.commodityLiveOnly,
      liveLabel: commodity.commodityLiveLabel,
      ratio: ratio,
    );
  }

  Widget _buildEnterEffect() {
    return Stack(
      children: [
        CachedNetworkImage(
          key: ValueKey('enterEffect-${commodity.commodityImage}'),
          imageUrl: commodity.commodityImage,
          height: 34 * ratio,
          width: 96 * ratio,
          cachedWidth: (96 * ratio).px,
          cachedHeight: (34 * ratio).px,
        ),
        if (commodity.commodityLiveOnly == 1 && commodity.commodityLiveLabel.isNotEmpty)
          UserLiveLabelWidget(
            commodity.commodityLiveLabel,
            UserLiveLabelType.effect,
            bgHeight: 34 * ratio,
          ),
      ],
    );
  }
}
