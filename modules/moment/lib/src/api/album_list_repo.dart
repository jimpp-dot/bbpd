import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/src/api/api.dart';

class AlbumListRepo extends LoadingMoreBase<CirclePicItem> {
  final int uid;

  int page = 0;
  bool _hasMore = true;
  bool forceRefresh = false;

  AlbumListRepo(this.uid);

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    page = 0;
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      ResCirclePics resp = await Api.getCirclePics(uid, page);
      if (resp.success) {
        if (!isloadMoreAction && resp.data.list.isNotEmpty) {
          clear();
        }
        for (var element in resp.data.list) {
          add(element);
        }
        _hasMore = resp.data.tpid > 0;
        page = resp.data.tpid.toInt();
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
