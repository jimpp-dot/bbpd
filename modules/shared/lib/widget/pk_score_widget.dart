import 'dart:ui' as ui;
import 'package:shared/src/manager/ComponentManager.dart';
import 'package:shared/src/theme/themes.dart';
import 'package:shared/src/util.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;

import '../assets.dart';

class PkScoreWidget extends StatelessWidget {
  double leftRatio = 0;
  double? leftScore, rightScore;
  bool? roundCorner; //是否显示圆角
  double? height;
  bool noScore = false;
  bool displayScore = true; //分数是否显示
  List<Color>? leftColors;
  List<Color>? rightColors;
  bool showFlash = false;
  bool showDecimal = false; // 是否显示小数
  String? leftName; //左边显示名字
  String? rightName; //右边显示名字
  Widget? midWidget; //PK值中间的特效
  bool showFog = false; //展示迷雾
  bool showFogTranslucent = false; //展示透明迷雾

  bool showLeftAndRightIcon = false; //左右图标
  double? marginLR;

  PkScoreWidget(
    this.leftScore,
    this.rightScore, {
    super.key,
    this.roundCorner,
    this.height,
    this.displayScore = true,
    this.showFlash = false,
    this.showDecimal = false,
    this.leftName,
    this.rightName,
    this.leftColors,
    this.rightColors,
    this.midWidget,
    this.showFog = false,
    this.showFogTranslucent = false,
    this.showLeftAndRightIcon = false,
    this.marginLR = 0.0,
  }) {
    leftScore ??= 0;
    rightScore ??= 0;
    roundCorner ??= false;
    height ??= 20;
    if (leftScore == rightScore) {
      leftRatio = 0.5;
    } else {
      leftRatio = leftScore! / (leftScore! + rightScore!);
    }
    leftRatio = leftRatio.clamp(0.2, 0.8);
    leftName ??= '';
    rightName ??= '';
  }

  PkScoreWidget.noScore(
      {super.key, this.height, this.leftColors, this.rightColors}) {
    height ??= 12;
    noScore = true;
    leftRatio = 0.5;
  }

  @override
  Widget build(BuildContext context) {
    double mMarginLR = (marginLR ?? 0);

    if (noScore) {
      return SizedBox(
        width: double.infinity,
        height: height,
        child: CustomPaint(
          painter: _PkScorePainter(leftRatio, noScore,
              marginLR: mMarginLR,
              leftColors: leftColors,
              rightColors: rightColors),
        ),
      );
    }
    return LayoutBuilder(builder: (context, constrains) {
      return SizedBox(
        width: double.infinity,
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            if (showFogTranslucent == false)
              SizedBox(
                width: double.infinity,
                height: height,
                child: CustomPaint(
                  painter: _PkScorePainter(leftRatio, noScore,
                      marginLR: mMarginLR,
                      leftColors: leftColors,
                      rightColors: rightColors),
                ),
              ),
            if (showFogTranslucent == false && showLeftAndRightIcon)
              Positioned(
                  left: 0,
                  child: R.img(BaseAssets.pk_left_icon,
                      package: BaseAssets.package,
                      width: height,
                      height: height,
                      fit: BoxFit.fitHeight)),
            if (showFogTranslucent == false && showLeftAndRightIcon)
              Positioned(
                  right: 0,
                  child: R.img(BaseAssets.pk_lright_icon,
                      package: BaseAssets.package,
                      width: height,
                      height: height,
                      fit: BoxFit.fitHeight)),
            if (showFog == false)
              PositionedDirectional(
                start: leftRatio * constrains.maxWidth - 16,
                child: Container(
                  child: R.img(
                    'live/live_pk_score_progress_bar.webp',
                    width: 32.0,
                    height: 32.0,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
              ),
            if (showFlash == true)
              Align(
                alignment: FractionalOffset(leftRatio, 0),
                child: R.img(BaseAssets.shared$room_flash_webp,
                    width: height, height: height),
              ),
            if (displayScore)
              Row(
                children: [
                  SizedBox(width: 12 + mMarginLR),
                  Text(
                    showDecimal == true
                        ? '$leftName $leftScore'
                        : '$leftName ${leftScore?.toInt()}',
                    style: TextStyle(
                      fontSize: 0.6 * height!,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      height: 1,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    showDecimal == true
                        ? '$rightScore $rightName'
                        : '${rightScore?.toInt()} $rightName',
                    style: TextStyle(
                      fontSize: 0.6 * height!,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      height: 1,
                    ),
                  ),
                  SizedBox(width: 12 + mMarginLR),
                ],
              ),
            if (showFog || showFogTranslucent)
              PositionedDirectional(
                child: Container(
                  width: double.infinity,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          roundCorner == true ? height! / 2 : 0),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(Util.getImgUrl(
                            showFog
                                ? 'live/live_pk_fog_effect.webp'
                                : 'live/live_pk_fog_effect_translucent.webp',
                            package: ComponentManager.MANAGER_BASE_ROOM)),
                        fit: BoxFit.fill,
                      )),
                  child: showFog == true
                      ? Container(
                          child: Text(
                            '迷雾效果中，仅使用者方主播可见',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 0.6 * height!,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                          ),
                        )
                      : Container(),
                ),
              ),
          ],
        ),
      );
    });
  }
}

class _PkScorePainter extends CustomPainter {
  double leftRatio;

  late Paint leftPaint;
  late Paint rightPaint;
  late Paint middlePaint;
  final double? marginLR;
  bool noScore = false;
  List<Color>? leftColors;
  List<Color>? rightColors;

  _PkScorePainter(this.leftRatio, this.noScore,
      {this.leftColors, this.marginLR, this.rightColors}) {
    leftColors ??= [const Color(0xFFFF38B2), const Color(0xFFFF6991)];
    rightColors ??= [const Color(0xFF758EFF), const Color(0xFF60C8FF)];

    leftPaint = Paint();
    leftPaint.isAntiAlias = true;
    leftPaint.style = PaintingStyle.fill;

    rightPaint = Paint();
    rightPaint.isAntiAlias = true;
    rightPaint.style = PaintingStyle.fill;

    middlePaint = Paint();
    middlePaint.isAntiAlias = true;
    middlePaint.color = Colors.white;
    middlePaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    double margin = marginLR ?? 0;

    double leftW = leftRatio * width + 0.1 * height;
    final double radius = size.height / 2;
// 左侧带圆角的矩形
    final leftRRect = RRect.fromLTRBAndCorners(
      margin,
      0,
      leftW,
      size.height,
      topLeft: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
    );
    leftPaint.shader = ui.Gradient.linear(
      Offset(margin, height / 2),
      Offset(leftW, height / 2),
      leftColors!,
    );

    Path path = Path();
    path.moveTo(margin + radius, 0);
    path.lineTo(leftW, 0);
    path.lineTo(leftW - 0.15 * height, height);
    path.lineTo(margin + radius, height);
    path.close();

    canvas.drawPath(path, leftPaint);

    canvas.drawRRect(leftRRect, leftPaint);

    // 右侧带圆角的矩形
    final rightRRect = RRect.fromLTRBAndCorners(
      leftW,
      0,
      size.width - margin,
      size.height,
      topRight: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );

    rightPaint.shader = ui.Gradient.linear(
      Offset(width, height / 2),
      Offset(leftW, height / 2),
      rightColors!,
    );

    path.reset();
    path.moveTo(leftW, 0);
    path.lineTo(width - margin - radius, 0);
    path.lineTo(width - margin - radius, height);
    path.lineTo(leftW - 0.15 * height, height);
    path.close();
    canvas.drawRRect(rightRRect, rightPaint);

    canvas.drawPath(path, rightPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
