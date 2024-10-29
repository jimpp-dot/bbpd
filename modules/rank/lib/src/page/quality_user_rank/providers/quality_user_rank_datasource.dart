import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../../../k.dart';
import '../models/generated/slp_newbie.pb.dart';
import 'quality_user_rank_repository.dart';

class QualityUserRankDataSource extends LoadingMoreBase<NewbieUserData> {
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  /// 最后一个数据的index
  int lastDataIndex = 0;

  Function(String)? onRefresh;

  QualityUserRankDataSource();

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      ResNewbieUserList result =
          await QualityUserRankRepository.getUserList(page: page);

      if (page == 1) {
        String navTitle = result.headline;
        if (Util.isNullOrEmpty(navTitle)) {
          navTitle = K.rank_quality_user_rank_title;
        }
        if (onRefresh != null) {
          onRefresh!(navTitle);
        }
        clear();
      }

      if (Util.validList(result.list)) {
        lastDataIndex = result.list.length - 1;
        for (var element in result.list) {
          add(element);
        }
      }

      _hasMore = result.hasMore;
      page++;
      isSuccess = true;
    } catch (exception, _) {
      isSuccess = false;
    }

    return isSuccess;
  }
}
