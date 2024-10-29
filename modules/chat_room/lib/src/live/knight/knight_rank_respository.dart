import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:chat_room/src/live/model/live_repository.dart';

class KnightRankRepository extends LoadingMoreBase<KnightRankItem> {
  final int rid;
  bool _hasMore = true;
  KnightRankItem? masterInfo; //排名第一的数据
  KnightRankItem? myInfo; //我的info
  KnightGroupInfo? groupInfo; //守护团信息
  KnightCouponInfo? knightCoupon; //守护体验券
  bool roomer = false;
  int total = 0;

  KnightRankRepository(this.rid);
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
      ResKnightRankList resKnightRankList =
          await LiveRepository.getKnightRankData(rid, _page);
      if (resKnightRankList.success) {
        if (_page == 1) {
          clear();
          total = resKnightRankList.total;
          if (resKnightRankList.hasKnightMyInfo()) {
            myInfo = resKnightRankList.knightMyInfo;
          }
          if (resKnightRankList.hasKnightRankMaster()) {
            masterInfo = resKnightRankList.knightRankMaster;
          }
          if (resKnightRankList.hasKnightGroupInfo()) {
            groupInfo = resKnightRankList.knightGroupInfo;
          }
          if (resKnightRankList.hasKnightCoupon()) {
            knightCoupon = resKnightRankList.knightCoupon;
          }
          roomer = resKnightRankList.isRoomer;
        }
        addAll(resKnightRankList.list);
        _page++;
        _hasMore = resKnightRankList.hasMore;
        isSuccess = true;
      }
    } catch (e) {
      Log.d(e);
    }
    return isSuccess;
  }
}
