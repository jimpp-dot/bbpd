import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 标签item
class MomentTagItem extends StatelessWidget {
  final String? tag;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDeleteTap;
  final Color? background;
  final TextStyle? textStyleParam;
  final double? height;
  final double? maxWidth;
  final String? icon;
  final Color? iconColor;
  final Color? deleteIconColor;

  const MomentTagItem({
    super.key,
    this.tag,
    this.onTap,
    this.icon = 'ic_tag.svg',
    this.iconColor,
    this.onDeleteTap,
    this.deleteIconColor,
    this.background,
    this.height = 25,
    this.textStyleParam,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (tag == null || tag!.isEmpty) {
      return Container();
    }

    double end = 12;
    if (onDeleteTap != null) {
      end = 0;
    }

    TextStyle textStyle = textStyleParam ??
        TextStyle(
            color: R.color.mainTextColor,
            fontSize: 13,
            fontFamily: Util.fontFamily);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: EdgeInsetsDirectional.only(start: 10, end: end),
        decoration: BoxDecoration(
          color: background ?? R.color.thirdBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        constraints:
            maxWidth != null ? BoxConstraints(maxWidth: maxWidth!) : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 4.0),
              child: R.img(
                icon,
                package: ComponentManager.MANAGER_MOMENT,
                width: 16,
                height: 16,
                color: iconColor ?? textStyle.color,
              ),
            ),
            Flexible(
              child: Text(
                '$tag',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle,
              ),
            ),
            if (onDeleteTap != null)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onDeleteTap,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 4, bottom: 4, start: 12, end: 8),
                  child: R.img(
                    'ic_tag_delete.svg',
                    package: ComponentManager.MANAGER_MOMENT,
                    width: 16,
                    height: 16,
                    color: deleteIconColor ?? textStyle.color,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
