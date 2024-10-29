import 'dart:math';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import '../model/pb/slp_gift_extension.dart';
import '../../k.dart';

class SlpDiyGiftItem extends StatelessWidget {
  final BbGiftPanelDiyGift? gift;
  final bool selected;
  final bool showLoading;

  const SlpDiyGiftItem({
    Key? key,
    this.gift,
    required this.selected,
    this.showLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      height: 100,
      child: Stack(
        children: [
          selected
              ? MultiframeImage.network(
                  Util.getRemoteImgUrl(
                      'static/room/diy_gift_item_select_bg.webp'),
                  'gift',
                  width: 84,
                  height: 100,
                )
              : R.img(
                  Assets.diy_gift_item_bg_webp,
                  width: 84,
                  height: 100,
                  package: ComponentManager.MANAGER_GIFT,
                ),
          Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    placeholder: const CupertinoActivityIndicator(),
                    imageUrl: gift?.giftIcon ?? '',
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    gift?.name ?? ' ',
                    style: TextStyle(
                      color: (gift?.isnaming ?? 0) > 0
                          ? R.color.thirdBrightColor
                          : Colors.white,
                      fontSize: 12.0,
                    ),
                    maxLines: 1,
                  ),
                  _renderPrice(gift, selected),
                ],
              ),
              _renderNumBadge(gift),
            ],
          ),
          if (gift?.isLocked ?? false)
            PositionedDirectional(
              start: 6,
              top: 6,
              child: R.img(
                BaseAssets.ic_lock_svg,
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
            ),
          if (showLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }

  /// 价格
  Widget _renderPrice(BbGiftPanelDiyGift? gift, bool selected) {
    String unit;

    int num = gift?.cnum ?? 0;
    int cid = gift?.cid ?? 0;
    String type = gift?.ctype ?? '';

    if (selected &&
        num > 0 &&
        cid > 0 &&
        (type == 'gift' || type == 'key' || type == 'coupon')) {
      String coin;
      String priceStr;
      if (type == 'gift' || type == 'key') {
        if (gift?.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin =
              (max(0, min(1, 1 - num)) * (gift?.price ?? 0)).toStringAsFixed(0);
          priceStr = '${(gift?.price ?? 0)}';
        } else if (gift?.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin =
              (max(0, min(1, 1 - num)) * (gift?.price ?? 0)).toStringAsFixed(0);
          priceStr = '${(gift?.price ?? 0)}';
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(
              (max(0, min(1, 1 - num)) * (gift?.price ?? 0)));
          priceStr = MoneyConfig.moneyNum((gift?.price ?? 0) * 100);
        }
      } else {
        int money = (gift?.price ?? 0) - (gift?.ductionMoney ?? 0);
        if (gift?.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = '$money';
          priceStr = '${gift?.price ?? 0}';
        } else if (gift?.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin = '$money';
          priceStr = '${gift?.price ?? 0}';
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(money);
          priceStr = MoneyConfig.moneyNum(gift?.price ?? 0);
        }
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 2),
          Text(
            "$coin$unit",
            style: const TextStyle(color: Colors.white60, fontSize: 10),
          ),
          Text(
            "$priceStr$unit",
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 10,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.white60,
            ),
          )
        ],
      );
    }

    String priceStr;
    // 金币礼物单位为金
    if (gift?.giftType == 'coin') {
      unit = K.gift_coin_unit;
      priceStr = '${gift?.price ?? 0}';
    } else if (gift?.giftType == 'bean') {
      unit = K.gift_gold_bean_unit;
      priceStr = '${gift?.price ?? 0}';
    } else {
      unit = MoneyConfig.moneyName;
      priceStr = MoneyConfig.moneyNum(gift?.price ?? 0);
    }

    return Text(
      "$priceStr$unit",
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 10,
      ),
    );
  }

  /// 右上角背包物品数量角标
  Widget _renderNumBadge(BbGiftPanelDiyGift? gift) {
    if (gift?.isLocked ?? false) return const SizedBox.shrink();
    int cid = gift?.cid ?? 0;
    int num = gift?.cnum ?? 0;
    String type = gift?.ctype ?? '';
    String numStr = num > 999 ? '999+' : num.toString();

    TextStyle textStyle = const TextStyle(
        color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600);
    if (cid > 0 &&
        (type == 'gift' || type == 'key' || type == 'pub_drink') &&
        num > 0) {
      // 数量
      return PositionedDirectional(
        end: 5,
        top: 5,
        child: Container(
          height: 16,
          width: 26,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: R.color.thirdBrightColor,
            borderRadius: BorderRadius.circular(8.5),
          ),
          child: Text(
            numStr,
            style: textStyle,
          ),
        ),
      );
    } else if (cid > 0 && type == 'coupon') {
      // 优惠券
      return PositionedDirectional(
        end: 5,
        top: 5,
        child: Coupon(
          color: R.color.thirdBrightColor,
          child: Container(
            width: 24,
            height: 12,
            alignment: Alignment.center,
            child: Text(
              numStr,
              style: const TextStyle(
                fontSize: 9.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    } else if (gift?.tagList != null && gift?.tagList.isNotEmpty == true) {
      // 礼物标签
      int maxNum = 2;

      List<Widget> icons = gift!.tagList
          .take(min(maxNum, gift.tagList.length))
          .map((e) => _buildGiftTag(e))
          .toList();

      return PositionedDirectional(
        start: 8,
        top: 4,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: icons,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildGiftTag(BbGiftPanelTagList tag) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 2),
      child: CachedNetworkImage(
        imageUrl: tag.icon,
        height: 12,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
