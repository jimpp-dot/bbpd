import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:message/src/api/message_repo.dart';

import '../../model/pb/generated/slp_gs.pb.dart';

class BbAccostRankSubWidget extends StatefulWidget {
  final int type;
  final String rankName;

  const BbAccostRankSubWidget(this.type, this.rankName, {super.key});

  @override
  State<StatefulWidget> createState() => BbAccostRankSubState();
}

class BbAccostRankSubState extends State<BbAccostRankSubWidget>
    with AutomaticKeepAliveClientMixin {
  late _BbAccostRankLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _BbAccostRankLoadingSource(widget.type, this, widget.rankName);
    _source.refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: _buildContent()),
          _buildRankItemMe(_source.me),
        ],
      ),
    );
  }

  Widget _buildContent() {
    Widget child =
        LoadingMoreList<AccostGsRankItem>(ListConfig<AccostGsRankItem>(
      itemBuilder: (context, item, index) {
        return _buildRankItem(item);
      },
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      indicatorBuilder: _indicatorBuilder,
      physics: const ClampingScrollPhysics(),
    ));

    return RefreshIndicatorFactory.of(
      child: child,
      onRefresh: () => _source.refresh(),
    );
  }

  Widget _buildRankItem(AccostGsRankItem item) {
    return InkWell(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, item.uid);
      },
      child: Container(
        width: double.infinity,
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showRankByKey(autoChatKey)) ...[
              _buildRankItemIndex(item.rank),
              const SizedBox(width: 10),
            ],
            CommonAvatar(
              path: item.icon ?? '',
              size: 48,
              shape: BoxShape.circle,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.name ?? '',
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (showRankScoreByKey(autoChatKey)) ...[
              const SizedBox(width: 12),
              Text(
                '${item.score.toStringAsFixed(1)} ${R.string('rank_score')}',
                style: TextStyle(
                  color: R.color.secondTextColor,
                  fontSize: 15,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildRankItemIndex(int rank) {
    return Container(
      width: 30,
      height: 27,
      alignment: AlignmentDirectional.center,
      child: (rank > 0 && rank < 4)
          ? R.img(
              'ic_accost_rank_index_$rank.webp',
              width: 30,
              height: 27,
              package: ComponentManager.MANAGER_MESSAGE,
            )
          : Text(
              _acquireRankStr(rank),
              style: const TextStyle(
                color: Color(0xFFFFD04B),
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
    );
  }

  String _acquireRankStr(int rank) {
    if (rank < 10 && rank > 0) {
      // 10以内 返回0+rank
      return '0$rank';
    }
    return (rank > 50 || rank <= 0) ? '50+' : '$rank';
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
        fontColor: R.colors.secondTextColor,
        onTap: () {
          _source.refresh();
        },
      );
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        fontColor: R.colors.secondTextColor,
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

  Widget _buildRankItemMe(AccostGsRankItem? item) {
    if (item == null || item.uid <= 0) {
      return const SizedBox();
    }
    return Container(
      width: double.infinity,
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(12), topEnd: Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -4),
            blurRadius: 4,
            color: Color(0x08202020),
          )
        ],
      ),
      alignment: AlignmentDirectional.center,
      child: _buildRankItem(item),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _BbAccostRankLoadingSource extends LoadingMoreBase<AccostGsRankItem> {
  final int type;
  final String rankName;
  int _nextId = 0;
  final BbAccostRankSubState state;

  AccostGsRankItem? me;

  _BbAccostRankLoadingSource(this.type, this.state, this.rankName);

  bool _hasMore = true;
  String errorMsg = '';

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _nextId = 0;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _nextId = 0;
      _hasMore = true;
    }

    bool loadSuccess = false;
    ResAccostGsRank res = await MessageRepo.getBbAccostRankList(
        type: type, nextId: _nextId, rankName: rankName);
    if (res.success) {
      if (_nextId == 0) {
        clear();
        state.refresh();
      }
      me = res.data.me;
      addAll(res.data.list);

      _hasMore = res.data.hasMore;
      _nextId = res.data.nextId;
      loadSuccess = true;
    } else {
      errorMsg = res.msg;
      loadSuccess = false;
    }
    return loadSuccess;
  }
}
