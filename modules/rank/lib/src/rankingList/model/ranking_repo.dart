import 'package:shared/shared.dart';
import 'package:rank/src/rankingList/model/ranking_week_star_data.dart';

import 'ranking_main_screen_bean.dart';

class RankingRepo {
  /// 获取排行榜页面框架Tab
  static Future<DataRsp<List<FirstTab>>> newRankTab() async {
    try {
      String url = '${System.domain}rank/newRankTab?version=3';
      XhrResponse response = await Xhr.getJson(url);
      var resp = DataRsp.fromXhrResponse(response, (json) {
        if (json is Map) {
          return Util.parseList(json['tab_list'], (e) => FirstTab.fromJson(e));
        }
        return null;
      });
      return DataRsp<List<FirstTab>>(
          success: (resp.success) && resp.data != null,
          data: resp.data,
          msg: resp.success == true ? null : resp.msg);
    } catch (e) {
      Log.d(e);
      return DataRsp(msg: R.array('xhr_error_type_array')[5], success: false);
    }
  }

  /// 房间周星榜
  static Future<RankingWeekStarResponse> getRankingWeekStar(int page,
      {int tab = -1}) async {
    String url = '${System.domain}roomcharm/rankWeekStar';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'page': page.toString(),
            if (tab > -1) 'tab': tab.toString(),
          },
          throwOnError: true);

      if (response.error != null) {
        return RankingWeekStarResponse(
            success: false, msg: response.error.toString());
      }
      return RankingWeekStarResponse.fromJson(
          response.value() as Map<String, dynamic>);
    } catch (e) {
      Log.d(e);
      return RankingWeekStarResponse(success: false);
    }
  }
}
