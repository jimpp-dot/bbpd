import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';

class HomeFavoriteRepo extends LoadingMoreBase<RoomListItem> {
  int _page = 1;
  bool _hasMore = true;

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _page = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    if (!Session.isLogined) {
      return isSuccess;
    }
    try {
      String url = "${System.domain}go/yy/home/tabCollect?page=$_page";
      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      ResHomeTabCollect res = ResHomeTabCollect.fromBuffer(response.bodyBytes);
      if (_page == 1) {
        clear();
      }
      _hasMore = Util.validList(res.data.roomList);
      if (_hasMore) {
        addAll(res.data.roomList);
        _page++;
      }
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}
