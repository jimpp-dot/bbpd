import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/rank.dart';
import 'package:rank/src/room_list/model/room_list_api.dart';

class RoomListRecommendRepository
    extends LoadingMoreBase<GamesRoomRecommendListItem> {
  String gamesType;
  int _page = 1;
  bool _hasMore = true;
  List<bool> exposures = [];

  RoomListRecommendRepository(this.gamesType);

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
    try {
      RespGamesRoomRecommendList responseRoomList =
          await RoomListApi.gamesRoomList(gamesType, page: _page);
      if (Constant.isDevMode) Log.d('RoomListRecommendRepository.loadData');
      if (_page == 1) {
        clear();
        exposures.clear();
      }
      if (responseRoomList.success && responseRoomList.data.isNotEmpty) {
        List<GamesRoomRecommendListItem> items = responseRoomList.data;
        for (var element in items) {
          add(element);
          exposures.add(false);
        }
      } else {
        _hasMore = false;
      }
      _page++;
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }

  bool getExposureIndex(int index) {
    if (index >= 0 && exposures.length > index) {
      return exposures[index];
    }
    return true;
  }

  void setExposureIndex(int index, bool exposure) {
    if (index >= 0 && exposures.length > index) {
      exposures[index] = exposure;
    }
  }
}
