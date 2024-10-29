import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rank/k.dart';

class CompanionValueWidget extends StatelessWidget {
  final int degree;
  final int staySecs;
  final Color? textColor;

  const CompanionValueWidget(this.degree, this.staySecs,
      {super.key, this.textColor});

  @override
  Widget build(BuildContext context) {
    int min = staySecs ~/ 60;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "${K.rank_intimacy} ${Util.numberToWString(degree)}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: R.color.thirdBrightColor,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          width: 2,
          height: 2,
          decoration: BoxDecoration(
              color: R.color.thirdBrightColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(1),
              )),
        ),
        const SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            K.rank_companion_time_minute([Util.numberToWString(min)]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: textColor ?? R.color.thirdTextColor,
            ),
          ),
        )
      ],
    );
  }
}
