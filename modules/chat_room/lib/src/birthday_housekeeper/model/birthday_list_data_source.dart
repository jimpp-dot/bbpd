import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/shared.dart';

import 'birthday_repository.dart';
import 'generated/gs_birthday.pb.dart';

class BirthdayListDataSource extends LoadingMoreBase<GsBirthdayListItem> {
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  // 入参
  String type = '';
  int rid = 0;
  int uid = 0;

  // 出参
  GsBirthdayListItem? extra;

  VoidCallback? onUpdated;

  BirthdayListDataSource();

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      ApiGsBirthdayListResponse result =
          await BirthdayRepository.getGsBirthdayListData(
              type: type, page: page, rid: rid, uid: uid);

      if (page == 1) {
        clear();
      }

      for (var element in result.data.list) {
        add(element);
      }

      extra = result.data.extra;

      if (onUpdated != null) {
        onUpdated!();
      }

      _hasMore = Util.parseInt(result.data.more) == 1;
      page++;
      isSuccess = true;
    } catch (exception) {
      isSuccess = false;
    }

    return isSuccess;
  }
}
