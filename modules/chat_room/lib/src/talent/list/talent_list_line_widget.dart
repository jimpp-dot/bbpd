import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../talent_constants.dart';
import 'serial_point_widget.dart';
import 'talent_programme_listitem.dart';

Widget positionListLineWidget({
  required int index,
  required bool performing,
  required bool isEditing,
  OnUpCallback? onUpCallback,
  OnDownCallback? onDownCallback,
}) {
  return PositionedDirectional(
    start: isEditing ? 11.dp : 14.dp,
    top: 0,
    bottom: 0,
    child: ListLineWidget(
      index: index,
      performing: performing,
      isEditing: isEditing,
      onUpCallback: onUpCallback,
      onDownCallback: onDownCallback,
    ),
  );
}

/// 左侧线控件，包含编辑模式，按钮，圆点。
class ListLineWidget extends StatelessWidget {
  final int index;
  final bool isEditing;
  final bool performing;
  final OnUpCallback? onUpCallback;
  final OnDownCallback? onDownCallback;

  const ListLineWidget({
    super.key,
    required this.index,
    required this.performing,
    required this.isEditing,
    this.onUpCallback,
    this.onDownCallback,
  });

  @override
  Widget build(BuildContext context) {
    Widget lineUp;
    if (index == 0) {
      if (isEditing) {
        lineUp = SizedBox(height: 5.dp);
      } else {
        lineUp = SizedBox(height: 18.dp);
      }
    } else {
      if (isEditing) {
        lineUp = SizedBox(height: 5.dp, child: _buildLine());
      } else {
        lineUp = SizedBox(height: 18.dp, child: _buildLine());
      }
    }

    Widget lineCenter;
    if (isEditing) {
      lineCenter = _buildEditArrow();
    } else {
      lineCenter = TalentSerialPointWidget(selected: performing);
    }

    return Column(
      children: [
        lineUp,
        lineCenter,
        Expanded(child: _buildLine()),
      ],
    );
  }

  Widget _buildLine() {
    return Container(
      width: 1.dp,
      height: double.infinity,
      color: talentMainTxtColor.withOpacity(0.1),
    );
  }

  Widget _buildEditArrow() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 1.dp),
        GestureDetector(
          onTap: () {
            onUpCallback?.call(index);
          },
          child: _buildTriangle(TriangleDirection.up),
        ),
        SizedBox(height: 4.dp),
        GestureDetector(
          onTap: () {
            onDownCallback?.call(index);
          },
          child: _buildTriangle(TriangleDirection.down),
        ),
        SizedBox(height: 1.dp),
      ],
    );
  }

  Widget _buildTriangle(direction) {
    double size = 25.dp;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: talentMainTxtColor.withOpacity(0.2),
            ),
          ),
          SizedBox(
            width: 8.dp,
            height: 6.dp,
            child: CustomPaint(
              painter: _TrianglePainter(
                Colors.white,
                direction: direction,
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum TriangleDirection {
  up,
  down,
}

class _TrianglePainter extends CustomPainter {
  Color color; //填充颜色
  late Paint _paint; //画笔
  late Path _path; //绘制路径
  TriangleDirection direction;

  _TrianglePainter(
    this.color, {
    this.direction = TriangleDirection.up,
  }) {
    _paint = Paint()
      ..strokeWidth = 1.0 //线宽
      ..color = color
      ..isAntiAlias = true;
    _path = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (direction == TriangleDirection.up) {
      _path.moveTo(0, size.height);
    } else {
      _path.moveTo(0, 0);
    }
    if (direction == TriangleDirection.up) {
      _path.lineTo(size.width * 0.5, 0);
    } else {
      _path.lineTo(size.width * 0.5, size.height);
    }
    if (direction == TriangleDirection.up) {
      _path.lineTo(size.width, size.height);
    } else {
      _path.lineTo(size.width, 0);
    }
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
