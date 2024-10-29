import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pk_rank_beans.g.dart';

enum PkDailyRankType {
  daily, // 日榜
  weekly, // 周榜
}

@JsonSerializable()
class PkDailyRankResponse extends BaseResponse
    with PageListResponse<PkDailyRankItem> {
  @JsonKey(name: 'prevNo1')
  PkDailyRankTopItem? topItem;

  @JsonKey(name: 'my')
  PkAnchorInfoItem? anchorInfoItem;

  @override
  @JsonKey(name: 'list')
  List<PkDailyRankItem> items;

  @JsonKey(fromJson: Util.parseInt)
  int total;

  @JsonKey(name: 'icons')
  HeaderFrame? headerFrame;

  @override
  @JsonKey(name: 'more', defaultValue: true)
  bool hasMore;

  PkDailyRankResponse(
      {super.success,
      super.msg,
      this.topItem,
      this.items = const [],
      this.total = 0,
      this.headerFrame,
      this.anchorInfoItem,
      this.hasMore = true});

  factory PkDailyRankResponse.fromJson(Map<String, dynamic> json) =>
      _$PkDailyRankResponseFromJson(json);
}

@JsonSerializable()
class PkDailyRankItem {
  @JsonKey(fromJson: Util.parseInt)
  int uid;
  String name;
  String icon;

  // String frame;
  @JsonKey(fromJson: Util.parseInt)
  int score;
  @JsonKey(name: 'con_win', fromJson: Util.parseInt)
  int winStreak;

  PkDailyRankItem(this.uid, this.name, this.icon, this.score, this.winStreak);

  factory PkDailyRankItem.fromJson(Map<String, dynamic> json) =>
      _$PkDailyRankItemFromJson(json);
}

@JsonSerializable()
class HeaderFrame {
  @JsonKey(
    name: '1',
  )
  String firstFrame;
  @JsonKey(
    name: '2',
  )
  String secondFrame;
  @JsonKey(
    name: '3',
  )
  String thirdFrame;
  @JsonKey(
    name: '4',
  )
  String famousFrame;

  HeaderFrame(
      this.firstFrame, this.secondFrame, this.thirdFrame, this.famousFrame);

  factory HeaderFrame.fromJson(Map<String, dynamic> json) =>
      _$HeaderFrameFromJson(json);
}

@JsonSerializable()
class PkAnchorInfoItem {
  @JsonKey(fromJson: Util.parseInt)
  int uid;
  @JsonKey(fromJson: Util.parseInt)
  int order;
  String name;
  String icon;
  @JsonKey(name: 'con_win', fromJson: Util.parseInt)
  int winStreak;
  @JsonKey(fromJson: Util.parseInt)
  int score;
  @JsonKey(name: 'win', fromJson: Util.parseInt)
  int winNumber;
  @JsonKey(fromJson: Util.parseInt)
  int total;

  // @JsonKey(fromJson: Util.parseDouble)
  // double winRate;

  PkAnchorInfoItem(this.uid, this.name, this.order, this.icon, this.winStreak,
      this.score, this.winNumber, this.total);

  factory PkAnchorInfoItem.fromJson(Map<String, dynamic> json) =>
      _$PkAnchorInfoItemFromJson(json);
}

@JsonSerializable()
class PkDailyRankTopItem extends PkDailyRankItem {
  @JsonKey(name: 'max(id)', fromJson: Util.parseInt)
  int topDays;

  PkDailyRankTopItem(super.uid, super.name, super.icon, super.score,
      super.winStreak, this.topDays);

  factory PkDailyRankTopItem.fromJson(Map<String, dynamic> json) =>
      _$PkDailyRankTopItemFromJson(json);
}

@JsonSerializable()
class PkDailyStarItem {
  @JsonKey(fromJson: Util.parseInt)
  int uid;
  @JsonKey(name: 'daily')
  String date;
  String name;
  String icon;

  PkDailyStarItem(this.uid, this.date, this.name, this.icon);

  factory PkDailyStarItem.fromJson(Map<String, dynamic> json) =>
      _$PkDailyStarItemFromJson(json);
}

@JsonSerializable()
class PkDailyStarResponse extends BaseResponse
    with PageListResponse<PkDailyStarItem> {
  @override
  @JsonKey(name: 'data')
  List<PkDailyStarItem> items;

  @override
  @JsonKey(name: 'more', defaultValue: true)
  bool hasMore;

  PkDailyStarResponse(
      {super.success, super.msg, this.items = const [], this.hasMore = true});

  factory PkDailyStarResponse.fromJson(Map<String, dynamic> json) =>
      _$PkDailyStarResponseFromJson(json);
}

@JsonSerializable()
class PkHistoryMyInfo {
  @JsonKey(fromJson: Util.parseInt)
  int total;
  @JsonKey(name: 'win', fromJson: Util.parseInt)
  int winRate;

  PkHistoryMyInfo(
    this.total,
    this.winRate,
  );

  factory PkHistoryMyInfo.fromJson(Map<String, dynamic> json) =>
      _$PkHistoryMyInfoFromJson(json);
}

@JsonSerializable()
class PkHistoryItem {
  @JsonKey(name: 'uid', fromJson: Util.parseInt)
  int anchorUid;
  @JsonKey(name: 'compete_uid', fromJson: Util.parseInt)
  int competeUid;
  @JsonKey(name: 'icon')
  String anchorIcon;
  @JsonKey(name: 'compete_icon')
  String competeIcon;
  @JsonKey(name: 'name')
  String anchorName;
  @JsonKey(name: 'compete_name')
  String competeName;
  @JsonKey(name: 'score', fromJson: Util.parseInt)
  int anchorScore;
  @JsonKey(name: 'compete_score', fromJson: Util.parseInt)
  int competeScore;
  @JsonKey(name: 'punish_content')
  String punishContent;

  // String punishIcon;
  // @JsonKey(fromJson: Util.parseInt)
  // int punishColor;
  @JsonKey(name: 'pk_time', fromJson: Util.parseInt)
  int pkTime;
  @JsonKey(fromJson: Util.parseInt)
  int win;

  PkHistoryItem(
      this.anchorUid,
      this.competeUid,
      this.anchorIcon,
      this.competeIcon,
      this.anchorName,
      this.competeName,
      this.anchorScore,
      this.competeScore,
      this.punishContent,
      this.pkTime,
      this.win);

  factory PkHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$PkHistoryItemFromJson(json);
}

@JsonSerializable()
class PkHistoryResponse extends BaseResponse
    with PageListResponse<PkHistoryItem> {
  @override
  @JsonKey(name: 'list')
  List<PkHistoryItem> items;

  @JsonKey(name: 'my')
  PkHistoryMyInfo? myInfo;

  @override
  @JsonKey(name: 'more', defaultValue: true)
  bool hasMore;

  PkHistoryResponse(
      {super.success,
      super.msg,
      this.items = const [],
      this.myInfo,
      this.hasMore = true});

  factory PkHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$PkHistoryResponseFromJson(json);
}

class PkRankRepository {
  static Future<PkDailyRankResponse> getRankItems(
      PkDailyRankType type, int page) async {
    String url = '${System.domain}games/pk/rank';
    try {
      Map<String, String> params = {
        'type': (type == PkDailyRankType.daily) ? 'day' : 'week'
      };
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return PkDailyRankResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return PkDailyRankResponse(msg: res['msg'], success: false);
      }
      try {
        Map data = res['data'];
        data['success'] = true;
        PkDailyRankResponse responseData =
            PkDailyRankResponse.fromJson(data as Map<String, dynamic>);
        responseData.headerFrame = HeaderFrame.fromJson(res['icons']);
        return responseData;
      } catch (e) {
        return PkDailyRankResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return PkDailyRankResponse(msg: e.toString(), success: false);
    }
  }

  static Future<PkDailyStarResponse> getStarItems(PkDailyRankType type) async {
    String url = '${System.domain}games/pk/dailyStar';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return PkDailyStarResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return PkDailyStarResponse(msg: res['msg'], success: false);
      }
      try {
        Map data = res;
        data['success'] = true;
        PkDailyStarResponse responseData =
            PkDailyStarResponse.fromJson(data as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return PkDailyStarResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return PkDailyStarResponse(msg: e.toString(), success: false);
    }
  }

  static Future<PkHistoryResponse> getHistoryItems(int rid, int page) async {
    String url = '${System.domain}games/pk/myHistory';
    try {
      Map<String, String> params = {'rid': '$rid', 'p': '$page'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return PkHistoryResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return PkHistoryResponse(msg: res['msg'], success: false);
      }
      try {
        Map data = res['data'];
        data['success'] = true;
        PkHistoryResponse responseData =
            PkHistoryResponse.fromJson(data as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return PkHistoryResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return PkHistoryResponse(msg: e.toString(), success: false);
    }
  }
}
