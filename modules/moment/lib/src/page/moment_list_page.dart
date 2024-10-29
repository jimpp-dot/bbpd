import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter_sliver_tracker/flutter_sliver_tracker.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/api/moment_follow_list_repo.dart';
import 'package:moment/src/model/moment_bean_v3.dart';
import 'package:moment/src/widget/activity_follow_widget.dart';
import 'package:moment/src/widget/moment_follow_topics.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'global_moment_list/global_moment_item.dart';

/// 朋友圈关注列表 v3
class MomentListPage extends StatefulWidget {
  final bool autoPlayVideo;
  final bool showLikeList;
  final bool supportDark;

  const MomentListPage(
      {super.key,
      this.autoPlayVideo = false,
      this.showLikeList = false,
      this.supportDark = false});

  @override
  MomentListPageState createState() => MomentListPageState();
}

class MomentListPageState extends State<MomentListPage>
    with
        AutomaticKeepAliveClientMixin<MomentListPage>,
        WidgetsBindingObserver,
        ReloadStateMixin {
  @override
  bool get wantKeepAlive => true;

  late MomentFollowListRepo _repository;
  final String _errorMessage = K.moment_net_error;

  bool _scrollIdle = true;
  int _firstIndex = -1; //当前屏幕内可见的第一个条目索引
  int _lastIndex = -1; //当前屏幕内可见的最后一个条目索引
  bool _showRefresh = false; //首页下滑超过一屏时底栏按钮改为显示刷新

  final Map<int, ExposureMoment> _exposureItems = {};

  bool _isCurrentPage = false;

  Timer? _loadExtraTimer;

  late int _lastReloadTime;

  ScrollController _scrollController = ScrollController();

  final GlobalKey<MomentFollowTopicsState> _keyFollowTopics = GlobalKey();
  final _maxReloadDurationInMilliSecs = 60 * 1000;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    eventCenter.addListener(EventRefreshFollowList, _onRefreshList);

    MomentModel momentModel = context.read<MomentModel>();
    _repository = MomentFollowListRepo(momentModel, onReload: _onRepoReload);
    _isCurrentPage = true;
    _lastReloadTime = nowMilliSecs();
  }

  void _onRepoReload() {
    if (mounted) {
      Provider.of<ProfilePayload>(context, listen: false).resetMomentFollow();
    }
  }

  @override
  void dispose() {
    _isCurrentPage = false;
    WidgetsBinding.instance.removeObserver(this);
    eventCenter.removeListener(EventRefreshFollowList, _onRefreshList);
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    _repository.dispose();
    _loadExtraTimer?.cancel();
    super.dispose();
  }

  _onRefreshList(String type, dynamic data) {
    if (data != null && data is Moment) {
      Moment item = data;
      if (item.tagType == TagType.broadcast) {
        int index = _repository.indexWhere(
            (element) => element.type == MomentFollowItemType.Broadcast);
        _repository[index] = MomentFollowItemBean(
          circleItemData: data,
          type: MomentFollowItemType.Broadcast,
          isExposure: false,
          exposureId: data.topicId,
        );
      } else {
        _repository.insert(
          0,
          MomentFollowItemBean(
            circleItemData: data,
            type: MomentFollowItemType.Circle,
            isExposure: false,
            exposureId: data.topicId,
          ),
        );
      }
      if (mounted) setState(() {});
    } else {
      _repository.refresh();
    }
  }

  _onLogin(String type, dynamic data) {
    reload();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        if (_isCurrentPage) _onPageVisible(true);
        break;
      case AppLifecycleState.paused:
        if (_isCurrentPage) _reportAll();
        break;
      case AppLifecycleState.detached:
        break;
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

  @override
  void reload({bool force = true, animated = true}) {
    scrollToTop(animated: animated);

    int now = nowMilliSecs();
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
      _repository.refresh();
      _keyFollowTopics.currentState?.reload();
      _firstIndex = -1;
      _lastIndex = -1;
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
        reportExposureTime(value, MomentFlowPage.Follow);
      }
      value.isDirty = true;
    });
//    _exposureItems.clear();
  }

  /// 开始曝光统计
  void _startExposure(MomentFollowItemBean itemBean, double percent) {
    if (!_exposureItems.containsKey(itemBean.exposureId)) {
      _exposureItems[itemBean.exposureId] = ExposureMoment(
        topicId: itemBean.exposureId,
        startExposureTime: DateTime.now(),
        moment: itemBean.circleItemData,
      );
    }
  }

  /// 结束曝光统计
  void _endExposure(MomentFollowItemBean itemBean) {
    if (_exposureItems.containsKey(itemBean.exposureId)) {
      ExposureMoment item = _exposureItems[itemBean.exposureId]!;
      item.duration =
          DateTime.now().difference(item.startExposureTime).inMilliseconds;
      reportExposureTime(item, MomentFlowPage.Follow);
      _exposureItems.remove(itemBean.exposureId);
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController =
        PrimaryScrollController.of(context) ?? _scrollController;

    super.build(context);
    return VisibilityDetector(
      key: const ValueKey('moment-list-page-key'),
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

          if (notification is UserScrollNotification) {
            UserScrollNotification user = notification;
            bool scrollIdle = user.direction == ScrollDirection.idle;
            if (!scrollIdle) {
              _scrollIdle = false;
            } else if (scrollIdle != _scrollIdle && mounted) {
              _scrollIdle = true;
              refreshBottomButtonIfNeed();
            }
          } else if (notification is ScrollStartNotification) {
            Provider.of<MomentVideoProvider>(context, listen: false)
                .setScrollState(MomentFlowPage.Follow, 0);
          } else if (notification is ScrollEndNotification) {
            Provider.of<MomentVideoProvider>(context, listen: false)
                .setScrollState(MomentFlowPage.Follow, 1);
          }

          return false;
        },
        child: ScrollViewListener(
          child: RefreshIndicatorFactory.of(
            onRefresh: () async {
              _repository.refresh();
              _keyFollowTopics.currentState?.reload();
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
                      // 话题
                      MomentFollowTopics(key: _keyFollowTopics),
                    ],
                  ),
                ),
                LoadingMoreSliverList(
                  SliverListConfig<MomentFollowItemBean>(
                    itemBuilder: _itemBuilder,
                    sourceList: _repository,
                    indicatorBuilder: _indicatorBuilder,
                    extendedListDelegate: ExtendedListDelegate(
                      viewportBuilder: _handleExposureReport,
                    ),
                    //isLastOne: false
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(
      BuildContext context, MomentFollowItemBean itemBean, int index) {
    return SliverMultiBoxScrollListenerDebounce(
      debounce: 30,
      maxSpeed: 0.1,
      onScrollInit: (double percent) {
        if (itemBean.type == MomentFollowItemType.Circle) {
          // percent 列表项显示比例
          if (percent >= 0.5) {
            _startExposure(itemBean, percent);
          }
        }
      },
      onScrollUpdate: (double percent) {
        // if (itemBean.type == MomentFollowItemType.Circle) {
        //   if (percent >= Report_Start_Percent) {
        //     _startExposure(itemBean, percent);
        //   } else {
        //     _endExposure(itemBean);
        //   }
        // }
      },
      builder: (BuildContext context, double itemLength, double displayedLength,
          double parentDisplayRate) {
        double percent = 0;
        if (itemLength > 0) {
          percent = displayedLength / itemLength;
        }
        // Log.d('SliverMultiBoxScrollListenerDebounce build: $percent ==== ${itemBean.exposureId}');
        if (itemBean.type == MomentFollowItemType.Circle) {
          if (percent >= Report_Start_Percent) {
            _startExposure(itemBean, percent);
          } else {
            _endExposure(itemBean);
          }
        }
        if (MomentFollowItemType.Circle == itemBean.type) {
          Moment moment = itemBean.circleItemData!;
          return Consumer<MomentModel>(builder: (context, item, child) {
            Moment? cachedMoment =
                context.watch<MomentModel>().getCachedMoment(moment.topicId);
            if (cachedMoment != null) {
              moment = cachedMoment;
            }
            return MomentItem(
              key: ValueKey(moment.topicId),
              moment: moment,
              page: MomentFlowPage.Follow,
              showComment: true,
              canCommentTaped: false,
              showLikeList: widget.showLikeList,
              onMomentDelete: (int topicId) {
                Log.d('onMomentDelete topicId: $topicId');
                _repository.removeWhere(
                    (item) => item.circleItemData?.topicId == topicId);
                setState(() {});
              },
              isInView: percent >= 0.5,
              autoPlayVideo: widget.autoPlayVideo,
              supportDark: widget.supportDark,
              bottomMargin: 12,
            );
          });
        } else if (MomentFollowItemType.Broadcast == itemBean.type) {
          Moment moment = itemBean.circleItemData!;
          return Consumer<MomentModel>(builder: (context, item, child) {
            Moment? cachedMoment =
                context.watch<MomentModel>().getCachedMoment(moment.topicId);
            if (cachedMoment != null) {
              moment = cachedMoment;
            }
            return Column(
              children: [
                GlobalMomentItem(
                  key: ValueKey(moment.topicId),
                  moment: moment,
                  page: MomentFlowPage.Follow,
                  showInNormalMoment: true,
                ),
                const SizedBox(height: 12)
              ],
            );
          });
        } else {
          return Column(
            children: [
              ActivityFollowWidget(
                activityBean: itemBean.activityBean,
                page: MomentFlowPage.Follow,
              ),
              const SizedBox(height: 12)
            ],
          );
        }
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
        hasScrollBody: false,
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
        errorMessage: BaseK.K.data_error,
        textColor: widget.supportDark
            ? R.colors.secondTextColor
            : R.color.secondTextColor,
        loadMore: _repository.loadMore,
      );
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: ErrorData(
              error: K.moment_no_data_recommend,
              fontColor: R.colors.secondTextColor,
              bottom: 120,
              onTap: () {
                _repository.refresh();
              },
            ),
          ));
    }
    return LoadingFooter(
      hasMore: true,
      textColor: widget.supportDark
          ? R.colors.secondTextColor
          : R.color.secondTextColor,
    );
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    _firstIndex = firstIndex;
    _lastIndex = lastIndex;
    if (_repository.isLoading && _repository.isEmpty) return;

    int maxNum = _repository.length;

    for (int i = firstIndex; i <= lastIndex && i < maxNum; i++) {
      if (i >= maxNum || i < 0) continue; // 防止数组越界

      MomentFollowItemBean? item = _repository.elementAt(i);
      if (item.isExposure) {
        continue;
      }

      if (MomentFollowItemType.Circle == item.type) {
        trackerViewFlowReport(
            moment: item.circleItemData, page: MomentFlowPage.Follow);

        item.isExposure = true;
      } else if (MomentFollowItemType.Activity == item.type) {
        //活动
        Tracker.instance.track(TrackEvent.view_flow, properties: {
          'page': getFlowPage(MomentFlowPage.Follow),
          'flow_type': 'followactivity',
          'owner_uid': item.exposureId,
        });

        item.isExposure = true;
      }
    }
  }

  void refreshBottomButtonIfNeed({bool force = false}) {
    // Log.d('HomeScreenState._refreshBottomButtonIfNeed first = $_firstIndex, last = $_lastIndex');
    bool showRefresh = _lastIndex >= 8;
    if (showRefresh != _showRefresh || force) {
      _showRefresh = showRefresh;
      eventCenter.emit('homescreen.scroll.showRefresh', _showRefresh);
    }
  }
}
