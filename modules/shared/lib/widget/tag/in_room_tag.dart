import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class InRoomTag extends StatelessWidget {
  final String? label;
  final Color? labelColor;
  final List<Color>? gradientBgColors;
  final double height;
  final double fontSize;
  final double tagEndPadding;
  final double tagStartPadding;

  const InRoomTag({
    super.key,
    this.label,
    this.labelColor,
    this.gradientBgColors,
    this.height = 16,
    this.fontSize = 9,
    this.tagEndPadding = 5,
    this.tagStartPadding = 4,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: height,
        constraints: const BoxConstraints(minWidth: 40),
        padding: EdgeInsetsDirectional.only(
          start: tagStartPadding,
          end: tagEndPadding,
        ),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          gradient: LinearGradient(
            colors: (gradientBgColors?.length ?? 0) >= 2
                ? gradientBgColors!
                : [const Color(0xff6fffe8), const Color(0xff6eb6ff)],
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RepaintBoundary(
              child: R.img(
                'in_room_status.webp',
                package: ComponentManager.MANAGER_BASE_CORE,
                width: 12,
                height: 12,
              ),
            ),
            const SizedBox(width: 1),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 1),
              child: Text(
                label ?? '',
                style: TextStyle(
                  color: labelColor ?? R.color.mainBgColor,
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
