import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:rank/assets.dart';
import 'package:rank/src/api/api.dart';
import 'package:rank/src/model/pb/generated/rank_cross_pk.proto.pb.dart';

/// PK厅
class CrossPKLivingScreen extends StatefulWidget {
  const CrossPKLivingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CrossPKLivingState();
}

class _CrossPKLivingState extends State<CrossPKLivingScreen>
    with AutomaticKeepAliveClientMixin {
  late _CrossPKLivingLoadingSource _source;

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.rank_cross_pk_living);
    _source = _CrossPKLivingLoadingSource();
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(child: _buildBody());
  }

  Widget _buildBody() {
    return RefreshIndicatorFactory.of(
      onRefresh: () => _source.refresh(),
      child: LoadingMoreList<RoomCrossPkLivingRankItem>(
        ListConfig<RoomCrossPkLivingRankItem>(
          itemBuilder: (context, item, index) {
            return _buildCrossPkLivingItem(item);
          },
          lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
          sourceList: _source,
          indicatorBuilder: _indicatorBuilder,
        ),
      ),
    );
  }

  Widget _buildCrossPkLivingItem(RoomCrossPkLivingRankItem item) {
    return GestureDetector(
      onTap: () {
        int rid =
            (item.red.charm >= item.blue.charm) ? item.red.rid : item.blue.rid;
        _onTapGoRoom(rid);
      },
      child: Container(
        width: double.infinity,
        height: 66,
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 54,
              alignment: AlignmentDirectional.center,
              child: showRankByKey(roomCpkLiving)
                  ? _renderIndex(item.rank)
                  : const SizedBox.shrink(),
            ),
            GestureDetector(
              onTap: () => _onTapGoRoom(item.red.rid),
              child: CommonAvatar(
                  path: item.red.icon, size: 46, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
            R.img(Assets.ic_rank_cross_pk_icon_webp,
                width: 30, height: 24, package: ComponentManager.MANAGER_RANK),
            const SizedBox(width: 6),
            GestureDetector(
              onTap: () => _onTapGoRoom(item.blue.rid),
              child: CommonAvatar(
                  path: item.blue.icon, size: 46, shape: BoxShape.circle),
            ),
            const Spacer(),
            if (showRankScoreByKey(roomCpkLiving))
              Text('${(item.red.charm + item.blue.charm)}',
                  style:
                      const TextStyle(color: Color(0xFFFF5F7D), fontSize: 16)),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  void _onTapGoRoom(int rid) {
    if (rid > 0) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, rid);
      Tracker.instance
          .track(TrackEvent.click, properties: {'enter_pk_room': rid});
    }
  }

  Widget _renderIndex(int rank) {
    String rankStr = '';
    if (rank > 99) {
      rankStr = '99+';
    } else if (rank <= 0) {
      rankStr = '-';
    } else {
      rankStr = '$rank';
    }
    return (rank >= 1 && rank <= 3)
        ? R.img(
            Assets.rank_rank_big_x_png(rank),
            width: 30,
            height: 27,
            package: ComponentManager.MANAGER_RANK,
          )
        : Text(
            rankStr,
            style: TextStyle(
                color: R.color.mainTextColor.withOpacity(0.4), fontSize: 15),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
      return LoadingFooter(
        hasMore: false,
        loadMore: () => {},
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _source.errorMsg,
        onTap: () {
          _source.refresh();
        },
      );
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: R.string("no_data"),
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg, loadMore: _source.loadMore);
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore, loadMore: _source.loadMore);
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class _CrossPKLivingLoadingSource
    extends LoadingMoreBase<RoomCrossPkLivingRankItem> {
  _CrossPKLivingLoadingSource();

  int _pageIndex = 1;
  bool _hasMore = true;
  String errorMsg = '';

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _pageIndex = 1;
    clear();
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool loadSuccess = false;

    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;

    ApiRoomCrossPkLivingRankResponse resp =
        await Api.getCrossPkLivingRank(page);
    if (resp.success) {
      if (resp.data.list.isNotEmpty) {
        addAll(resp.data.list);
        _hasMore = resp.data.more > 0;
        _pageIndex = page;
      } else {
        _hasMore = false;
      }
      loadSuccess = true;
    } else {
      errorMsg = resp.message;
      loadSuccess = false;
    }
    return loadSuccess;
  }
}
