import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as base_k;
import 'package:rank/assets.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../k.dart';
import '../api/api.dart';
import '../model/pb/generated/awake_rank.pb.dart';

enum HandBookType {
  daily, //本日
  weekly, //本周
}

class HandBookRankPage extends StatefulWidget {
  final String? pageType;
  final int? tabIndex;

  const HandBookRankPage({super.key, this.pageType, this.tabIndex});

  @override
  _HandBookRankPageState createState() {
    return _HandBookRankPageState();
  }

  static Future show(BuildContext context, String? pageType, int tabIndex) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          HandBookRankPage(pageType: pageType, tabIndex: tabIndex),
      settings: RouteSettings(
        name: '/rank/handbook',
        arguments: {'pageType': pageType, 'tabIndex': tabIndex},
      ),
    ));
  }
}

class _HandBookRankPageState extends State<HandBookRankPage>
    with AutomaticKeepAliveClientMixin<HandBookRankPage> {
  late PageController _pageController;
  List<Widget> _pages = [];
  final List<String> _tabs = [K.rank_handbook_daily, K.rank_handbook_weekly];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(initialPage: widget.tabIndex ?? 0, keepPage: true);

    _pages = [
      HandBookListWidget(widget.pageType, HandBookType.daily,
          const PageRefer('HandBookRankDaily')),
      HandBookListWidget(widget.pageType, HandBookType.weekly,
          const PageRefer('HandBookRankWeekly')),
    ];
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

    if (widget.pageType == 'singleGift') {
      return Container(
        decoration: const BoxDecoration(
          color: Color(0XFFD670FF),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: BaseAppBar.custom(
            statusBrightness: Brightness.dark,
            title: Text(
              K.rank_page_title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.transparent,
            backColor: Colors.white,
          ),
          body: ScaffoldBody(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.only(bottom: 8),
                  decoration: const BoxDecoration(
                    color: Color(0XFFD670FF),
                    border: Border(
                        top: BorderSide(width: 0.0, color: Color(0XFFD670FF))),
                  ),
                  child: ShortSubTabWidget(
                    selectIndex: widget.tabIndex ?? 0,
                    tabLabels: _tabs,
                    onTabSelected: (page) => _jump(page),
                    width: 184,
                    height: 32,
                    bgColor: Colors.white.withOpacity(0.3),
                    selectTextColor: const Color(0XFFBA69FF),
                    unSelectTextColor: Colors.white.withOpacity(0.4),
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: _pages,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(bottom: 8),
            decoration: const BoxDecoration(color: Color(0XFFD670FF)),
            child: ShortSubTabWidget(
              selectIndex: widget.tabIndex ?? 0,
              tabLabels: _tabs,
              onTabSelected: (page) => _jump(page),
              width: 184,
              height: 32,
              bgColor: Colors.white.withOpacity(0.3),
              selectTextColor: const Color(0XFFBA69FF),
              unSelectTextColor: Colors.white.withOpacity(0.4),
            ),
          ),
          Container(
            height: double.infinity,
            padding: const EdgeInsetsDirectional.only(top: 40),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}

class GiftRankItemIconWidget extends StatelessWidget {
  final double size;
  final RankDatas rankItem;
  final PageRefer refer;

  const GiftRankItemIconWidget(this.rankItem, this.size, this.refer,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, rankItem.uid,
            refer: refer);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              width: 52,
              height: 52,
              child: CommonAvatarWithFrame(
                childWidget: CommonAvatar(
                  path: rankItem.icon,
                  shape: BoxShape.circle,
                  size: 52,
                ),
                uid: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GiftRankItemWidget extends StatelessWidget {
  final int index;
  final RankDatas rankItem;
  final String? pageType;
  final HandBookType rankType;
  final PageRefer refer;

  const GiftRankItemWidget(
    this.index,
    this.rankItem,
    this.pageType,
    this.rankType,
    this.refer, {
    super.key,
  });

  Widget _buildIndex() {
    return Container(
      height: 23,
      width: 28,
      alignment: Alignment.center,
      child: Text(
        '${index + 1}',
        maxLines: 1,
        style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.color.mainBgColor,
      padding: EdgeInsetsDirectional.only(
          top: index == 3 ? 18 : 5, bottom: 5, start: 14, end: 18),
      child: InkWell(
        onTap: () {
          if (pageType != null && pageType == 'allGift') {
            IRankManager rankManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_RANK);
            rankManager.showGiftRankScreen(context, 'singleGift',
                (rankType == HandBookType.daily ? 0 : 1));
          } else {
            IPersonalDataManager personalDataManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.openImageScreen(context, rankItem.uid,
                refer: refer);
          }
        },
        child: Row(
          children: <Widget>[
            if (showRankByKey(handbookGiftKey)) _buildIndex(),
            GiftRankItemIconWidget(rankItem, 62.0, refer),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: Util.width - 290),
                      child: Text(
                        rankItem.nickname,
                        style: TextStyle(
                            fontSize: 16,
                            color: R.color.mainTextColor,
                            fontFamily: 'PingFang SC'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 2),
                    if (!NobilityUtil.titleIsInvalid(rankItem.titleNew))
                      UserNobilityWidget(
                        titleNew: rankItem.titleNew,
                      ),
                    if (rankItem.popularityLevel > 0)
                      UserPopularity(popularityLevel: rankItem.popularityLevel),
                    if (rankItem.vipLevel > 0)
                      UserVipWidget(vip: rankItem.vipLevel),
                  ],
                ),
                Row(
                  children: [
                    R.img(Util.getRemoteImgUrl(rankItem.giftLevelIcon),
                        width: 18),
                    Text(rankItem.giftLevel,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text("+${rankItem.xp}",
                    style: const TextStyle(color: Colors.amber)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HandBookListWidget extends StatefulWidget {
  final String? pageType;
  final HandBookType rankType;
  final PageRefer refer;

  const HandBookListWidget(this.pageType, this.rankType, this.refer,
      {super.key});

  @override
  _HandBookListWidgetState createState() => _HandBookListWidgetState();
}

class _HandBookListWidgetState extends State<HandBookListWidget> {
  late _GiftRankLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _GiftRankLoadingSource(widget.pageType, widget.rankType, this);
    _source.refresh();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _source.dispose();

    super.dispose();
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(child: CupertinoActivityIndicator());
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
        error: base_k.K.no_data,
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

  List<Color> topThreeBorderColor(int rank) {
    const List<Color> rank1Colors = [Color(0xFFFAD961), Color(0xFFF7B01C)];
    const List<Color> rank2Colors = [
      Color(0xFFE6E6E6),
      Color(0xFFCDD5E8),
      Color(0xFFD8D8D8)
    ];
    const List<Color> rank3Colors = [Color(0xFFFFE9D6), Color(0xFFFFAB81)];
    switch (rank) {
      case 1:
        return rank1Colors;
      case 2:
        return rank2Colors;
      case 3:
        return rank3Colors;
      default:
        return [Colors.white];
    }
  }

  Widget _buildTopEmptyItem(int rank) {
    double cardWidth = 106 * Util.ratio;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 102, height: 104),
        const SizedBox(height: 10),
        _buildEmptyOverLordCard(cardWidth, rank),
      ],
    );
  }

  Column _buildTopThreeItem(RankDatas data, int rank) {
    List<Color> borderColor = topThreeBorderColor(rank);
    double avatarSize = rank == 1 ? 72 : 64;
    double cardWidth = (rank == 1 ? 132 : 106) * Util.ratio;

    String? header; //头像框
    String? mounts; //座驾
    String? ring; //麦上光圈

    if (_source.awards != null) {
      for (var award in _source.awards!) {
        if (award.type == "header") {
          header = award.image;
        }
        if (award.type == "mounts") {
          mounts = award.image;
        }
        if (award.type == "ring") {
          ring = award.image;
        }
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: rank == 1 ? 115 : 102,
          height: rank == 1 ? 117 : 104,
          child: GestureDetector(
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, data.uid,
                  refer: widget.refer);
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                if (ring != null && ring.isNotEmpty)
                  UserIconFrame(size: 1.6 * avatarSize, frameUrl: ring),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: GradientBorder(
                    borderGradient: LinearGradient(colors: borderColor),
                    borderWidth: 2,
                    borderRadius: (avatarSize + 4) / 2,
                    child: CommonAvatarWithFrame(
                      childWidget: Container(
                        padding: const EdgeInsets.all(2),
                        child: CommonAvatar(
                          path: data.icon,
                          size: avatarSize,
                          shape: BoxShape.circle,
                          onTap: () {
                            IPersonalDataManager personalDataManager =
                                ComponentManager.instance.getManager(
                                    ComponentManager.MANAGER_PERSONALDATA);
                            personalDataManager.openImageScreen(
                                context, data.uid,
                                refer: widget.refer);
                          },
                        ),
                      ),
                      uid: 0,
                    ),
                  ),
                ),
                if (header != null && header.isNotEmpty)
                  UserIconFrame(size: avatarSize + 10, frameUrl: header),
                if (mounts != null && mounts.isNotEmpty)
                  PositionedDirectional(
                    top: rank == 1 ? 70 : 57,
                    child: CachedNetworkImage(
                      imageUrl: System.imageDomain + mounts,
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

  Widget _buildOverLordCard(double cardWidth, int rank, RankDatas data) {
    final imagePath = R.imagePath(
        R.color.statusBarTheme == Brightness.light
            ? Assets.rank_charm_achieve_rank_header_x_webp(rank)
            : Assets.rank_charm_achieve_rank_header_dark_x_webp(rank),
        package: ComponentManager.MANAGER_RANK);

    final BorderRadius radius = BorderRadiusDirectional.only(
      topStart: Radius.circular(rank < 3 ? 8 : 0),
      topEnd: Radius.circular(rank == 2 ? 0 : 8),
    ).resolve(Directionality.of(context));

    final double cardHeight = (rank == 1 ? 125.0 : 115.0);

    return GestureDetector(
      onTap: () {},
      child: Stack(
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
                : Container(),
          ),
          PositionedDirectional(
            top: 12,
            child: Container(
              constraints: BoxConstraints(maxWidth: cardWidth - 20),
              child: Text(
                data.nickname,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          PositionedDirectional(
            top: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!NobilityUtil.titleIsInvalid(data.titleNew))
                  UserNobilityWidget(titleNew: data.titleNew, height: 22),
                const SizedBox(width: 2),
                if (data.popularityLevel > 0)
                  UserPopularity(
                      popularityLevel: data.popularityLevel, height: 22),
                if (data.vipLevel > 0)
                  UserVipWidget(vip: data.vipLevel, height: 22),
              ],
            ),
          ),
          PositionedDirectional(
              top: (rank == 1 || widget.pageType == 'allGift') ? 50 : 60,
              child: Container()),
          PositionedDirectional(
              top: 62,
              child: Column(
                children: [
                  Row(
                    children: [
                      R.img(Util.getRemoteImgUrl(data.giftLevelIcon),
                          width: 18),
                      Text(data.giftLevel,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text("+${data.xp}",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 12)),
                ],
              )),
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
                        image: AssetImage(imagePath), fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyOverLordCard(double cardWidth, int rank) {
    final imagePath = R.imagePath(
        R.color.statusBarTheme == Brightness.light
            ? Assets.rank_charm_achieve_rank_header_x_webp(rank)
            : Assets.rank_charm_achieve_rank_header_dark_x_webp(rank),
        package: ComponentManager.MANAGER_RANK);

    final BorderRadius radius = BorderRadiusDirectional.only(
            topStart: Radius.circular(rank < 3 ? 8 : 0),
            topEnd: Radius.circular(rank == 2 ? 0 : 8))
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

  Widget _buildTopThree(List<RankDatas> items) {
    int length = items.length;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0XFFD670FF), Color(0XFF91ADFF)],
        ),
      ),
      height: 259,
      alignment: AlignmentDirectional.bottomCenter,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          R.img(
            R.color.statusBarTheme == Brightness.light
                ? Assets.rank_charm_rank_header_bg_webp
                : Assets.rank_charm_rank_header_bg_dark_webp,
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
                  child: length >= 2
                      ? _buildTopThreeItem(items[1], 2)
                      : _buildTopEmptyItem(2),
                )),
          if (length >= 1)
            PositionedDirectional(
              end: 0,
              child: Container(
                alignment: AlignmentDirectional.bottomEnd,
                padding: EdgeInsetsDirectional.only(end: 16 * Util.ratio),
                child: length >= 3
                    ? _buildTopThreeItem(items[2], 3)
                    : _buildTopEmptyItem(3),
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

  Widget _itemBuilder(BuildContext context, RankDatas item, int index) {
    if (index < 3) return Container();

    return GiftRankItemWidget(
        index, item, widget.pageType, widget.rankType, widget.refer);
  }

  Widget _buildList() {
    LoadingMoreList child = LoadingMoreList<RankDatas>(ListConfig<RankDatas>(
      itemBuilder: _itemBuilder,
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      indicatorBuilder: _indicatorBuilder,
    ));

    return RefreshIndicatorFactory.of(
      child: child,
      onRefresh: () => _source.refresh(),
    );
  }

  Widget _buildMyRank(RankDatas myItem) {
    return Container(
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(12.0),
          topEnd: Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: const Offset(0.0, -4.0),
              color: R.color.thirdBgColor),
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: 18.0, end: 18.0, bottom: Util.iphoneXBottom),
        child: Row(
          children: <Widget>[
            Text(
              myItem.rank == 0 ? "100+" : "${myItem.rank}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 12.0, end: 12.0, top: 12.0, bottom: 12.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(26)),
                child: CachedNetworkImage(
                  imageUrl: System.imageDomain + myItem.icon,
                  width: 52.0,
                  height: 52.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: Util.width - 220),
                        child: Text(
                          myItem.nickname,
                          style: TextStyle(
                              fontSize: 16,
                              color: R.color.mainTextColor,
                              fontFamily: 'PingFang SC'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 2),
                      if (!NobilityUtil.titleIsInvalid(myItem.titleNew))
                        UserNobilityWidget(
                          titleNew: myItem.titleNew,
                        ),
                      const SizedBox(width: 2),
                      if (myItem.popularityLevel > 0)
                        UserPopularity(popularityLevel: myItem.popularityLevel),
                      if (myItem.vipLevel > 0)
                        UserVipWidget(vip: myItem.vipLevel),
                    ]),
                    Row(
                      children: [
                        R.img(Util.getRemoteImgUrl(myItem.giftLevelIcon),
                            width: 18),
                        Text(myItem.giftLevel,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                )),
            Text(
              myItem.xp <= 0 ? "0" : "+${myItem.xp}",
              style: const TextStyle(color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double expandedHeight = 0;
    if (_source.isNotEmpty) {
      expandedHeight += 259;
    }
    return showRankListByKey(handbookGiftKey)
        ? Column(
            children: [
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        pinned: false,
                        snap: false,
                        elevation: 0.0,
                        automaticallyImplyLeading: false,
                        primary: false,
                        floating: true,
                        expandedHeight: expandedHeight,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_source.isNotEmpty)
                                _buildTopThree(
                                    _source.sublist(0, min(3, _source.length))),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                  body: _buildList(),
                ),
              ),
              if (_source.my != null) _buildMyRank(_source.my!)
            ],
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

class _GiftRankLoadingSource extends LoadingMoreBase<RankDatas> {
  final String? pageType;
  final HandBookType rankType;
  int _lastId = 0;
  final _HandBookListWidgetState state;

  _GiftRankLoadingSource(this.pageType, this.rankType, this.state);

  bool _hasMore = true;
  String errorMsg = '';
  List<AwardsData>? awards;
  RankDatas? my;

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    if (isLoading) return Future.value(false);
    _hasMore = true;
    _lastId = 0;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _hasMore = true;
      _lastId = 0;
    }
    AwakenHandbookRes res = await Api.getHandBookList(
        rankType == HandBookType.daily ? 0 : 1, _lastId);
    if (res.success && res.data.list.isNotEmpty) {
      awards = res.data.awards;
      my = res.data.my;
      if (_lastId == 0) {
        clear();
        state.refresh();
      }
      _hasMore = res.hasMore;
      _lastId = res.lastId;
      addAll(res.data.list);
    } else {
      _hasMore = res.hasMore;
    }
    return true;
  }
}
