/*
 *
 *  Created by yao.qi on 2022/4/26 下午3:47
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/4/26 下午3:47
 *
 */

/// 名人堂页面
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../model/fame_hall_list_repository.dart';
import '../model/pb/generated/slp_weekstar.pb.dart';
import 'ranking_celebrity_item_widget.dart';
import 'package:rank/k.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:flutter/cupertino.dart';

class RankingCelebrityPage extends StatefulWidget {
  const RankingCelebrityPage({super.key});

  @override
  State<RankingCelebrityPage> createState() => _RankingCelebrityPageState();

  static Future show(BuildContext context, {Key? key}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RankingCelebrityPage(key: key),
        settings: const RouteSettings(name: '/celebrity'),
      ),
    );
  }
}

class _RankingCelebrityPageState extends State<RankingCelebrityPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late FameHallListRepository _fameHallListRepository;

  String? _errorMessage;

  final ScrollController _scrollController = ScrollController();

  late int _lastReloadTime;
  final _maxReloadDurationInMilliSecs = 15 * 1000;

  @override
  void initState() {
    super.initState();
    _lastReloadTime = nowMilliSecs();
    _fameHallListRepository = FameHallListRepository();
  }

  @override
  bool get wantKeepAlive => true;

  Widget _itemBuilder(
      BuildContext context, WeekStarFameHallData item, int index) {
    return RankingCelebrityItemWidget(data: item);
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (Constant.isDevMode)
      Log.d('_indicatorBuilder status=${status.toString()}');
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
          error: _errorMessage,
          onTap: () {
            _fameHallListRepository.refresh(true);
          },
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: K.rank_error_data,
        loadMore: _fameHallListRepository.loadMore,
      );
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        child: ErrorData(
          error: K.rank_no_data,
          onTap: () {
            _fameHallListRepository.refresh(true);
          },
        ),
      );
    }
    return const LoadingFooter(
      hasMore: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          K.rank_celebrity_title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF313131),
          ),
        ),
      ),
      body: RefreshIndicatorFactory.of(
        onRefresh: () async {
          _fameHallListRepository.refresh();
        },
        child: Container(
          color: Colors.white,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              const SliverToBoxAdapter(),
              LoadingMoreSliverList(
                SliverListConfig<WeekStarFameHallData>(
                  itemBuilder: _itemBuilder,
                  sourceList: _fameHallListRepository,
                  indicatorBuilder: _indicatorBuilder,
                  extendedListDelegate: ExtendedListDelegate(
                      viewportBuilder: _handleExposureReport),
                  //isLastOne: false
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
//    Log.d('livelist-$type._handleExposureReport first: $firstIndex, last: $lastIndex');
    if (_fameHallListRepository.isLoading && _fameHallListRepository.isEmpty)
      return;

    int maxNum = _fameHallListRepository.length;

    for (int i = firstIndex; i < lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;
      // Log.d("_handleExposureReport exposure=${item.exposure}");
      if (!_fameHallListRepository.getExposureIndex(i)) {
        //未曝光过
        _fameHallListRepository.setExposureIndex(i, true);

        /// TODO: 曝光上报
      }
    }
  }

  @override
  void reload({bool force = true, animated = true}) {
    int now = nowMilliSecs();
    // Log.d("RoomListRecommendScreen now=$now _lastReloadTime=$_lastReloadTime diff=${now - _lastReloadTime} _maxReloadDurationInMilliSecs=$_maxReloadDurationInMilliSecs force=$force");
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
      scrollToTop(animated: animated);
      _fameHallListRepository.refresh();
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
}
