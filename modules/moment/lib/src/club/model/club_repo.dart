import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';

import 'club_bean.dart';
import 'pb/generated/home_club_item.pb.dart';

const String EventJoinClub = "event.join.club";

class ClubRepo {
  ClubRepo._();

  /// 俱乐部
  static Future<ResClub> getCircleClub() async {
    String url = '${System.domain}go/mate/home/circleIndex';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      return ResClub.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResClub(msg: e.toString(), success: false);
    }
  }

  /// 获取俱乐部详情
  ///
  static Future<DataRsp<ClubListPage>> getAllClub(int page,
      {int size = 10}) async {
    String url = '${System.domain}go/mate/club/list?page=$page';
    try {
      XhrResponse response = await Xhr.getJson(url, formatJson: true);
      return DataRsp<ClubListPage>.fromXhrResponse(response,
          (object) => ClubListPage.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<ClubListPage>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 获取俱乐部详情
  ///
  static Future<DataRsp<ClubDetailBean>> getClubDetail(int clubId) async {
    String url = '${System.domain}go/mate/club/detail?club_id=$clubId';
    try {
      XhrResponse response = await Xhr.getJson(url, formatJson: true);
      return DataRsp.fromXhrResponse(response,
          (object) => ClubDetailBean.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 加入俱乐部
  /// [is_join] 0:加入 1：退出
  static Future<NormalNull> joinClub(int clubId, {bool quit = false}) async {
    String url = '${System.domain}go/mate/club/join';
    try {
      XhrResponse response = await Xhr.post(
        url,
        {
          'club_id': '$clubId',
          'is_join': quit ? '1' : '0',
        },
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      if (rsp.success) {
        eventCenter.emit(EventJoinClub, clubId);
      }
      return rsp;
    } catch (e) {
      return NormalNull(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}

class ClubListRepo extends LoadingMoreBase<ClubBean> {
  int _page = 1;
  bool _hasMore = true;

  Future<bool> _loadClubs(int next, {bool first = false}) async {
    bool success = false;

    DataRsp<ClubListPage> rsp = await ClubRepo.getAllClub(_page);
    if (rsp.success == true && rsp.data != null) {
      ClubListPage data = rsp.data!;

      if (data.list.isNotEmpty) {
        List<ClubBean> list = data.list;
        if (first) {
          clear();
        }
        addAll(list);
        _hasMore = data.total > length;
      }
      if (_hasMore) {
        _page++;
      }

      success = true;
    } else {
      success = false;
    }

    return success;
  }

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _page = 1;
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  bool get hasMore {
    return _hasMore;
  }

  @override
  Future<bool> loadData([bool isLoadMoreAction = false]) async {
    bool isLoadMore = isLoadMoreAction;
    return _loadClubs(isLoadMore ? _page : 1, first: !isLoadMore);
  }
}
