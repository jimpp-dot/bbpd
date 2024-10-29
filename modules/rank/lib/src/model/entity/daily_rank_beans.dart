import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_rank_beans.g.dart';

enum DailyRankType {
  charm, // 魅力榜
  contribution, // 贡献榜
}

@JsonSerializable()
class DailyRankItem {
  int uid;
  String name;
  String icon;
  String frame;
  int score;
  @JsonKey(name: 'self_frame')
  String selfFrame;

  DailyRankItem(
      this.uid, this.name, this.icon, this.frame, this.score, this.selfFrame);

  factory DailyRankItem.fromJson(Map<String, dynamic> json) =>
      _$DailyRankItemFromJson(json);
}

@JsonSerializable()
class DailyRankTopItem extends DailyRankItem {
  @JsonKey(name: 'number1_times')
  int topDays;

  DailyRankTopItem(super.uid, super.name, super.icon, super.frame, super.score,
      super.selfFrame, this.topDays);

  factory DailyRankTopItem.fromJson(Map<String, dynamic> json) =>
      _$DailyRankTopItemFromJson(json);
}

@JsonSerializable()
class DailyRankResponse extends BaseResponse {
  @JsonKey(name: 'number1')
  DailyRankTopItem? topItem;

  @JsonKey(name: 'list')
  List<DailyRankItem> items;

  DailyRankResponse(
      {super.success, super.msg, this.topItem, required this.items});

  factory DailyRankResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyRankResponseFromJson(json);
}

@JsonSerializable()
class DailyStarItem {
  int uid;
  String date;
  String name;
  String icon;

  DailyStarItem(this.uid, this.date, this.name, this.icon);

  factory DailyStarItem.fromJson(Map<String, dynamic> json) =>
      _$DailyStarItemFromJson(json);
}

@JsonSerializable()
class DailyStarResponse extends BaseResponse {
  @JsonKey(name: 'list')
  List<DailyStarItem> items;

  DailyStarResponse({super.success, super.msg, required this.items});

  factory DailyStarResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyStarResponseFromJson(json);
}

class DailyRankRepository {
  static Future<DailyRankResponse> getRankItems(
      DailyRankType type, int page) async {
    int tp = 0;
    if (type == DailyRankType.charm) tp = 1;

    String url = '${System.domain}rank/daily?tp=$tp&page=$page';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return DailyRankResponse(
            msg: response.error.toString(), success: false, items: []);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return DailyRankResponse(msg: res['msg'], success: false, items: []);
      }
      try {
        Map data = res['data'];
        data['success'] = true;
        DailyRankResponse responseData =
            DailyRankResponse.fromJson(data as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return DailyRankResponse(
            msg: R.array('xhr_error_type_array')[6], success: false, items: []);
      }
    } catch (e) {
      return DailyRankResponse(msg: e.toString(), success: false, items: []);
    }
  }

  static Future<DailyStarResponse> getStarItems(
      DailyRankType type, int page) async {
    int tp = 0;
    if (type == DailyRankType.charm) tp = 1;

    String url = '${System.domain}rank/dailystar?tp=$tp&page=$page';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return DailyStarResponse(
            msg: response.error.toString(), success: false, items: []);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return DailyStarResponse(msg: res['msg'], success: false, items: []);
      }
      try {
        Map data = res['data'];
        data['success'] = true;
        DailyStarResponse responseData =
            DailyStarResponse.fromJson(data as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return DailyStarResponse(
            msg: R.array('xhr_error_type_array')[6], success: false, items: []);
      }
    } catch (e) {
      return DailyStarResponse(msg: e.toString(), success: false, items: []);
    }
  }
}
