import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 礼物之王/礼物之星标签

class GiftKingOrStarTag extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String icon;
  final double width;
  final double height;

  const GiftKingOrStarTag(
      {Key? key,
      required this.icon,
      this.padding = EdgeInsets.zero,
      this.width = 108,
      this.height = 42})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Util.isStringEmpty(icon)) return const SizedBox.shrink();
    return Padding(
      padding: padding,
      child: CachedNetworkImage(
        imageUrl: icon,
        width: width,
        height: height,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class GiftKingOrStarWithGiftNameTag extends StatelessWidget {
  final String name;
  final String icon;
  final double width;
  final double height;
  final Color color;
  final double fontSize;
  final bool awakeGift;
  final Color? shadowColor;
  final AlignmentGeometry alignment;
  final BoxFit? iconFit;

  const GiftKingOrStarWithGiftNameTag(
      {Key? key,
      required this.name,
      required this.icon,
      this.width = 100,
      this.height = 39,
      this.color = Colors.white,
      this.fontSize = 12,
      this.alignment = AlignmentDirectional.center,
      this.awakeGift = false,
      this.shadowColor,
      this.iconFit = BoxFit.fitHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color shadowColor = const Color(0xff392728);
    shadowColor = shadowColor;
    bool isShowAwake = awakeGift && icon.isNotEmpty;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: alignment,
        children: [
          if (Util.validStr(icon))
            CachedNetworkImage(
              imageUrl: icon,
              width: width,
              height: height,
              fit: iconFit,
            ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: isShowAwake ? 10 : 0),
            child: GradientText(
              name,
              style: TextStyle(
                fontSize: fontSize,
                height: 1.1,
                color: color,
                fontFamily: 'YouSheBiaoTiYuan',
                overflow: TextOverflow.ellipsis,
                package: ComponentManager.MANAGER_BASE_CORE,
                shadows: isShowAwake
                    ? [
                        Shadow(
                            color: shadowColor,
                            blurRadius: 1,
                            offset: const Offset(0, 1))
                      ]
                    : null,
              ),
              maxLines: 1,
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: isShowAwake
                    ? const [
                        Color(0xffFFB6FA),
                        Color(0xffFFFEC2),
                        Color(0xffF4D87F)
                      ]
                    : [color, color, color],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
