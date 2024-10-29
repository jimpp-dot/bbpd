import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/widget/banner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sliver_tracker/flutter_sliver_tracker.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/club/widget/pb_club_grid_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../small_mood/small_mood_entry.dart';
import 'package:provider/provider.dart' hide Selector;

/// 首页推荐
///
class RecommendPage extends StatefulWidget {
  final bool isTestPage;
  final String? pageType;
  final String pageKey;
  final bool autoPlayVideo;
  final bool showClub;
  final bool supportDark;

  const RecommendPage({
    Key? key,
    this.isTestPage = false,
    this.pageType,
    this.pageKey = 'home_recommend',
    this.autoPlayVideo = false,
    this.showClub = false,
    this.supportDark = false,
  }) : super(key: key);

  @override
  RecommendPageState createState() => RecommendPageState();
}

class RecommendPageState extends State<RecommendPage>
    with
        AutomaticKeepAliveClientMixin<RecommendPage>,
        TickerProviderStateMixin,
        WidgetsBindingObserver,
        ReloadStateMixin {
  @override
  bool get wantKeepAlive => true;

  late HomePageRepository _repository;
  final String _errorMessage = K.moment_net_error;

  final Map<int, ExposureMoment> _exposureItems = {};

  bool _isCurrentPage = false;

  Timer? _loadExtraTimer;
  ScrollController _scrollController = ScrollController();

  final GlobalKey<PbClubGridWidgetState> _keyClub = GlobalKey();

  int _lastReloadTime = 0;
  final _maxReloadDurationInMilliSecs = 60 * 1000;

  @override
  void initState() {
    super.initState();
    _lastReloadTime = nowMilliSecs();
    WidgetsBinding.instance.addObserver(this);
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener('refresh_small_mood_entry', _onRefresh);
    _repository = HomePageRepository(System.context,
        isTestPage: widget.isTestPage, pageType: widget.pageType);
    _repository.onPageRefresh = _onPageRefresh;
    _isCurrentPage = true;
  }

  void _onPageRefresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _isCurrentPage = false;
    WidgetsBinding.instance.removeObserver(this);
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    eventCenter.removeListener('refresh_small_mood_entry', _onRefresh);
    _repository.dispose();
    _loadExtraTimer?.cancel();
    super.dispose();
  }

  _onLogin(String type, dynamic data) {
    reload();
  }

  _onRefresh(String type, dynamic data) {
    reload();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (_isCurrentPage) _onPageVisible(true);
        break;
      case AppLifecycleState.paused:
        if (_isCurrentPage) _reportAll();
        break;
      default:
        break;
    }
  }

  @override
  void reload({bool force = true, animated = true}) {
    scrollToTop(animated: animated);
    int now = nowMilliSecs();
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
      _repository.refresh();
      _reloadClub();
    }
  }

  void _reloadClub() {
    if (widget.showClub) {
      _keyClub.currentState?.reload();
    }
  }

  @override
  void scrollToTop({bool animated = true}) {
    if (_scrollController.hasClients) {
      if (animated) {
        _scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      } else {
        _scrollController.jumpTo(0.0);
      }
    }
  }

  _onPageVisible(bool visible) {
    if (visible) {
      _isCurrentPage = true;
      _exposureItems.forEach((key, value) {
        if (value.isDirty) {
          value.reset();
        }
      });
    } else {
      _isCurrentPage = false;
      _reportAll();
    }
  }

  _reportAll() {
    _exposureItems.forEach((key, value) {
      value.duration =
          DateTime.now().difference(value.startExposureTime).inMilliseconds;

      if (!value.isDirty) {
        reportExposureTime(value, MomentFlowPage.Recommend);
      }
      value.isDirty = true;
    });
  }

  /// 开始曝光统计
  void _startExposure(Moment? moment, double percent) {
    if (moment == null) return;
    if (!_exposureItems.containsKey(moment.topicId)) {
      _exposureItems[moment.topicId] = ExposureMoment(
        topicId: moment.topicId,
        startExposureTime: DateTime.now(),
        moment: moment,
      );
    }
  }

  /// 结束曝光统计
  void _endExposure(Moment? moment) {
    if (moment == null) return;
    if (_exposureItems.containsKey(moment.topicId)) {
      ExposureMoment? item = _exposureItems[moment.topicId];
      if (item == null) return;
      item.duration =
          DateTime.now().difference(item.startExposureTime).inMilliseconds;
      reportExposureTime(item, MomentFlowPage.Recommend);
      _exposureItems.remove(moment.topicId);
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController =
        PrimaryScrollController.of(context) ?? _scrollController;

    super.build(context);
    return VisibilityDetector(
      key: const ValueKey('recommend-page-key'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 0.0) {
          _onPageVisible(false);
        } else if (visibilityInfo.visibleFraction == 1.0) {
          _onPageVisible(true);
        }
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          ScrollMetrics metrics = notification.metrics;
          if (metrics.axis == Axis.horizontal) return false;

          if (notification is ScrollStartNotification) {
            Provider.of<MomentVideoProvider>(context, listen: false)
                .setScrollState(MomentFlowPage.Recommend, 0);
          } else if (notification is ScrollEndNotification) {
            Provider.of<MomentVideoProvider>(context, listen: false)
                .setScrollState(MomentFlowPage.Recommend, 1);
          }
          return false;
        },
        child: ScrollViewListener(
          child: RefreshIndicatorFactory.of(
            onRefresh: () async {
              _repository.refresh();
              _reloadClub();
            },
            child: CustomScrollView(
              controller: _scrollController,
              physics: _repository.isEmpty
                  ? const AlwaysScrollableScrollPhysics()
                  : const TopBouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // banner挪到第一个动态后面去了
                      // if (_repository.hasBanners && !Util.needHideAllTitle())
                      //   BannerWidget('recommend_page', _repository.banners, fitDark: true),
                      if (widget.showClub) PbClubGridWidget(key: _keyClub),
                      if (_repository.smallMood) const SmallMoodEntry()
                    ],
                  ),
                ),
                LoadingMoreSliverList(
                  SliverListConfig<HomePageItemData>(
                    itemBuilder: _itemBuilder,
                    sourceList: _repository,
                    indicatorBuilder: _indicatorBuilder,
                    extendedListDelegate: ExtendedListDelegate(
                      viewportBuilder: _handleExposureReport,
                      exposureRatioThreshold: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, HomePageItemData item, int index) {
    if (item.type == HomePageItemType.banner) {
      return BannerWidget('recommend_page', _repository.banners, fitDark: true);
    }

    return SliverMultiBoxScrollListenerDebounce(
      debounce: 30,
      maxSpeed: 0.1,
      onScrollInit: (double percent) {
        if (item.type == HomePageItemType.Circle) {
          if (percent >= 0.5) {
            _startExposure(item.circleItemData, percent);
          }
        }
      },
      builder: (BuildContext context, double? itemLength,
          double displayedLength, double parentDisplayRate) {
        double percent = 0;
        if (itemLength != null && itemLength > 0) {
          percent = displayedLength / itemLength;
        }
        if (item.type == HomePageItemType.Circle) {
          Moment? moment = item.circleItemData;
          if (percent >= Report_Start_Percent) {
            _startExposure(moment, percent);
          } else {
            _endExposure(moment);
          }
        }
        return Column(
          children: [
            HomePageItemWidget(
              key: ValueKey(item.exposureKey),
              data: item,
              isTest: widget.isTestPage,
              refer: PageRefer(widget.pageKey),
              isInView: percent >= 0.5,
              autoPlayVideo: widget.autoPlayVideo,
              supportDark: widget.supportDark,
            ),
            SizedBox(height: item.bottomPadding)
          ],
        );
      },
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(
        hasMore: true,
        textColor: widget.supportDark
            ? R.colors.secondTextColor
            : R.color.secondTextColor,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(
        hasMore: false,
        textColor: widget.supportDark
            ? R.colors.secondTextColor
            : R.color.secondTextColor,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: ErrorData(
          error: _errorMessage,
          fontColor: R.colors.secondTextColor,
          onTap: () {
            _repository.refresh();
          },
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: _errorMessage,
        textColor: widget.supportDark
            ? R.colors.secondTextColor
            : R.color.secondTextColor,
        loadMore: _repository.loadMore,
      );
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: EmptyWidget(
          desc: K.moment_no_data,
          textColor: R.colors.secondTextColor,
          onTap: () {
            _repository.refresh();
          },
        ),
      );
    }
    return LoadingFooter(
      hasMore: true,
      textColor: widget.supportDark
          ? R.colors.secondTextColor
          : R.color.secondTextColor,
    );
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    if (_repository.isLoading && _repository.isEmpty) return;

    List<String> exposureIds = [];
    int maxNum = _repository.length;

    for (int i = firstIndex; i <= lastIndex && i < maxNum; i++) {
      if (i >= maxNum || i < 0) continue; // 防止数组越界
      HomePageItemData? item = _repository.elementAt(i);

      if (item.exposured) {
        continue;
      }

      if (HomePageItemType.Circle == item.type) {
        exposureIds.add(item.exposureKey);
        _trackViewFlow(
          item.exposureType ?? '',
          item.exposureId,
          momentId: item.circleItemData?.topicId,
          tag: item.circleItemData?.reportTag,
          topicIds: item.circleItemData?.reportTagIds,
        );
      } else if (HomePageItemType.Unknown != item.type) {
        exposureIds.add(item.exposureKey);
        _trackViewFlow(item.exposureType ?? '', item.exposureId);
      }

      item.exposured = true;
    }
    if (exposureIds.isNotEmpty) {
      Api.reportStreamExposure(exposureIds);
    }
  }

  void _trackViewFlow(String type, int uid,
      {int? momentId, String? tag, List<int>? topicIds}) {
    Tracker.instance.track(TrackEvent.view_flow, properties: {
      'page': getFlowPage(MomentFlowPage.Recommend),
      'flow_type': type,
      if (uid > 0) 'owner_uid': uid,
      if (momentId != null) 'moment_id': momentId,
      if (tag != null) 'tag': tag,
      if (topicIds != null) 'subject_id': topicIds,
    });
  }
}
