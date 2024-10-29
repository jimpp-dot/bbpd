import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:shared/shared.dart';

import 'base_painter.dart';
import 'trace.dart';

GZipCodec _gzip = GZipCodec(level: ZLibOption.maxLevel);

class TraceCodec extends Codec<Trace?, String> {
  final bool gzip;

  const TraceCodec({this.gzip = true});

  @override
  Converter<Trace, String> get encoder => TraceEncoderV2(gzip: gzip);

  @override
  Converter<String, Trace?> get decoder => TraceDecoderV2(gzip: gzip);
}

class TraceEncoderV2 extends Converter<Trace, String> {
  final bool gzip;

  TraceEncoderV2({this.gzip = true});

  @override
  String convert(Trace input) {
    int bytes = (input.bitSize / 8).ceil();
    ByteData byteData = ByteData(bytes);
    int offset = 0;
    // version 8 bits
    byteData.setUint8(offset, 2);
    offset++;
    // width 12位 + height 高4位
    byteData.setUint16(
      offset,
      (input.boardSize.width.round().toUnsigned(12) << 4) |
          (input.boardSize.height.round().toUnsigned(12) >> 8),
    );
    offset += 2;
    // height 低8位
    byteData.setUint8(offset, input.boardSize.height.round().toUnsigned(8));
    offset++;

    // 存放segments的length
    byteData.setUint16(offset, input.segments.length.toUnsigned(16));
    offset += 2;

    // 存放segments
    for (Segment segment in input.segments) {
      // 1 bit op + 7 bits strokeWidth
      byteData.setUint8(offset, segment.opBits << 7 | segment.strokeWidthBits);
      offset++;
      // 32 bits color
      byteData.setUint32(offset, segment.color.value.toUnsigned(32));
      offset += 4;
      // 16 bits points length
      byteData.setUint16(offset, segment.points.length.toUnsigned(16));
      offset += 2;
    }
    // 存放points
    for (Segment segment in input.segments) {
      for (Point point in segment.points) {
        // 2 bits start flag + 15 bits dx + 15 bits dy
        byteData.setUint32(
          offset,
          point.startBits << 30 |
              point.offset.dx.round().toUnsigned(15) << 15 |
              point.offset.dy.round().toUnsigned(15),
        );
        offset += 4;
      }
    }

    List<int> list = byteData.buffer.asUint8List();
    if (gzip) {
      List<int> zipData = _gzip.encode(list);
      return base64Encode(zipData);
    } else {
      return base64Encode(list);
    }
  }
}

class TraceDecoderV2 extends Converter<String, Trace?> {
  final bool gzip;

  TraceDecoderV2({this.gzip = true});

  @override
  Trace? convert(String input) {
    if (Util.isStringEmpty(input)) return null;
    List<int> sourceData = base64Decode(input);
    if (gzip) {
      sourceData = _gzip.decode(sourceData);
    }

    ByteData byteData = Uint8List.fromList(sourceData).buffer.asByteData();
    int offset = 0;
    int version = byteData.getUint8(offset);
    offset++;
    if (version != 2) {
      throw Exception('data version[$version] != 2');
    }

    // width 12位 + height 高4位
    int bits16 = byteData.getUint16(offset);
    offset += 2;
    int bits8 = byteData.getUint8(offset);
    offset++;

    int width = bits16 >> 4;
    int height = bits16.toUnsigned(4) << 8 | bits8;
    ui.Size boardSize = ui.Size(width.toDouble(), height.toDouble());

    // segments.length
    int segmentsSize = byteData.getUint16(offset);
    offset += 2;
    List<Segment> segments = [];
    List<int> pointsSize = [];

    // 循环取出segment
    for (int i = 0; i < segmentsSize; i++) {
      // 1 bit op + 7 bits strokeWidth
      bits8 = byteData.getUint8(offset);
      offset++;
      Operation op = (bits8 >> 7 == 0) ? Operation.erase : Operation.draw;
      double strokeWidth = bits8.toUnsigned(7).toDouble();
      // 32 bits color
      ui.Color color = ui.Color(byteData.getUint32(offset));
      offset += 4;
      // 16 bits points length
      pointsSize.add(byteData.getUint16(offset));
      offset += 2;
      segments.add(
          Segment(points: [], op: op, strokeWidth: strokeWidth, color: color));
    }

    for (int i = 0; i < segmentsSize; i++) {
      Segment segment = segments[i];
      for (int j = 0; j < pointsSize[i]; j++) {
        // 2 bits start flag + 15 bits dx + 15 bits dy
        int pointBytes = byteData.getUint32(offset);
        offset += 4;
        bool start = pointBytes >> 30 != 0;
        double dx = (pointBytes.toUnsigned(30) >> 15).toDouble();
        double dy = pointBytes.toUnsigned(15).toDouble();
        segment.points.add(Point(offset: ui.Offset(dx, dy), start: start));
      }
    }

    return Trace(segments: segments, boardSize: boardSize);
  }
}
