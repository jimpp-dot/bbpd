import 'dart:convert';
import 'package:crclib/catalog.dart';

class MusicUniqueId {
  static int getUniqueId(String name) {
    return int.parse(Crc32Xz().convert(utf8.encode(name)).toString());
  }
}
