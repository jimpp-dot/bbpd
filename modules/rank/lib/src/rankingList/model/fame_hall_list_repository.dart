/*
 *
 *  Created by yao.qi on 2022/4/28 下午2:39
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/4/28 下午2:39
 *
 */

import 'package:shared/shared.dart';
import 'fame_hall_list_api.dart';
import 'pb/generated/slp_weekstar.pb.dart';
import 'package:loading_more_list/loading_more_list.dart';

class FameHallListRepository extends LoadingMoreBase<WeekStarFameHallData> {
  int _page = 1;
  bool _hasMore = true;
  List<bool> exposures = [];

  FameHallListRepository();

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
    if (!showRankListByKey(liveWeekStarKey)) {
      isSuccess = true;
      _hasMore = false;
      _page = 1;
      clear();
      exposures.clear();
      return isSuccess;
    }
    try {
      ResWeekStarFameHall resWeekStarFameHallList =
          await FameHallListApi.sendFameHallListRequest(page: _page);
      if (Constant.isDevMode) Log.d('FameHallListRepository.loadData');
      if (_page == 1) {
        clear();
        exposures.clear();
      }
      if (resWeekStarFameHallList.success &&
          resWeekStarFameHallList.data.isNotEmpty) {
        List<WeekStarFameHallData> items = resWeekStarFameHallList.data;
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
