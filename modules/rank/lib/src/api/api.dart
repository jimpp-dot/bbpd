import 'package:shared/shared.dart';
import 'package:rank/src/model/entity/skill_filter_bean.dart';
import 'package:rank/src/model/entity/skill_tab_item.dart';
import 'package:rank/src/model/entity/super_admin_patrol_tab_data.dart';
import 'package:rank/src/model/pb/generated/entertain_rank.pb.dart';
import 'package:rank/src/model/pb/generated/god_recommend.pb.dart';
import 'package:rank/src/model/pb/generated/impression_tag_rank.pb.dart';
import 'package:rank/src/model/pb/generated/rank_cross_pk.proto.pb.dart';

import '../model/pb/generated/awake_rank.pb.dart';

class Api {
  /// 超管巡房列表tab
  static Future<SuperAdminPatrolTabResponse> getSuperAdminPatrolTab() async {
    try {
      String url = '${System.domain}chatroom/superPatrolTabs';
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return SuperAdminPatrolTabResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return SuperAdminPatrolTabResponse(msg: res['msg'], success: false);
      }
      try {
        SuperAdminPatrolTabResponse responseData =
            SuperAdminPatrolTabResponse.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return SuperAdminPatrolTabResponse(msg: e.toString(), success: false);
      }
    } catch (e) {
      return SuperAdminPatrolTabResponse(msg: e.toString(), success: false);
    }
  }

  static Future<DataRsp<TransInviteInfo>> getTransInviteInfo() async {
    String url = '${System.domain}home/transInvitePopUp';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<TransInviteInfo>.fromXhrResponse(response,
          (object) => TransInviteInfo.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<TransInviteInfo>(msg: '$e', success: false);
    }
  }

  /// 互娱榜单数据
  /// rank_type    榜单类型，1-心动榜，2-挚友榜，3-知己榜
  /// tab               榜单周期tab，1-日榜，2-周榜，3-月榜
  /// page             页数
  /// prev              历史数据，日榜传入日期20221219，上周、上月榜单传1
  static Future<ResEntertainRank> getEntertainRankData(
      int rankType, int subType, int page, int prev) async {
    String url = '${System.domain}go/yy/entertain/relationRank';
    Map<String, dynamic> params = {
      'rank_type': rankType,
      'tab': subType,
      'page': page
    };
    if (prev > 0) {
      params.addAll({'prev': prev});
    }
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: params, pb: true, throwOnError: true);
      return ResEntertainRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResEntertainRank(msg: e.toString(), success: false);
    }
  }

  /// PK厅榜单
  static Future<ApiRoomCrossPkLivingRankResponse> getCrossPkLivingRank(
      int page) async {
    String url = '${System.domain}go/room/games/crosspk/livingRank';
    try {
      XhrResponse response =
          await Xhr.get(url, queryParameters: {'page': page}, pb: true);
      return ApiRoomCrossPkLivingRankResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiRoomCrossPkLivingRankResponse(
          success: false, message: e.toString());
    }
  }

  /// PK排位榜单
  static Future<ApiRoomCrossPkSegmentRankResponse> getCrossPkSegmentRank(
      int page) async {
    String url = '${System.domain}go/room/games/crosspk/segmentRank';
    try {
      XhrResponse response =
          await Xhr.get(url, queryParameters: {'page': page}, pb: true);
      return ApiRoomCrossPkSegmentRankResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiRoomCrossPkSegmentRankResponse(
          success: false, message: e.toString());
    }
  }

  /// 图鉴经验值榜单  page榜单类型 0:日榜 1：周榜
  static Future<AwakenHandbookRes> getHandBookList(int type, int lastId) async {
    String url = '${System.domain}go/yy/rank/awakenHandbook';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'type': type, 'last_id': lastId}, pb: true);
      return AwakenHandbookRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      return AwakenHandbookRes(success: false, msg: e.toString());
    }
  }

  ///印象标记排行榜
  static Future<ImpressionTagsRankRsp> getImpressionTagRank(int tagId,
      {bool lastWeek = false}) async {
    String url = '${System.domain}go/yy/rank/impressionTags';
    try {
      XhrResponse response = await Xhr.get(url,
          pb: true,
          queryParameters: {
            'tag_id': tagId,
            "rank_type": 1,
            "last": lastWeek ? 1 : 0
          },
          throwOnError: true);
      return ImpressionTagsRankRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ImpressionTagsRankRsp(success: false, msg: e.toString());
    }
  }

  ///印象标记总排行榜
  static Future<ImpressionTagsRankRsp> getImpressionTagOverallRank(
      {bool lastWeek = false}) async {
    String url = '${System.domain}go/yy/rank/impressionTags';
    try {
      XhrResponse response = await Xhr.get(url,
          pb: true,
          queryParameters: {"rank_type": 2, "last": lastWeek ? 1 : 0},
          throwOnError: true);
      return ImpressionTagsRankRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ImpressionTagsRankRsp(success: false, msg: e.toString());
    }
  }

  /// 匹配开黑房
  static Future<RspGodRecommendGangUp> matchGangUpRoom() async {
    String url = '${System.domain}go/yy/god_rec/gangUp';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      return RspGodRecommendGangUp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RspGodRecommendGangUp(success: false, msg: e.toString());
    }
  }

  /// 获取主播推荐tab
  static Future<RspGodRecommendTab> getGodRecommendTabs() async {
    String url = '${System.domain}go/yy/god_rec/getTab';
    try {
      XhrResponse response = await Xhr.getPb(url, throwOnError: true);
      return RspGodRecommendTab.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RspGodRecommendTab(success: false, msg: e.toString());
    }
  }

  /// 获取主播推荐列表
  static Future<RspGodRecommendList> getGodRecommendList(int cid) async {
    try {
      XhrResponse response = await Xhr.getPb(
        '${System.domain}go/yy/god_rec/getList',
        queryParameters: {'cid': cid},
        throwOnError: true,
      );
      return RspGodRecommendList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RspGodRecommendList(success: false, msg: e.toString());
    }
  }
}
