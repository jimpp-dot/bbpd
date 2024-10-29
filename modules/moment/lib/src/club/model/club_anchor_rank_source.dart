import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'club_anchor_rank_beans.dart';

class ClubAnchorRankLoadingSource extends LoadingMoreBase<ClubAnchorRankItem> {
  static const int _firstPageIndex = 1;

  final int clubId;
  final VoidCallback? refreshCallback;

  ClubAnchorRankLoadingSource(this.clubId, this.refreshCallback);

  int _pageIndex = _firstPageIndex;
  bool _hasMore = true;
  String errorMsg = '';

  ClubAnchorRankItem? me;
  String? help;

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _pageIndex = _firstPageIndex;
      _hasMore = true;
    }

    bool loadSuccess = false;
    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;

    DataRsp<ClubAnchorRankResponse> rsp = await getRankItems(clubId);
    if (rsp.data != null && rsp.success == true) {
      if (rsp.data!.me != null) {
        me = rsp.data!.me;
      }

      if (!Util.isStringEmpty(rsp.data!.help)) {
        help = rsp.data!.help;
      }

      if (page == _firstPageIndex) {
        clear();
        if (refreshCallback != null) {
          refreshCallback!();
        }
      }

      if (rsp.data!.items.isNotEmpty) {
        addAll(rsp.data!.items);
        _pageIndex = page;

        _hasMore = false;
      } else {
        _hasMore = false;
      }

      loadSuccess = true;
    } else {
      errorMsg = rsp.msg ?? '';
      loadSuccess = false;
    }

    return loadSuccess;
  }

  static Future<DataRsp<ClubAnchorRankResponse>> getRankItems(
      int clubId) async {
    String url = '${System.domain}go/mate/club/rank?club_id=$clubId';
    try {
      XhrResponse response =
          await Xhr.getJson(url, throwOnError: false, formatJson: true);
      return DataRsp<ClubAnchorRankResponse>.fromXhrResponse(
          response,
          (object) =>
              ClubAnchorRankResponse.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<ClubAnchorRankResponse>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}
