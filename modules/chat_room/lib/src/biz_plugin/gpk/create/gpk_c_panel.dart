import 'dart:ui' as ui;
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_room/assets.dart';

import '../gpk_constants.dart';
import 'gpk_c_panel_position.dart';

/// 分组Pk创建面板，座位面板,目前只是支持1~4人位置
class GPKCreatePanel extends StatefulWidget {
  final List<GPKCreatePosWidget> camp1;
  final List<GPKCreatePosWidget> camp2;

  const GPKCreatePanel({super.key, required this.camp1, required this.camp2});

  @override
  _GPKCreatePanelState createState() => _GPKCreatePanelState();
}

class _GPKCreatePanelState extends State<GPKCreatePanel> {
  /// 单行面板高度
  final double _initHeight = 120;

  /// 双行面板高度
  final double _twoLineHeight = 182;

  /// 一行的数量
  static const int LINE_COUNT = 2;

  @override
  void initState() {
    super.initState();
  }

  double get _widgetHeight {
    return _isSingleLine() ? _initHeight : _twoLineHeight;
  }

  bool _isSingleLine() {
    return widget.camp1.length <= LINE_COUNT &&
        widget.camp2.length <= LINE_COUNT;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _widgetHeight,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildBackground(),
          _buildPkImg(),
          ..._buildPositions(true),
          ..._buildPositions(false),
        ],
      ),
    );
  }

  /// 红蓝背景图
  _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: _widgetHeight,
      child: ClipRRect(
        borderRadius: const BorderRadiusDirectional.all(Radius.circular(12.0))
            .resolve(Directionality.of(context)),
        child: CustomPaint(
          painter: _PkBackgroundPainter(),
        ),
      ),
    );
  }

  /// 中间的PK图片
  _buildPkImg() {
    return R.img(RoomAssets.chat_room$gpk_gpk_ic_pk_png,
        width: 120, height: 120);
  }

  /// 左右区域的PK位
  List<PositionedDirectional> _buildPositions(bool left) {
    var list = left ? widget.camp1 : widget.camp2;
    var spacePos = calculateSpace(left, list);
    if (spacePos == null || spacePos.isEmpty) {
      return [];
    }

    /// 顺序摆放
    var retVal = <PositionedDirectional>[];
    for (int i = 0; i < spacePos.length; i++) {
      var pos = spacePos[i];
      var posWidget = list[i];
      retVal.add(left
          ? PositionedDirectional(
              start: pos.start,
              top: pos.top,
              child: posWidget,
            )
          : PositionedDirectional(
              end: pos.start,
              top: pos.top,
              child: posWidget,
            ));
    }
    return retVal;
  }

  /// 计算间距
  List<_PutSpacePosition>? calculateSpace(
      bool left, List<GPKCreatePosWidget>? list) {
    if (list == null || list.isEmpty) {
      return null;
    }
    var len = list.length;
    var singleLine = _isSingleLine();
    double top = singleLine ? 26 : 57;
    if (len == 1) {
      return [_PutSpacePosition(46, top)];
    } else if (len == 2) {
      var list = [_PutSpacePosition(16, top), _PutSpacePosition(80, top)];
      return left ? list : list.reversed.toList();
    } else if (len == 3) {
      var list = [_PutSpacePosition(16, 16), _PutSpacePosition(80, 16)];
      list = left ? list : list.reversed.toList();
      return [
        ...list,
        _PutSpacePosition(48, 98),
      ];
    } else if (len == 4) {
      var line1 = [_PutSpacePosition(16, 16), _PutSpacePosition(80, 16)];
      line1 = left ? line1 : line1.reversed.toList();

      var line2 = [_PutSpacePosition(16, 98), _PutSpacePosition(80, 98)];
      line2 = left ? line2 : line2.reversed.toList();

      return [...line1, ...line2];
    } else {
      Log.w(tag: 'gpk', 'create pk user num >4 !!!');
      return null;
    }
  }
}

/// 计算不同数量的PK人数排放坐标
class _PutSpacePosition {
  double start; // 横向开始间距
  double top; // 顶部间距
  _PutSpacePosition(this.start, this.top);
}

/// pk座位背景
class _PkBackgroundPainter extends CustomPainter {
  double leftRatio = 0.5;

  late Paint leftPaint;
  late Paint rightPaint;

  _PkBackgroundPainter() {
    leftPaint = Paint();
    leftPaint.isAntiAlias = true;
    leftPaint.style = PaintingStyle.fill;

    rightPaint = Paint();
    rightPaint.isAntiAlias = true;
    rightPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    double leftW = leftRatio * width + 0.1 * height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(leftW, 0);
    path.lineTo(leftW - 0.15 * height, height);
    path.lineTo(0, height);
    path.close();
    leftPaint.shader = ui.Gradient.linear(
      Offset(0, height / 2),
      Offset(leftW, height / 2),
      GPK_CAMP1_COLORS,
    );
    canvas.drawPath(path, leftPaint);

    path.reset();
    path.moveTo(leftW, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(leftW - 0.15 * height, height);
    path.close();
    rightPaint.shader = ui.Gradient.linear(
      Offset(width, height / 2),
      Offset(leftW, height / 2),
      GPK_CAMP2_COLORS,
    );
    canvas.drawPath(path, rightPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
