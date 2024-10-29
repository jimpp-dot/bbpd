import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/model/homePageRsp.dart';
import 'package:shared/model/banner_model.dart';
import 'package:provider/provider.dart' hide Selector;

/// 首页信息流推荐repo
class HomePageRepository extends LoadingMoreBase<HomePageItemData> {
  final bool isTestPage;
  final String? pageType;

  final BuildContext context;
  int page = 1;
  bool _hasMore = true;
  bool smallMood = false;
  bool forceRefresh = false;

  HomePageRepository(this.context, {this.isTestPage = false, this.pageType});

  final HashSet<String> _cachedIds = HashSet();

  @override
  bool get hasMore => (_hasMore) || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    page = 1;
    _cachedIds.clear();
    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      List<String> bwids = _cachedIds.toList();
      MomentModel model = context.read<MomentModel>();
      HomePageRsp result = await Api.getHomePage(page,
          debug: isTestPage ? 1 : 0, sort: pageType, bwids: bwids);
      if (page == 1) {
        clear();
      }
      _cachedIds.clear();
      for (var item in (result.data?.items ?? [])) {
        if (item.type != HomePageItemType.Unknown) {
          add(item);

          String key = item.exposureKey;
          if (!_cachedIds.contains(key)) {
            _cachedIds.add(key);
          }

          // 刷新动态缓存
          if (item.type == HomePageItemType.Circle) {
            Moment moment = item.circleItemData;
            model.putCachedMoment(moment, notify: false);
            // objectCache.put(item.exposureKey, moment);
          }
        }
      }
      if (page == 1) {
        _hasLoadHotTopic = false;
        // 第一页插入banner
        _loadBanners();
        // 第一页插入热搜话题
        _loadHotTopic();
      }
      model.notify();

      page++;
      _hasMore = (result.data?.more ?? 0) > 0;

      smallMood = result.data?.smallMood ?? false;
      Provider.of<ProfilePayload>(context, listen: false)
          .loadMomentsSmallMood(show: smallMood);
      isSuccess = true;
      _onPageRefresh?.call();
    } catch (exception) {
      isSuccess = false;
    }
    return isSuccess;
  }

  /// 页面刷新回调
  Function? _onPageRefresh;

  set onPageRefresh(Function refreshed) {
    _onPageRefresh = refreshed;
  }

  List<BannerModel>? _banners;

  List<BannerModel>? get banners => _banners;

  bool get hasBanners => banners?.isNotEmpty == true;

  /// 加载banner运营位
  Future<void> _loadBanners() async {
    if (hasBanners) {
      _insertBanner();
    } else {
      _banners = await BannerModel.loadBanners(BannerModel.position_topic_tab);
      _insertBanner();
      _onPageRefresh?.call(); // 刷新页面
    }
  }

  /// 热门话题 是否拉取过 -> 标识
  bool _hasLoadHotTopic = false;
  List<RecTag>? _hotTopics;

  Future<void> _loadHotTopic() async {
    if (_hasLoadHotTopic) {
      // 已经拉取过，直接插入
      _insertHotTopic();
    } else {
      // 第一次拉取热门话题
      ResGetRecTags resp = await Api.getSquareHotTopic();
      if (resp.success) {
        _hasLoadHotTopic = true;
        if (resp.data.list.isNotEmpty) {
          _hotTopics = resp.data.list;
          _insertHotTopic();
          _onPageRefresh?.call(); // 刷新页面
        }
      } else {
        if (!Util.isCollectionEmpty(_hotTopics)) {
          _insertHotTopic();
          _onPageRefresh?.call(); // 刷新页面
        }
      }
    }
  }

  void _insertHotTopic() {
    if (!Util.isCollectionEmpty(_hotTopics)) {
      HomePageItemData item = HomePageItemData();
      item.type = HomePageItemType.HotTopic;
      item.topics = _hotTopics;
      int index = min(hasBanners ? 2 : 1, length);
      insert(index, item);
    }
  }

  void _insertBanner() {
    if (hasBanners && !Util.needHideAllTitle()) {
      if (length > 1) {
        this[0].bottomPadding = 0;
      }

      HomePageItemData item = HomePageItemData();
      item.type = HomePageItemType.banner;
      insert(min(1, length), item);
    }
  }
}
