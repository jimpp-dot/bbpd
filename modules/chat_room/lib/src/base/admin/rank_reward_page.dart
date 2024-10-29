import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:shared/widget/base_select_pop_dialog.dart';
import 'package:chat_room/src/base/admin/rank_reward_detail_page.dart';
import 'package:chat_room/src/base/model/pb/generated/common_reward.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

/// 房间打赏榜
class RankRewardPage extends StatefulWidget {
  final ChatRoomData room;

  const RankRewardPage({Key? key, required this.room}) : super(key: key);

  @override
  State createState() => _RankRewardPageState();
}

class _RankRewardPageState extends State<RankRewardPage>
    with AutomaticKeepAliveClientMixin<RankRewardPage> {
  late _RankRewardLoadingSource _source;

  final GlobalKey _positionKey = GlobalKey();
  final GlobalKey _sortKey = GlobalKey();

  final List<PopBean> _sortPopList = [
    PopBean(0, BaseK.K.sort_reward_value_tab),
    PopBean(1, BaseK.K.sort_recent_time_tab)
  ];
  late PopBean _sortPop;

  final List<PopBean> _positionPopList = [];
  late PopBean _positionPop;

  /// 麦上GS，排除boss位，加入房主信息
  List<PopBean> get _positionByGS {
    List<PopBean> result = widget.room.positions
        .where((e) => e.uid > 0 && !ChatRoomUtil.isBossChair(e))
        .map((e) => PopBean(e.uid, e.name))
        .toList();

    /// 判断服务端返回的positions 是否包含房主信息
    int index = result.indexWhere((e) => e.id == widget.room.createor?.uid);
    if (index < 0) {
      result.insert(
          0,
          PopBean(widget.room.createor?.uid ?? 0,
              widget.room.createor?.name ?? ''));
    }
    return result;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _positionPopList.addAll(_positionByGS);
    _sortPop = _sortPopList[0];
    _positionPop = PopBean(Session.uid, Session.name);
    _source = _RankRewardLoadingSource(
        widget.room.realRid, _positionPop.id, _sortPop.id);
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        children: [
          _buildFilter(),
          Expanded(
            child: RefreshIndicatorFactory.of(
              onRefresh: () => _source.refresh(),
              child: LoadingMoreList<RankRewardItem>(
                ListConfig<RankRewardItem>(
                  itemBuilder: (context, item, index) {
                    return _buildRankRewardItem(item);
                  },
                  lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
                  sourceList: _source,
                  indicatorBuilder: _indicatorBuilder,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankRewardItem(RankRewardItem item) {
    return Container(
      width: double.infinity,
      height: 65,
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildRank(item.rank),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, item.uid,
                  refer: const PageRefer('RankRewardRefer'));
            },
            child:
                CommonAvatar(path: item.icon, size: 48, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        item.name,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    UserSexAndAgeWidget(sex: item.sex, age: item.age),
                  ],
                ),
                if (item.time > 0) ...[
                  const SizedBox(height: 4),
                  Text(
                    Utility.getDateDiff(item.time),
                    style:
                        const TextStyle(color: Color(0x66202020), fontSize: 11),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildPrice(item.value),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              RankRewardDetailPage.show(context, widget.room.realRid,
                  _positionPop.id, _positionPop.title, item.uid);
            },
            child: Container(
              height: 28,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: AlignmentDirectional.center,
              child: Text(K.room_rank_reward_detail,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildPrice(int price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(MoneyConfig.moneyIcon, width: 16, height: 16),
        const SizedBox(width: 2),
        Text(Util.numberToWStringByFloor(price),
            style: TextStyle(color: R.color.secondTextColor, fontSize: 14)),
      ],
    );
  }

  Widget _buildRank(int rank) {
    String rankStr = '';
    if (rank > 99) {
      rankStr = '99+';
    } else if (rank <= 0) {
      rankStr = '-';
    } else {
      rankStr = '$rank';
    }
    return Container(
      width: 54,
      alignment: AlignmentDirectional.center,
      child: (rank >= 1 && rank <= 3)
          ? R.img(
              "rank/rank_big_$rank.png",
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

  Widget _buildFilter() {
    return Container(
      width: double.infinity,
      height: 44,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 16),
          if (widget.room.isReception || widget.room.isCreator)
            GestureDetector(
              onTap: () async {
                PopBean? result = await BaseSelectPopDialog.show(
                    context, _positionPopList, _positionPop.id, _positionKey,
                    width: 172, defaultMarginTop: 8);
                if (result != null && _positionPop.id != result.id) {
                  _positionPop = result;
                  _source.setGs(_positionPop.id);
                  refresh();
                }
              },
              child: Container(
                key: _positionKey,
                width: 105,
                height: 28,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsetsDirectional.only(end: 4),
                alignment: AlignmentDirectional.center,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Color(0xFFF6F7F9),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                          child: Text(_positionPop.title,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis)),
                    ),
                    const SizedBox(width: 6),
                    CustomPaint(
                      painter: DownArrowPainter(color: const Color(0xFF202020)),
                      size: const Size(6, 3),
                    ),
                  ],
                ),
              ),
            ),
          GestureDetector(
            onTap: () async {
              PopBean? result = await BaseSelectPopDialog.show(
                  context, _sortPopList, _sortPop.id, _sortKey,
                  width: 140, defaultMarginTop: 8);
              if (result != null && _sortPop.id != result.id) {
                _sortPop = result;
                _source.setSort(_sortPop.id);
                refresh();
              }
            },
            child: Container(
              key: _sortKey,
              width: 92,
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsetsDirectional.only(end: 4),
              alignment: AlignmentDirectional.center,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Color(0xFFF6F7F9),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                        child: Text(_sortPop.title,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis)),
                  ),
                  const SizedBox(width: 6),
                  CustomPaint(
                    painter: DownArrowPainter(color: const Color(0xFF202020)),
                    size: const Size(6, 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RankRewardLoadingSource extends LoadingMoreBase<RankRewardItem> {
  final int rid;
  int _gs;
  int _sort = 0;

  _RankRewardLoadingSource(this.rid, this._gs, this._sort);

  int _pageIndex = 1;
  bool _hasMore = true;
  String errorMsg = '';

  @override
  bool get hasMore => (_hasMore);

  void setSort(int sort) {
    _sort = sort;
    refresh();
  }

  void setGs(int gs) {
    _gs = gs;
    clear();
    refresh();
  }

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

    ApiRankRewardResponse resp =
        await RoomApi.getRoomRewardList(1, rid, _gs, page, sort: _sort);
    if (resp.success) {
      if (resp.data.list.isNotEmpty) {
        addAll(resp.data.list);
        _hasMore = resp.data.more;
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
