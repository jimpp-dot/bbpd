import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// killer 爵位标签
class KillerUserNameWithNobilityTag extends StatelessWidget {
  final int? nobility;
  final double? width;
  final double height;
  final bool showTag;
  final String name;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxline;
  final Color? textColor;
  final Color? specialColor; //特殊房间，适配颜色

  final EdgeInsetsGeometry padding;

  const KillerUserNameWithNobilityTag({
    super.key,
    this.nobility = 0,
    this.width,
    this.height = 20, // 默认高度26，宽度自适应
    this.showTag = false,
    required this.name,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.padding = EdgeInsets.zero,
    this.textAlign = TextAlign.start,
    this.maxline = 1,
    this.textColor,
    this.specialColor,
  });

  @override
  Widget build(BuildContext context) {
    if (nobility == null || nobility! <= 0) {
      return Flexible(
          child: Text(
        name,
        maxLines: maxline,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor ?? R.color.mainTextColor,
            fontFamily: Util.fontFamily),
      ));
    }

    if (showTag) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: _title()),
          const SizedBox(
            width: 4,
          ),
          UserNobilityWidget(
            titleNew: nobility!,
            height: height,
          )
        ],
      );
    } else {
      return _title();
    }
  }

  Widget _title() {
    bool isUpperDuke = nobility! >= 70;

    if (isUpperDuke) {
      return ShaderMask(
        shaderCallback: (Rect bounds) => const LinearGradient(colors: [
          Color(0xffFEFF8E),
          Color(0xffFEFF87),
          Color(0xffFF8E49)
        ]).createShader(bounds),
        child: Text(name,
            overflow: TextOverflow.ellipsis,
            maxLines: maxline,
            textAlign: textAlign,
            style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: fontWeight,
                height: 1.0,
                fontFamily: Util.fontFamily)),
      );
    } else {
      return Text(name,
          overflow: TextOverflow.ellipsis,
          maxLines: maxline,
          textAlign: textAlign,
          style: TextStyle(
              fontSize: fontSize,
              color: nobility! >= 10
                  ? (specialColor ?? const Color(0xffFF7070))
                  : (textColor ?? R.color.mainTextColor),
              fontWeight: fontWeight,
              height: 1.0,
              fontFamily: Util.fontFamily));
    }
  }
}
