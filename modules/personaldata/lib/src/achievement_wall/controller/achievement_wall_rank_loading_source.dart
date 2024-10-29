import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../api/achievement_wall_repo.dart';
import '../model/pb/generated/slp_achieve.pb.dart';

class AchievementWallRankLoadingSource
    extends LoadingMoreBase<AchieveBadgeRankItem> {
  // tab 取值：1-好友，2-全站
  final int tab;

  VoidCallback? refreshCallback;

  int _page = 1;
  bool _hasMore = true;
  String errorMsg = '';

  AchieveBadgeRankItem? my;

  AchievementWallRankLoadingSource(this.tab);

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _page = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool loadSuccess = false;
    try {
      ResAchieveBadgeRank resp =
          await AchievementWallRepo.getAchieveWallBadgeRank(
              tab: tab, page: _page);
      if (_page == 1) {
        clear();
      }
      if (resp.success) {
        my = resp.data.my;
        if (!Util.isCollectionEmpty(resp.data.list)) {
          addAll(resp.data.list);
          _hasMore = true;
        } else {
          _hasMore = false;
        }
        if (refreshCallback != null) {
          refreshCallback!();
        }
        _page++;
        loadSuccess = true;
      } else {
        errorMsg = resp.msg ?? '';
        loadSuccess = false;
      }
    } catch (e) {
      errorMsg = e.toString() ?? '';
      loadSuccess = false;
    }
    return loadSuccess;
  }
}
