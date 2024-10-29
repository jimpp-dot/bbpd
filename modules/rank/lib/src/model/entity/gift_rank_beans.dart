import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rank/src/model/pb/generated/awake_rank.pb.dart';

part 'gift_rank_beans.g.dart';

enum GiftRankType {
  king, //礼物之王
  star, //礼物之星
}

@JsonSerializable()
class GiftRankItem {
  int uid;

  int stime; //周一0点时间戳

  @JsonKey(name: 'gift_id')
  int giftId;

  @JsonKey(name: 'gift_name')
  String giftName;

  @JsonKey(name: 'gift_num')
  int giftNum;

  @JsonKey(name: 'gift_worth')
  int giftWorth;

  @JsonKey(name: 'user_name')
  String name;

  @JsonKey(name: 'user_icon')
  String icon;

  int title;

  @JsonKey(name: 'title_new')
  int titleNew;

  @JsonKey(name: 'popularity_level')
  int popularityLevel;

  @JsonKey(name: 'vip_level')
  int vipLevel;

  @JsonKey(name: 'badge_icon')
  String badgeIcon;

  @JsonKey(name: 'awake_gift')
  bool awakeGift;

  GiftRankItem(
      this.uid,
      this.stime,
      this.giftId,
      this.giftName,
      this.giftWorth,
      this.name,
      this.icon,
      this.title,
      this.titleNew,
      this.popularityLevel,
      this.vipLevel,
      this.badgeIcon,
      this.giftNum,
      this.awakeGift);

  factory GiftRankItem.fromJson(Map<String, dynamic> json) =>
      _$GiftRankItemFromJson(json);
}

@JsonSerializable()
class GiftMyRankItem {
  int uid;
  String rank;
  String name;
  String icon;
  int title;

  @JsonKey(name: 'pupularity_level')
  int popularityLevel;

  @JsonKey(name: 'vip_level')
  int vipLevel;

  @JsonKey(name: 'before_diff')
  int beforeDiff;

  GiftMyRankItem(this.uid, this.rank, this.name, this.icon, this.title,
      this.popularityLevel, this.vipLevel, this.beforeDiff);

  factory GiftMyRankItem.fromJson(Map<String, dynamic> json) =>
      _$GiftMyRankItemFromJson(json);
}

@JsonSerializable()
class GiftRankPrizeItem {
  int cid;
  String type;
  String image;

  GiftRankPrizeItem(this.cid, this.type, this.image);

  factory GiftRankPrizeItem.fromJson(Map<String, dynamic> json) =>
      _$GiftRankPrizeItemFromJson(json);
}

@JsonSerializable()
class GiftRankResponse extends BaseResponse {
  @JsonKey(name: 'list')
  List<GiftRankItem> items;

  @JsonKey(name: 'my')
  GiftMyRankItem? my;

  @JsonKey(name: 'awards')
  Map<dynamic, List<GiftRankPrizeItem>>? awards;

  GiftRankResponse(
      {super.success, super.msg, required this.items, this.my, this.awards});

  factory GiftRankResponse.fromJson(Map<String, dynamic> json) =>
      _$GiftRankResponseFromJson(json);
}

class GiftRankRepository {
  static Future<GiftRankResponse> getAllGiftItems(
      GiftRankType rankType, int page,
      {bool lastWeek = false}) async {
    int type = 0;

    if (rankType == GiftRankType.king) {
      type = 1;
    } else if (rankType == GiftRankType.star) {
      type = 2;
    }

    if (type == 0) {
      return GiftRankResponse(
          msg: R.array('xhr_error_type_array')[6], success: false, items: []);
    }

    String url = '${System.domain}rank/gift?type=$type&page=$page';
    if (lastWeek) {
      url = '$url&last=1';
    }

    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GiftRankResponse(
            msg: response.error.toString(), success: false, items: []);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return GiftRankResponse(msg: res['msg'], success: false, items: []);
      }

      try {
        Map<String, dynamic> data = res['data'];
        data['success'] = true;
        GiftRankResponse responseData = GiftRankResponse.fromJson(data);
        return responseData;
      } catch (e) {
        return GiftRankResponse(
            msg: R.array('xhr_error_type_array')[6], success: false, items: []);
      }
    } catch (e) {
      return GiftRankResponse(msg: e.toString(), success: false, items: []);
    }
  }

  static Future<GiftRankResponse> getSingleGiftItems(
      GiftRankType rankType, int? page, int? giftId,
      {bool lastWeek = false}) async {
    int type = 0;

    if (rankType == GiftRankType.king) {
      type = 1;
    } else if (rankType == GiftRankType.star) {
      type = 2;
    }

    if (type == 0 || page == null || giftId == null) {
      return GiftRankResponse(
          msg: R.array('xhr_error_type_array')[6], success: false, items: []);
    }

    String url =
        '${System.domain}rank/giftUser?type=$type&page=$page&gift_id=$giftId';
    if (lastWeek) {
      url = '$url&last=1';
    }
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return GiftRankResponse(
            msg: response.error.toString(), success: false, items: []);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return GiftRankResponse(msg: res['msg'], success: false, items: []);
      }

      try {
        Map<String, dynamic> data = res['data'];
        data['success'] = true;
        GiftRankResponse responseData = GiftRankResponse.fromJson(data);
        return responseData;
      } catch (e) {
        return GiftRankResponse(
            msg: R.array('xhr_error_type_array')[6], success: false, items: []);
      }
    } catch (e) {
      return GiftRankResponse(msg: e.toString(), success: false, items: []);
    }
  }

  // 觉醒时刻接口
  static Future<AwakeTimeRankRsp> getGiftAwakeTimeItems(
      GiftRankType rankType) async {
    int type = 0;

    if (rankType == GiftRankType.king) {
      type = 1;
    } else if (rankType == GiftRankType.star) {
      type = 2;
    }

    if (type == 0) {
      return AwakeTimeRankRsp(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }

    String url = '${System.domain}go/yy/gift-handbook/awakeTimeRank';

    try {
      XhrResponse response =
          await Xhr.postPb(url, {'typ': type.toString()}, throwOnError: true);
      if (response.error != null) {
        Log.d(response.error.toString());
        return AwakeTimeRankRsp(msg: response.error.toString(), success: false);
      }

      AwakeTimeRankRsp rsp = AwakeTimeRankRsp.fromBuffer(
        response.bodyBytes,
      );
      return rsp;
    } catch (e) {
      return AwakeTimeRankRsp(msg: e.toString(), success: false);
    }
  }
}
