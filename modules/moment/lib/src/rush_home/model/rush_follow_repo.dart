import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/model/homePageRsp.dart';
import 'package:moment/src/model/moment_bean_v3.dart';
import 'package:provider/provider.dart' hide Selector;

class RushFollowRepo extends LoadingMoreBase<Moment> {
  final BuildContext context;

  int page = 1;
  bool forceRefresh = false;
  final HashSet<String> _cachedIds = HashSet();
  late MomentModel model;

  RushFollowRepo(this.context) {
    model = context.read<MomentModel>();
  }

  bool hasFollowMore = true;
  bool hasRecommendMore = true;

  int _followNext = 0;

  @override
  bool get hasMore => (hasFollowMore || hasRecommendMore) || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    page = 1;
    _followNext = 0;
    hasFollowMore = true;
    hasRecommendMore = true;
    _cachedIds.clear();
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    Log.d('HomePageRepository loadData:$isloadMoreAction');
    if (isloadMoreAction == false) {
      hasFollowMore = true;
      hasRecommendMore = true;
    }

    try {
      if (hasFollowMore) {
        isSuccess = await _loadFollow(isloadMoreAction);
      } else if (hasRecommendMore) {
        isSuccess = await _loadRecommend();
      } else {}
    } catch (e) {
      isSuccess = false;
    }
    return isSuccess;
  }

  Future<bool> _loadFollow([bool isloadMoreAction = false]) async {
    if (hasFollowMore) {
      DataRsp<MomentPageV3> response = await Api.getFollowListV3(_followNext);
      if (!isloadMoreAction) {
        clear();
      }

      if (response.success == true && response.data != null) {
        MomentPageV3 momentPage = response.data!;

        if (momentPage.items.isNotEmpty) {
          for (var element in momentPage.items) {
            if (element.type == MomentFollowItemType.Circle) {
              model.putCachedMoment(element.circleItemData, notify: false);
            }

            if (element.type == MomentFollowItemType.Circle) {
              add(element.circleItemData!);
            }
          }
          model.notify();
        }
        hasFollowMore = momentPage.hasMore;
        if (hasFollowMore) {
          _followNext = momentPage.next;
        }

        if (!isloadMoreAction && Util.isCollectionEmpty(momentPage.items)) {
          return _loadRecommend();
        }
        return true;
      } else {
        return false;
      }
    }

    return true;
  }

  Future<bool> _loadRecommend() async {
    if (hasRecommendMore) {
      List<String> bwids = _cachedIds.toList();

      HomePageRsp result = await Api.getHomePage(page, bwids: bwids);
      if (result.success) {
        _cachedIds.clear();
        result.data?.items.forEach((item) {
          if (item.type == HomePageItemType.Circle) {
            add(item.circleItemData!);

            String key = item.exposureKey;
            if (!_cachedIds.contains(key)) {
              _cachedIds.add(key);
            }
            Moment moment = item.circleItemData!;
            model.putCachedMoment(moment);
          }
        });

        hasRecommendMore = result.data!.more > 0;
        page++;
        return true;
      } else {
        return false;
      }
    }

    return true;
  }
}
