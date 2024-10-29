import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';

import 'model/rush_follow_repo.dart';
import 'package:provider/provider.dart' hide Selector;

/// 冲鸭首页关注列表
///
class HomeFollowPage extends StatefulWidget {
  const HomeFollowPage({Key? key}) : super(key: key);

  @override
  State<HomeFollowPage> createState() => _HomeFollowPageState();
}

class _HomeFollowPageState extends State<HomeFollowPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  @override
  bool get wantKeepAlive => true;

  late MomentModel _momentModel;

  RushFollowRepo? _repository;
  final String _errorMsg = K.moment_something_went_wrong;
  int _lastReloadTime = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _lastReloadTime = nowMilliSecs();
    _momentModel = context.read<MomentModel>();
    _repository = RushFollowRepo(context);
  }

  @override
  void reload({bool force = true, animated = true}) {
    scrollToTop(animated: animated);
    int now = nowMilliSecs();
    if (now - _lastReloadTime > maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
      _repository?.refresh();
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
  Widget build(BuildContext context) {
    super.build(context);
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollStartNotification) {
          Provider.of<MomentVideoProvider>(context, listen: false)
              .setScrollState(MomentFlowPage.Follow, 0);
        } else if (notification is ScrollEndNotification) {
          Provider.of<MomentVideoProvider>(context, listen: false)
              .setScrollState(MomentFlowPage.Follow, 1);
        }
        return false;
      },
      child: RefreshIndicatorFactory.of(
        onRefresh: () async {
          _repository?.refresh();
        },
        child: Consumer<MomentModel>(
          builder: (context, model, child) {
            return LoadingMoreList<Moment>(
              ListConfig<Moment>(
                controller: _scrollController,
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
                    autoPlayVideo: true,
                    showFollow: true,
                    showDelete: false,
                    onMomentDelete: (int topicId) {
                      _repository
                          ?.removeWhere((item) => item.topicId == topicId);
                    },
                    page: MomentFlowPage.Follow,
                  );
                },
                lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
                sourceList: _repository!,
                indicatorBuilder: _indicatorBuilder,
                extendedListDelegate: ExtendedListDelegate(
                    viewportBuilder: _handleExposureReport),
              ),
            );
          },
        ),
      ),
    );
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
          _repository?.refresh();
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
          errorMessage: _errorMsg, loadMore: _repository?.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return InkWell(
        onTap: () {
          _repository?.refresh();
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
    _repository?.dispose();
    super.dispose();
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {}
}
