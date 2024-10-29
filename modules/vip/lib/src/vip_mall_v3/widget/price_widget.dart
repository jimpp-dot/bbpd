import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final PriceType priceType;
  final double? size;
  final int price;
  final int? subPrice;
  final bool fixPrice;

  const PriceWidget(
      {super.key,
      required this.price,
      required this.priceType,
      this.size = 10,
      this.subPrice = 0,
      this.fixPrice = true});

  @override
  Widget build(BuildContext context) {
    ///钻石
    if (PriceType.diamond == priceType) {
      return Row(children: [
        R.img(MoneyConfig.moneyIcon,
            width: size, height: size, wholePath: true),
        NumText(
          "$price",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: R.colors.mainTextColor,
            fontFamily: Util.numFontFamily,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
          maxLines: 1,
        )
      ]);
    } else if (PriceType.diamond_score == priceType) {
      ///点亮积分+钻石
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          R.img(MoneyConfig.scoreIcon,
              width: size, height: size, wholePath: true),
          NumText(
            fixPrice
                ? Util.numberToWString(subPrice ?? 0, fix: 2)
                : "${subPrice ?? 0}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: R.colors.mainTextColor,
              fontFamily: Util.numFontFamily,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
            maxLines: 1,
          ),
          if (price > 0)
            Column(children: [
              const SizedBox(height: 2),
              Row(children: [
                Text("+",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: R.colors.mainTextColor,
                    )),
                R.img(MoneyConfig.moneyIcon,
                    width: size, height: size, wholePath: true),
                NumText(
                  fixPrice ? Util.numberToWString(price, fix: 2) : "$price",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: R.colors.mainTextColor,
                    fontFamily: Util.numFontFamily,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  ),
                  maxLines: 1,
                ),
              ])
            ])
        ],
      );
    }
    return Text("unsupported",
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: R.colors.mainTextColor,
        ));
  }
}
