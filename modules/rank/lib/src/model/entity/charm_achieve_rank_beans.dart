import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'charm_achieve_rank_beans.g.dart';

enum CharmAchieveRankType {
  charm, //魅力榜
  achieve, //成就榜
}

@JsonSerializable()
class CharmAchieveRankItem {
  int uid;
  int rank;
  String name;
  String icon;
  int score;
  int title;
  @JsonKey(name: 'title_new')
  int titleNew;

  @JsonKey(name: 'vip_level')
  int vipLevel;

  @JsonKey(name: 'popularity_level')
  int popularityLevel;

  CharmAchieveRankItem(
    this.uid,
    this.rank,
    this.name,
    this.icon,
    this.score,
    this.title,
    this.titleNew,
    this.vipLevel,
    this.popularityLevel,
  );

  factory CharmAchieveRankItem.fromJson(Map<String, dynamic> json) =>
      _$CharmAchieveRankItemFromJson(json);
}

@JsonSerializable()
class CharmAchieveMyRankItem {
  int uid;
  String rank;
  String name;
  String icon;
  int score;
  int title;

  @JsonKey(name: 'vip_level')
  int vipLevel;

  @JsonKey(name: 'popularity_level')
  int popularityLevel;

  @JsonKey(name: 'before_diff')
  int beforeDiff;

  CharmAchieveMyRankItem(this.uid, this.name, this.icon, this.score, this.title,
      this.vipLevel, this.popularityLevel, this.beforeDiff, this.rank);

  factory CharmAchieveMyRankItem.fromJson(Map<String, dynamic> json) =>
      _$CharmAchieveMyRankItemFromJson(json);
}

@JsonSerializable()
class CharmAchieveRankTopItem extends CharmAchieveRankItem {
  @JsonKey(name: 'number1_times')
  int topDays;

  CharmAchieveRankTopItem(
      int uid,
      int rank,
      String name,
      String icon,
      int score,
      int title,
      int titleNew,
      int vipLevel,
      int popularityLevel,
      this.topDays)
      : super(uid, rank, name, icon, score, title, titleNew, vipLevel,
            popularityLevel);

  factory CharmAchieveRankTopItem.fromJson(Map<String, dynamic> json) =>
      _$CharmAchieveRankTopItemFromJson(json);
}

@JsonSerializable()
class CharmAchieveRankPrizeItem {
  int cid;
  String type;
  String image;

  CharmAchieveRankPrizeItem(this.cid, this.type, this.image);

  factory CharmAchieveRankPrizeItem.fromJson(Map<String, dynamic> json) =>
      _$CharmAchieveRankPrizeItemFromJson(json);
}

@JsonSerializable()
class CharmAchieveRankResponse extends BaseResponse {
  @JsonKey(name: 'number1')
  CharmAchieveRankTopItem? topItem;

  @JsonKey(name: 'list')
  List<CharmAchieveRankItem> items;

  @JsonKey(name: 'my')
  CharmAchieveMyRankItem? my;

  @JsonKey(name: 'awards')
  Map<dynamic, List<CharmAchieveRankPrizeItem>>? awards;

  CharmAchieveRankResponse(
      {super.success,
      super.msg,
      this.topItem,
      required this.items,
      this.my,
      this.awards});

  factory CharmAchieveRankResponse.fromJson(Map<String, dynamic> json) =>
      _$CharmAchieveRankResponseFromJson(json);
}

@JsonSerializable()
class RankFameHallItem {
  int uid;
  String date;
  String name;
  String icon;

  RankFameHallItem(this.uid, this.date, this.name, this.icon);

  factory RankFameHallItem.fromJson(Map<String, dynamic> json) =>
      _$RankFameHallItemFromJson(json);
}

@JsonSerializable()
class RankFameHallResponse extends BaseResponse {
  @JsonKey(name: 'list')
  List<RankFameHallItem> items;

  RankFameHallResponse({super.success, super.msg, required this.items});

  factory RankFameHallResponse.fromJson(Map<String, dynamic> json) =>
      _$RankFameHallResponseFromJson(json);
}

class CharmAchieveRankRepository {
  static Future<CharmAchieveRankResponse> getRankItems(
      CharmAchieveRankType rankType, int tab, int page,
      {bool isLastWeek = false}) async {
    int type = 0;

    if (rankType == CharmAchieveRankType.charm) {
      type = 1;
    } else if (rankType == CharmAchieveRankType.achieve) {
      type = 2;
    }

    if (type == 0 || tab < 1 || tab > 2) {
      return CharmAchieveRankResponse(
          msg: R.array('xhr_error_type_array')[6], success: false, items: []);
    }

    String url =
        '${System.domain}rank/charmAchieve?type=$type&tab=$tab&page=$page';
    if (isLastWeek) {
      url = '$url&last=1';
    }

    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return CharmAchieveRankResponse(
            msg: response.error.toString(), success: false, items: []);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return CharmAchieveRankResponse(
            msg: res['msg'], success: false, items: []);
      }

      try {
        Map<String, dynamic> data = res['data'];
        data['success'] = true;
        CharmAchieveRankResponse responseData =
            CharmAchieveRankResponse.fromJson(data);
        return responseData;
      } catch (e) {
        return CharmAchieveRankResponse(
            msg: R.array('xhr_error_type_array')[6], success: false, items: []);
      }
    } catch (e) {
      return CharmAchieveRankResponse(
          msg: e.toString(), success: false, items: []);
    }
  }

  static Future<RankFameHallResponse> getFameItems(
      CharmAchieveRankType type, int tab, int page) async {
    int tp = -1;
    String url = '';

    if (tab == 1) {
      if (type == CharmAchieveRankType.achieve) {
        //成就日名人堂
        tp = 0;
      } else if (type == CharmAchieveRankType.charm) {
        //魅力日名人堂
        tp = 1;
      }

      if (tp < 0 || tp > 1) {
        return RankFameHallResponse(
            msg: R.array('xhr_error_type_array')[6], success: false, items: []);
      }

      url = '${System.domain}rank/dailystar?tp=$tp&page=$page';
    } else if (tab == 2) {
      if (type == CharmAchieveRankType.achieve) {
        //成就周名人堂
        tp = 1;
      } else if (type == CharmAchieveRankType.charm) {
        //魅力周名人堂
        tp = 2;
      }

      if (tp < 1 || tp > 2) {
        return RankFameHallResponse(
            msg: R.array('xhr_error_type_array')[6], success: false, items: []);
      }

      url = '${System.domain}rank/weeklyStar?type=$tp&page=$page';
    }

    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return RankFameHallResponse(
            msg: response.error.toString(), success: false, items: []);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return RankFameHallResponse(msg: res['msg'], success: false, items: []);
      }
      try {
        Map data = res['data'];
        data['success'] = true;

        RankFameHallResponse responseData =
            RankFameHallResponse.fromJson(data as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return RankFameHallResponse(
            msg: R.array('xhr_error_type_array')[6], success: false, items: []);
      }
    } catch (e) {
      return RankFameHallResponse(msg: e.toString(), success: false, items: []);
    }
  }
}
