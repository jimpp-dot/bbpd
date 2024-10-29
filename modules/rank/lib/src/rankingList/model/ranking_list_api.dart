import 'package:shared/shared.dart';
import 'package:rank/src/model/pb/generated/room_charm.pb.dart';

import 'ranking_list_bean.dart';
import 'package:loading_more_list/loading_more_list.dart';

/// 房间排行榜相关api
class RankingListApi extends LoadingMoreBase<RankingTabItem> {
  final int rid;
  final String type;
  final String charmType;
  int _next = 1;
  bool _hasMore = true;
  RankingTabListResponse? rankingRes;
  Function? listStateChange;

  RankingListApi(this.rid, this.type, this.charmType, this.listStateChange);

  /// 房间魅力值-轮播入口
  static Future<RoomCharmIndexResponse> getEntrance(String rid) async {
    String url = '${System.domain}go/yy/roomcharm/index?version=1';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'rid': rid}, throwOnError: true);
      RespRoomCharm respRoomCharm =
          RespRoomCharm.fromBuffer(response.bodyBytes);
      if (!respRoomCharm.success) {
        Log.d(respRoomCharm.message.toString());
        return RoomCharmIndexResponse(false,
            msg: respRoomCharm.message.toString());
      }
      List<RankingTabItem> topList = respRoomCharm.data.topList
          .map((top) => RankingTabItem(
              rank: top.rank,
              rid: top.rid,
              uid: top.uid,
              roomName: top.roomName,
              roomCharm: top.roomCharm,
              userName: top.userName,
              userIcon: top.userIcon,
              rankChange: top.rankChange,
              rankChangeType: top.rankChangeType,
              currentRid: top.currentRid,
              beforeDiff: top.beforeDiff,
              stayHour: top.stayHour))
          .toList();
      List<RoomCharmGapBean> gapList = respRoomCharm.data.gapList
          .map((gap) => RoomCharmGapBean(
              time: gap.time,
              des: gap.des,
              type: gap.typeMame,
              showIcon: gap.showIcon))
          .toList();
      List<TabItem> rankTypeList = respRoomCharm.data.rankTypeList
          .map((rankType) => TabItem(rankType.typeMame, rankType.title))
          .toList();
      Map<String, List<String>> rule = {};
      rule["day"] = respRoomCharm.data.rule.day;
      rule["hour"] = respRoomCharm.data.rule.hour;
      rule["week"] = respRoomCharm.data.rule.week;
      rule["knight"] = respRoomCharm.data.rule.knight;
      rule["pk"] = respRoomCharm.data.rule.pk;
      return RoomCharmIndexResponse(respRoomCharm.success,
          entrance: RoomCharmIndexBean(
              topList: topList,
              gapList: gapList,
              rankTypeList: rankTypeList,
              rule: rule,
              haveRoomCharm: (respRoomCharm.data.haveRoomCharm) > 0));
    } catch (e) {
      Log.d(e);
      return RoomCharmIndexResponse(false);
    }
  }

  /// 房间排行列表
  static Future<RankingTabListResponse> getRankingTabList(
      {String type = '', int? page, int? rid, String charmType = ''}) async {
    String url = '${System.domain}roomcharm/rank';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'rid': rid.toString(),
            'page': page.toString(),
            'rank_type': type,
            'charm_type': charmType
          },
          throwOnError: true);
      if (response.error != null) {
        Log.d(response.error.toString());
        return RankingTabListResponse(false, msg: response.error.toString());
      }
      return RankingTabListResponse.fromJson(
          response.value() as Map<String, dynamic>);
    } catch (e) {
      Log.d(e);
      return RankingTabListResponse(false);
    }
  }

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _next = 1;
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  bool get hasMore {
    return _hasMore;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isLoadMore = isloadMoreAction;
    if (isLoadMore) {
      // 防止上拉回弹
      await Future.delayed(const Duration(milliseconds: 500));
    }
    return _loadList(isLoadMore ? _next : 1, first: !isLoadMore);
  }

  Future<bool> _loadList(int next, {bool first = false}) async {
    bool success = false;

    RankingTabListResponse response = await RankingListApi.getRankingTabList(
        type: type, page: next, rid: rid, charmType: charmType);

    List<RankingTabItem> rankingList = response.list;
    if (response.success) {
      if (first) {
        clear();
        rankingRes = response;
      } else {
        if (response.msg != null) rankingRes?.msg = response.msg;
        if (response.overLoad != null) rankingRes?.overLoad = response.overLoad;
        rankingRes?.list.addAll(List.from(rankingList));
      }
      addAll(rankingList);

      _hasMore = response.more == 1;

      if (_hasMore) {
        _next += 1;
      }
      success = true;
    } else {
      success = false;
    }

    if (listStateChange != null) listStateChange!();
    return success;
  }
}
