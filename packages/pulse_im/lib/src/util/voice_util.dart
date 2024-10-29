import 'dart:convert';
import 'dart:io';

import 'package:pulse_im/pulse_im.dart';
import 'package:pulse_im/src/socket/local_user_data.dart';
import 'package:path/path.dart';

class VoiceUtil {
  static const COMMON_IMG_VOICE_DIR = "common_im_voice_dir";
  static const IOS_SUFFIX = "wav";
  static const ANDROID_SUFFIX = "amr";

  /// base64audioData这是格式始终是amr的
  static Future<String> getVoiceFilePath(String base64audioData, int messageId) async {
    String filePath = await _getVoiceFilePath(messageId);
    File file = File(filePath);
    print('file.path: $filePath');
    if (await file.exists()) {
      return filePath;
    }
    file.createSync(recursive: true);
    String rData = _replaceNoUseChar(base64audioData);
    if (Platform.isIOS) {
      /// IOS的转码为wav
      rData = _replaceNoUseChar(await PulseIMClient.convertAmrToWav(rData));
    }

    print("rData = $rData}");
    List<int> bytesData = base64.decode(rData);
    await file.writeAsBytes(bytesData);
    return filePath;
  }

  static String _getVoiceDir() {
    return join(LocalUserData.baseFileDir, COMMON_IMG_VOICE_DIR, LocalUserData.senderUserId);
  }

  static String _replaceNoUseChar(String base64) {
    return base64.replaceAll("\n", "").replaceAll("\r", "");
  }

  static Future<String> _getVoiceFilePath(int messageId) async {
    String suffix = Platform.isIOS ? IOS_SUFFIX : ANDROID_SUFFIX;
    String dir = _getVoiceDir();
    Directory baseDirectory = Directory(dir);
    await baseDirectory.create(recursive: true);
    return join(dir, "v_$messageId.$suffix");
  }

  /// IOS base64 wav格式，转换成amr格式音频
  static Future<String> convertWavToAmr(String base64Data) async {
    String rData = _replaceNoUseChar(base64Data);
    return await PulseIMClient.convertWavToAmr(rData);
  }

  static Future<String> convertAmrToWav(String base64Data) async {
    String rData = _replaceNoUseChar(base64Data);
    String result = await PulseIMClient.convertAmrToWav(rData);
    return _replaceNoUseChar(result);
  }
}
