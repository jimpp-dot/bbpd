import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/src/model/rankRequestManager.dart';
import 'package:rank/src/model/wave_progress_repository.dart';
import 'package:rank/src/page/main_page_controller.dart';
import 'package:get/get.dart';

class HomeRecommendRepository extends LoadingMoreBase<RoomListItem> {
  int _page = 1;
  bool _hasMore = true;
  List<bool> exposures = [];

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

    if (!Session.isLogined) {
      return isSuccess;
    }
    try {
      ResHomeForYou? liveListRsp =
          await RankRequestManager.getHomeRecommend(_page);
      if (liveListRsp != null && _page == 1) {
        clear();
        exposures.clear();
      }
      if (liveListRsp?.data != null) {
        if (liveListRsp!.data.roomList.isNotEmpty) {
          for (var _ in liveListRsp.data.roomList) {
            exposures.add(false);
          }
          addAll(liveListRsp.data.roomList);
          sortDatas();
          _page++;

          // 加载 潜水进度数据
          List<int> rids = liveListRsp.data.roomList.map((e) => e.rid).toList();
          await WaveProgressRepository().loadWaveProgressData(rids);
        }
        _hasMore = liveListRsp.data.more > 0;
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
    if (exposures.length > index && index >= 0) {
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
