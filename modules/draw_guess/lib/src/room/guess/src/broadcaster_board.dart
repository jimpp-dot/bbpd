import 'package:shared/shared.dart' hide Config;
import 'package:flutter/material.dart';

import 'broadcaster_painter.dart';
import 'config.dart';
import 'trace.dart';

typedef OnDrawEvent = void Function(Trace trace);

/// 画板，即绘制区域
class BroadcasterBoard extends StatefulWidget {
  final OnDrawEvent? onDraw;
  final Color? eraseColor;
  final Trace? initTrace;

  const BroadcasterBoard(
      {super.key, this.onDraw, this.eraseColor, this.initTrace});

  @override
  BroadcasterBoardState createState() => BroadcasterBoardState();
}

class BroadcasterBoardState extends State<BroadcasterBoard> {
  // all segments
  final List<Segment> _segments = [];

  Config? _config;

  // current segment
  Segment? _segment;

  BroadcasterPainter? _painter;

  // 指针是否越界
  bool _overstep = false;

//  Offset _lastOffset;

  RenderBox? _box;

  RenderBox? get box {
    return _box ??= context.findRenderObject() as RenderBox;
  }

  Size? _boxSize;

  Size? get boxSize {
    return _boxSize ??= context.size;
  }

  Offset? _boxOffset;

  Offset? get boxOffset {
    return _boxOffset ??= box?.localToGlobal(Offset.zero);
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _config = ShareConfig.of(context)?.config;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _init() {
    _segments.clear();
    if (widget.initTrace?.segments != null) {
      for (var element in widget.initTrace!.segments) {
        _segments.add(element);
      }
    }
    _painter = BroadcasterPainter(_segments, eraseColor: widget.eraseColor);
  }

  /// 撤销
  void undo() {
    if (_segments.isNotEmpty) {
      _segments.removeLast();
      _repaint();
      if (boxSize != null) {
        widget.onDraw?.call(Trace(segments: _segments, boardSize: boxSize!));
      }
    }
  }

  /// 重置
  void reset() {
    _init();
    refresh();
  }

  bool _isPositionInBox(Offset position) {
    if (boxOffset == null) return false;
    return position.dx > boxOffset!.dx &&
        position.dx < boxOffset!.dx + boxSize!.width &&
        position.dy > boxOffset!.dy &&
        position.dy < boxOffset!.dy + boxSize!.height;
  }

  void _repaint() {
    _painter = BroadcasterPainter(_segments, eraseColor: widget.eraseColor);
    refresh();
  }

  @override
  Widget build(BuildContext context) => _buildPainter();

  Widget _buildPainter() {
    return Listener(
      onPointerDown: (event) {
        if (_config == null) return;
        _overstep = false;
        Offset local = event.localPosition;
        _segment = Segment(
            points: [],
            op: _config!.op,
            strokeWidth: _config!.strokeWidth,
            color: _config!.paintColor);
        _segment?.points.add(Point(offset: local, start: true));
        _segments.add(_segment!);
        _repaint();
      },
      onPointerMove: (event) {
        if (event.delta != Offset.zero) {
          if (_isPositionInBox(event.position)) {
            Offset local = event.localPosition;
            if (_overstep) {
              _segment?.points.add(Point(offset: local, start: true));
              _overstep = false;
            } else {
              _segment?.points.add(Point(offset: local));
            }
            _repaint();
          } else {
            _overstep = true;
          }
        }
      },
      onPointerUp: (event) {
        if (boxSize != null) {
          widget.onDraw?.call(Trace(segments: _segments, boardSize: boxSize!));
        }
      },
      behavior: HitTestBehavior.opaque,
      child: CustomPaint(painter: _painter, size: Size.infinite),
    );
  }
}
