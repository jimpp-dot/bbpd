import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/src/model/entity/homeMainRsp.dart';
import 'package:rank/src/model/rankRequestManager.dart';

class NearbyPageRepository extends LoadingMoreBase<ListItem> {
  int _page = 1;
  bool _hasMore = true;

  bool? nearbyInvisible;

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _page = 1;
    clear();
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      HomeMainXhrRsp rsp = await RankRequestManager.getHomePage(_page);
      HomeMainRsp? homeMainRsp = rsp.homeMainRsp;
      // Log.d('RecommendPageRepository.loadData');
      if (homeMainRsp != null && _page == 1) {
        clear();
      }
      if (homeMainRsp != null) {
        addAll(homeMainRsp.recommendItems);
        _hasMore = homeMainRsp.more;
      }
      _page++;
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}
