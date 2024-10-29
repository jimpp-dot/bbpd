import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class PayDiamondItem extends StatefulWidget {
  final bool selected;

  final double? width;
  final double? height;

  const PayDiamondItem(
      {super.key, this.selected = false, this.height, this.width});

  @override
  _PayDiamondItemState createState() => _PayDiamondItemState();
}

class _PayDiamondItemState extends State<PayDiamondItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.selected
              ? R.color.mainBrandColor.withOpacity(0.08)
              : R.color.secondBgColor,
          border: widget.selected
              ? Border.all(
                  color: R.color.mainBrandColor,
                  width: 1,
                  style: BorderStyle.solid)
              : null),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              MoneyConfig.moneyIcon,
              width: 28.0,
              height: 28.0,
            ),
            NumText(
              '600',
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 21,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              '¥ 6.00',
              style: TextStyle(color: R.color.secondTextColor, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
