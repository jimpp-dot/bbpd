import 'dart:math';

import 'package:chat_room/k.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 投票-两个用户投票PK
class VoteUserOptionProgress extends StatelessWidget {
  final VoteDynamic? left;
  final VoteDynamic? right;
  final double width;
  final double height;
  final double? radius;
  final bool showText;

  const VoteUserOptionProgress(
      {super.key,
      required this.width,
      required this.height,
      this.left,
      this.right,
      this.radius,
      this.showText = true});

  @override
  Widget build(BuildContext context) {
    double borderRadius = radius ?? height / 2;
    double total = ((left?.score ?? 0) + (right?.score ?? 0)).toDouble();
    double leftRate, rightRate;
    if (total == 0) {
      leftRate = 0.5;
      rightRate = 0.5;
    } else if ((left?.score ?? 0) >= (right?.score ?? 0)) {
      leftRate = (left?.score ?? 0).toDouble() / total;
      leftRate = max(leftRate, 0.2);
      leftRate = min(leftRate, 0.8);
      rightRate = 1 - leftRate;
    } else {
      rightRate = (right?.score ?? 0).toDouble() / total;
      rightRate = max(rightRate, 0.2);
      rightRate = min(rightRate, 0.8);
      leftRate = 1 - rightRate;
    }
    double offset = 15.dp;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          _renderLeft(leftRate, borderRadius, offset),
          _renderRight(rightRate, borderRadius, offset),
          if (showText) ...[
            PositionedDirectional(
              start: 10.dp,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  '${left?.score ?? 0}${K.vote_ticket}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            PositionedDirectional(
              end: 10.dp,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  '${right?.score ?? 0}${K.vote_ticket}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _renderLeft(double rate, double borderRadius, double offset) {
    double finalWidth = width * rate + offset;
    return PositionedDirectional(
      start: 0,
      top: 0,
      width: finalWidth,
      height: height,
      child: CustomPaint(
        size: Size(finalWidth, height),
        painter: _ProgressPainter(finalWidth, height, offset, true),
      ),
    );
  }

  Widget _renderRight(double rate, double borderRadius, double offset) {
    double finalWidth = width * rate + offset;
    return PositionedDirectional(
      end: 0,
      top: 0,
      width: finalWidth,
      height: height,
      child: CustomPaint(
        size: Size(finalWidth, height),
        painter: _ProgressPainter(finalWidth, height, offset, false),
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final double height; // 高度
  final double width; // 宽度
  final double offset;
  final bool left;
  final Paint _paint;

  _ProgressPainter(this.width, this.height, this.offset, this.left)
      : _paint = Paint()
          ..isAntiAlias = true
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.fill {
    Gradient gradient;
    if (left) {
      gradient =
          const LinearGradient(colors: [Color(0xFFFF029D), Color(0xFFFF94F7)]);
    } else {
      gradient =
          const LinearGradient(colors: [Color(0xFF5DC9FF), Color(0xFF5876FF)]);
    }
    Shader shader = gradient.createShader(
      Rect.fromLTWH(0, 0, width, height),
    );
    _paint.shader = shader;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = left ? _drawLeftPath() : _drawRightPath();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant _ProgressPainter oldDelegate) {
    return oldDelegate.width != width ||
        oldDelegate.height != height ||
        oldDelegate.offset != offset;
  }

  /// 圆角矩形绘制，从上部中间位置开始
  /// [rw] 矩形宽度
  /// [h] 矩形高度
  /// [percent] 百分比
  Path _drawLeftPath() {
    Path path = Path();
    // 圆角半径
    double r = height / 2;
    path.moveTo(r, 0);
    path.lineTo(width, 0);
    path.lineTo(width - 2 * offset, height);
    path.lineTo(r, height);
    path.addArc(Rect.fromLTWH(0, 0, 2 * r, 2 * r), 0.5 * pi, pi);

    return path;
  }

  /// 圆角矩形绘制，从上部中间位置开始
  /// [rw] 矩形宽度
  /// [h] 矩形高度
  /// [percent] 百分比
  Path _drawRightPath() {
    Path path = Path();
    // 圆角半径
    double r = height / 2;
    path.moveTo(2 * offset, 0);
    path.lineTo(width - r, 0);
    path.addArc(Rect.fromLTWH(width - 2 * r, 0, 2 * r, 2 * r), -0.5 * pi, pi);
    path.lineTo(0, height);
    path.lineTo(2 * offset, 0);
    return path;
  }
}
