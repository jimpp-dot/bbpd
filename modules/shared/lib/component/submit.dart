import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Submit extends StatelessWidget {
  final String label;
  final VoidCallback onSubmit;
  final bool disabled;
  final EdgeInsetsDirectional margin;
  final double btnCircular;
  final bool needGradientColors;
  final String? disableBgPath;
  final String? ableBgPath;
  final bool? showNewStyle;
  const Submit({
    super.key,
    required this.label,
    required this.onSubmit,
    this.disabled = false,
    this.showNewStyle = false,
    this.margin = const EdgeInsetsDirectional.only(
        start: 45.0, end: 45.0, top: 40.0, bottom: 40.0),
    this.btnCircular = 20.0,
    this.needGradientColors = false,
    this.disableBgPath,
    this.ableBgPath,
  });

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration;

    if (showNewStyle == false) {
      boxDecoration = disableBgPath == null || ableBgPath == null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(btnCircular),
              // color: needGradientColors && disabled ? null : background,
              gradient: needGradientColors
                  ? LinearGradient(
                      colors: disabled
                          ? R.dColor.darkGradientColorsDisable
                          : R.dColor.darkGradientColors)
                  : null,
            )
          : BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    R.imagePath(disabled ? disableBgPath! : ableBgPath!)),
                fit: BoxFit.fill,
              ),
            );
    } else {
      boxDecoration = BoxDecoration(
        color: const Color(0xFF4AFFC0),
        borderRadius: BorderRadius.all(Radius.circular(btnCircular ?? 32)),
        boxShadow: const [
          BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, -4.0), //阴影y轴偏移量
              blurRadius: 0, //阴影模糊程度
              spreadRadius: 0 //阴影扩散程度
              ),
          BoxShadow(
              color: Color(0xFF0CA36F),
              offset: Offset(0.0, 4.0), //阴影y轴偏移量
              blurRadius: 0, //阴影模糊程度
              spreadRadius: 0 //阴影扩散程度
              ),
        ],
      );
    }
    return Container(
      margin: margin,
      child: InkWell(
        enableFeedback: true,
        onTap: disabled ? null : onSubmit,
        child: Container(
          height: 50.0,
          alignment: Alignment.center,
          decoration: boxDecoration,
          child: Text(
            label,
            textScaleFactor: 1.0,
            style: TextStyle(
              color: disabled ? Colors.black.withOpacity(0.5) : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
