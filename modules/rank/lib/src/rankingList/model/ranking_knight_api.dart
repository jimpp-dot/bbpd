import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';

class RankingKnightApi extends LoadingMoreBase<KnightGroupRankItem> {
  int _next = 1;
  bool _hasMore = true;
  ResKnightGroupRankList? rankingRes;
  Function? listStateChange;

  RankingKnightApi(this.listStateChange);

  /// 房间守护团排行
  static Future<ResKnightGroupRankList> getKnightRanking(int page) async {
    String url = '${System.domain}go/yy/knight/rankgroup';

    try {
      XhrResponse response = await Xhr.post(
        url,
        {'page': page.toString()},
        pb: true,
      );
      return ResKnightGroupRankList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKnightGroupRankList(msg: '$e', success: false);
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

    ResKnightGroupRankList response =
        await RankingKnightApi.getKnightRanking(next);

    List<KnightGroupRankItem> rankingList = response.list;
    if (rankingList.isNotEmpty) {
      if (first) {
        clear();
        rankingRes = response;
      } else {
        rankingRes?.msg = response.msg;
        rankingRes?.list.addAll(List.from(rankingList));
      }
      addAll(rankingList);
      _hasMore = response.hasMore;
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
