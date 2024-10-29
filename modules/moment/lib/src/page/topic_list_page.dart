import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:provider/provider.dart';

/// 话题列表
class TopicListPage extends StatefulWidget {
  final int tagId;
  final PageType? pageType;
  final String? tagName;
  final bool wrapRefresh;

  const TopicListPage(
      {super.key,
      required this.tagId,
      this.pageType,
      this.tagName,
      this.wrapRefresh = true});

  @override
  _TopicListPageState createState() => _TopicListPageState();
}

class _TopicListPageState extends State<TopicListPage>
    with AutomaticKeepAliveClientMixin<TopicListPage>, ReloadStateMixin {
  final String _errorMessage = '';
  late CircleDetailRepo _source;

  late MomentModel _momentModel;

  @override
  void initState() {
    super.initState();
    _momentModel = context.read<MomentModel>();
    _source = CircleDetailRepo(widget.tagId, widget.pageType, _momentModel);
    _source.refresh();
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    // Log.d('Build indicator with status: $status');

    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      if (_source.isEmpty) {
        return ErrorData(
          onTap: () {
            _source.refresh();
          },
          fontColor: R.colors.secondTextColor,
        );
      } else {
        return const LoadingFooter(hasMore: false);
      }
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.colors.secondTextColor,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMessage, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return EmptyWidget(
          desc: K.moment_topic_empty, textColor: R.colors.secondTextColor);
    }
    return const LoadingFooter(hasMore: true);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.wrapRefresh == false) {
      return _buildBody();
    } else {
      return RefreshIndicatorFactory.of(
          backgroundColor: R.color.homeBgColor,
          child: _buildBody(),
          onRefresh: () async {
            Log.d('On refresh...');
            _source.refresh();
          });
    }
  }

  Widget _buildBody() {
    return Consumer<MomentModel>(
      builder: (context, model, child) {
        return LoadingMoreList<Moment>(
          ListConfig<Moment>(
            itemBuilder: (c, item, index) {
              Moment? cachedMoment = _momentModel.getCachedMoment(item.topicId);
              if (cachedMoment != null) {
                item = cachedMoment;
              }

              int parenTagId = 0;
              // 如果是鉴定师，则tag不能点击
              if (item.appraiserTag?.id != null) {
                parenTagId = item.appraiserTag!.id;
              }

              return MomentItem(
                key: ValueKey(item.topicId),
                moment: item,
                canHeadTaped: true,
                showFollow: true,
                parentTagId: parenTagId,
                onMomentDelete: (int topicId) {
                  _source.removeWhere((item) => item.topicId == topicId);
                },
                page: MomentFlowPage.TopicDetail,
                topicName: widget.tagName ?? '',
                supportDark: true,
                bottomMargin: 12,
              );
            },
            lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
            sourceList: _source,
            indicatorBuilder: _indicatorBuilder,
            extendedListDelegate:
                ExtendedListDelegate(viewportBuilder: _handleExposureReport),
          ),
        );
      },
    );
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    if (_source.isLoading && _source.isEmpty) return;
    int maxNum = _source.length;
    for (int i = firstIndex; i <= lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;
      Moment item = _source.elementAt(i);
      if (item.isExposure) {
        continue;
      }

      trackerViewFlowReport(
          moment: item,
          page: MomentFlowPage.TopicDetail,
          topicName: widget.tagName);

      item.isExposure = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _source.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void scrollToTop({bool animated = true}) {}

  @override
  void reload({bool force = true, animated = true}) {
    scrollToTop(animated: animated);
    _source.refresh();
  }
}

class CircleDetailRepo extends LoadingMoreBase<Moment> {
  int _page = 1;
  bool _hasMoreMoment = true;

  final int tagId; // 话题id
  final PageType? pageType;
  final MomentModel momentModel;

  CircleDetailRepo(this.tagId, this.pageType, this.momentModel);

  Future<bool> _loadMoments(int next, {bool first = false}) async {
    // Log.d('Start to load moments, nextId: $next, isFirst: $first');
    bool success = false;

    DataRsp<RushMomentPage> response =
        await Api.getPlayList(_page, type: pageType, id: tagId);
    if (response.success == true && response.data != null) {
      RushMomentPage momentPage = response.data!;

      if (momentPage.topics != null) {
        _hasMoreMoment = momentPage.more != 0;
        List<Moment> moments = momentPage.topics!;
        if (first) {
          clear();
        }
        addAll(moments);
        momentModel.putCachedMoments(moments);
      }
      if (_hasMoreMoment) {
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
    _hasMoreMoment = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  bool get hasMore {
    return _hasMoreMoment;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isLoadMore = isloadMoreAction;
    return _loadMoments(isLoadMore ? _page : 1, first: !isLoadMore);
  }
}
