import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'liveListRsp.dart';

class LivePageRepository extends LoadingMoreBase<RoomItemModel> {
  String type;
  int _page = 1;
  bool _hasMore = true;

  List<RankerItem> rankers = [];
  VoidCallback? onRankersUpdated;
  String? source;

  LivePageRepository(this.type, {this.onRankersUpdated, this.source});

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
      LiveListRsp? liveListRsp =
          await BaseRequestManager.getLiveList(_page, type, source: source);
      if (liveListRsp == null) return isSuccess;
      Log.d('LivePageRepository.loadData');
      if (_page == 1) {
        clear();
      }
      addAll(liveListRsp.data?.items ?? []);
      if (_page == 1) {
        rankers = liveListRsp.data?.rankers ?? [];
        if (onRankersUpdated != null) {
          onRankersUpdated!();
        }
      }
      _hasMore = liveListRsp.data?.hasMore ?? false;
      _page++;
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}
