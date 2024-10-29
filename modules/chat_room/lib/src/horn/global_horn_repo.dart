import 'package:loading_more_list/loading_more_list.dart';

import '../protobuf/generated/horn.pb.dart';
import 'api/api.dart';

class GlobalHornRepo extends LoadingMoreBase<Horn> {
  final int state;
  int _lastId = 0;
  bool _hasMore = true;

  String errorMsg = '';

  @override
  bool get hasMore => _hasMore;

  GlobalHornRepo(this.state);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    if (isLoading) return Future.value(false);
    _hasMore = true;
    _lastId = 0;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _hasMore = true;
      _lastId = 0;
    }
    HornListRes res = await Api.getList(state, _lastId);
    if (res.success) {
      if (_lastId == 0) {
        clear();
      }
      _hasMore = res.hasMore;
      _lastId = res.lastId;
      addAll(res.data);
    }
    return true;
  }
}
