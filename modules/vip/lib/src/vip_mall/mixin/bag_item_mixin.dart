import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';

import '../../bag/model/bag_bean.dart';
import '../../pb/generated/store.pb.dart';
import '../model/commodity_base.dart';
import '../widget/chat_bubble_widget.dart';
import '../widget/enter_effect_widget.dart';

mixin BagItemMixin {
  Widget buildGift(IShopMailCommodity commodity) {
    var imageUrl = '';
    if (commodity is ShopMailCommodity) {
      imageUrl = commodity.image ?? '';
    } else if (commodity is StoreCommodityItem) {
      imageUrl = commodity.commodityImage ?? '';
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: 193,
      height: 193,
      fit: BoxFit.contain,
    );
  }

  Widget buildAchievementMedal(IShopMailCommodity commodity, {Map<String, dynamic>? map}) {
    Map<String, dynamic>? extra = {};
    String? avatar = '';
    String? image = '';
    if (commodity is ShopMailCommodity) {
      extra = handlerMap(commodity, map)!;
      avatar = commodity.avatar;
      image = commodity.image;
    }

    if (commodity is SimpleShopMailCommodity) {
      extra = handlerMap(commodity, map)!;
      avatar = commodity.avatar;
      image = commodity.image;
    }

    return Center(
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAvatar(
              shape: BoxShape.circle,
              size: 37,
              path: avatar,
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 成就勋章和名称
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: Util.parseIcon(image),
                      fit: BoxFit.fitWidth,
                      height: 26,
                      cachedHeight: 26.px,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      extra!['user_name'] ?? Session.name,
                      style: R.textStyle.medium14.copyWith(color: HexColor(extra['user_name_font_color'] ?? 'FFFFFFFF')),
                    )
                  ],
                ),
                const SizedBox(height: 2),

                /// 消息气泡
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  decoration: BoxDecoration(
                    color: HexColor(extra['bubble_bg_color'] ?? '#1FFFFFFF'),
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(5),
                      topEnd: Radius.circular(14),
                      bottomStart: Radius.circular(14),
                      bottomEnd: Radius.circular(14),
                    ),
                  ),
                  child: Text(
                    extra['bubble_desc'] ?? '我已经进房了呀～，快来',
                    style: R.textStyle.regular16.copyWith(fontSize: 15, color: HexColor(extra['bubble_font_color'] ?? 'FFFFFFFF')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBubble(IShopMailCommodity commodity, {Map<String, dynamic>? map}) {
    Map<String, dynamic>? extra = {};
    String? avatar = '';
    String? image = '';
    if (commodity is ShopMailCommodity) {
      extra = handlerMap(commodity, map)!;
      avatar = commodity.avatar;
      image = commodity.image;
    }

    if (commodity is SimpleShopMailCommodity) {
      extra = handlerMap(commodity, map)!;
      avatar = commodity.avatar;
      image = commodity.image;
    }

    BubbleCommodity item = BubbleCommodity.fromJson(extra);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatBubbleWidget(
          image: image ?? '',
          text: item.bubbleDescShort,
          color: item.getTextColor(),
          liveOnly: 0,
          liveLabel: '',
        ),
        const SizedBox(height: 10),
        ChatBubbleWidget(
          image: image ?? '',
          text: item.bubbleDescLong,
          color: item.getTextColor(),
          liveOnly: 0,
          liveLabel: '',
        ),
      ],
    );
  }

  Widget buildAvatar(IShopMailCommodity commodity) {
    String? avatar = '';
    String? image = '';

    if (commodity is ShopMailCommodity) {
      avatar = commodity.avatar;
      image = commodity.image;
    }

    if (commodity is SimpleShopMailCommodity) {
      avatar = commodity.avatar;
      image = commodity.image;
    }

    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          UserIconFrame(
            size: 80,
            frameUrl: image ?? '',
          ),
          CommonAvatar(
            path: avatar,
            shape: BoxShape.circle,
            size: 80 / 1.6,
          ),
        ],
      ),
    );
  }

  Widget buildEnterEffect(ShopMailCommodity commodity, {Map<String, dynamic>? map}) {
    Map<String, dynamic>? extra = {};
    if (commodity is BagGoods) {
      extra = handlerMap(commodity, map)!;
    }
    return EnterEffectWidget(
      image: commodity.image ?? '',
      extra: extra,
      liveOnly: commodity.liveOnly,
      liveLabel: commodity.liveLabel,
    );
  }

  Map<String, dynamic>? handlerMap(IShopMailCommodity? bagGoods, Map<String, dynamic>? map) {
    Map<String, dynamic>? extra;
    if (map != null) {
      extra = map;
    }
    if (bagGoods is BagGoods && bagGoods.extra is Map<String, dynamic>) {
      extra = bagGoods.extra;
    } else if (bagGoods is BagGoods && bagGoods.extra is Map<String, dynamic>) {
      extra = bagGoods.extra;
    }
    return extra;
  }
}
