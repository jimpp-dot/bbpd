import 'dart:math';
import 'package:shared/src/theme/themes.dart';
import 'package:flutter/material.dart';

class PieChartBean {
  int num;
  Color color;
  String? title;

  PieChartBean({required this.num, required this.color, this.title});
}

class PieChatWidget extends StatelessWidget {
  final List<PieChartBean> dataList;

  final Color? bgColor;

  /// 饼图直径
  final double? width;

  /// 饼图内环直径，无内环不传
  final double? innerWidth;

  const PieChatWidget({
    super.key,
    required this.dataList,
    this.width,
    this.innerWidth,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    if (width == null || width! <= 0) {
      return const SizedBox.shrink();
    }

    return Container(
      color: bgColor ?? R.color.mainBgColor,
      width: width,
      height: width,
      child: buildStack(),
    );
  }

  Stack buildStack() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        /// 饼图
        buildCustomPaint(),

        /// 纯色内环
        if (innerWidth != null && innerWidth! > 0)
          Container(
            width: innerWidth,
            height: innerWidth,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor ?? R.color.mainBgColor,
            ),
          ),
      ],
    );
  }

  CustomPaint buildCustomPaint() {
    return CustomPaint(
      size: Size(width!, width!),
      painter: CustomPiePainter(
        dataList,
      ),
    );
  }
}

/// 饼图绘制
class CustomPiePainter extends CustomPainter {
  /// 数据内容
  List<PieChartBean> list;

  CustomPiePainter(this.list);

  final Paint _paint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0;

  double radius = 0;
  double startRadius = 0.0;

  @override
  void paint(Canvas canvas, Size size) {
    radius = size.width / 2;

    //将原点移动到画布中心
    canvas.translate(size.width / 2, size.height / 2);

    double total = 0.0;
    for (var element in list) {
      total += element.num;
    }

    if (total == 0) {
      _paint.color = R.color.dividerColor;
      canvas.drawArc(
          Rect.fromCircle(center: const Offset(0, 0), radius: radius),
          startRadius,
          2 * pi,
          true,
          _paint);
      return;
    }

    for (var i = 0; i < list.length; i++) {
      var entity = list[i];
      _paint.color = entity.color;

      //计算所占的比例
      double flag = entity.num / total;

      //计算弧度
      double sweepRadius = flag * 2 * pi;

      double tagRadius = radius;

      canvas.drawArc(
          Rect.fromCircle(center: const Offset(0, 0), radius: tagRadius),
          startRadius,
          sweepRadius,
          true,
          _paint);

      startRadius += sweepRadius;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
