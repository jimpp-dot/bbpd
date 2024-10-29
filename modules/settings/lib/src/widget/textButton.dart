import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

enum TextButtonState {
  normal,
  disable,
}

class SettingTextButton extends StatelessWidget {
  const SettingTextButton({
    super.key,
    this.color,
    this.onPressed,
    this.title,
    this.marginHorizontal = 0.0,
    this.state = TextButtonState.normal,
  });

  final Color? color;
  final GestureTapCallback? onPressed;
  final double marginHorizontal;
  final String? title;
  final TextButtonState? state;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (state == TextButtonState.normal && onPressed != null) onPressed!();
      },
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
//        decoration: BoxDecoration(
//          color: state == TextButtonState.normal ? R.color.mainBrandColor : R.color.thirdBgColor,
//          borderRadius:  BorderRadius.all(
//            Radius.circular(4.0),
//          )
//        ),
        constraints: const BoxConstraints(minWidth: 75.0),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(title ?? '',
              style: TextStyle(
                  color: color ?? R.color.mainTextColor, fontSize: 13.0)),
        ),
      ),
    );
  }
}
