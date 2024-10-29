import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/src/api/api.dart';
import 'package:moment/src/circle/model/circle_friend_playing_resp.dart';
import 'package:moment/src/circle/model/circle_page_resp.dart';

class CircleFriendPlayingPageRepository
    extends LoadingMoreBase<CircleFriendsActivity> {
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  final int circleId;

  CircleFriendPlayingPageRepository({this.circleId = 0});

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
      DataRsp<CircleFriendPlayingData> rsp =
          await Api.getCircleFriendPlayingPageResponse(page, hubid: circleId);
      if (rsp.success == true) {
        if (!isloadMoreAction &&
            rsp.data?.dataList != null &&
            rsp.data!.dataList.isNotEmpty) {
          clear();
        }
        rsp.data?.dataList.forEach((element) {
          add(element);
        });
        _hasMore = (rsp.data?.more ?? 0) > 0;
        page++;
        isSuccess = true;
      }
    } catch (exception, stack) {
      isSuccess = false;
      Log.d(exception);
      Log.d(stack);
    }
    return isSuccess;
  }
}
