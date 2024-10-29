import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/auction/model/auction_repo.dart';
import 'package:chat_room/src/auction/rank/fame_hall_item.dart';
import 'package:chat_room/src/auction/rank/rank_item.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

enum RankType {
  today, // 今日榜
  total, // 总榜
  fameHall, // 名人堂
}

/// 今日榜、总榜
class RankListPage extends StatefulWidget {
  final RankType rankType;

  const RankListPage({Key? key, required this.rankType}) : super(key: key);

  @override
  _RankListPageState createState() {
    return _RankListPageState();
  }
}

class _RankListPageState extends State<RankListPage>
    with AutomaticKeepAliveClientMixin {
  late RankListSource _source;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _source = RankListSource(widget.rankType);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LoadingMoreList<RespAuctionRankItem>(
      ListConfig<RespAuctionRankItem>(
        sourceList: _source,
        itemBuilder:
            (BuildContext context, RespAuctionRankItem item, int index) {
          if (widget.rankType == RankType.fameHall) {
            return FameHallItem(item: item);
          } else {
            return RanKItem(item: item, index: index);
          }
        },
        indicatorBuilder: _indicatorBuilder,
        lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
        padding: widget.rankType == RankType.fameHall
            ? const EdgeInsetsDirectional.only(start: 10, end: 10, top: 12)
            : EdgeInsets.zero,
        extendedListDelegate: widget.rankType == RankType.fameHall
            ? const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                // childAspectRatio: 172.5 / 116,
              )
            : null,
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(
        hasMore: true,
        textColor: Colors.grey.withOpacity(0.6),
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const CupertinoActivityIndicator();
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(
        hasMore: false,
        textColor: Colors.grey.withOpacity(0.6),
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        fontColor: Colors.grey.withOpacity(0.6),
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: BaseK.K.data_error,
        loadMore: _source.loadMore,
        textColor: Colors.grey.withOpacity(0.6),
      );
    } else if (status == IndicatorStatus.empty) {
      return EmptyWidget(
        textColor: Colors.grey.withOpacity(0.6),
      );
    }
    return LoadingFooter(
      hasMore: true,
      textColor: Colors.grey.withOpacity(0.6),
    );
  }
}

class RankListSource extends LoadingMoreBase<RespAuctionRankItem> {
  final RankType rankType;

  final int limit = 20;
  int page = 0;
  bool _hasMore = true;
  bool forceRefresh = false;

  RankListSource(this.rankType);

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    page = 0;
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      RespAuctionRank result;
      switch (rankType) {
        case RankType.today:
          result = await AuctionRepo.todayRank(
              ChatRoomData.getInstance()?.rid ?? 0,
              page: page);
          break;
        case RankType.total:
          result = await AuctionRepo.worldRank(
              ChatRoomData.getInstance()?.rid ?? 0,
              page: page);
          break;
        case RankType.fameHall:
          result = await AuctionRepo.fameHallRank(
              ChatRoomData.getInstance()?.rid ?? 0,
              page: page);
          break;
      }
      if (result.success && page == 0) {
        clear();
      }
      addAll(result.data.list);
      _hasMore = result.data.list.length >= limit;
      page++;
      isSuccess = true;
    } catch (e, stack) {
      isSuccess = false;
      Log.e(e, stackTrace: stack);
    }
    return isSuccess;
  }
}
