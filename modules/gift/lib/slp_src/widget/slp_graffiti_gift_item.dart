import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/slp_src/model/pb/slp_gift_extension.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

class SlpGraffitiGiftItem extends StatefulWidget {
  final BbGiftPanelGift? hostGift;
  final BbGiftPanelSpecialPlayItem? gift;
  final bool selected;

  const SlpGraffitiGiftItem(
      {super.key, this.hostGift, this.gift, this.selected = false});

  @override
  SlpGraffitiGiftItemState createState() {
    return SlpGraffitiGiftItemState();
  }
}

class SlpGraffitiGiftItemState extends State<SlpGraffitiGiftItem> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildGiftIcon(BbGiftPanelSpecialPlayItem? gift) {
    return CachedNetworkImage(
      placeholder: const CupertinoActivityIndicator(),
      imageUrl: gift?.giftIcon ?? '',
      width: 60,
      height: 60,
      cachedHeight: (60 * Util.devicePixelRatio).toInt(),
      cachedWidth: (60 * Util.devicePixelRatio).toInt(),
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildGiftIcon(widget.gift),
              Text(
                widget.gift?.title ?? ' ',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                maxLines: 1,
              ),
              _renderPrice(widget.hostGift, widget.gift, widget.selected),
            ],
          ),
          if (widget.gift?.isLocked ?? false)
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
          if (widget.selected)
            R.img(Assets.ic_gift_select_svg,
                package: ComponentManager.MANAGER_GIFT,
                fit: BoxFit.fill,
                color: const Color(0xff7d2ee6)),
        ],
      ),
    );
  }

  Widget _renderPrice(BbGiftPanelGift? hostGift,
      BbGiftPanelSpecialPlayItem? gift, bool selected) {
    String unit;

    int num = hostGift?.cnum ?? 0;
    int cid = hostGift?.cid ?? 0;
    String type = hostGift?.ctype ?? '';
    double price = (gift?.price ?? 0).toDouble();

    if (selected &&
        num > 0 &&
        cid > 0 &&
        (type == 'gift' || type == 'key' || type == 'coupon')) {
      String coin;
      String priceStr;
      if (type == 'gift' || type == 'key') {
        if (hostGift?.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = (max(0, min(1, 1 - num)) * price).toStringAsFixed(0);
          priceStr =
              Util.removeDecimalZeroFormat((gift?.price ?? 0).toDouble());
        } else if (hostGift?.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin = (max(0, min(1, 1 - num)) * price).toStringAsFixed(0);
          priceStr =
              Util.removeDecimalZeroFormat((gift?.price ?? 0).toDouble());
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(
              Util.parseInt((max(0, min(1, 1 - num)) * price)));
          priceStr = MoneyConfig.moneyNum(Util.parseInt(((gift?.price ?? 0))));
        }
      } else {
        double money =
            ((price).round() - Util.parseInt(hostGift?.ductionMoney)) / 100;
        if (hostGift?.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = Util.removeDecimalZeroFormat(money);
          priceStr =
              Util.removeDecimalZeroFormat((gift?.price ?? 0).toDouble());
        } else if (hostGift?.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin = Util.removeDecimalZeroFormat(money);
          priceStr =
              Util.removeDecimalZeroFormat((gift?.price ?? 0).toDouble());
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(Util.parseInt(money));
          priceStr = MoneyConfig.moneyNum(Util.parseInt(((gift?.price ?? 0))));
        }
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 2.0),
            child: Text(
              "$coin$unit",
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 10,
              ),
            ),
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
    if (hostGift?.giftType == 'coin') {
      unit = K.gift_coin_unit;
      priceStr = Util.removeDecimalZeroFormat((gift?.price ?? 0).toDouble());
    } else if (hostGift?.giftType == 'bean') {
      unit = K.gift_gold_bean_unit;
      priceStr = Util.removeDecimalZeroFormat((gift?.price ?? 0).toDouble());
    } else {
      unit = MoneyConfig.moneyName;
      priceStr = MoneyConfig.moneyNum(Util.parseInt(gift?.price ?? 0));
    }

    return Text(
      "$priceStr$unit",
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 10,
      ),
    );
  }
}
