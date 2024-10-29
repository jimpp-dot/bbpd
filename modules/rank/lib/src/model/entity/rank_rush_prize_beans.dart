import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rank_rush_prize_beans.g.dart';

@JsonSerializable()
class RankRushPrizeResponse extends BaseResponse {
  Map<dynamic, List<ShopMailCommodity>>? awards;

  @JsonKey(name: 'new_awards')
  RankRushPrizeNewAwards? newAwards;

  int top;

  RankRushPrizeResponse(
      {super.success, super.msg, this.awards, this.newAwards, this.top = 0});

  factory RankRushPrizeResponse.fromJson(Map<String, dynamic> json) =>
      _$RankRushPrizeResponseFromJson(json);
}

@JsonSerializable()
class RankRushPrizeNewAwards {
  String type;
  int num;
  String desc;
  String image;

  @JsonKey(name: 'image_bg')
  String imageBg;

  RankRushPrizeNewAwards(
      {this.type = '',
      this.num = 0,
      this.desc = '',
      this.image = '',
      this.imageBg = ''});

  factory RankRushPrizeNewAwards.fromJson(Map<String, dynamic> json) =>
      _$RankRushPrizeNewAwardsFromJson(json);
}

class RankRushPrizeRepository {
  static Future<RankRushPrizeResponse> getRankPrize(String type,
      {int? tab}) async {
    String url = '${System.domain}rank/awards?type=$type';

    if (tab != null) {
      url += '&tab=$tab';
    }

    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return RankRushPrizeResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return RankRushPrizeResponse(msg: res['msg'], success: false);
      }

      try {
        Map<String, dynamic> data = res['data'];
        data['success'] = true;

        RankRushPrizeResponse responseData =
            RankRushPrizeResponse.fromJson(data);
        return responseData;
      } catch (e) {
        return RankRushPrizeResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return RankRushPrizeResponse(msg: e.toString(), success: false);
    }
  }
}
