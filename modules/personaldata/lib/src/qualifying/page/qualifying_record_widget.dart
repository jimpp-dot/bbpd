import 'package:shared/shared.dart';
import 'package:shared/widget/qualifying_segment_start_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart' as RoomK;
import 'package:personaldata/k.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:personaldata/src/qualifying/model/qualifying_api.dart';
import 'package:shared/util/qualifying_util.dart';
import 'package:personaldata/src/qualifying/widget/qualifying_select_pop_dialog.dart';

/// PK战绩主页
class QualifyingRecordWidget extends StatefulWidget {
  final int uid;

  const QualifyingRecordWidget({Key? key, required this.uid}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QualifyingRecordState();

  static Future show(BuildContext context, int uid) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QualifyingRecordWidget(uid: uid),
        settings: const RouteSettings(name: '/QualifyingRecordWidget'),
      ),
    );
  }
}

class _QualifyingRecordState extends State<QualifyingRecordWidget>
    with BaseScreenStateMixin {
  RoomCrossPkExploitsListData? _data;

  RoomCrossPkQualifyingSummary get summary =>
      _data?.summary ?? RoomCrossPkQualifyingSummary();
  List<RoomCrossPkQualifyingRecordItem> get recordList => _data?.list ?? [];

  final GlobalKey _filterKey = GlobalKey();
  final List<PopBean> _filterPopList = [
    PopBean(0, K.room_cross_pk_qualifying_total_record),
    PopBean(1, RoomK.K.room_cross_pk_qualifying_title),
    PopBean(2, RoomK.K.room_cross_pk_match_title)
  ];
  late PopBean _filterPop;

  final GlobalKey<_QualifyingRecordListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _filterPop = _filterPopList[0];
    _loadData();
  }

  Future _loadData() async {
    ApiRoomCrossPkExploitsListResponse resp =
        await QualifyingApi.getPKRecordList(widget.uid);
    if (resp.success) {
      _data = resp.data;
      setScreenReady();
    } else {
      setScreenError();
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar.custom(
        title: Text(K.personal_cpk_record_title,
            style: const TextStyle(
                color: Color(0xFF202020),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
            iconSize: 24,
            padding: const EdgeInsetsDirectional.only(start: 8, end: 16),
            icon: R.img('ic_help.svg',
                width: 24,
                color: const Color(0xFF202020),
                package: ComponentManager.MANAGER_BASE_CORE),
            onPressed: () => BaseWebviewScreen.show(context,
                url: Util.getHelpUrlWithQStr('k163')),
          ),
        ],
      ),
      body: buildStatusContent(),
    );
  }

  @override
  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CommonNestedScrollView(
        headerSliverBuilder: (context, boxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 10),
                child: QualifyingStatisticsWidget(summary: summary),
              ),
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildBar(),
            Expanded(
              child: QualifyingRecordListWidget(
                  key: _listKey, uid: widget.uid, data: recordList),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              (widget.uid == Session.uid)
                  ? K.personal_qualifying_record_title_self
                  : K.personal_qualifying_record_title_ta,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              List<PopBean> filterList = List.from(_filterPopList);
              filterList.remove(_filterPop);
              filterList.insert(0, _filterPop);
              PopBean? result = await QualifyingSelectPopDialog.show(
                  context, filterList, _filterKey,
                  selectedId: _filterPop.id);
              if (result != null && _filterPop.id != result.id) {
                _filterPop = result;
                _listKey.currentState?.setFilter(_filterPop.id);
                refresh();
              }
            },
            child: Container(
              key: _filterKey,
              width: 84,
              height: 36,
              alignment: AlignmentDirectional.center,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Color(0xFFF6F7F9),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_filterPop.title,
                      style: const TextStyle(
                          color: Color(0xFF202020),
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(width: 8),
                  CustomPaint(
                    painter: TopArrowPainter(color: const Color(0xFF202020)),
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

/// PK战绩-排位段位胜率
class QualifyingStatisticsWidget extends StatelessWidget {
  final RoomCrossPkQualifyingSummary summary;

  const QualifyingStatisticsWidget({Key? key, required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 215,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
            colors: [Color(0xFFD364FF), Color(0xFF82E0FF)]),
      ),
      alignment: AlignmentDirectional.center,
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 114),
              Text(
                QualifyingUtil.getSegmentTitle(summary.curSegment.segmentName,
                    summary.curSegment.subSegment),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              QualifyingSegmentStarBigWidget(
                  summary.curSegment.star, summary.curSegment.totalStart,
                  height: 30, fontSize: 20),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    K.personal_cpk_segment_record([
                      '${summary.numWin}',
                      '${summary.numDraw}',
                      '${summary.numFail}'
                    ]),
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 11),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    K.personal_cpk_segment_rate([
                      QualifyingUtil.getWinRate(
                          summary.numWin, summary.numDraw, summary.numFail)
                    ]),
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                R.img(
                  'ic_cross_pk_statistics_segment_bg.webp',
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                  package: ComponentManager.MANAGER_PERSONALDATA,
                ),
                CachedNetworkImage(
                    imageUrl: summary.curSegment.segmentUrl,
                    width: 128,
                    height: 128),
              ],
            ),
          ),
          PositionedDirectional(
            start: 12,
            top: 12,
            child: GestureDetector(
              onTap: () {
                IRankManager rankManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_RANK);
                rankManager.showRank(context, 'cpk/living');
              },
              child: Container(
                height: 28,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: AlignmentDirectional.center,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                      colors: [Color(0xFFFE67D1), Color(0xFF65DAFF)]),
                ),
                child: Text(K.personal_cpk_rank_living_title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// PK战绩-记录
class QualifyingRecordListWidget extends StatefulWidget {
  final int uid;
  final List<RoomCrossPkQualifyingRecordItem> data;

  const QualifyingRecordListWidget(
      {Key? key, required this.uid, required this.data})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _QualifyingRecordListState();
}

class _QualifyingRecordListState extends State<QualifyingRecordListWidget> {
  late _QualifyingRecordLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _QualifyingRecordLoadingSource(widget.uid);
    if (Util.isCollectionEmpty(widget.data)) {
      _source.refresh();
    } else {
      _source.addAll(widget.data);
    }
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  void setFilter(int type) {
    _source.setType(type);
  }

  @override
  Widget build(BuildContext context) {
    return LoadingMoreList<RoomCrossPkQualifyingRecordItem>(
      ListConfig<RoomCrossPkQualifyingRecordItem>(
        itemBuilder: (context, item, index) {
          return _buildQualifyingRecordItem(item);
        },
        lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
        sourceList: _source,
        indicatorBuilder: _indicatorBuilder,
        autoRefresh: false,
      ),
    );
  }

  Widget _buildQualifyingRecordItem(RoomCrossPkQualifyingRecordItem item) {
    String winIcon = 'ic_cross_pk_fail.webp';
    String winBg = 'ic_cross_pk_fail_bg.webp';
    List<Color> bgColors = [const Color(0x0F1D60DD), const Color(0x0F1D60DD)];
    double bgRadius = 12, margin = 0;
    if (item.master.win == RoomCrossPkWinState.CROSSPK_WIN) {
      margin = 0.5;
      winIcon = 'ic_cross_pk_win.webp';
      winBg = 'ic_cross_pk_win_bg.webp';
      bgColors = [
        const Color(0xFFFFF6DE),
        const Color(0xFFFFEFC1),
        const Color(0xFFFFE290)
      ];
    } else if (item.master.win == RoomCrossPkWinState.CROSSPK_DRAW) {
      winIcon = 'ic_cross_pk_draw.webp';
    }

    /// 目标是否在红方房间
    bool selfFromRed = item.master.rid == item.red.rid;

    Widget child = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(bgRadius - margin),
        gradient: LinearGradient(colors: bgColors),
      ),
      margin: EdgeInsets.all(margin),
      alignment: AlignmentDirectional.center,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            end: 0,
            child: R.img(winBg,
                width: 112,
                height: 112,
                package: ComponentManager.MANAGER_PERSONALDATA),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonAvatar(
                        path: item.master.user.icon,
                        size: 58,
                        shape: BoxShape.circle),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  item.pkMode == 4
                                      ? RoomK.K.room_cross_pk_qualifying_title
                                      : RoomK.K.room_cross_pk_match_title,
                                  style: const TextStyle(
                                      color: Color(0xFF222222),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              R.img(winIcon,
                                  width: 42,
                                  height: 21,
                                  package:
                                      ComponentManager.MANAGER_PERSONALDATA),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Text(
                                      RoomK.K.room_live_pk_charm_num(
                                          ['${item.master.score}']),
                                      style: const TextStyle(
                                          color: Color(0x99222222),
                                          fontSize: 13))),
                              Text(Utility.formatDateDisComment(item.pkAt),
                                  style: const TextStyle(
                                      color: Color(0xFFBC6C26), fontSize: 11)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: Color(0xFF6D33E3),
                  ),
                  padding: const EdgeInsetsDirectional.all(2),
                  alignment: AlignmentDirectional.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonAvatar(
                          path: item.red.user.icon,
                          size: 36,
                          shape: BoxShape.circle),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.red.user.name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(getDurationStr(item.pkDuration),
                                      style: const TextStyle(
                                          color: Color(0xD9F6F7F9),
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      item.blue.user.name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 2),
                            PkScoreWidget(
                              item.red.score.toDouble(),
                              item.blue.score.toDouble(),
                              roundCorner: true,
                              height: 18,
                              leftName: selfFromRed
                                  ? RoomK.K.room_our_side
                                  : RoomK.K.room_opposite_side,
                              rightName: selfFromRed
                                  ? RoomK.K.room_opposite_side
                                  : RoomK.K.room_our_side,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      CommonAvatar(
                          path: item.blue.user.icon,
                          size: 36,
                          shape: BoxShape.circle),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );

    if (item.master.win == RoomCrossPkWinState.CROSSPK_WIN) {
      child = GradientBorder(
        borderGradient: const LinearGradient(
            colors: [Color(0xFFFFDEA1), Color(0xFFFFC489)]),
        borderRadius: bgRadius,
        child: child,
      );
    }
    child = GestureDetector(
      onTap: () {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.showShowCrossPKResultDialog(
            context, item.pkId, item.master.rid);
      },
      child: child,
    );
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4), child: child);
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

  String getDurationStr(int duration) {
    String result = '';
    if (duration > 0) {
      int min = duration ~/ 60;
      int sec = duration % 60;
      result += (min < 10) ? '0$min' : '$min';
      result += ':';
      result += (sec < 10) ? '0$sec' : '$sec';
    }
    return result;
  }
}

class _QualifyingRecordLoadingSource
    extends LoadingMoreBase<RoomCrossPkQualifyingRecordItem> {
  final int uid;

  _QualifyingRecordLoadingSource(this.uid);

  int _type = 0;

  void setType(int value) {
    _type = value;
    refresh();
  }

  RoomCrossPkQualifyingSummary? qualifying;

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

    ApiRoomCrossPkExploitsListResponse resp =
        await QualifyingApi.getPKRecordList(uid, page: page, type: _type);
    if (resp.success) {
      if (qualifying == null && resp.data.hasSummary()) {
        qualifying = resp.data.summary;
      }
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
