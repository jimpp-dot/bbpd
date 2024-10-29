import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';

class RoomDataRankRepository extends LoadingMoreBase<PackageItem> {
  final int rid;
  final int type;
  final int startTime; //时间段开启时间
  final int dateTime; //日期开始时间
  final int recent; //7或14天 三个参数选一个

  RoomDataRankRepository(this.rid, this.type,
      {required this.startTime, required this.dateTime, required this.recent});

  bool _hasMore = true;
  int _page = 1;

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
      ResRoomDataList resRoomDataList = await RoomApi.getRoomAdminDataList(
          rid, _page, type,
          start: startTime, date: dateTime, recent: recent);
      if (resRoomDataList.success) {
        if (_page == 1) {
          clear();
        }

        if (type == 1) {
          addAll(resRoomDataList.data.packageList);
        } else if (type == 2) {
          addAll(resRoomDataList.data.receiveList);
        } else if (type == 3) {
          addAll(resRoomDataList.data.newPayList);
        }
        _page++;
        _hasMore = resRoomDataList.data.more;
        isSuccess = true;
      }
    } catch (e) {
      Log.d(e);
    }
    return isSuccess;
  }
}
