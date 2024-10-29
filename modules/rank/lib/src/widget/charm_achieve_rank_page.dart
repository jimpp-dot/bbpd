import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/model/entity/charm_achieve_rank_beans.dart';
import 'package:rank/src/widget/rank_fame_hall.dart';
import 'package:shared/assets.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../k.dart';

/// 魅力榜 or 成就榜
///
class CharmAchieveRankPage extends StatefulWidget {
  final CharmAchieveRankType rankType;
  final int tabIndex;

  //是否是上周榜单
  final bool isLastWeek;

  const CharmAchieveRankPage({super.key, required this.rankType, this.tabIndex = 0, this.isLastWeek = false});

  @override
  State createState() => _CharmAchieveRankPageState();
}

class _CharmAchieveRankPageState extends State<CharmAchieveRankPage> with AutomaticKeepAliveClientMixin<CharmAchieveRankPage> {
  late PageController _pageController;
  List<Widget> _pages = [];
  final List<String> _tabs = [K.rank_charm_achieve_day, K.rank_charm_achieve_week];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: widget.tabIndex, keepPage: true);

    if (widget.isLastWeek) {
      ///只显示周不显示日
      if (widget.rankType == CharmAchieveRankType.achieve) {
        _pages = [CharmAchieveRankListWidget(widget.rankType, 2, const PageRefer('AchieveRankWeek'), isLastWeek: widget.isLastWeek)];
      } else {
        _pages = [CharmAchieveRankListWidget(widget.rankType, 2, const PageRefer('CharmRankWeek'), isLastWeek: widget.isLastWeek)];
      }
    } else {
      if (widget.rankType == CharmAchieveRankType.achieve) {
        _pages = [
          CharmAchieveRankListWidget(widget.rankType, 1, const PageRefer('AchieveRankDay')),
          CharmAchieveRankListWidget(widget.rankType, 2, const PageRefer('AchieveRankWeek'))
        ];
      } else {
        _pages = [
          CharmAchieveRankListWidget(widget.rankType, 1, const PageRefer('CharmRankDay')),
          CharmAchieveRankListWidget(widget.rankType, 2, const PageRefer('CharmRankWeek'))
        ];
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  _jump(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(
      children: [
        if (!widget.isLastWeek)
          Container(
            padding: const EdgeInsetsDirectional.only(bottom: 8),
            decoration: commonBoxDecoration(linearGradientColor: R.colors.translateGradientColors, borderRadius: 0),
            child: ShortSubTabWidget(
              tabLabels: _tabs,
              selectBgColor: const Color(0xFFFDE7BF),
              selectIndex: widget.tabIndex,
              onTabSelected: (page) => _jump(page),
              width: 128,
              height: 32,
              bgColor: Colors.white.withOpacity(0.27),
              selectTextColor: Colors.black,
              unSelectTextColor: Colors.black.withOpacity(0.3),
            ),
          ),
        Container(
          height: double.infinity,
          padding: EdgeInsetsDirectional.only(top: widget.isLastWeek ? 0 : 40),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _pages,
          ),
        ),
      ],
    );
  }
}

class CharmAchieveRankItemIconWidget extends StatelessWidget {
  final double size;
  final CharmAchieveRankItem rankItem;
  final bool? isTopIcon;
  final PageRefer refer;

  const CharmAchieveRankItemIconWidget(this.rankItem, this.size, this.isTopIcon, this.refer, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, rankItem.uid, refer: refer);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            if (isTopIcon != null && isTopIcon!)
              R.img(Assets.rank_charm_fame_head_border_webp, width: size, height: size, package: ComponentManager.MANAGER_RANK),
            CommonAvatarWithFrame(
              childWidget: CommonAvatar(
                path: rankItem.icon,
                shape: BoxShape.circle,
                size: 52,
              ),
              uid: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class CharmAchieveRankItemWidget extends StatelessWidget {
  final CharmAchieveRankType rankType;
  final int index;
  final CharmAchieveRankItem rankItem;
  final PageRefer refer;

  const CharmAchieveRankItemWidget(this.rankType, this.index, this.rankItem, this.refer, {super.key});

  Widget _buildIndex() {
    return Container(
      height: 23,
      width: 28,
      alignment: Alignment.center,
      child: Text(
        '${index + 1}',
        maxLines: 1,
        style: const TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: index == 3 ? 18 : 5, bottom: 5, start: 14, end: 18),
      child: InkWell(
        onTap: () {
          IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, rankItem.uid, refer: refer);
        },
        child: Row(
          children: <Widget>[
            if (_showRankByType(rankType)) _buildIndex(),
            CharmAchieveRankItemIconWidget(rankItem, 62.0, false, refer),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 250),
                    child: Text(
                      rankItem.name,
                      style: const TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'PingFang SC'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 2),
                  if (!NobilityUtil.titleIsInvalid(rankItem.titleNew))
                    UserNobilityWidget(
                      titleNew: rankItem.titleNew,
                    ),
                  if (rankItem.popularityLevel > 0) UserPopularity(popularityLevel: rankItem.popularityLevel),
                  if (rankItem.vipLevel > 0) UserVipWidget(vip: rankItem.vipLevel),
                ]),
                if (_showRankScoreByType(rankType)) _buildScoreText(rankType, rankItem, textColor: const Color(0xFFB83DFF))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CharmAchieveRankListWidget extends StatefulWidget {
  final CharmAchieveRankType rankType;
  final int tabIndex;
  final PageRefer refer;

  //是否是上周榜单
  final bool isLastWeek;

  const CharmAchieveRankListWidget(this.rankType, this.tabIndex, this.refer, {super.key, this.isLastWeek = false});

  @override
  _CharmAchieveRankListWidgetState createState() => _CharmAchieveRankListWidgetState();
}

class _CharmAchieveRankListWidgetState extends State<CharmAchieveRankListWidget> {
  late _CharmAchieveRankLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _source = _CharmAchieveRankLoadingSource(widget.rankType, widget.tabIndex, this, isLastWeek: widget.isLastWeek);
    _source.refresh();
  }

  @override
  void dispose() {
    _source.dispose();

    super.dispose();
  }

  Widget _buildLabel(String text, List<Color> bgColor) {
    return Container(
      alignment: Alignment.center,
      width: 44,
      height: 16,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(side: BorderSide(color: Color(0xFFFFF1AB), width: 1)),
        gradient: LinearGradient(colors: bgColor),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 9, color: Colors.white),
      ),
    );
  }

  //名人堂
  Widget _buildTop() {
    CharmAchieveRankTopItem? rankTopItem = _source.topItem;
    if (Util.isStringEmpty(rankTopItem?.name)) return const SizedBox.shrink();
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 16, bottom: 8, start: 20, end: 20),
      padding: const EdgeInsetsDirectional.only(start: 11, end: 8),
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: (R.img(Assets.rank_bg_rank_daily_top_webp, package: ComponentManager.MANAGER_RANK) as Image).image,
        ),
      ),
      child: InkWell(
        onTap: () => RankFameHallScreen.show(context, widget.rankType, widget.tabIndex),
        child: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Row(
            children: <Widget>[
              CharmAchieveRankItemIconWidget(rankTopItem!, 58.0, true, widget.refer),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LimitedBox(
                      child: Text(
                        rankTopItem.name,
                        maxLines: 1,
                        style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        _buildLabel(K.rank_daily_last_top, [const Color(0xFFFFCF8A), const Color(0xFFFDA252)]),
                        const SizedBox(width: 4),
                        _buildLabel(
                          '${K.rank_daily_last_top_times} x${rankTopItem.topDays}',
                          [const Color(0xFFFF99B4), const Color(0xFFFF5F7D)],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                K.rank_daily_star_title,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              R.img(BaseAssets.icon_next_svg, color: Colors.white, width: 16, height: 16, package: ComponentManager.MANAGER_BASE_CORE),
            ],
          ),
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(
          color: Colors.white,
        ),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(
        hasMore: false,
        textColor: Colors.black.withOpacity(0.4),
        loadMore: () => {},
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
          error: _source.errorMsg,
          onTap: () {
            _source.refresh();
          },
        ),
      );
    }
    if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        child: ErrorData(
          error: BaseK.K.no_data,
          onTap: () {
            _source.refresh();
          },
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(errorMessage: _source.errorMsg, loadMore: _source.loadMore);
    } else {
      return LoadingFooter(hasMore: _source.hasMore, loadMore: _source.loadMore);
    }
  }

  /// 底部视图我的排名
  Widget _buildMyRank(CharmAchieveMyRankItem myItem) {
    return Container(
      width: Util.width,
      height: Util.width * 321 / 1125,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: (R.img(Assets.nomal_rang_bottom_bg, width: Util.width, height: Util.width * 321 / 1125, package: Assets.package) as Image)
              .image,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 18.0, end: 0.0, bottom: Util.iphoneXBottom),
        child: Row(
          children: <Widget>[
            if (_showRankByType(widget.rankType))
              Text(
                myItem.rank,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0, top: 12.0, bottom: 12.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(26)),
                child: CachedNetworkImage(
                  imageUrl: Util.squareResize(myItem.icon, 150),
                  width: 52.0,
                  height: 52.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: Util.width - 220),
                      child: Text(
                        myItem.name,
                        style: const TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'PingFang SC'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 2),
                    if (myItem.popularityLevel > 0) UserPopularity(popularityLevel: myItem.popularityLevel),
                    if (myItem.vipLevel > 0) UserVipWidget(vip: myItem.vipLevel),
                  ],
                ),
                if (_showRankByType(widget.rankType))
                  Text(
                    K.rank_upgrade_need + myItem.beforeDiff.toString(),
                    style: R.textStyle.caption.copyWith(color: Colors.black),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Color> topThreeBorderColor(int rank) {
    List<Color> rank1Colors = [const Color(0xFFFAD961), const Color(0xFFF7B01C)];
    List<Color> rank2Colors = [const Color(0xFFE6E6E6), const Color(0xFFCDD5E8), const Color(0xFFD8D8D8)];
    List<Color> rank3Colors = [const Color(0xFFFFE9D6), const Color(0xFFFFAB81)];
    if (rank == 1) {
      return rank1Colors;
    } else if (rank == 2) {
      return rank2Colors;
    } else if (rank == 3) {
      return rank3Colors;
    }
    return [Colors.white];
  }

  Widget _buildTopEmptyItem(int rank) {
    double cardWidth = 106 * Util.ratio;

    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 102, height: 104),
        SizedBox(height: 10),
        // _buildEmptyOverLordCard(cardWidth, rank),
      ],
    );
  }

  /// 顶部3个视图
  Column _buildTopThreeItem(CharmAchieveRankItem data, int rank) {
    List<Color> borderColor = topThreeBorderColor(rank);
    double avatarSize = rank == 1 ? 72 : 64;
    double cardWidth = (rank == 1 ? 132 : 106) * Util.ratio;

    String? header; //头像框
    String? mounts; //座驾
    String? ring; //麦上光圈

    if (_source.awards != null) {
      _source.awards!.forEach((key, value) {
        if (Util.parseInt(key) == rank) {
          for (var e in value) {
            if (e.type == 'header') {
              header = e.image;
            }

            if (e.type == 'mounts') {
              mounts = e.image;
            }

            if (e.type == 'ring') {
              ring = e.image;
            }
          }
        }
      });
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: rank == 1 ? 115 : 102,
          height: rank == 1 ? 117 : 104,
          child: GestureDetector(
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, data.uid, refer: widget.refer);
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                if (ring != null && ring!.isNotEmpty) UserIconFrame(size: 1.6 * avatarSize, frameUrl: ring!),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: GradientBorder(
                    borderGradient: LinearGradient(colors: borderColor),
                    borderWidth: 2,
                    borderRadius: (avatarSize + 4) / 2,
                    child: CommonAvatarWithFrame(
                      uid: 0,
                      childWidget: Padding(
                        padding: const EdgeInsets.all(2),
                        child: CommonAvatar(
                          path: data.icon,
                          size: avatarSize,
                          shape: BoxShape.circle,
                          onTap: () {
                            IPersonalDataManager personalDataManager =
                                ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
                            personalDataManager.openImageScreen(context, data.uid, refer: widget.refer);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                if (header != null && header!.isNotEmpty) UserIconFrame(size: avatarSize + 10, frameUrl: header!),
                if (mounts != null && mounts!.isNotEmpty)
                  PositionedDirectional(
                    top: rank == 1 ? 70 : 57,
                    child: CachedNetworkImage(
                      imageUrl: System.imageDomain + mounts!,
                      width: 64,
                      height: 64,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        _buildOverLordCard(cardWidth, rank, data),
      ],
    );
  }

  Widget _buildEmptyOverLordCard(double cardWidth, int rank) {
    final imagePath = R.imagePath(
        R.color.statusBarTheme == Brightness.light
            ? Assets.rank_charm_achieve_rank_header_x_webp(rank)
            : Assets.rank_charm_achieve_rank_header_dark_x_webp(rank),
        package: ComponentManager.MANAGER_RANK);

    final BorderRadius radius =
        BorderRadiusDirectional.only(topStart: Radius.circular(rank < 3 ? 8 : 0), topEnd: Radius.circular(rank == 2 ? 0 : 8))
            .resolve(Directionality.of(context));

    const double cardHeight = 115.0;

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          width: cardWidth,
          height: cardHeight,
          alignment: AlignmentDirectional.bottomCenter,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0XFFE96CFF), Color(0XFFB37EFF)],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
            borderRadius: radius,
            boxShadow: const [
              BoxShadow(
                blurRadius: 8.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 0.0),
                color: Color(0XFFC571FF),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          child: R.img(Assets.rank_charm_achieve_rank_x_webp(rank), width: 24, height: 32, package: ComponentManager.MANAGER_RANK),
        ),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: radius,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                width: double.infinity,
                height: 9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOverLordCard(double cardWidth, int rank, CharmAchieveRankItem data) {
    final imagePath = R.imagePath(
        R.color.statusBarTheme == Brightness.light
            ? Assets.rank_charm_achieve_rank_header_x_webp(rank)
            : Assets.rank_charm_achieve_rank_header_dark_x_webp(rank),
        package: ComponentManager.MANAGER_RANK);

    final BorderRadius radius =
        BorderRadiusDirectional.only(topStart: Radius.circular(rank < 3 ? 8 : 0), topEnd: Radius.circular(rank == 2 ? 0 : 8))
            .resolve(Directionality.of(context));

    final double cardHeight =
        (rank == 1 ? (_showRankScoreByType(widget.rankType) ? 115.0 : 90.0) : (_showRankScoreByType(widget.rankType) ? 105.0 : 80.0));

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          width: cardWidth,
          height: cardHeight,
          alignment: AlignmentDirectional.bottomCenter,
          // padding: EdgeInsetsDirectional.only(start: 8, end: 8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0XFFFB87FF), Color(0XFFFFC484)],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                spreadRadius: 0.0,
                offset: const Offset(1.0, 0.0),
                color: const Color(0XFFC571FF).withOpacity(0.4),
              ),
            ],
          ),
          child: rank == 1
              ? Row(
                  children: [
                    Container(
                      width: 1,
                      height: cardHeight,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.0,
                            spreadRadius: 0.0,
                            offset: const Offset(1.0, 1.0),
                            color: Colors.white.withOpacity(0.24),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 1,
                      height: cardHeight,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.0,
                            spreadRadius: 0.0,
                            offset: const Offset(-1.0, -1.0),
                            color: Colors.white.withOpacity(0.24),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
        PositionedDirectional(
          top: 20,
          child: Container(
            constraints: BoxConstraints(maxWidth: cardWidth - 20),
            child: Text(data.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
        PositionedDirectional(
          top: 44,
          child: Row(
            children: [
              if (!NobilityUtil.titleIsInvalid(data.titleNew)) UserNobilityWidget(titleNew: data.titleNew, height: 22),
              const SizedBox(width: 2),
              if (data.popularityLevel > 0) UserPopularity(popularityLevel: data.popularityLevel, height: 22),
              if (data.vipLevel > 0) UserVipWidget(vip: data.vipLevel, height: 22),
            ],
          ),
        ),
        if (_showRankScoreByType(widget.rankType))
          PositionedDirectional(
            top: 68,
            child: _buildScoreText(widget.rankType, data, textColor: Colors.white.withOpacity(0.8)),
          ),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: radius,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                width: double.infinity,
                height: rank == 1 ? 15 : 9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopThree(List<CharmAchieveRankItem> items) {
    int length = items.length;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [Colors.transparent, Colors.transparent]),
      ),
      height: (_showRankScoreByType(widget.rankType) ? 249 : 219),
      alignment: AlignmentDirectional.bottomCenter,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          R.img(
            R.color.statusBarTheme == Brightness.light ? Assets.rank_charm_rank_header_bg_webp : Assets.rank_charm_rank_header_bg_dark_webp,
            width: Util.width,
            height: 259,
            package: ComponentManager.MANAGER_RANK,
            fit: BoxFit.fitWidth,
          ),
          if (length >= 1)
            PositionedDirectional(
              start: 0,
              child: Container(
                alignment: AlignmentDirectional.bottomStart,
                padding: EdgeInsetsDirectional.only(start: 16 * Util.ratio),
                child: length >= 2 ? _buildTopThreeItem(items[1], 2) : _buildTopEmptyItem(2),
              ),
            ),
          if (length >= 1)
            PositionedDirectional(
              end: 0,
              child: Container(
                alignment: AlignmentDirectional.bottomEnd,
                padding: EdgeInsetsDirectional.only(end: 16 * Util.ratio),
                child: length >= 3 ? _buildTopThreeItem(items[2], 3) : _buildTopEmptyItem(3),
              ),
            ),
          if (length >= 1)
            PositionedDirectional(
              child: Container(
                alignment: AlignmentDirectional.bottomCenter,
                child: _buildTopThreeItem(items[0], 1),
              ),
            ),
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, CharmAchieveRankItem item, int index) {
    if (index == 0) {
      return SizedBox(
        height: expandedHeight + 20,
      );
    }
    if (index < 3) return const SizedBox.shrink();
    return CharmAchieveRankItemWidget(widget.rankType, index, item, widget.refer);
  }

  late ScrollController _controller;

  Widget _buildList() {
    LoadingMoreSliverList child = LoadingMoreSliverList<CharmAchieveRankItem>(
      SliverListConfig<CharmAchieveRankItem>(
        itemBuilder: _itemBuilder,
        lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
        sourceList: _source,
        indicatorBuilder: _indicatorBuilder,
      ),
    );
    return child;
  }

  double expandedHeight = 334;

  @override
  Widget build(BuildContext context) {
    CharmAchieveRankTopItem? rankTopItem = _source.topItem;
    if (Util.isStringEmpty(rankTopItem?.name)) {
      expandedHeight = 228;
    } else {
      expandedHeight = 334;
    }
    return _showRankListByType(widget.rankType)
        ? SizedBox(
            height: Util.height,
            child: Stack(
              children: [
                SizedBox(
                  height: Util.height,
                ),
                RefreshIndicatorFactory.of(
                  backgroundColor: Colors.white,
                  onRefresh: () => _source.refresh(),
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _controller,
                    slivers: [
                      SliverStack(
                        insetOnOverlap: false,
                        children: [
                          SliverToBoxAdapter(
                            child: SizedBox(
                              width: Util.width,
                              height: Util.height,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsetsDirectional.only(top: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _buildTop(),
                                      if (_source.isNotEmpty) _buildTopThree(_source.sublist(0, min(3, _source.length))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SliverPositioned.fill(
                            top: expandedHeight,
                            child: Visibility(
                              visible: _source.isNotEmpty,
                              child: Container(
                                height: double.infinity,
                                child: Stack(
                                  alignment: AlignmentDirectional.topCenter,
                                  children: [
                                    Container(
                                      margin: EdgeInsetsDirectional.only(top: Util.width * 92 / 750),
                                      height: double.infinity,
                                      decoration: commonBoxDecorationWithParamsBeginAndEnd(
                                        [const Color(0xFFFCF3FF), const Color(0xFFF9E7FF)],
                                        0,
                                        Alignment.topCenter,
                                        Alignment.bottomCenter,
                                      ),
                                    ),
                                    R.img(Assets.nomal_rank_middle_bg,
                                        width: Util.width, fit: BoxFit.fitWidth, package: ComponentManager.MANAGER_RANK),
                                  ],
                                ),

                                // decoration: BoxDecoration(
                                //   image: DecorationImage(
                                //     image: ( as Image)
                                //         .image,
                                //     fit: BoxFit.fill,
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                          SliverPositioned.fill(child: _buildList()),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(bottom: 0, child: _source.my != null ? _buildMyRank(_source.my!) : const SizedBox.shrink())
              ],
            ),
          )
        : Container(
            color: Colors.white,
            child: Center(
              child: Text(
                K.rank_no_more_data,
                style: TextStyle(fontSize: 13, color: Colors.grey[400]),
              ),
            ),
          );
  }
}

class _CharmAchieveRankLoadingSource extends LoadingMoreBase<CharmAchieveRankItem> {
  final CharmAchieveRankType rankType;
  final _CharmAchieveRankListWidgetState state;
  final int tabIndex;

  //是否是上周榜单
  final bool isLastWeek;
  static const int _firstPageIndex = 1;

  _CharmAchieveRankLoadingSource(this.rankType, this.tabIndex, this.state, {this.isLastWeek = false});

  int _pageIndex = _firstPageIndex;
  bool _hasMore = true;
  String errorMsg = '';

  CharmAchieveRankTopItem? topItem;
  CharmAchieveMyRankItem? my;
  CharmAchieveRankResponse? rsp;
  Map<dynamic, List<CharmAchieveRankPrizeItem>>? awards;

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _pageIndex = _firstPageIndex;
      _hasMore = true;
    }

    bool loadSuccess = false;
    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;

    rsp = await CharmAchieveRankRepository.getRankItems(rankType, tabIndex, page, isLastWeek: isLastWeek);
    if (rsp != null && rsp!.success == true) {
      if (rsp!.my != null) {
        my = rsp!.my!;
      }

      if (page == _firstPageIndex) {
        topItem = rsp!.topItem;
        clear();
        state.refresh();
      }

      if (rsp!.awards != null) {
        awards = rsp!.awards;
      }

      if (rsp!.items.isNotEmpty) {
        addAll(rsp!.items);
        _pageIndex = page;

        _hasMore = true;
      } else {
        _hasMore = false;
      }

      loadSuccess = true;
    } else {
      errorMsg = rsp?.msg ?? '';
      loadSuccess = false;
    }

    return loadSuccess;
  }
}

Widget _buildScoreText(CharmAchieveRankType rankType, CharmAchieveRankItem rankItem, {Color? textColor}) {
  if (rankItem.score == 0) return Container();

  String scoreStr = '';
  int score = rankItem.score;

  if (score < 1000) {
    scoreStr = '$score ';
  } else if (score % 1000 == 0) {
    score = (score / 1000).floor();
    scoreStr = '${score}K ';
  } else {
    int kScore = (score / 1000).floor();
    int modScore = score % 1000;

    if (modScore < 100) {
      scoreStr = '${kScore}K ';
    } else {
      int floatScore = (modScore / 100).floor();
      scoreStr = '$kScore.${floatScore}K ';
    }
  }

  if (rankType == CharmAchieveRankType.charm) {
    // scoreStr += K.rank_charm_score;
  } else {
    scoreStr += K.rank_achieve_score;
  }

  return Text(scoreStr, style: TextStyle(color: textColor ?? R.color.thirdBrightColor, fontSize: 11, fontWeight: FontWeight.w500));
}

bool _showRankByType(CharmAchieveRankType rankType) {
  if (rankType == CharmAchieveRankType.charm) {
    /// 魅力榜单
    return showRankByKey(homeCharmKey);
  }
  if (rankType == CharmAchieveRankType.achieve) {
    /// 成就榜单
    return showRankByKey(homeAchieveKey);
  }
  return false;
}

bool _showRankScoreByType(CharmAchieveRankType rankType) {
  if (rankType == CharmAchieveRankType.charm) {
    /// 魅力榜单
    return showRankScoreByKey(homeCharmKey);
  }
  if (rankType == CharmAchieveRankType.achieve) {
    /// 成就榜单
    return showRankScoreByKey(homeAchieveKey);
  }
  return false;
}

bool _showRankListByType(CharmAchieveRankType rankType) {
  if (rankType == CharmAchieveRankType.charm) {
    /// 魅力榜单
    return showRankListByKey(homeCharmKey);
  }
  if (rankType == CharmAchieveRankType.achieve) {
    /// 成就榜单
    return showRankListByKey(homeAchieveKey);
  }
  return false;
}
