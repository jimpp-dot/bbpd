import 'package:shared/shared.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/moment.dart';
import 'package:provider/provider.dart';

import '../../k.dart';

/// 个人页朋友圈列表
///
class MomentListWidget extends StatefulWidget {
  final int uid;

  const MomentListWidget({Key? key, this.uid = 0}) : super(key: key);

  @override
  _MomentListWidgetState createState() => _MomentListWidgetState();
}

class _MomentListWidgetState extends State<MomentListWidget>
    with AutomaticKeepAliveClientMixin<MomentListWidget> {
  late MomentModel _momentModel;

  final String _errorMessage = '';
  late MomentLoadingMoreSource _source;

  @override
  void initState() {
    super.initState();

    _momentModel = context.read<MomentModel>();
    _source = MomentLoadingMoreSource(widget.uid, _momentModel);
    _source.refresh();
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      if (_source.isEmpty) {
        return ErrorData(
          error: K.personaldata_no_data,
          onTap: () {
            PulseLog.instance.event('click_event', properties: {
              'click_tag': 'personal_moment_empty_retry_${widget.uid}',
            });
            _source.refresh();
          },
        );
      } else {
        return const SizedBox();
      }
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _errorMessage,
        onTap: () {
          PulseLog.instance.event('click_event', properties: {
            'click_tag': 'personal_moment_error_retry_${widget.uid}',
          });
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMessage, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      String imageUrl =
          Session.uid == widget.uid ? 'bb_null.webp' : 'bb_null.webp';
      String toast = Session.uid == widget.uid
          ? K.publish_first_moment
          : K.personaldata_no_moment;
      return SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: ImageEmptyWidget(imageUrl,
              text: toast, textColor: R.colors.mainTextColor),
        ),
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicatorFactory.of(
      backgroundColor: R.color.mainBgColor,
      child: Consumer<MomentModel>(
        builder: (context, model, child) {
          return LoadingMoreList<Moment>(
            ListConfig<Moment>(
              itemBuilder: (c, item, index) {
                Moment? cachedMoment =
                    _momentModel.getCachedMoment(item.topicId);
                if (cachedMoment != null) {
                  item = cachedMoment;
                }
                return Column(
                  children: [
                    const SizedBox(height: 12),
                    MomentItem(
                      key: ValueKey(item.topicId),
                      moment: item,
                      canHeadTaped: false,
                      showLikeList: false,
                      supportDark: true,
                      page: MomentFlowPage.User,
                      onMomentDelete: (int topicId) {
                        Log.d('onMomentDelete topicId: $topicId');
                        _source.removeWhere((item) => item.topicId == topicId);
                        setState(() {});
                      },
                      onTopChanged: () {
                        _source.refresh();
                      },
                    ),
                  ],
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
      ),
      onRefresh: () async {
        Log.d('On refresh...');
        _source.refresh();
      },
    );
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    if (_source.isEmpty) return;

    int maxNum = _source.length;
    for (int i = firstIndex; i < lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;
      Moment item = _source.elementAt(i);
      if (item.isExposure) {
        continue;
      }

      item.isExposure = true;

      trackerViewFlowReport(moment: item, page: MomentFlowPage.User);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _source.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class MomentLoadingMoreSource extends LoadingMoreBase<Moment> {
  int _nextTopicId = 0;
  bool _hasMoreMoment = true;
  bool forceRefresh = false;
  int uid;
  final MomentModel _momentModel;

  MomentLoadingMoreSource(this.uid, this._momentModel);

  Future<bool> _loadMoments(int next, {bool first = false}) async {
    bool success = false;
    MomentPage? momentPage;
    DataRsp<MomentPage> response = await Api.getMomentList(uid, next);
    if (response.success == true && response.data != null) {
      momentPage = response.data;
      if (momentPage?.topics != null) {
        List<Moment> moments = momentPage?.topics ?? [];
        if (first) {
          clear();
        }
        addAll(moments);
        _momentModel.putCachedMoments(moments);
      }
      _nextTopicId = momentPage?.next ?? 0;
      if (_nextTopicId != 0) {
        _hasMoreMoment = true;
      } else {
        _hasMoreMoment = false;
      }
      success = true;
    } else {
      success = false;
    }

    return success;
  }

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMoreMoment = true;
    forceRefresh = !notifyStateChanged;
    final bool result = await super.refresh(notifyStateChanged);
    forceRefresh = false;
    return result;
  }

  @override
  bool get hasMore {
    return (_hasMoreMoment) || forceRefresh;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isLoadMore = isloadMoreAction;
    return _loadMoments(isLoadMore ? _nextTopicId : 0, first: !isLoadMore);
  }
}
