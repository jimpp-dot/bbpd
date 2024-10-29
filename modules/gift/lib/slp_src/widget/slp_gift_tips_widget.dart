import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/pb/slp_gift_extension.dart';

import '../../k.dart';

/// 礼物面板装扮提示
class SlpDecorateTipsWidget extends StatelessWidget {
  final BbGiftPanelDecorates? item;
  final int totalNum;

  final bool showDiscount;

  const SlpDecorateTipsWidget(
      {Key? key, this.item, this.totalNum = 1, this.showDiscount = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      color: Colors.black.withOpacity(0.7),
      child: Row(
        children: [
          buildImage(),
          const SizedBox(
            width: 4,
          ),
          Text(
            item?.panelTips ?? '',
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
          const Spacer(),
          _buildDiscountTips(),
        ],
      ),
    );
  }

  Widget buildImage() {
    if (item?.getDecorateType == ShopMailCommodityType.MicrophoneEffect ||
        item?.getDecorateType == ShopMailCommodityType.Frame) {
      return UserIconFrame(
        size: 32,
        frameUrl: item?.image ?? '',
      );
    }

    return RepaintBoundary(
      child: CachedNetworkImage(
        key: ValueKey(item?.image ?? ''),
        placeholder: const CupertinoActivityIndicator(),
        imageUrl: item?.image ?? '',
        height: formatGoodsType(item?.decorateType ?? '') ==
                ShopMailCommodityType.EnterEffect
            ? 20
            : 32,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  /// 折扣价
  Widget _buildDiscountTips() {
    if (totalNum == 0) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _renderDiscountPrice(),
        _renderOriginPrice(),
      ],
    );
  }

  /// 原始价格
  Widget _renderOriginPrice() {
    if ((!(item?.hasCoupon() ?? false) ||
            item?.coupon == null ||
            (item?.coupon.ductionMoney ?? 0) < 0) &&
        ((item?.ductionRate ?? 0) <= 0 || (item?.ductionRate ?? 0) >= 100)) {
      return const SizedBox.shrink();
    }

    String unit;
    int price = (item?.price ?? 0) * totalNum;
    String displayPrice;

    // 金币礼物单位为金
    if (item?.moneyType == 'coin') {
      unit = K.gift_coin_unit;
      displayPrice = "$price";
    } else if (item?.moneyType == 'bean') {
      unit = K.gift_gold_bean_unit;
      displayPrice = "$price";
    } else {
      unit = MoneyConfig.moneyName;
      displayPrice = MoneyConfig.moneyNum(price);
    }
    return Text(
      "$displayPrice$unit",
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 12,
        decoration: TextDecoration.lineThrough,
      ),
    );
  }

  Widget _renderDiscountPrice() {
    String unit;
    int price = (item?.price ?? 0) * totalNum;
    String displayPrice;

    if (showDiscount &&
        (item?.ductionRate ?? 0) > 0 &&
        (item?.ductionRate ?? 0) < 100) {
      price = (price * (item?.ductionRate ?? 0) / 100).ceil();
    } else if ((item?.hasCoupon() ?? false) &&
        item?.coupon != null &&
        (item?.coupon.ductionMoney ?? 0) > 0) {
      price = max(price - (item?.coupon.ductionMoney ?? 0), 0);
    }
    // 金币礼物单位为金
    if (item?.moneyType == 'coin') {
      unit = K.gift_coin_unit;
      displayPrice = '$price';
    } else if (item?.moneyType == 'bean') {
      unit = K.gift_gold_bean_unit;
      displayPrice = '$price';
    } else {
      unit = MoneyConfig.moneyName;
      displayPrice = MoneyConfig.moneyNum(price);
    }

    return Text(
      "$displayPrice$unit",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    );
  }
}
