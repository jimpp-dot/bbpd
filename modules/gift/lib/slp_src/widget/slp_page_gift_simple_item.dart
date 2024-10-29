import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/slp_src/gift/slp_page_gift.dart';
import '../model/pb/slp_gift_extension.dart';
import '../../k.dart';

class SlpGiftSimpleItem extends StatefulWidget {
  final OnGiftTaped? onGiftTaped;
  final bool selected;
  final int giftId;
  final BbGiftPanelGift? gift;

  const SlpGiftSimpleItem(
      {Key? key,
      this.onGiftTaped,
      this.selected = false,
      this.giftId = 0,
      this.gift})
      : super(key: key);

  @override
  _SlpGiftSimpleItemState createState() => _SlpGiftSimpleItemState();
}

class _SlpGiftSimpleItemState extends State<SlpGiftSimpleItem> {
  @override
  Widget build(BuildContext context) {
    return _giftMarryItem();
  }

  Widget _giftMarryItem() {
    return InkWell(
      onTap: () {
        if (widget.onGiftTaped != null && widget.gift != null) {
          widget.onGiftTaped!(widget.gift!);
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                widget.selected ? R.color.mainBrandColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CachedNetworkImage(
                  placeholder: const CupertinoActivityIndicator(),
                  imageUrl: widget.gift?.giftIcon ?? '',
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                  fadeInDuration: const Duration(microseconds: 0),
                  fadeOutDuration: const Duration(microseconds: 0),
                ),
                Text(
                  widget.gift?.name ?? ' ',
                  style: TextStyle(
                    color: (widget.gift?.isnaming ?? 0) > 0
                        ? R.color.thirdBrightColor
                        : R.color.mainTextColor,
                    fontSize: 12.0,
                  ),
                  maxLines: 1,
                ),
                _renderMarryPrice(widget.gift, widget.selected),
              ],
            ),
            // this._renderNumBadge(gift),
          ],
        ),
      ),
    );
  }

  Widget _renderMarryPrice(BbGiftPanelGift? gift, bool selected) {
    String unit;
    String priceStr = '${(gift?.price ?? 0)}';
    if (gift?.giftType == 'coin') {
      // 金币礼物单位为金
      unit = K.gift_coin_unit;
    } else if (gift?.giftType == 'bean') {
      // 金豆礼物
      unit = K.gift_gold_bean_unit;
    } else {
      unit = MoneyConfig.moneyName;
      priceStr = MoneyConfig.moneyNum((gift?.price ?? 0));
    }

    return Text(
      "$priceStr$unit",
      style: TextStyle(
        color: R.color.secondTextColor,
        fontSize: 10,
      ),
    );
  }
}
