import 'package:shared/shared.dart';

import 'pb/generated/emotion.pb.dart';

class EmoteRepo {
  // 获取表情
  static Future<ResEmojiConfig> getEmotionConfig() async {
    String url = '${System.domain}go/yy/emoji/config?ver=1';
    ResEmojiConfig resp;
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      resp = ResEmojiConfig.fromBuffer(response.bodyBytes);
    } catch (e) {
      resp = ResEmojiConfig(success: false, msg: e.toString());
    }
    if (!resp.success) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
    return resp;
  }
}
