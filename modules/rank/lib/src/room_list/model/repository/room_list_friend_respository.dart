import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/rank.dart';
import 'package:rank/src/room_list/model/room_list_api.dart';

class RoomListFriendRepository
    extends LoadingMoreBase<GamesRoomFriendListItem> {
  int _page = 1;
  bool _hasMore = true;
  List<bool> exposures = [];

  RoomListFriendRepository();

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
      ResponseGamesRoomFriendList responseGamesRoomFriendList =
          await RoomListApi.goGamesFriendList();
      Log.d('RoomRepository.loadData');
      if (_page == 1) {
        clear();
        exposures.clear();
      }
      if (responseGamesRoomFriendList.success) {
        List<GamesRoomFriendListItem> items = responseGamesRoomFriendList.data;
        for (var element in items) {
          add(element);
          exposures.add(false);
        }
      }
      _hasMore = false;
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
