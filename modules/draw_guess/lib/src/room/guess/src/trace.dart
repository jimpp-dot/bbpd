import 'dart:ui';

import 'package:shared/shared.dart';

import 'base_painter.dart';

/// 传递给观众的轨迹数据，包含设备基本信息
class Trace {
  // 绘画人的画板大小
  final Size boardSize; // 12 bits width + 12 bits height

  final List<Segment> segments;

  Trace({required this.segments, required this.boardSize});

  // 获取占用多少bits
  int get bitSize {
    int bits = 8 + 24 + 16; // version + boardSize + segments.length
    for (Segment segment in segments) {
      bits += segment.bitSize;
    }
    return bits;
  }

  factory Trace.fromJson(Map<String, dynamic> json) {
    return Trace(
      segments: json['segments'] == null
          ? []
          : (json['segments'] as List).map((e) => Segment.fromJson(e)).toList(),
      boardSize: Size(Util.parseDouble(json['size']['width']),
          Util.parseDouble(json['size']['height'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'size': {
        'width': boardSize.width,
        'height': boardSize.height,
      },
      'segments':
          List.generate(segments.length, (index) => segments[index].toJson()),
    };
  }

  // 获取有多少个坐标点
  int get points {
    int size = 0;
    for (var segment in segments) {
      size += segment.points.length;
    }
    return size;
  }

  void updateSegments(List<Segment> list) {
    segments.clear();
    segments.addAll(list);
  }
}

/// 每一笔轨迹的数据
class Segment {
  final List<Point> points;

  // 操作
  final Operation op; // 1 bit

  // 画笔粗细
  final double strokeWidth; // 7 bits

  // 画笔颜色
  final Color color; // 32 bits

  Segment({
    required this.points,
    required this.op,
    required this.strokeWidth,
    required this.color,
  });

  int get bitSize {
    return 1 +
        7 +
        32 +
        points.length * Point.BIT_SIZE +
        16; // 16 bits 存放points.length
  }

  int get opBits {
    return op == Operation.draw ? 1 : 0;
  }

  int get strokeWidthBits {
    return strokeWidth.round().toUnsigned(7);
  }

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      points: json['points'] == null
          ? []
          : (json['points'] as List).map((e) => Point.fromJson(e)).toList(),
      op: Util.parseInt(json['op']) == 1 ? Operation.draw : Operation.erase,
      strokeWidth: Util.parseDouble(json['strokeWidth']),
      color: Color(Util.parseInt(json['color'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'op': op == Operation.draw ? 1 : 0,
      'strokeWidth': strokeWidth,
      'color': color.value,
      'points': List.generate(points.length, (index) => points[index].toJson()),
    };
  }
}

/// 每一点的数据
class Point {
  static const int BIT_SIZE = 32;

  // moveTo or lineTo
  bool start = false; // 2bits

  // local offset
  Offset offset; // 15 bits width + 15 bits height

  Point({required this.offset, this.start = false});

  int get startBits => start ? 1 : 0;

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      offset: Offset(Util.parseDouble(json['offset']['dx']),
          Util.parseDouble(json['offset']['dy'])),
      start: Util.parseBool(json['start']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'offset': {
        'dx': offset.dx,
        'dy': offset.dy,
      },
    };
  }
}
