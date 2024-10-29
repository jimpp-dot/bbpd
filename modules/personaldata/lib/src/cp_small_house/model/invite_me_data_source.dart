import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';

import 'cp_small_house_repo.dart';
import 'pb/generated/slp_cp_house.pb.dart';

class InviteMeDataSource extends LoadingMoreBase<HouseInviteItem> {
  int lastId = 0;
  bool _hasMore = true;
  bool forceRefresh = false;

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    lastId = 0;
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      ResHouseInvite result =
          await CpSmallHouseRepo.getCpHouseInviteList(lastId);
      if (lastId == 0) {
        clear();
      }

      if (result.data.isNotEmpty == true) {
        for (var element in result.data) {
          add(element);
        }
        lastId = result.data.last.id ?? 0;
      }

      _hasMore = result.data.isNotEmpty == true;
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}
