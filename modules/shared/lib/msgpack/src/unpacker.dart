part of msgpack;

const int _maxUint32 = 4294967295;
const bool _enableFastBinaryUnpacker = true;

dynamic unpack(input) {
  ByteBuffer buff;
  int offset = 0;

  if (input is TypedData) {
    buff = input.buffer;
    offset = input.offsetInBytes;
  } else if (input is List<int>) {
    buff = Uint8List.fromList(input).buffer;
  } else {
    throw ArgumentError.value(input, "input", "Not a byte source.");
  }

  if (_unpacker == null) {
    _unpacker = Unpacker(buff, offset);
  } else {
    _unpacker!.reset(buff, offset);
  }

  var value = _unpacker!.unpack();
  _unpacker!.data = null;
  return value;
}

Unpacker? _unpacker;

unpackMessage(input, factory(List fields)) {
  ByteBuffer? buff;
  int offset = 0;

  if (input is TypedData) {
    buff = input.buffer;
    offset = input.offsetInBytes;
  }

  if (input is List<int>) {
    buff = Uint8List.fromList(input).buffer;
  }

  if (buff == null) return;

  if (_unpacker == null) {
    _unpacker = Unpacker(buff);
  } else {
    _unpacker!.reset(buff, offset);
  }

  var value = _unpacker!.unpackMessage(factory);
  _unpacker!.data = null;
  return value;
}

class Unpacker {
  ByteData? data;
  int offset;

  Unpacker(ByteBuffer buffer, [this.offset = 0]) {
    data = buffer.asByteData();
  }

  void reset(ByteBuffer buff, int off) {
    data = buff.asByteData();
    offset = off;
  }

  unpack() {
    int type = data!.getUint8(offset++);

    if (type >= 0xe0) return type - 0x100;
    if (type < 0xc0) {
      if (type < 0x80)
        return type;
      else if (type < 0x90)
        return unpackMap(type - 0x80);
      else if (type < 0xa0)
        return unpackList(type - 0x90);
      else
        return unpackString(type - 0xa0);
    }

    switch (type) {
      case 0xc0:
        return null;
      case 0xc2:
        return false;
      case 0xc3:
        return true;

      case 0xc4:
        return unpackBinary(type);
      case 0xc5:
        return unpackBinary(type);
      case 0xc6:
        return unpackBinary(type);

      case 0xcf:
        return unpackU64();
      case 0xce:
        return unpackU32();
      case 0xcd:
        return unpackU16();
      case 0xcc:
        return unpackU8();

      case 0xd3:
        return unpackS64();
      case 0xd2:
        return unpackS32();
      case 0xd1:
        return unpackS16();
      case 0xd0:
        return unpackS8();

      case 0xd9:
        return unpackString(unpackU8());
      case 0xda:
        return unpackString(unpackU16());
      case 0xdb:
        return unpackString(unpackU32());

      case 0xdf:
        return unpackMap(unpackU32());
      case 0xde:
        return unpackMap(unpackU16());
      case 0x80:
        return unpackMap(unpackU8());

      case 0xdd:
        return unpackList(unpackU32());
      case 0xdc:
        return unpackList(unpackU16());
      case 0x90:
        return unpackList(unpackU8());

      case 0xca:
        return unpackFloat32();
      case 0xcb:
        return unpackDouble();
    }
  }

  ByteData unpackBinary(int type) {
    int count;

    var byteOffset = 0;

    if (type == 0xc4) {
      count = data!.getUint8(offset);
      byteOffset = 1;
    } else if (type == 0xc5) {
      count = data!.getUint16(offset);
      byteOffset = 2;
    } else if (type == 0xc6) {
      count = data!.getUint32(offset);
      byteOffset = 4;
    } else {
      throw Exception("Bad Binary Type");
    }

    offset += byteOffset;

    if (_enableFastBinaryUnpacker) {
      var result = data!.buffer.asByteData(offset, count);
      offset += count;
      return result;
    } else {
      var result = Uint8List(count);
      var c = 0;
      for (var i = offset; c < count; i++) {
        result[c] = data!.getUint8(i);
        c++;
      }
      offset += count;

      return result.buffer
          .asByteData(result.offsetInBytes, result.lengthInBytes);
    }
  }

  double unpackFloat32() {
    var value = data!.getFloat32(offset);
    offset += 4;
    return value;
  }

  double unpackDouble() {
    var buff = Uint8List.fromList(data!.buffer.asUint8List(offset, 8));
    offset += 8;
    return buff.buffer.asByteData().getFloat64(0);
  }

  unpackMessage(factory(List fields)) {
    List fields = unpack();
    return factory(fields);
  }

  int unpackU64() {
    var high = unpackU32();
    var low = unpackU32();
    return (high * (_maxUint32 + 1)) + low;
  }

  int unpackU32() {
    var num = 0;
    for (var i = 0; i < 4; i++) {
      num = (num << 8) | unpackU8();
    }
    return num;
  }

  int unpackU16() {
    var o = unpackU8();
    o = o << 8;
    o |= unpackU8();
    return o;
  }

  int unpackU8() {
    return data!.getUint8(offset++);
  }

  int unpackS64() {
    var bytes = [
      unpackU8(),
      unpackU8(),
      unpackU8(),
      unpackU8(),
      unpackU8(),
      unpackU8(),
      unpackU8(),
      unpackU8()
    ];

    var num = bytes[0];

    if ((num & 0x80) != 0) {
      var out = (num ^ 0xff) * 0x100000000000000;
      out += (bytes[1] ^ 0xff) * 0x1000000000000;
      out += (bytes[2] ^ 0xff) * 0x10000000000;
      out += (bytes[3] ^ 0xff) * 0x100000000;
      out += (bytes[4] ^ 0xff) * 0x1000000;
      out += (bytes[5] ^ 0xff) * 0x10000;
      out += (bytes[6] ^ 0xff) * 0x100;
      out += (bytes[7] ^ 0xff) + 1;
      return -out;
    } else {
      var out = num * 0x100000000000000;
      out += bytes[1] * 0x1000000000000;
      out += bytes[2] * 0x10000000000;
      out += bytes[3] * 0x100000000;
      out += bytes[4] * 0x1000000;
      out += bytes[5] * 0x10000;
      out += bytes[6] * 0x100;
      out += bytes[7];
      return out;
    }
  }

  int unpackS32() {
    var bytes = [unpackU8(), unpackU8(), unpackU8(), unpackU8()];
    var negate = (bytes[0] & 0x40) != 0;
    var x = 0;
    var o = 0;
    var carry = 1;
    for (var i = 3, m = 1; i >= 0; i--, m *= 256) {
      var v = bytes[o + i];

      if (negate) {
        v = (v ^ 0xff) + carry;
        carry = v >> 8;
        v &= 0xff;
      }

      x += v * m;
    }

    return negate ? -x : x;
  }

  int unpackS16() {
    int num = unpackU8() * 256 + unpackU8();
    if (num > 0x7FFF) return num - 0x10000;

    return num;
  }

  int unpackS8() {
    var num = unpackU8();
    return num < 0x80 ? num : num - 0x100;
  }

  String unpackString(int count) {
    String value =
        const Utf8Decoder().convert(data!.buffer.asUint8List(offset, count));

    offset += count;
    return value;
  }

  Map unpackMap(int count) {
    Map map = {};
    for (int i = 0; i < count; ++i) {
      map[unpack()] = unpack();
    }
    return map;
  }

  List unpackList(int count) {
    List list = [];
    list.length = count;
    for (int i = 0; i < count; ++i) {
      list[i] = unpack();
    }
    return list;
  }
}
