import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/src/model/wave_progress_repository.dart';
import 'package:rank/src/page/main_page_controller.dart';
import 'package:get/get.dart';
import 'rankRequestManager.dart';

class HomeRoomRepository extends LoadingMoreBase<RoomListItem> {
  String type;
  int _page = 1;
  bool _hasMore = true;
  List<bool> exposures = [];

  HomeRoomRepository(this.type);

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    if (isLoading) return Future.value(false);
    _hasMore = true;
    _page = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      RoomListRes? roomListRsp =
          await RankRequestManager.getHomeRoom(type, _page);
      Log.d('HomeRoomRepository.loadData');
      if (roomListRsp != null && _page == 1) {
        clear();
        exposures.clear();
      }

      bool hasData = roomListRsp?.item != null && roomListRsp!.item.isNotEmpty;

      _hasMore = hasData && (roomListRsp.hasMore == true);

      if (hasData) {
        for (var _ in roomListRsp.item) {
          exposures.add(false);
        }
        addAll(roomListRsp.item);
        sortDatas();
        _page++;
        // 加载 潜水进度数据
        List<int> rids = roomListRsp.item.map((e) => e.rid).toList();
        await WaveProgressRepository().loadWaveProgressData(rids);
      }
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }

  /// true：单列显示（默认）；false-双列显示
  bool get listStyle {
    if (Get.isRegistered<MainPageController>()) {
      MainPageController logic = Get.find<MainPageController>();
      return logic.listStyle;
    }
    return true;
  }

  /// 对数据源进行排序
  void sortDatas() {
    sort((a, b) => listStyle
        ? b.fixSort1.compareTo(a.fixSort1)
        : b.fixSort2.compareTo(a.fixSort2));
  }

  bool getExposureIndex(int index) {
    if (exposures.length > index) {
      return exposures[index];
    }
    return true;
  }

  void setExposureIndex(int index, bool exposure) {
    if (exposures.length > index) {
      exposures[index] = exposure;
    }
  }
}
