import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String? text;
  final String? icon;
  final String? iconPkg;
  final Color? bgColor;
  final List<Color>? gradientColor;
  final Color? textColor;
  final double? width;
  final double height;
  final double? textSize;
  final double? iconWidth;
  final double? iconHeight;
  final EdgeInsetsDirectional? padding;
  final FontWeight? fontWeight;

  const LabelWidget({
    super.key,
    this.text,
    this.icon,
    this.iconPkg,
    this.width,
    required this.height,
    this.bgColor,
    this.gradientColor,
    this.textColor,
    this.textSize,
    this.iconWidth,
    this.iconHeight,
    this.padding,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        gradient: gradientColor != null
            ? LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: gradientColor!,
              )
            : null,
        borderRadius: BorderRadius.circular(100),
      ),
      width: width,
      height: height,
      padding: padding ?? const EdgeInsetsDirectional.only(start: 4, end: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (icon != null && icon!.isNotEmpty)
            SvgPicture.asset(
              icon!,
              width: iconWidth ?? height - 1,
              height: iconHeight ?? height - 1,
            ),
          if (text != null && text!.isNotEmpty)
            Text(
              text!,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: textSize,
                  fontWeight: fontWeight),
            ),
        ],
      ),
    );
  }
}

class UserSexAndAgeWidget extends StatelessWidget {
  final int? sex;
  final int? age;
  final double width;
  final double height;
  final double textSize;
  final double sexIconSize;
  final String? bgImg;

  const UserSexAndAgeWidget(
      {super.key,
      this.sex,
      this.age,
      this.width = 31,
      this.height = 14,
      this.textSize = 9,
      this.sexIconSize = 10,
      this.bgImg});

  @override
  Widget build(BuildContext context) {
    if (age == null || age! <= 0) {
      return UserSexWidget(sex: sex, size: height, iconSize: sexIconSize);
    }
    return Container(
      height: height,
      width: width,
      decoration: bgImg == null
          ? BoxDecoration(
              gradient: LinearGradient(
                  colors: sex == 1
                      ? R.color.translateGradientColors
                      : R.color.translateGradientColors),
              borderRadius: BorderRadius.all(Radius.circular(height / 2)),
            )
          : BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(bgImg!), fit: BoxFit.fill)),
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          R.img(
            sex == 1 ? "ic_male.webp" : "ic_female.webp",
            width: sexIconSize,
            height: sexIconSize,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
          const SizedBox(width: 2),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 1),
            child: NumText(
              '$age',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: textSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserSexWidget extends StatelessWidget {
  final double size;
  final int? sex;
  final double? iconSize;

  const UserSexWidget({
    super.key,
    this.sex,
    required this.size,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: sex == 1
                ? R.color.maleGradientColors
                : R.color.femaleGradientColors),
        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
      ),
      alignment: AlignmentDirectional.center,
      child: R.img(
        sex == 1 ? 'ic_male.webp' : 'ic_female.webp',
        width: iconSize ?? (size - 2),
        height: size - 2,
        package: ComponentManager.MANAGER_BASE_CORE,
      ),
    );
  }
}
