import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/circle/repository/circle_moment_page_repository.dart';
import 'package:provider/provider.dart';

import '../../../k.dart';

typedef RefreshCallback = void Function();

/// 圈子
class CircleMomentPage extends StatefulWidget {
  final int circleId;
  final int typeId;
  final String circleName;
  final RefreshCallback callback;

  const CircleMomentPage(
      this.circleId, this.typeId, this.callback, this.circleName,
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return CircleMomentState();
  }
}

class CircleMomentState extends State<CircleMomentPage>
    with AutomaticKeepAliveClientMixin<CircleMomentPage> {
  late MomentModel _momentModel;

  late CircleMomentPageRepository repository;
  final String _errorMsg = K.moment_something_went_wrong;

  @override
  void initState() {
    super.initState();
    _momentModel = context.read<MomentModel>();
    repository = CircleMomentPageRepository(
        widget.circleId, widget.typeId, widget.callback, _momentModel);
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
                return MomentItem(
                  key: ValueKey(item.topicId),
                  moment: item,
                  canHeadTaped: true,
                  onMomentDelete: (int topicId) {
                    repository.removeWhere((item) => item.topicId == topicId);
                  },
                  page: MomentFlowPage.NetDetail,
                  topicName: widget.circleName,
                );
              },
              lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
              sourceList: repository,
              indicatorBuilder: _indicatorBuilder,
              extendedListDelegate:
                  ExtendedListDelegate(viewportBuilder: _handleExposureReport),
            ),
          );
        },
      ),
      onRefresh: () async {
        repository.refresh();
      },
    );
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    if (repository.isLoading && repository.isEmpty) return;
    int maxNum = repository.length;
    for (int i = firstIndex; i <= lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;
      Moment item = repository.elementAt(i);
      if (item.isExposure) {
        continue;
      }

      trackerViewFlowReport(
          moment: item,
          page: MomentFlowPage.NetDetail,
          topicName: widget.circleName);

      item.isExposure = true;
    }
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return InkWell(
        onTap: () {
          repository.refresh();
        },
        child: Center(
          child: Text(
            _errorMsg,
            style: R.textStyle.caption,
          ),
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMsg, loadMore: repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return InkWell(
        onTap: () {
          repository.refresh();
        },
        child: Center(
          child: Text(
            K.moment_no_more_info,
            style: R.textStyle.caption,
          ),
        ),
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  @override
  void dispose() {
    repository.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
