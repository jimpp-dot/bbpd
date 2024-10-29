import 'package:shared/assets.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:rank/src/rankingList/model/ranking_repo.dart';
import 'package:rank/src/rankingList/model/ranking_week_star_data.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rank/src/rankingList/widget/ranking_celebrity_page.dart';

/// 房间周星榜
class RankingWeekStarPage extends StatefulWidget {
  const RankingWeekStarPage({super.key});

  @override
  _RankingWeekStarPageState createState() => _RankingWeekStarPageState();
}

class _RankingWeekStarPageState extends State<RankingWeekStarPage>
    with SingleTickerProviderStateMixin {
  ExtendedTabController? _tabController;
  RankingWeekStarResponse? _rsp;
  List<RankingWeekStarGift>? _tabs;
  late SwiperController _swipeController;

  @override
  void initState() {
    super.initState();

    _swipeController = SwiperController();
    _load();
  }

  void _load() async {
    _rsp = await RankingRepo.getRankingWeekStar(1);

    if (_rsp!.success == true &&
        _rsp!.data?.gifts != null &&
        _rsp!.data!.gifts.isNotEmpty) {
      _tabs = _rsp!.data!.gifts;
      safeRun(
        () => _tabController =
            ExtendedTabController(length: _tabs!.length, vsync: this),
      );
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _swipeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_rsp == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    if ((_rsp != null && _rsp!.success == false) ||
        _rsp?.data == null ||
        (_rsp?.data?.lastWeekTop == null &&
            _rsp?.data?.list == null &&
            _rsp?.data?.gifts == null)) {
      return EmptyWidget(
        onTap: () {
          _load();
        },
        desc: _rsp?.msg ?? BaseK.K.no_data,
      );
    }

    return Container(
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  if (_rsp?.data?.lastWeekTop != null &&
                      _rsp!.data!.lastWeekTop.isNotEmpty &&
                      showRankListByKey(liveWeekStarKey))
                    SliverAppBar(
                      pinned: false,
                      snap: false,
                      elevation: 0.0,
                      automaticallyImplyLeading: false,
                      primary: false,
                      floating: true,
                      expandedHeight: 198.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildLastWeekStar(),
                          ],
                        ),
                      ),
                    ),
                ];
              },
              body: showRankListByKey(liveWeekStarKey)
                  ? (_tabs != null && _tabs!.isNotEmpty
                      ? Column(
                          children: [
                            _buildTab(),
                            Container(
                              margin: const EdgeInsetsDirectional.only(top: 5),
                              height: 1,
                              color: const Color(0XFF333333).withOpacity(0.1),
                            ),
                            Expanded(
                              child: ExtendedTabBarView(
                                controller: _tabController,
                                children: _tabs!
                                    .map((e) =>
                                        _RankPage(index: _tabs!.indexOf(e)))
                                    .toList(),
                              ),
                            ),
                          ],
                        )
                      : const EmptyWidget())
                  : EmptyWidget(desc: K.rank_no_more_data),
            ),
          ),
        ],
      ),
    );
  }

  /// 上周周星
  Widget _buildLastWeekStar() {
    int weekStarLength = _rsp!.data!.lastWeekTop.length;

    return Container(
      decoration: BoxDecoration(
        // color: [Color(0xFFD50055), Color(0xFFFE629F)].last,
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF4F7A), Color(0xFFFF5496)]),
        image: DecorationImage(
          image: AssetImage(R.imagePath(
              Assets.rank_rank_last_week_star_banner_bg_webp,
              package: ComponentManager.MANAGER_RANK)),
        ),
      ),
      height: 198.0,
      padding: const EdgeInsetsDirectional.only(
          start: 16, top: 16, end: 16, bottom: 13),
      child: Container(
        height: 169,
        decoration: BoxDecoration(
          color: const Color(0X33FFFFFF),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            R.img(Assets.rank_week_star_title_bg_svg,
                width: 108, height: 26, package: ComponentManager.MANAGER_RANK),
            Container(
              alignment: AlignmentDirectional.center,
              height: 26,
              child: Text(
                K.rank_week_star_title,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Swiper(
              controller: _swipeController,
              autoplay: weekStarLength > 1,
              loop: weekStarLength > 1,
              autoplayDelay: 5000,
              duration: 500,
              autoplayDisableOnInteraction: true,
              itemCount: weekStarLength,
              pagination: weekStarLength > 1
                  ? SwiperPagination(
                      builder: RectSwiperPaginationBuilder(
                          space: 3,
                          size: const Size(6, 6),
                          activeSize: const Size(6, 6),
                          activeColor: Colors.white,
                          color: Colors.white.withOpacity(0.4),
                          radius: 3),
                    )
                  : null,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _rsp!.data!.lastWeekTop[index].map((e) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 39,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  IPersonalDataManager personalDataManager =
                                      ComponentManager.instance.getManager(
                                          ComponentManager
                                              .MANAGER_PERSONALDATA);
                                  personalDataManager.openImageScreen(
                                      context, e.uid);
                                },
                                child: GradientBorder(
                                  borderGradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFF9D423),
                                      Color(0xFFF83600),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: 37.dp,
                                  borderWidth: 2.dp,
                                  child: Padding(
                                    padding: EdgeInsets.all(2.dp),
                                    child: CommonAvatar(
                                      path: e.icon,
                                      size: 72.0,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                top: 65,
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  width: 50,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0XFFF71C6F),
                                        Color(0XFFFA9E61)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    e.type == 'income'
                                        ? K.rank_week_star_king
                                        : K.rank_week_star_rich,
                                    style: const TextStyle(
                                        fontSize: 9, color: Colors.white),
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                start: 60,
                                child: Container(
                                  width: 37,
                                  height: 37,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0XFFFA9E61),
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(18.5),
                                  ),
                                  child: CommonAvatar(
                                    path:
                                        '${System.imageDomain}static/$giftSubDir/${e.giftId}.png',
                                    size: 36,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 100),
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              e.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            PositionedDirectional(
              end: 4,
              top: 4,
              child: GestureDetector(
                onTap: () {
                  // 名人堂页面
                  RankingCelebrityPage.show(context);
                },
                child: Container(
                  width: 68,
                  height: 22,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4A8F).withOpacity(0.6),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    K.rank_history_weekly_star_list,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab() {
    double tabWidth = (Util.width / _tabs!.length).floorToDouble() - 20.0;

    return Container(
      color: Colors.white,
      height: 40.0,
      child: CommonTabBar(
        tabs: _tabs!.map((e) {
          return Container(
            alignment: AlignmentDirectional.center,
            width: tabWidth,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: tabWidth - (e.fresh == 1 ? 25 : 0),
                  ),
                  child: Text(
                    e.giftName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (e.fresh == 1) ...[
                  const SizedBox(width: 5),
                  Container(
                    width: 18,
                    height: 16,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0XFFFC5897), Color(0XFFFF6AFD)],
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      K.rank_week_star_fresh,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ]
              ],
            ),
          );
        }).toList(),
        isScrollable: true,
        controller: _tabController,
        labelColor: R.color.mainTextColor,
        unselectedLabelColor: R.color.secondTextColor,
        labelStyle: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 17,
            fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w600),
        indicator: const CommonUnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: Color(0xFF12C5FF)),
          insets: EdgeInsetsDirectional.only(bottom: 0),
          wantWidth: 8.0,
          draggingWidth: 8.0,
        ),
        indicatorWeight: 0,
      ),
    );
  }
}

class _RankPage extends StatefulWidget {
  final int index;

  const _RankPage({this.index = 0});

  @override
  __RankPageState createState() => __RankPageState();
}

class __RankPageState extends State<_RankPage>
    with AutomaticKeepAliveClientMixin {
  RankingWeekStarResponse? _rsp;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _load();
  }

  _load() async {
    _rsp = await RankingRepo.getRankingWeekStar(1, tab: widget.index);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_rsp == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    if (_rsp != null && _rsp!.success == false ||
        _rsp?.data == null ||
        _rsp?.data?.list == null) {
      return EmptyWidget(
        onTap: () {
          _load();
        },
        desc: _rsp?.msg ?? BaseK.K.no_data,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: _rsp!.data!.list.length,
      itemBuilder: _itemBuilder,
    );
  }

  _buildRankWidget(int rank) {
    if (rank < 4) {
      return R.img(BaseAssets.ic_prize_cup_x_webp(rank),
          width: 28, height: 28, package: ComponentManager.MANAGER_BASE_CORE);
    }

    return Container(
      width: 28,
      height: 28,
      alignment: AlignmentDirectional.center,
      child: Text(
        rank > 99 ? '99+' : '$rank',
        style: TextStyle(fontSize: 15, color: R.color.thirdTextColor),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    RankingWeekStarItem item = _rsp!.data!.list[index];

    return Container(
      height: 72.0,
      padding: const EdgeInsetsDirectional.only(end: 16),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 46,
            alignment: AlignmentDirectional.center,
            child: showRankByKey(liveWeekStarKey)
                ? _buildRankWidget(item.rank)
                : const SizedBox.shrink(),
          ),
          CommonAvatar(
            path: item.icon,
            size: 52,
            shape: BoxShape.circle,
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, item.uid);
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Flexible(
                  child: Text(
                    '${K.rank_charm_mvp}${item.topSenderName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: R.color.thirdTextColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // if (showRankScoreByKey(liveWeekStarKey)) RichText(
          //   text: TextSpan(
          //       text: K.rank_week_star_get_gift,
          //       style: TextStyle(
          //           color: R.color.thirdTextColor,
          //           fontSize: 13,
          //           fontFamily: Util.fontFamily),
          //       children: [
          //         TextSpan(
          //             text: item.giftNumStr,
          //             style: TextStyle(
          //                 fontSize: 13,
          //                 color: R.color.thirdBrightColor,
          //                 fontFamily: Util.fontFamily),
          //         ),
          //         TextSpan(
          //           text: K.rank_week_star_get_num,
          //           style: TextStyle(
          //               fontSize: 13,
          //               color: R.color.thirdTextColor,
          //               fontFamily: Util.fontFamily),
          //         ),
          //       ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
