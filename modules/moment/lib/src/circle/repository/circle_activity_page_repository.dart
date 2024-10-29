import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/circle/model/circle_activity_resp.dart';

class CircleActivityPageRepository extends LoadingMoreBase<CircleActivity> {
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
  Future<bool> loadData([bool isLoadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      DataRsp<CircleActivityData> resp =
          await Api.getCircleActivityPageResponse(page);
      if (resp.success == true) {
        if (!isLoadMoreAction &&
            resp.data?.dataList != null &&
            resp.data!.dataList.isNotEmpty) {
          clear();
        }
        resp.data?.dataList.forEach((element) {
          add(element);
        });
        _hasMore = (resp.data?.more ?? 0) > 0;
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
