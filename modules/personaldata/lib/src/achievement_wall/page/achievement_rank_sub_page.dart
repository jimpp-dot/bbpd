import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../assets.dart';
import '../controller/achievement_wall_rank_loading_source.dart';
import '../model/pb/generated/slp_achieve.pb.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

typedef OnScrolled = Function(double progress);

class AchievementRankSubPage extends StatefulWidget {
  final int tab;
  final PageRefer refer;
  final OnScrolled scrolled;

  const AchievementRankSubPage(
      {Key? key,
      required this.tab,
      required this.refer,
      required this.scrolled})
      : super(key: key);

  @override
  State<AchievementRankSubPage> createState() => _AchievementRankSubPageState();
}

class _AchievementRankSubPageState extends State<AchievementRankSubPage> {
  late AchievementWallRankLoadingSource _source;
  late ScrollController _scrollController;
  double expandedHeight = 320.5.dp;

  @override
  void initState() {
    super.initState();
    _source = AchievementWallRankLoadingSource(widget.tab);
    _source.refreshCallback = refresh;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      double r = _scrollController.offset / expandedHeight;
      if (r < 0) {
        r = 0;
      }
      if (r > 1) {
        r = 1;
      }
      widget.scrolled(r);
    });
  }

  @override
  void dispose() {
    _source.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  List<AchieveBadgeRankItem> get items =>
      _source.sublist(0, min(3, _source.length));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NestedScrollView(
            controller: _scrollController,
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
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    background: SizedBox(
                      width: Util.width,
                      height: expandedHeight,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          PositionedDirectional(
                            top: 0,
                            child: R.img(
                              Assets
                                  .personaldata$achievement_wall_achieve_rank_bg_webp,
                              width: Util.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // 第二名
                          if (items.length >= 2)
                            PositionedDirectional(
                              top: 73,
                              start: 0,
                              child: Container(
                                alignment: AlignmentDirectional.topStart,
                                padding:
                                    const EdgeInsetsDirectional.only(start: 16),
                                child: _buildTopThreeItem(items[1], 2),
                              ),
                            ),
                          // 第三名
                          if (items.length >= 3)
                            PositionedDirectional(
                              top: 93,
                              end: 0,
                              child: Container(
                                alignment: AlignmentDirectional.topEnd,
                                padding:
                                    const EdgeInsetsDirectional.only(end: 16),
                                child: _buildTopThreeItem(items[2], 3),
                              ),
                            ),
                          // 第一名
                          if (items.isNotEmpty)
                            PositionedDirectional(
                              top: 16,
                              child: Container(
                                alignment: AlignmentDirectional.topCenter,
                                child: _buildTopThreeItem(items[0], 1),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Container(child: _buildList()),
          ),
        ),
        if (_source.my != null) _buildMyRank(_source.my!),
      ],
    );
  }

  Widget _buildList() {
    LoadingMoreList child =
        LoadingMoreList<AchieveBadgeRankItem>(ListConfig<AchieveBadgeRankItem>(
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

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(
        hasMore: true,
        textColor: Colors.white.withOpacity(0.5),
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(
        textColor: Colors.white.withOpacity(0.5),
        hasMore: false,
        loadMore: () => {},
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _source.errorMsg,
        fontColor: Colors.white.withOpacity(0.5),
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: R.string("no_data"),
        fontColor: Colors.white.withOpacity(0.5),
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: _source.errorMsg,
        loadMore: _source.loadMore,
        textColor: Colors.white.withOpacity(0.5),
      );
    } else {
      return LoadingFooter(
        hasMore: _source.hasMore,
        loadMore: _source.loadMore,
        textColor: Colors.white.withOpacity(0.5),
      );
    }
  }

  Widget _itemBuilder(
      BuildContext context, AchieveBadgeRankItem item, int index) {
    if (index < 3) return Container();
    return AchievementWallRankItem(index, item, widget.refer);
  }

  List<Color> topThreeBorderColor(int rank) {
    List<Color> rank1Colors = [
      const Color(0xFFFAD961),
      const Color(0xFFF7B01C)
    ];
    List<Color> rank2Colors = [
      const Color(0xFFE6E6E6),
      const Color(0xFFCDD5E8),
      const Color(0xFFD8D8D8)
    ];
    List<Color> rank3Colors = [
      const Color(0xFFFFE9D6),
      const Color(0xFFFFAB81)
    ];
    if (rank == 1) {
      return rank1Colors;
    } else if (rank == 2) {
      return rank2Colors;
    } else if (rank == 3) {
      return rank3Colors;
    }
    return [Colors.white];
  }

  Column _buildTopThreeItem(AchieveBadgeRankItem item, int rank) {
    double avatarSize = rank == 1 ? 72 : 64;
    double avatarBottom = rank == 1 ? 12 : 0;
    double nameWidth = rank == 1 ? 124 : 110;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: rank == 1 ? 124 : 110,
          height: 108,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              PositionedDirectional(
                bottom: avatarBottom,
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: CommonAvatarWithFrame(
                    childWidget: GestureDetector(
                        onTap: () {
                          IPersonalDataManager personalDataManager =
                              ComponentManager.instance.getManager(
                                  ComponentManager.MANAGER_PERSONALDATA);
                          personalDataManager.openImageScreen(context, item.uid,
                              refer: widget.refer);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              CommonAvatar(
                                path: item.icon,
                                size: avatarSize,
                                shape: BoxShape.circle,
                              ),
                              R.img(
                                (rank == 1)
                                    ? Assets
                                        .personaldata$achievement_wall_crown_rank_1_webp
                                    : (rank == 2
                                        ? Assets
                                            .personaldata$achievement_wall_crown_rank_2_webp
                                        : Assets
                                            .personaldata$achievement_wall_crown_rank_3_webp),
                                width: avatarSize + 40,
                                height: avatarSize + 40,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        )),
                    uid: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          constraints: BoxConstraints(maxWidth: nameWidth - 20),
          child: Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                TextStyle(color: Colors.white, fontSize: rank == 1 ? 16 : 14),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          constraints: BoxConstraints(maxWidth: nameWidth - 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${item.score}',
                style: const TextStyle(
                    color: Color(0xFFFFF056),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 底部我的排名
  Widget _buildMyRank(AchieveBadgeRankItem myItem) {
    return Container(
      height: 90 + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        color: const Color(0xFF2E2E45),
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(32.0),
          topEnd: Radius.circular(32.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: const Offset(0.0, 4.0),
            color: R.color.unionRankText1.withOpacity(0.03),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 76,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                NumText(
                  myItem.rank > 100 ? '100+' : '${myItem.rank}',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 18),
                CommonAvatar(
                  path: myItem.icon,
                  size: 56,
                  shape: BoxShape.circle,
                  onTap: () {
                    IPersonalDataManager personalDataManager = ComponentManager
                        .instance
                        .getManager(ComponentManager.MANAGER_PERSONALDATA);
                    personalDataManager.openImageScreen(context, myItem.uid,
                        refer: widget.refer);
                  },
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    myItem.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${myItem.score}',
                  style: const TextStyle(
                      color: Color(0xFFFFF056),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom)
        ],
      ),
    );
  }
}

class AchievementWallRankItem extends StatelessWidget {
  final int index;
  final AchieveBadgeRankItem item;
  final PageRefer refer;

  const AchievementWallRankItem(this.index, this.item, this.refer, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  NumText(
                    (index + 1) > 100 ? '100+' : '${index + 1}',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 15,
                        fontFamily: Util.numFontFamily,
                        package: ComponentManager.MANAGER_BASE_CORE),
                  ),
                  const SizedBox(width: 20),
                  CommonAvatar(
                    path: item.icon,
                    size: 56,
                    shape: BoxShape.circle,
                    onTap: () {
                      IPersonalDataManager personalDataManager =
                          ComponentManager.instance.getManager(
                              ComponentManager.MANAGER_PERSONALDATA);
                      personalDataManager.openImageScreen(context, item.uid,
                          refer: refer);
                    },
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${item.score}',
                    style: const TextStyle(
                        color: Color(0xFFFFF056),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
