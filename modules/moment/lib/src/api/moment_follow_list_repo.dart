import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/model/moment_bean_v3.dart';

class MomentFollowListRepo extends LoadingMoreBase<MomentFollowItemBean> {
  int _next = 0;
  bool _hasMoreMoment = true;
  bool forceRefresh = false;
  final VoidCallback? onReload;
  final MomentModel momentModel;

  bool hasFollowSomeone = true;

  MomentFollowListRepo(this.momentModel, {this.onReload});

  @override
  bool get hasMore => (_hasMoreMoment) || forceRefresh;

  Future<bool> _loadMoments(int next, {bool first = false}) async {
    bool success = false;

    hasFollowSomeone = await _hasFollowSomeone();

    DataRsp<MomentPageV3> response = await Api.getFollowListV3(next);
    if (first) {
      clear();
    }

    if (response.success == true && response.data != null) {
      MomentPageV3 momentPage = response.data!;

      if (momentPage.items.isNotEmpty) {
        List<MomentFollowItemBean> items = momentPage.items;
        for (var element in items) {
          if (element.type == MomentFollowItemType.Circle) {
            momentModel.putCachedMoment(element.circleItemData, notify: false);
          }

          if (element.type != MomentFollowItemType.Unknown) {
            add(element);
          }
        }
        momentModel.notify();
      }
      _hasMoreMoment = momentPage.hasMore;
      if (_hasMoreMoment) {
        _next = momentPage.next;
      }

      if (first) {
        onReload?.call();
      }

      success = true;
    } else {
      success = false;
    }

    return success;
  }

  Future<bool> _hasFollowSomeone() async {
    String url = '${System.domain}go/yy/friend/data';
    Map<String, String> params = {
      "type": "follow",
      "page": "1",
      "pageSize": "20",
      "query": ''
    };

    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true, formatJson: true);
      Map res = response.value();
      List? list = res['data'];

      if (list != null && list.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // 默认认为有朋友，兼容已有逻辑
      return true;
    }
  }

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _next = 0;
    _hasMoreMoment = true;
    forceRefresh = !notifyStateChanged;
    final bool result = await super.refresh(notifyStateChanged);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool? isloadMoreAction = false]) async {
    bool isLoadMore = isloadMoreAction ?? false;
    return _loadMoments(isLoadMore ? _next : 0, first: !isLoadMore);
  }
}
