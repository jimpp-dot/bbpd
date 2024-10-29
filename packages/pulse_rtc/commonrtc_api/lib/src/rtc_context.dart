import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class RtcContext {
  static const mainDir = 'commonrtc_api';
  static Directory? _temporaryDirectory;

  static Future<Directory> get temporaryDirectory async {
    if (_temporaryDirectory != null) {
      return _temporaryDirectory!;
    }
    var dir = await getTemporaryDirectory();
    dir = Directory(join(dir.path, mainDir));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    _temporaryDirectory = dir;
    return dir;
  }
}
