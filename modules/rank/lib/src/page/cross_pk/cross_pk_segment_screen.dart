import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/util/qualifying_util.dart';
import 'package:shared/widget/qualifying_segment_start_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/api/api.dart';
import 'package:rank/src/model/pb/generated/rank_cross_pk.proto.pb.dart';

/// PK排位
class CrossPKSegmentScreen extends StatefulWidget {
  const CrossPKSegmentScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CrossPKSegmentState();
}

class _CrossPKSegmentState extends State<CrossPKSegmentScreen>
    with AutomaticKeepAliveClientMixin {
  late _CrossPKSegmentLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _CrossPKSegmentLoadingSource(this);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: RefreshIndicatorFactory.of(
            onRefresh: () => _source.refresh(),
            child: LoadingMoreList<RoomCrossPkSegmentRankItem>(
              ListConfig<RoomCrossPkSegmentRankItem>(
                itemBuilder: (context, item, index) {
                  return _buildCrossPkSegmentItem(item);
                },
                lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
                sourceList: _source,
                indicatorBuilder: _indicatorBuilder,
              ),
            ),
          ),
        ),
        if (_source.me != null)
          PositionedDirectional(
            start: 0,
            end: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: R.color.mainBgColor,
                borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(12), topEnd: Radius.circular(12)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x21000000),
                    offset: Offset(0, 2),
                    blurRadius: 16,
                  )
                ],
              ),
              child: _buildCrossPkSegmentItem(_source.me!),
            ),
          ),
      ],
    );
  }

  Widget _buildCrossPkSegmentItem(RoomCrossPkSegmentRankItem item) {
    return GestureDetector(
      onTap: () {
        if (item.uid > 0 && item.uid != Session.uid) {
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, item.uid,
              refer: const PageRefer('RankSegmentRefer'));
        }
      },
      child: Container(
        width: double.infinity,
        height: 72,
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 54,
              alignment: AlignmentDirectional.center,
              child: showRankByKey(roomCpkSegment)
                  ? _renderIndex(item.rank)
                  : const SizedBox.shrink(),
            ),
            CommonAvatar(path: item.icon, size: 52, shape: BoxShape.circle),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          item.name,
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      CachedNetworkImage(
                          imageUrl: item.curSegment.segmentUrl,
                          width: 22,
                          height: 22),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        QualifyingUtil.getSegmentTitle(
                            item.curSegment.segmentName,
                            item.curSegment.subSegment),
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 8),
                      QualifyingSegmentStarWidget(
                          item.curSegment.star, item.curSegment.totalStart),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (item.uid > 0 && item.uid != Session.uid)
              _buildFollowWidget(item),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowWidget(RoomCrossPkSegmentRankItem item) {
    return GestureDetector(
      onTap: () async {
        if (item.isFollow) {
          // 已关注
          bool? result = await showDialog(
            context: context,
            builder: (context) =>
                ConfirmDialog(title: K.rank_dialog_follow_title),
          );
          if (result == true) {
            NormalNull resp =
                await BaseRequestManager.unFollow(item.uid.toString());
            if (resp.success) {
              item.isFollow = !item.isFollow;
              refresh();
            } else {
              Fluttertoast.showCenter(msg: resp.msg);
            }
          }
        } else {
          // 关注
          NormalNull resp = await BaseRequestManager.onFollow(
              item.uid.toString(),
              refer: 'rank_cpk_segment_follow');
          if (resp.success) {
            item.isFollow = !item.isFollow;
            refresh();
          } else {
            Fluttertoast.showCenter(msg: resp.msg);
          }
        }
      },
      child: Container(
        width: 63,
        height: 28,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
              colors: item.isFollow
                  ? [const Color(0xFFF5F5F5), const Color(0xFFF5F5F5)]
                  : R.color.mainBrandGradientColors),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          item.isFollow ? K.rank_has_attention : BaseK.K.base_follow,
          style: TextStyle(
              color: item.isFollow ? const Color(0x99202020) : Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
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

class _CrossPKSegmentLoadingSource
    extends LoadingMoreBase<RoomCrossPkSegmentRankItem> {
  final State state;

  _CrossPKSegmentLoadingSource(this.state);

  int _pageIndex = 1;
  bool _hasMore = true;
  String errorMsg = '';

  RoomCrossPkSegmentRankItem? me;

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

    ApiRoomCrossPkSegmentRankResponse resp =
        await Api.getCrossPkSegmentRank(page);
    if (resp.success) {
      me = resp.data.me;
      state.refresh();
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
