import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/banban_rank_common.pb.dart';

class RankRepo {
  /// 歌手榜单
  static Future<ResSingerRank> getSingerRankList() async {
    String url = '${System.domain}go/yy/rank/singer';
    try {
      XhrResponse response = await Xhr.postPb(url, {});
      return ResSingerRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResSingerRank(success: false, msg: e.toString());
    }
  }
}
