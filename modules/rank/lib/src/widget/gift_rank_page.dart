import 'dart:math';

import 'package:shared/shared.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as base_k;
import 'package:rank/assets.dart';
import 'package:rank/src/model/entity/gift_rank_beans.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/src/model/pb/generated/awake_rank.pb.dart';
import 'package:rank/src/widget/gift_rank_awake_widget.dart';

import '../../k.dart';

class GiftRankPage extends StatefulWidget {
  final String? pageType;
  final int? tabIndex;
  final int? giftId;
  //是否是上周榜单
  final bool isLastWeek;

  const GiftRankPage(
      {super.key,
      this.pageType,
      this.tabIndex,
      this.giftId,
      this.isLastWeek = false});

  @override
  _GiftRankPageState createState() {
    return _GiftRankPageState();
  }

  static Future show(
      BuildContext context, String pageType, int tabIndex, int giftId,
      {bool isLastWeek = false}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GiftRankPage(
          pageType: pageType,
          tabIndex: tabIndex,
          giftId: giftId,
          isLastWeek: isLastWeek),
      settings: RouteSettings(
        name: '/rank/gift',
        arguments: {
          'pageType': pageType,
          'tabIndex': tabIndex,
          'giftId': giftId
        },
      ),
    ));
  }
}

class _GiftRankPageState extends State<GiftRankPage>
    with AutomaticKeepAliveClientMixin<GiftRankPage> {
  late PageController _pageController;
  List<Widget> _pages = [];
  final List<String> _tabs = [K.rank_gift_king, K.rank_gift_star];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(initialPage: widget.tabIndex ?? 0, keepPage: true);

    int giftId = widget.pageType == 'singleGift' && widget.giftId != null
        ? widget.giftId!
        : 0;
    _pages = [
      GiftRankListWidget(
          widget.pageType, GiftRankType.king, const PageRefer('GiftRankKing'),
          giftId: giftId, isLastWeek: widget.isLastWeek),
      GiftRankListWidget(
          widget.pageType, GiftRankType.star, const PageRefer('GiftRankStar'),
          giftId: giftId, isLastWeek: widget.isLastWeek),
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
        decoration:
            commonBoxDecorationWithParams(R.colors.translateGradientColors, 0),
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
                  decoration: commonBoxDecorationWithParams(
                      R.colors.translateGradientColors, 0),
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
            decoration: commonBoxDecorationWithParams(
                R.colors.translateGradientColors, 0),
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
  final GiftRankItem rankItem;
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
  final GiftRankItem rankItem;
  final String? pageType;
  final GiftRankType rankType;
  final PageRefer refer;
  final bool isLastWeek;

  const GiftRankItemWidget(
    this.index,
    this.rankItem,
    this.pageType,
    this.rankType,
    this.refer, {
    this.isLastWeek = false,
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
          if (pageType != null &&
              pageType == 'allGift' &&
              rankItem.giftId > 0) {
            IRankManager rankManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_RANK);
            rankManager.showGiftRankScreen(
                context, 'singleGift', (rankType == GiftRankType.king ? 0 : 1),
                giftId: rankItem.giftId, isLastWeek: isLastWeek);
          } else {
            IPersonalDataManager personalDataManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.openImageScreen(context, rankItem.uid,
                refer: refer);
          }
        },
        child: Row(
          children: <Widget>[
            if (showRankByKey(homeGiftKey)) _buildIndex(),
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
                        rankItem.name,
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
                    pageType == 'allGift'
                        ? GiftKingOrStarWithGiftNameTag(
                            name: (rankItem.giftName).safeSubstring(0, 4) +
                                (rankType == GiftRankType.king
                                    ? K.rank_singlegift_king
                                    : K.rank_singlegift_star),
                            icon: rankItem.badgeIcon,
                            color: Util.validStr(rankItem.badgeIcon)
                                ? Colors.white
                                : R.color.mainTextColor.withOpacity(0.4),
                            alignment: Util.validStr(rankItem.badgeIcon)
                                ? AlignmentDirectional.center
                                : AlignmentDirectional.centerStart,
                            awakeGift: rankItem.awakeGift,
                            shadowColor: (rankType == GiftRankType.star)
                                ? const Color(0xffDD0020)
                                : null,
                          )
                        : Container(
                            constraints:
                                BoxConstraints(maxWidth: Util.width - 200),
                            child: Text(
                              pageType == 'allGift'
                                  ? (rankItem.giftName +
                                      (rankType == GiftRankType.king
                                          ? K.rank_singlegift_king
                                          : K.rank_singlegift_star))
                                  : K.rank_gift_sub_text + rankItem.giftName,
                              style: TextStyle(
                                  fontSize: 13, color: R.color.thirdTextColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CachedNetworkImage(
                      imageUrl: Util.squareResize(
                          Util.giftImgUrl(rankItem.giftId), 100),
                      width: 36.0,
                      height: 36.0,
                    ),
                    if (rankItem.awakeGift)
                      PositionedDirectional(
                          end: -6,
                          top: -6,
                          child: R.img(Assets.rank$gift_weak_icon_png,
                              width: 16, height: 16)),
                  ],
                ),
                Container(
                  alignment: AlignmentDirectional.topCenter,
                  width: 48.0,
                  child: Text(
                    rankItem.giftNum > 9999 ? 'x9999+' : 'x${rankItem.giftNum}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 13, color: R.color.unionRankText2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GiftRankListWidget extends StatefulWidget {
  final String? pageType;
  final GiftRankType rankType;
  final PageRefer refer;
  final int? giftId;
  //是否是上周榜单
  final bool isLastWeek;

  const GiftRankListWidget(this.pageType, this.rankType, this.refer,
      {super.key, this.giftId = 0, this.isLastWeek = false});

  @override
  _GiftRankListWidgetState createState() => _GiftRankListWidgetState();
}

class _GiftRankListWidgetState extends State<GiftRankListWidget> {
  late _GiftRankLoadingSource _source;
  AwakeTimeRankRsp? _awakeTimeRankRsp;

  @override
  void initState() {
    super.initState();

    if (widget.giftId != null && widget.giftId! > 0) {
      _source = _GiftRankLoadingSource(widget.pageType, widget.rankType, this,
          giftId: widget.giftId, isLastWeek: widget.isLastWeek);
    } else {
      _source = _GiftRankLoadingSource(widget.pageType, widget.rankType, this,
          isLastWeek: widget.isLastWeek);
    }
    _source.refresh();
    _requestAwakeTimeData();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  ///觉醒时刻数据请求
  Future<void> _requestAwakeTimeData() async {
    if (!widget.isLastWeek && widget.pageType == 'allGift') {
      _awakeTimeRankRsp =
          await GiftRankRepository.getGiftAwakeTimeItems(widget.rankType);
      if (mounted) {
        setState(() {});
      }
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
          _requestAwakeTimeData();
        },
      );
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: base_k.K.no_data,
        onTap: () {
          _source.refresh();
          _requestAwakeTimeData();
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

  Column _buildTopThreeItem(GiftRankItem data, int rank) {
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
                if (ring != null && ring!.isNotEmpty)
                  UserIconFrame(size: 1.6 * avatarSize, frameUrl: ring!),
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
                if (header != null && header!.isNotEmpty)
                  UserIconFrame(size: avatarSize + 10, frameUrl: header!),
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

  Widget _buildOverLordCard(double cardWidth, int rank, GiftRankItem data) {
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
      onTap: () {
        if (widget.pageType != null &&
            widget.pageType == 'allGift' &&
            data.giftId > 0) {
          IRankManager rankManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_RANK);
          rankManager.showGiftRankScreen(context, 'singleGift',
              (widget.rankType == GiftRankType.king ? 0 : 1),
              giftId: data.giftId, isLastWeek: widget.isLastWeek);
        }
      },
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
                data.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          PositionedDirectional(
            top: 36,
            child: Row(
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
            child: (rank == 1 || widget.pageType == 'allGift')
                ? GiftKingOrStarWithGiftNameTag(
                    name: (data.giftName).safeSubstring(0, 4) +
                        (widget.rankType == GiftRankType.king
                            ? K.rank_singlegift_king
                            : K.rank_singlegift_star),
                    icon: data.badgeIcon,
                    color: Colors.white,
                    awakeGift: data.awakeGift,
                    shadowColor: (widget.rankType == GiftRankType.star)
                        ? const Color(0xffDD0020)
                        : null,
                  )
                : Container(
                    constraints: BoxConstraints(maxWidth: cardWidth - 20),
                    child: Text(
                      data.giftName,
                      style: TextStyle(
                          fontSize: 13, color: Colors.white.withOpacity(0.9)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
          ),
          PositionedDirectional(
            top: 80,
            child: Row(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          Util.squareResize(Util.giftImgUrl(data.giftId), 75),
                      width: 24.0,
                      height: 24.0,
                    ),
                    if (data.awakeGift)
                      PositionedDirectional(
                          end: 0,
                          top: 0,
                          child: R.img(Assets.rank$gift_weak_icon_png,
                              width: 10, height: 10))
                  ],
                ),
                NumText(
                  data.giftNum > 9999 ? 'x9999+' : 'x${data.giftNum}',
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
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

  Widget _buildTopThree(List<GiftRankItem> items) {
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

  Widget _itemBuilder(BuildContext context, GiftRankItem item, int index) {
    if (index < 3) return Container();

    return GiftRankItemWidget(
        index, item, widget.pageType, widget.rankType, widget.refer,
        isLastWeek: widget.isLastWeek);
  }

  Widget _buildList() {
    LoadingMoreList child =
        LoadingMoreList<GiftRankItem>(ListConfig<GiftRankItem>(
      itemBuilder: _itemBuilder,
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      indicatorBuilder: _indicatorBuilder,
    ));

    return RefreshIndicatorFactory.of(
        child: child,
        onRefresh: () async {
          _source.refresh();
          _requestAwakeTimeData();
        });
  }

  Widget _buildMyRank(GiftMyRankItem myItem) {
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
            start: 18.0, end: 0.0, bottom: Util.iphoneXBottom),
        child: Row(
          children: <Widget>[
            Text(
              myItem.rank,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 220),
                    child: Text(
                      myItem.name,
                      style: TextStyle(
                          fontSize: 16,
                          color: R.color.mainTextColor,
                          fontFamily: 'PingFang SC'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 2),
                  if (myItem.popularityLevel > 0)
                    UserPopularity(popularityLevel: myItem.popularityLevel),
                  if (myItem.vipLevel > 0) UserVipWidget(vip: myItem.vipLevel),
                ]),
                Text(
                  K.rank_upgrade_need + myItem.beforeDiff.toString(),
                  style: R.textStyle.caption,
                ),
              ],
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

    return showRankListByKey(homeGiftKey)
        ? Column(
            children: [
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      if (!widget.isLastWeek &&
                          widget.pageType == 'allGift' &&
                          _awakeTimeRankRsp != null &&
                          _awakeTimeRankRsp!.success &&
                          _awakeTimeRankRsp!.data.rankList.isNotEmpty)
                        SliverToBoxAdapter(
                          child: GiftRankAwakeWidget(
                              rankType: widget.rankType,
                              ranks: _awakeTimeRankRsp!.data.rankList,
                              refer: widget.refer),
                        ),
                      SliverAppBar(
                        pinned: false,
                        snap: false,
                        elevation: 0.0,
                        automaticallyImplyLeading: false,
                        primary: false,
                        floating: true,
                        backgroundColor: Colors.transparent,
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
              if (_source.my != null && widget.pageType == 'singleGift')
                _buildMyRank(_source.my!)
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

class _GiftRankLoadingSource extends LoadingMoreBase<GiftRankItem> {
  final String? pageType;
  final GiftRankType rankType;
  final int? giftId;
  final _GiftRankListWidgetState state;
  //是否是上周榜单
  final bool isLastWeek;

  GiftMyRankItem? my;

  static const int _firstPageIndex = 1;

  _GiftRankLoadingSource(this.pageType, this.rankType, this.state,
      {this.giftId, this.isLastWeek = false});

  Map<dynamic, List<GiftRankPrizeItem>>? awards;
  int _pageIndex = _firstPageIndex;
  bool _hasMore = true;
  String errorMsg = '';

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
    GiftRankResponse rsp;

    if (pageType == 'singleGift' && giftId != null && giftId! > 0) {
      rsp = await GiftRankRepository.getSingleGiftItems(rankType, page, giftId,
          lastWeek: isLastWeek);
    } else {
      rsp = await GiftRankRepository.getAllGiftItems(rankType, page,
          lastWeek: isLastWeek);
    }

    if (rsp.success == true) {
      if (rsp.my != null) {
        my = rsp.my;
      }

      if (page == _firstPageIndex) {
        clear();

        state.refresh();
      }

      if (rsp.awards != null) {
        awards = rsp.awards;
      }

      if (rsp.items.isNotEmpty) {
        addAll(rsp.items);
        _pageIndex = page;

        _hasMore = true;
      } else {
        _hasMore = false;
      }

      loadSuccess = true;
    } else {
      errorMsg = rsp.msg ?? '';
      loadSuccess = false;
    }

    return loadSuccess;
  }
}
