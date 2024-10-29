/*
 *
 *  Created by yao.qi on 2022/6/15 下午2:15
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/6/15 下午2:15
 *
 */

import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';

class MountPieceBagRepo extends LoadingMoreBase<RoomListItem> {
  bool _hasMore = false;
  List<bool> exposures = [];

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    if (!Session.isLogined) {
      return isSuccess;
    }

    try {
      // ResHomePlayingFriend resp = await ChatBarApi.getPlayingFriend(_page, _onlyFriend ? 1 : 0);
      ResHomePlayingFriend resp = ResHomePlayingFriend();
      clear();
      exposures.clear();

      if (!Util.isCollectionEmpty(resp.data)) {
        addAll(resp.data);

        for (var _ in resp.data) {
          exposures.add(false);
        }
      }

      _hasMore = false;

      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
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

  set onlyFriend(bool value) {}
}
