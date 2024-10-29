import 'rtc_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class EffectFileManager {
  EffectFileManager._();

  static EffectFileManager inst = EffectFileManager._();

  static const String rtcEffectBaseDir = 'rtc_effect_dir';

  /// 保存网络文件在本地
  Future<File?> saveFile(String url) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String baseDir = join(documentsDirectory.path, rtcEffectBaseDir);
    String urlMd5 = RtcUtils.md5String(url);
    Directory directory = await Directory(baseDir).create(recursive: true);
    File file = File(join(directory.path, urlMd5));
    File tmpFile = File(join(directory.path, '${urlMd5}_temp'));

    if (await file.exists()) {
      return file;
    }
    if (await tmpFile.exists()) {
      await tmpFile.delete();
    }
    try {
      var resp = await RtcUtils.download(url, tmpFile.path);
      if (resp.statusCode == 200) {
        return await tmpFile.rename(file.path);
      }
    } catch (e) {
      print(e);
      await tmpFile.delete();
    }
    return null;
  }

}
