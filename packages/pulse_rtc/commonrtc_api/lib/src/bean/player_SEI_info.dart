import 'dart:typed_data';

class PlayerSEIInfo {
  int process;
  int duration;
  int playerState;
  int networkTime;
  int test = 0;

  static int bufSize = 6 * 4;

  PlayerSEIInfo(this.process, this.duration, this.playerState, this.networkTime,
      {this.test = 0});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {};
    params['process'] = process;
    params['duration'] = duration;
    params['playerState'] = playerState;
    params['networkTime'] = networkTime;
    params['test'] = test;
    return params;
  }

  factory PlayerSEIInfo.fromUint8List(Uint8List list) {
    ByteData src = list.buffer.asByteData();
    ByteData byteData = extractRawData(src);

    int offset = 0;
    int process = byteData.getUint32(offset);
    offset = offset + 4;
    int duration = byteData.getUint32(offset);
    offset = offset + 4;
    int playerState = byteData.getUint32(offset);
    offset = offset + 4;
    int networkTime = byteData.getUint64(offset);
    offset = offset + 8;
    int test = byteData.getUint32(offset);
    return PlayerSEIInfo(process, duration, playerState, networkTime,
        test: test);
  }

  Uint8List? toUint8List() {
    ByteData byteData = ByteData(bufSize);
    int offset = 0;
    byteData.setUint32(offset, process);
    offset = offset + 4;
    byteData.setUint32(offset, duration);
    offset = offset + 4;
    byteData.setUint32(offset, playerState);
    offset = offset + 4;
    byteData.setUint64(offset, networkTime);
    offset = offset + 8;
    byteData.setUint32(offset, test);
    ByteData? result = preventFromEmulation(byteData);
    if (result == null) {
      return null;
    }
    return result.buffer.asUint8List();
  }

  /// 媒体次要信息的输入没有做防竞争处理，所以内容不能携带 startCode，因此这里需要做防竞争处理。
  ///
  /// @param src 原始输入数据
  /// @return 防竞争处理后的数据
  static ByteData? preventFromEmulation(ByteData src) {
    // 最差情况，竞争的次数为 src.length / 2，因此需要添加 src.length / 2 个防竞争码，所以默认 ByteBuffer 长度为 src.length + src.length / 2
    int dstLength = (src.lengthInBytes * 3 / 2).ceil();
    ByteData dst = ByteData(dstLength);
    int zeroRun = 0; // 遇到0的次数

    int dp = 0;
    for (int sp = 0; sp < src.lengthInBytes; sp++) {
      if (dp >= dstLength) {
        print("preventFromEmulation dp >= dstLength?");
        return null;
      }

      if (zeroRun < 2) {
        if (src.getInt8(sp) == 0) {
          ++zeroRun;
        } else {
          zeroRun = 0;
        }
      } else {
        if ((src.getInt8(sp) & ~3) == 0) {
          // emulation_prevention_three_byte
          dst.setInt8(dp++, 0x03);
          if (dp >= dstLength) {
            print("preventFromEmulation dp >= dstLength?");
            return null;
          }
        }
        zeroRun = src.getInt8(sp) == 0 ? 1 : 0;
      }
      dst.setInt8(dp++, src.getInt8(sp));
    }

    if (dp == dstLength) {
      // 如果遇到最差的情况，那么dst就是结果，不需要再次拷贝
      return dst;
    } else {
      ByteData result = ByteData(dp);
      result = dst.buffer.asByteData(0, dp);
      return result;
    }
  }

  /// 解析做了防竞争后的数据，还原原始数据
  ///
  /// @return 原始数据
  static ByteData extractRawData(ByteData src) {
    int srcLength = src.lengthInBytes;
    // 最差的情况，一个竞争都没有，那么需要跟原来长度一致。
    ByteData dst = ByteData(srcLength);
    int i = 0;
    int len = 0;

    while (i + 2 < srcLength) {
      if (src.getInt8(i) == 0 && src.getInt8(i + 1) == 0 && src.getInt8(i + 2) == 3) {
        dst.setInt8(len++, src.getInt8(i++));
        dst.setInt8(len++, src.getInt8(i++));
        i++; // remove emulation_prevention_three_byte
      } else {
        dst.setInt8(len++, src.getInt8(i++));
      }
    }

    while (i < srcLength) {
      dst.setInt8(len++, src.getInt8(i++));
    }

    if (len == srcLength) {
      return dst;
    } else {
      ByteData result = ByteData(len);
      result = dst.buffer.asByteData(0, len);
      return result;
    }
  }

  @override
  String toString() {
    return 'process: $process, duration: $duration, playerState: $playerState, networkTime: $networkTime, test: $test';
  }

}
