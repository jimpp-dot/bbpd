import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class WolfControllerIconWidget extends StatelessWidget {
  final int style;
  final double? wholeWidth;
  final double? wholeHeight;
  final double iconWidth;
  final double iconHeight;
  final String icon;
  final String text;
  final Color textColor;
  final VoidCallback? onClick;

  const WolfControllerIconWidget({
    super.key,
    this.style = 0,
    this.wholeWidth,
    this.wholeHeight,
    this.iconWidth = 36.0,
    this.iconHeight = 36.0,
    required this.icon,
    required this.text,
    this.textColor = Colors.white,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    if (style == 0) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(iconHeight),
          onTap: () {
            if (onClick != null) {
              onClick!();
            }
          },
          child: Container(
            width: iconWidth,
            height: iconHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  R.imagePath(
                    icon,
                    package: ComponentManager.MANAGER_WERE_WOLF,
                  ),
                ),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    }

    return Container();
  }
}
