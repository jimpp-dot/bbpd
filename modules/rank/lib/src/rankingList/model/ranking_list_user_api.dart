import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'ranking_list_user_bean.dart';

class RankingListUserApi extends LoadingMoreBase<RankingListUserItem> {
  final String type;
  int _next = 1;
  bool _hasMore = true;
  RankingUserListResponse? rankingRes;
  Function? listStateChange;

  RankingListUserApi(this.type, this.listStateChange);

  /// 用户榜
  static Future<RankingUserListResponse> getRankingUserList(
      {String type = '', int page = 0}) async {
    String url = '${System.domain}roomcharm/rankUser';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'page': page.toString(),
            'rank_type': type,
          },
          throwOnError: true);
      if (response.error != null) {
        Log.d(response.error.toString());
        return RankingUserListResponse(
            success: false, msg: response.error.toString());
      }
      return RankingUserListResponse.fromJson(
          response.value() as Map<String, dynamic>);
    } catch (e) {
      Log.d(e);
      return RankingUserListResponse(success: false);
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

    RankingUserListResponse response =
        await RankingListUserApi.getRankingUserList(type: type, page: next);

    List<RankingListUserItem>? rankingList = response.data?.list;
    if (rankingList != null) {
      if (first) {
        clear();
        rankingRes = response;
      } else {
        if (response.msg != null) rankingRes?.msg = response.msg;
        rankingRes?.data?.list.addAll(List.from(rankingList));
      }
      addAll(rankingList);
      if (response.data?.more != null) {
        _hasMore = response.data?.more == 1;
      } else {
        _hasMore = rankingList.isNotEmpty;
      }
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
