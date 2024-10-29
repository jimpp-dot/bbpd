import 'package:shared/shared.dart';

class RecommendConfigRepo {
  /// 推荐进房接口, GET,  无参数
  static Future<ResHomeRecommendEnterRoom> getRecommendConfig() async {
    String url = '${System.domain}go/yy/home/enterRoom';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
      ResHomeRecommendEnterRoom data =
          ResHomeRecommendEnterRoom.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResHomeRecommendEnterRoom(msg: e.toString(), success: false);
    }
  }
}
