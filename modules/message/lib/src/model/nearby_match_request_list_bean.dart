import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:message/src/api/api.dart';
import 'package:message/src/model/nearby_match_request_list_data.dart';

class NearbyMatchRequestRepository
    extends LoadingMoreBase<NearbyMatchRequestListData> {
  bool forceRefresh = false;
  bool _hasMore = true;
  bool isFirstRefresh = false;

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    isFirstRefresh = true;
    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      String extendParam = '';

      if (length > 0 && _hasMore && isFirstRefresh == false) {
        extendParam = '&id=${last.indexId}&pagenum=20';
      }

      NearbyMatchRequestListDataResp response =
          await Api.getNearbyMatchRequestList(extendParam);

      if (response.success == true) {
        if (isFirstRefresh == true) {
          clear();
        }

        if (response.data != null && response.data!.isNotEmpty) {
          addAll(response.data!);
        }

        //返回数据刚好是20条 需要多拉一次 确定是否有更多
        _hasMore = (response.data?.length == 20 ? true : false);

        isSuccess = true;
        isFirstRefresh = false;
      } else {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
        isSuccess = false;
      }
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }

    return isSuccess;
  }
}
