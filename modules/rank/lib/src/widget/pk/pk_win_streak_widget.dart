import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../k.dart';

class PkWinStreakWidget extends StatelessWidget {
  final int? number;

  const PkWinStreakWidget({
    super.key,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    // return Stack(children: [
    //   R.img('bg_date_label.webp', width: 30, height: 20, fit: BoxFit.fill, package: ComponentManager.MANAGER_RANK),
    //   PositionedDirectional(end: 2, child: Text('$number')),
    // ],);
    if (number == 0 || number == null) {
      return Container();
    }
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned.fill(
          child: Container(
            margin: const EdgeInsetsDirectional.only(top: 2),
            child: CustomPaint(
              painter: ParallelogramPainter(),
            ),
          ),
        ),
        PositionedDirectional(
          child: Container(
            height: 16,
            padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  K.pk_streak_win,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text('x$number',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: Util.numFontFamily,
                      fontStyle: FontStyle.italic,
                    )),
              ],
            ),
            // child: Text('连胜x15', style: TextStyle(fontSize: 10, color: Colors.white),),
          ),
        ),
      ],
    );
  }
}

class ParallelogramPainter extends CustomPainter {
  late Paint bgPaint;
  List<Color>? bgColors;

  ParallelogramPainter({this.bgColors}) {
    bgColors ??= [const Color(0xFFFE6790), const Color(0xFF65A1FF)];

    bgPaint = Paint();
    bgPaint.isAntiAlias = true;
    bgPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(height / 3, 0);
    path.lineTo(width, 0);
    path.lineTo(width - height / 3, height);
    path.lineTo(0, height);
    path.close();
    bgPaint.shader = ui.Gradient.linear(
      Offset(0, height / 2),
      Offset(width, height / 2),
      bgColors!,
    );
    canvas.drawPath(path, bgPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
