import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';
import '../model/pb/slp_gift_extension.dart';

typedef OnGiftTaped = void Function(BbGiftPanelGift gift);

/// 礼物item 拍卖 送欧气
class SlpPageGiftItemBig extends StatefulWidget {
  final BbGiftPanelGift? gift;

  const SlpPageGiftItemBig({
    Key? key,
    this.gift,
  }) : super(key: key);

  @override
  _SlpPageGiftItemBigState createState() => _SlpPageGiftItemBigState();
}

class _SlpPageGiftItemBigState extends State<SlpPageGiftItemBig>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _scaleAnimation;

  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addListener(() {
        if (mounted) setState(() {});
      });
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildGiftItem(widget.gift);
  }

  _onGiftTaped(BbGiftPanelGift? gift) {
    _controller?.forward(from: 0);
    if (mounted) setState(() {});
  }

  Widget _buildGiftItem(BbGiftPanelGift? gift) {
    if (_controller?.isAnimating ?? false) {
      _scale = _scaleAnimation?.value ?? 1;
    } else {
      _scale = 1;
    }

    return GestureDetector(
      onTap: () => _onGiftTaped(gift),
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: _scale,
              child: CachedNetworkImage(
                placeholder: const CupertinoActivityIndicator(),
                imageUrl: gift?.giftIcon ?? '',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              gift?.name ?? ' ',
              style: TextStyle(
                color: (gift?.isnaming ?? 0) > 0
                    ? R.color.thirdBrightColor
                    : Colors.white,
                fontSize: 16.0,
              ),
              maxLines: 1,
            ),
            _renderPrice(gift, true),
          ],
        ),
      ),
    );
  }

  /// 价格
  Widget _renderPrice(BbGiftPanelGift? gift, bool selected) {
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
              Util.parseInt((max(0, min(1, 1 - num)) * (gift?.price ?? 0))));
          priceStr = MoneyConfig.moneyNum(Util.parseInt(((gift?.price ?? 0))));
        }
      } else {
        int money = (gift?.price ?? 0) - (gift?.ductionMoney ?? 0);
        if (gift?.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = '$money';
          priceStr = '${(gift?.price ?? 0)}';
        } else if (gift?.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin = '$money';
          priceStr = '${(gift?.price ?? 0)}';
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(money);
          priceStr = MoneyConfig.moneyNum((gift?.price ?? 0));
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
                fontSize: 13,
              ),
            ),
          ),
          Text(
            "$priceStr$unit",
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 13,
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
      priceStr = '${(gift?.price ?? 0)}';
    } else if (gift?.giftType == 'bean') {
      unit = K.gift_gold_bean_unit;
      priceStr = '${(gift?.price ?? 0)}';
    } else {
      unit = MoneyConfig.moneyName;
      priceStr = MoneyConfig.moneyNum(Util.parseInt((gift?.price ?? 0)));
    }

    return Text(
      "$priceStr$unit",
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 13,
      ),
    );
  }
}
