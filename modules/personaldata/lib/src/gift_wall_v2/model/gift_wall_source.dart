import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:personaldata/src/api/gift_wall_api.dart';

class GiftWallSource extends LoadingMoreBase<GiftMeta> {
  int _page = 1;
  bool _hasMore = true;
  int uid;
  String type;
  String seriesType;
  String sortType;
  String isasc;
  static const String _tag = "GiftWallSource";

  GiftWallSource(
      this.uid, this.type, this.seriesType, this.sortType, this.isasc);

  @override
  bool get hasMore => _hasMore;

  int rid = 0;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _page = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool success = false;

    GiftHandbookGiftListRsp rsp = await GiftWallApi.getGiftList(
        uid, type, seriesType, sortType, isasc,
        page: _page, pageSize: 20);
    success = rsp.success;
    if (_page == 1) {
      clear();
    }
    if (success) {
      List<GiftMeta> list = rsp.data.giftList;
      rid = rsp.data.roomId;
      addAll(list);
      _page++;
    }
    _hasMore = rsp.data.hasMore;

    return success;
  }
}
