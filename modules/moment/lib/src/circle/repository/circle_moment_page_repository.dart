import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/circle/model/circle_moment_response.dart';

typedef RefreshCallback = void Function();

class CircleMomentPageRepository extends LoadingMoreBase<Moment> {
  int page = 1;
  final int hubId;
  final int typeId;
  bool _hasMore = true;
  bool forceRefresh = false;
  final RefreshCallback? callback;
  MomentModel momentModel;

  CircleMomentPageRepository(
      this.hubId, this.typeId, this.callback, this.momentModel);

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
      DataRsp<CircleMomentData> rsp =
          await Api.getCircleMomentResponse(hubId, typeId, page);
      if (rsp.success == true) {
        if (!isloadMoreAction &&
            rsp.data?.momentList != null &&
            rsp.data!.momentList.isNotEmpty) {
          clear();
        }
        rsp.data?.momentList.forEach((element) {
          momentModel.putCachedMoment(element);
          add(element);
        });
        _hasMore = (rsp.data?.more ?? 0) > 0;
        page++;
        isSuccess = true;
        if (!isloadMoreAction && callback != null) {
          callback!.call();
        }
      }
    } catch (exception, stack) {
      isSuccess = false;
      Log.d(exception);
      Log.d(stack);
    }
    return isSuccess;
  }
}
