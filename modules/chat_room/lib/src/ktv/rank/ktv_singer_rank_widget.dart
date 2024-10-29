import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/ktv/rank/ktv_music_count_widget.dart';
import 'package:chat_room/src/ktv/rank/ktv_song_rank_widget.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/ktv/utils/time_util.dart';
import 'package:chat_room/src/protobuf/generated/common_ktv.pb.dart';

/// 本周演唱榜 & 最热单曲
class KtvSingerRankWidget extends StatefulWidget {
  final int selectIndex;

  const KtvSingerRankWidget({Key? key, this.selectIndex = 0}) : super(key: key);

  @override
  _KtvSingerRankWidgetState createState() => _KtvSingerRankWidgetState();

  static Future show(BuildContext context, {int selectIndex = 0}) {
    return displayModalBottomSheet(
      context: context,
      isBarrierDismissible: true,
      maxHeightRatio: 0.6,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return KtvSingerRankWidget(selectIndex: selectIndex);
      },
    );
  }
}

class _KtvSingerRankWidgetState extends State<KtvSingerRankWidget>
    with TickerProviderStateMixin {
  final List<String> _tabs = [K.ktv_rank_week_title, K.ktv_rank_hot_song_title];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: _tabs.length, initialIndex: widget.selectIndex, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        image: DecorationImage(
          image: AssetImage(R.imagePath('ktv/ktv_rank_bg.webp',
              package: ComponentManager.MANAGER_BASE_ROOM)),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          _buildTitleTab(),
          Expanded(child: _buildTabBarView()),
        ],
      ),
    );
  }

  Widget _buildTitleTab() {
    return SizedBox(
      height: 57.dp,
      width: Util.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildTabBar(),
          PositionedDirectional(
            end: 8,
            child: InkWell(
              onTap: () {
                String url = Util.getHelpUrlWithQStr('k76');
                BaseWebviewScreen.show(context, url: url);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: R.img(
                  'titlebar/ic_titlebar_question.svg',
                  width: 18,
                  height: 18,
                  color: Colors.white.withOpacity(0.6),
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return CommonTabBar(
      isScrollable: true,
      controller: _tabController,
      tabs: _tabs.map((e) => Tab(child: Text(e))).toList(),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white.withOpacity(0.6),
      labelStyle: const TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: 16,
          fontWeight: FontWeight.w500),
      indicator: const CommonUnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0, color: Colors.white),
        insets: EdgeInsetsDirectional.only(bottom: 6),
        wantWidth: 16,
        draggingWidth: 12.0,
      ),
      indicatorWeight: 0,
    );
  }

  Widget _buildTabBarView() {
    return ExtendedTabBarView(
      physics: const ClampingScrollPhysics(),
      controller: _tabController,
      children: const [
        KtvWeekRankWidget(),
        HotSongRankWidget(),
      ],
    );
  }
}

/// 本周演唱榜
class KtvWeekRankWidget extends StatefulWidget {
  const KtvWeekRankWidget({Key? key}) : super(key: key);

  @override
  _KtvWeekRankWidgetState createState() => _KtvWeekRankWidgetState();
}

class _KtvWeekRankWidgetState extends BaseScreenState<KtvWeekRankWidget>
    with AutomaticKeepAliveClientMixin<KtvWeekRankWidget> {
  ResKtvThisWeekRank? _resData;

  List<KtvThisWeekRankData> _listData = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildStatusContent();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    if (!showRankListByKey(ktvKey)) {
      setScreenEmpty(emptyMsgColor: Colors.white70);
      return;
    }
    ResKtvThisWeekRank resp = await KtvRepo.getWeekRank();
    if (resp.success) {
      if (!Util.isCollectionEmpty(resp.data)) {
        _resData = resp;
        if (resp.data.length < 4) {
          _listData = resp.data;
        } else {
          _listData = resp.data.sublist(3);
        }
        setScreenReady();
      } else {
        setScreenEmpty(emptyMsgColor: Colors.white70);
      }
    } else {
      setScreenError(errorMsg: resp.msg, errorMsgColor: Colors.white70);
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  Widget _buildTopUsersRow() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildRankTopUser(2),
          _buildRankTopUser(1),
          _buildRankTopUser(3),
        ],
      ),
    );
  }

  Widget _buildRankTopUser(int rank) {
    KtvThisWeekRankData? item =
        _resData!.data.firstWhereOrNull((element) => element.rank == rank);

    List<Color> borderColor = topThreeBorderColor(rank);
    double avatarSize = rank == 1 ? 52.0 : 42.0;
    double start = rank == 1 ? -15.0 : -16.0;
    double angle = rank == 1 ? -0.20 : -0.25;

    return Flexible(
      flex: rank == 1 ? 80 : 76,
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: rank == 1 ? 6 : 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            item == null
                ? Container()
                : Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GradientBorder(
                        borderGradient: LinearGradient(colors: borderColor),
                        borderWidth: 2,
                        borderRadius: (avatarSize + 4) / 2,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              CommonAvatar(
                                path: item.icon,
                                size: avatarSize,
                                shape: BoxShape.circle,
                                onTap: () {
                                  IPersonalDataManager manager =
                                      ComponentManager.instance.getManager(
                                          ComponentManager
                                              .MANAGER_PERSONALDATA);
                                  manager.openImageScreen(context, item.uid,
                                      refer: const PageRefer('ktv_rank'));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        start: start,
                        top: start,
                        child: Transform.rotate(
                          angle: angle,
                          child: R.img('ktv/ktv_rank_$rank.png',
                              package: ComponentManager.MANAGER_BASE_ROOM,
                              width: 40,
                              height: 36),
                        ),
                      )
                    ],
                  ),
            const SizedBox(
              height: 6,
            ),
            Text(
              item?.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              item?.desc ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  List<Color> topThreeBorderColor(int rank) {
    if (rank == 1) {
      return [const Color(0xFFFAD961), const Color(0xFFF7B01C)];
    } else if (rank == 2) {
      return [
        const Color(0xFFE6E6E6),
        const Color(0xFFCDD5E8),
        const Color(0xFFD8D8D8)
      ];
    } else if (rank == 3) {
      return [const Color(0xFFFFE9D6), const Color(0xFFFFAB81)];
    }
    return [const Color(0xFFFFE9D6), const Color(0xFFFFAB81)];
  }

  Widget _buildTopDesk() {
    KtvThisWeekRankData? top1 =
        _resData?.data.firstWhereOrNull((element) => element.rank == 1);
    KtvThisWeekRankData? top2 =
        _resData?.data.firstWhereOrNull((element) => element.rank == 2);
    KtvThisWeekRankData? top3 =
        _resData?.data.firstWhereOrNull((element) => element.rank == 3);

    return Container(
      height: 46.dp,
      width: 46.dp * 6.76,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(R.imagePath('ktv/ktv_rank_desk.png',
              package: ComponentManager.MANAGER_BASE_ROOM)),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 90,
            child: Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 16),
                child: Text(
                  KtvTimeUtil.getMusicNum(top2?.score ?? 0),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 132,
            child: Center(
              child: Text(
                KtvTimeUtil.getMusicNum(top1?.score ?? 0),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            flex: 90,
            child: Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 16),
                child: Text(
                  KtvTimeUtil.getMusicNum(top3?.score ?? 0),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListView() {
    return Stack(
      children: [
        ListView.builder(
          itemBuilder: _buildListItem,
          padding: EdgeInsetsDirectional.only(
              start: 12, end: 12, bottom: Util.iphoneXBottom + 62),
          itemCount: _listData.length,
          itemExtent: 56.0 + 8.0,
        ),
        PositionedDirectional(bottom: 0, child: _buildSelfInfo()),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    KtvThisWeekRankData itemData = _listData[index];
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 8),
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          if (showRankByKey(ktvKey))
            Text(
              '${itemData.rank}',
              style: TextStyle(
                  color: const Color(0xFF313131).withOpacity(0.4),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          const SizedBox(width: 24),
          CommonAvatar(
            path: itemData.icon,
            size: 36,
            shape: BoxShape.circle,
            onTap: () {
              IPersonalDataManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              manager.openImageScreen(context, itemData.uid,
                  refer: const PageRefer('ktv_rank'));
            },
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData.name,
                  style: const TextStyle(
                      color: Color(0xFF313131), fontSize: 14, height: 1.1),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  itemData.desc,
                  style: TextStyle(
                      color: const Color(0xFF313131).withOpacity(0.6),
                      fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          MusicCountWidget(count: itemData.score)
        ],
      ),
    );
  }

  Widget _buildSelfInfo() {
    KtvThisWeekRankData? itemData = _resData?.my;
    if (itemData == null) {
      return const SizedBox.shrink();
    }

    int rank = itemData.rank;
    bool notRank = false;
    String desc = itemData.desc;
    if (rank <= 0 || rank > _resData!.data.length) {
      desc = K.room_not_on_list;
      notRank = true;
    }

    return Container(
      height: 62 + Util.iphoneXBottom,
      width: Util.width,
      padding: EdgeInsetsDirectional.only(
          start: 12, end: 12, bottom: Util.iphoneXBottom),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          if (showRankByKey(ktvKey)) ...[
            notRank
                ? Container(
                    width: 10,
                    height: 2,
                    color: const Color(0xFFD8D8D8),
                  )
                : Text(
                    '${itemData.rank}',
                    style: TextStyle(
                        color: const Color(0xFF313131).withOpacity(0.4),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
            const SizedBox(width: 16),
          ],
          CommonAvatar(
            path: itemData.icon,
            shape: BoxShape.circle,
            size: 42,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF313131)),
                ),
                Text(
                  desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 13,
                      color: const Color(0xFF313131).withOpacity(0.6)),
                )
              ],
            ),
          ),
          if (showRankScoreByKey(ktvKey)) ...[
            const SizedBox(width: 8),
            if (notRank)
              Text(
                K.ktv_rank_left_score(['${itemData.diffScore}']),
                style: TextStyle(
                    color: const Color(0xFF313131).withOpacity(0.6),
                    fontSize: 14),
              )
            else
              MusicCountWidget(count: itemData.score),
          ]
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        const SizedBox(height: 8),
        if ((_resData?.data.length ?? 0) > 3) ...[
          _buildTopUsersRow(),
          const SizedBox(height: 2),
          _buildTopDesk(),
        ],
        Expanded(child: _buildListView()),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/// 最热单曲榜
class HotSongRankWidget extends StatefulWidget {
  const HotSongRankWidget({Key? key}) : super(key: key);

  @override
  _HotSongRankWidgetState createState() => _HotSongRankWidgetState();
}

class _HotSongRankWidgetState extends BaseScreenState<HotSongRankWidget>
    with AutomaticKeepAliveClientMixin<HotSongRankWidget> {
  static const _avatarSize = 30.0;
  static const _borderSize = 2.0;
  static const _overSize = 12.0;
  static const _itemSize = _avatarSize + 2 * _borderSize; // 34

  static const double COVER_HEIGHT = 62.0;

  ResKtvHotSongRank? _respData;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildStatusContent();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    if (!showRankListByKey(ktvKey)) {
      setScreenEmpty(emptyMsgColor: Colors.white70);
      return;
    }
    ResKtvHotSongRank resp = await KtvRepo.getHotSongRank();
    if (resp.success) {
      if (Util.isCollectionEmpty(resp.data)) {
        setScreenEmpty(emptyMsgColor: Colors.white70);
      } else {
        _respData = resp;
        setScreenReady();
      }
    } else {
      setScreenError(errorMsg: resp.msg, errorMsgColor: Colors.white70);
    }
  }

  @override
  void onTapErrorWidget() {
    _loadData();
  }

  @override
  Widget buildContent() {
    return Stack(
      children: [
        ListView.builder(
          itemBuilder: _buildListItem,
          padding: EdgeInsetsDirectional.only(
              start: 12, end: 12, bottom: Util.iphoneXBottom + COVER_HEIGHT),
          itemCount: _respData?.data.length ?? 0,
          itemExtent: 56.0 + 8.0,
        ),
        PositionedDirectional(bottom: 0, child: _buildBottomCover()),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    KtvHotSongRankData itemData = _respData!.data[index];

    return GestureDetector(
      onTap: () {
        KtvSongRankWidget.show(context, itemData.songId);
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 8),
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            if (showRankByKey(ktvKey)) ...[
              Text(
                '${itemData.rank}',
                style: TextStyle(
                    color: const Color(0xFF313131).withOpacity(0.4),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                itemData.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF313131)),
              ),
            ),
            const SizedBox(width: 8),
            if (showRankScoreByKey(ktvKey)) ...[
              MusicCountWidget(count: itemData.score),
              const SizedBox(width: 4),
            ],
            _buildTopUsers(itemData.singers),
            const SizedBox(width: 6),
            R.img(
              'icon_next_fq.svg',
              width: 20,
              height: 20,
              package: ComponentManager.MANAGER_BASE_CORE,
              color: const Color(0xFF313131).withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomCover() {
    return Container(
      height: COVER_HEIGHT,
      width: Util.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF170066).withOpacity(0),
            const Color(0xFF120064).withOpacity(0.9),
            const Color(0xFF130059)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        color: Colors.white,
      ),
    );
  }

  Widget _buildTopUsers(List<String> icons) {
    List<Widget> widgets = [];
    for (int i = 0; i < icons.length; i++) {
      widgets.add(_getWidgetTopUser(i, icons[i]));
    }

    return SizedBox(
      height: _itemSize,
      width: _itemSize + (icons.length - 1) * (_itemSize - _overSize),
      child: Stack(
        children: widgets.reversed.toList(),
      ),
    );
  }

  Widget _getWidgetTopUser(int index, String icon) {
    return PositionedDirectional(
      start: index * (_itemSize - _overSize),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: _borderSize,
          ),
        ),
        child: CommonAvatar(
          path: icon,
          shape: BoxShape.circle,
          size: _avatarSize,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }
}
