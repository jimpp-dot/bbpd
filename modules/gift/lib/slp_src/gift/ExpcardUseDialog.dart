import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';
import 'package:gift/slp_src/model/pb/slp_gift_extension.dart';

class ExpcardUseDialog extends StatelessWidget {
  final BbGiftPanelCommodities data;
  final BbGiftPanelGift? gift;

  const ExpcardUseDialog({Key? key, required this.data, this.gift})
      : super(key: key);

  static Future<int?> show(BuildContext context, BbGiftPanelCommodities data,
      BbGiftPanelGift? gift) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ExpcardUseDialog(data: data, gift: gift),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 20, end: 20, top: 25, bottom: 25),
              child: _buildBody(context),
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  size: 24,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(K.gift_prop_title([(data.name)]),
            style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(data.description,
            style: TextStyle(color: R.color.secondTextColor, fontSize: 14)),
        const SizedBox(height: 10),
        if (_hasGift()) _buildGiftItem(),
        const SizedBox(height: 20),
        _buildBtn(context),
      ],
    );
  }

  Widget _buildBtn(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop(0);
            },
            child: Container(
              height: 48,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Color(0xFFF5F5F5),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.gift_prop_cancel,
                style: const TextStyle(
                  color: Color(0xB3202020),
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InkWell(
            onTap: () async {
              Navigator.of(context).pop(_hasGift() ? 2 : 1);
            },
            child: Container(
              height: 48,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: LinearGradient(
                  colors: R.color.mainBrandGradientColors,
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.gift_prop_use,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGiftItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        CachedNetworkImage(
          placeholder: const CupertinoActivityIndicator(),
          imageUrl: gift?.giftIcon ?? Util.getGiftUrlSuffix(),
          width: 100,
          height: 100,
          cachedWidth: Util.getCommonCacheSize(100),
          cachedHeight: Util.getCommonCacheSize(100),
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(
          gift?.name ?? ' ',
          style: const TextStyle(
            color: Color(0xFF202020),
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 8),
        _renderPrice(gift!),
        const SizedBox(height: 10),
      ],
    );
  }

  /// 价格
  Widget _renderPrice(BbGiftPanelGift gift) {
    String unit;

    int num = gift.cnum;
    int cid = gift.cid;
    String type = gift.ctype;

    if (num > 0 &&
        cid > 0 &&
        (type == 'gift' || type == 'key' || type == 'coupon')) {
      String coin;
      String priceStr;
      if (type == 'gift' || type == 'key') {
        if (gift.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = (max(0, min(1, 1 - num)) * gift.price).toStringAsFixed(0);
          priceStr = '${gift.price}';
        } else if (gift.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin = (max(0, min(1, 1 - num)) * gift.price).toStringAsFixed(0);
          priceStr = '${gift.price}';
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(
              Util.parseInt((max(0, min(1, 1 - num)) * gift.price)));
          priceStr = MoneyConfig.moneyNum(Util.parseInt((gift.price)));
        }
      } else {
        int money = gift.price - gift.ductionMoney;
        if (gift.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = '$money';
          priceStr = '${gift.price}';
        } else if (gift.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin = '$money';
          priceStr = '${gift.price}';
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(money);
          priceStr = MoneyConfig.moneyNum(gift.price);
        }
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 2.0),
            child: Text(
              "$coin$unit",
              style: TextStyle(
                color: const Color(0xFF202020).withOpacity(0.7),
                fontSize: 13,
              ),
            ),
          ),
          Text(
            "$priceStr$unit",
            style: TextStyle(
              color: const Color(0xFF202020).withOpacity(0.7),
              fontSize: 13,
            ),
          )
        ],
      );
    }

    String priceStr;
    // 金币礼物单位为金
    if (gift.giftType == 'coin') {
      unit = K.gift_coin_unit;
      priceStr = '${gift.price}';
    } else if (gift.giftType == 'bean') {
      unit = K.gift_gold_bean_unit;
      priceStr = '${gift.price}';
    } else {
      unit = MoneyConfig.moneyName;
      priceStr = MoneyConfig.moneyNum(Util.parseInt(gift.price));
    }

    return Text(
      "$priceStr$unit",
      style: TextStyle(
        color: const Color(0xFF202020).withOpacity(0.7),
        fontSize: 13,
      ),
    );
  }

  bool _hasGift() {
    return (gift?.id ?? 0) > 0;
  }
}
