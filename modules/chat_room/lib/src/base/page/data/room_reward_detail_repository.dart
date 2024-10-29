import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';

class RoomRewardDetailRepository
    extends LoadingMoreBase<RoomDataPackageDetailItem> {
  final int rid;
  final int startTime; //时间段开启时间
  final int dateTime; //日期开始时间
  final int recent; //7或14天 三个参数选一个

  RoomRewardDetailRepository(this.rid,
      {this.startTime = 0, this.dateTime = 0, this.recent = 0});

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
      ResRoomPackageDetail resRoomPackageDetail =
          await RoomApi.getRoomAdminPackageDetail(rid, _page,
              start: startTime, date: dateTime, recent: recent);
      if (resRoomPackageDetail.success) {
        if (_page == 1) {
          clear();
        }
        addAll(resRoomPackageDetail.data.packageList);
        _page++;
        _hasMore = resRoomPackageDetail.data.more;
        isSuccess = true;
      }
    } catch (e) {
      Log.d(e);
    }
    return isSuccess;
  }
}
