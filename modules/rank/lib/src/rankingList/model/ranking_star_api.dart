import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'ranking_star_bean.dart';

/// 房间星光榜相关api
class RankingStarApi extends LoadingMoreBase<RankingStarTabItem> {
  final int rid;
  final String type;
  int _next = 1;
  bool _hasMore = true;
  RankingStarTabListResponse? rankingRes;
  Function? listStateChange;

  RankingStarApi(this.rid, this.type, this.listStateChange);

  static Future<RankingStarTabListResponse> getRankingTabList(
      {String type = '', int page = 0, int rid = 0}) async {
    String url = '${System.domain}rooms/broadcastercontent/starRank';
    try {
      XhrResponse response = await Xhr.postJson(url,
          {'rid': rid.toString(), 'page': page.toString(), 'rank_type': type},
          throwOnError: true);
      if (response.error != null) {
        Log.d(response.error.toString());
        return RankingStarTabListResponse(false,
            msg: response.error.toString());
      }
      return RankingStarTabListResponse.fromJson(
          response.value() as Map<String, dynamic>);
    } catch (e) {
      Log.d(e);
      return RankingStarTabListResponse(false);
    }
  }

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
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

    RankingStarTabListResponse response =
        await getRankingTabList(type: type, page: next, rid: rid);

    List<RankingStarTabItem> rankingList = response.list;
    if (response.success) {
      if (first) {
        clear();
        rankingRes = response;
      } else {
        if (response.msg != null) rankingRes?.msg = response.msg;
        rankingRes?.list.addAll(List.from(rankingList));
      }
      addAll(rankingList);
      _hasMore = response.more == 1 || rankingList.isNotEmpty;
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
