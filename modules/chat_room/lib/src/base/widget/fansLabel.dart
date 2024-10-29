import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class FansLabel extends StatelessWidget {
  final String? label;
  final double height;
  final String? levelIcon;
  final List<Color>? colors;

  static const String TAG = "FansLabel";

  const FansLabel(
    this.label,
    this.levelIcon,
    this.colors, {
    super.key,
    this.height = 22,
  });

  @override
  Widget build(BuildContext context) {
    if (Util.isStringEmpty(label) ||
        Util.isStringEmpty(levelIcon) ||
        Util.isCollectionEmpty(colors)) {
      return Container();
    }

    return _buildNew2(context);
  }

  Widget _buildNew2(BuildContext context) {
    double levelIconSize = height;

    double textBgHeight = 0.538 * height;

    double textSize = 0.42 * height;

    double paddingStart = 0.4615 * height;

    double paddingEnd = 0.16667 * height;

    double marginStart = 0.5 * height;

    double borderRadius = 0.5 * textBgHeight;

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: textBgHeight,
          margin: EdgeInsetsDirectional.only(start: marginStart),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(borderRadius),
                      bottomEnd: Radius.circular(borderRadius))
                  .resolve(Directionality.of(context)),
              gradient: LinearGradient(colors: colors!)),
          child: Stack(
            children: [
              Container(
                height: textBgHeight,
                padding: EdgeInsetsDirectional.only(
                    start: paddingStart, end: paddingEnd),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white.withOpacity(0.4), width: 1),
                  borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(borderRadius),
                          bottomEnd: Radius.circular(borderRadius))
                      .resolve(Directionality.of(context)),
                ),
                child: Text(
                  label ?? '',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: textSize,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ),
              PositionedDirectional(
                  end: 6,
                  child: R.img('fans/fans_label_bg_strip.png',
                      width: textBgHeight,
                      height: textBgHeight,
                      package: ComponentManager.MANAGER_BASE_ROOM)),
            ],
          ),
        ),
        PositionedDirectional(
            start: 0,
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(levelIcon ?? ''),
              width: levelIconSize,
              height: levelIconSize,
            ))
      ],
    );
  }

  static String getLevelIcon(int level, bool isNew) {
    String extraStr = '';
    if (isNew == true) {
      extraStr = 'n';
    }
    if (level < 1) {
      return "static/fansgruop/fanslevel$extraStr/v1_grey.png";
    } else {
      if (level > 36) {
        return "static/fansgruop/fanslevel$extraStr/v36.png";
      } else {
        return "static/fansgruop/fanslevel$extraStr/v$level.png";
      }
    }
  }

  static List<String> getLabelColors(level) {
    List<String> colors = [];
    if (level >= 1 && level <= 5) {
      colors = ['#31BABB', '#2EBCD9'];
    } else if (level >= 6 && level <= 10) {
      colors = ['#455CDF', '#7A65FF'];
    } else if (level >= 11 && level <= 20) {
      colors = ['#7541E3', '#B25DE9'];
    } else if (level >= 21 && level <= 30) {
      colors = ['#F03699', '#FF65ED'];
    } else if (level >= 31) {
      colors = ['#EF6270', '#FF6D4C'];
    } else {
      colors = ['#989898', '#C0C2C3'];
    }
    return colors;
  }
}
