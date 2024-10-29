import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';

import 'cp_small_house_repo.dart';
import 'pb/generated/slp_cp_house_friend.pb.dart';

class SendInviteDataSource extends LoadingMoreBase<FriendUser> {
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      ResFriendData result =
          await CpSmallHouseRepo.postCpHouseFriends(page: page);

      if (page == 1) {
        clear();
      }

      for (FriendUser element in result.data) {
        add(element);
      }

      _hasMore = result.data.length == 20;
      page++;
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }

    return isSuccess;
  }
}
