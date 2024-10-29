import 'dart:math';
import 'package:shared/shared.dart' hide SliverAppBar;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import '../../k.dart';
import 'model/club_anchor_rank_beans.dart';
import 'widget/club_anchor_rank_item_widget.dart';
import 'model/club_anchor_rank_source.dart';

class ClubAnchorRankPage extends StatefulWidget {
  final int clubId;

  const ClubAnchorRankPage({Key? key, required this.clubId}) : super(key: key);

  @override
  _ClubAnchorRankPageState createState() => _ClubAnchorRankPageState();

  static Future show(BuildContext context, int clubId) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ClubAnchorRankPage(
            clubId: clubId,
          );
        },
        settings: const RouteSettings(name: '/ClubAnchorRankPage'),
      ),
    );
  }
}

class _ClubAnchorRankPageState extends State<ClubAnchorRankPage> {
  late ClubAnchorRankLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = ClubAnchorRankLoadingSource(widget.clubId, refresh);
    _source.refresh();
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFC73AFF), Color(0xFF7471FF)],
              begin: AlignmentDirectional.topEnd,
              end: AlignmentDirectional.bottomEnd,
            ),
          ),
        ),
        PositionedDirectional(
          top: 0,
          end: 0,
          child: R.img('club/anchor_rank_top_bg.png',
              width: 236,
              height: 308,
              package: ComponentManager.MANAGER_MOMENT),
        ),
        if (_source.isNotEmpty)
          PositionedDirectional(
            top: 339,
            child: Container(
              width: Util.width,
              height: Util.height,
              color: R.color.mainBgColor,
            ),
          ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: BaseAppBar.custom(
            statusBrightness: Brightness.dark,
            leading: const BackButton(
              color: Colors.white,
            ),
            title: Text(
              K.moment_anchor_popularity_list,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
            actions: Util.isStringEmpty(_source.help)
                ? null
                : [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (_source.help != null) {
                          BaseWebviewScreen.show(context, url: _source.help!);
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 30,
                        alignment: AlignmentDirectional.center,
                        child: R.img(
                          'info.svg',
                          width: 24,
                          height: 24,
                          color: Colors.white.withOpacity(0.7),
                          package: ComponentManager.MANAGER_BASE_ROOM,
                        ),
                      ),
                    ),
                  ],
          ),
          body: _buildBody(),
        ),
      ],
    );
  }

  Widget _buildList() {
    LoadingMoreList child =
        LoadingMoreList<ClubAnchorRankItem>(ListConfig<ClubAnchorRankItem>(
      itemBuilder: _itemBuilder,
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      indicatorBuilder: _indicatorBuilder,
    ));

    return RefreshIndicatorFactory.of(
      child: Container(
        color: R.color.mainBgColor,
        child: child,
      ),
      onRefresh: () => _source.refresh(),
    );
  }

  Widget _itemBuilder(
      BuildContext context, ClubAnchorRankItem item, int index) {
    if (index < 3) {
      return Container();
    }

    return ClubAnchorRankItemWidget(index, item, () {
      _onTapUser(item.uid);
    });
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
      return Center(
        child: EmptyWidget(
          onTap: () {
            _source.refresh();
          },
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg, loadMore: _source.loadMore);
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore, loadMore: _source.loadMore);
    }
  }

  Widget _buildMyRank(ClubAnchorRankItem myItem) {
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
          start: 2,
          end: 18,
          bottom: Util.iphoneXBottom,
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 23,
              width: 36,
              alignment: Alignment.center,
              child: Text(
                myItem.rank <= 0 || myItem.rank > 99 ? '99+' : '${myItem.rank}',
                style: TextStyle(fontSize: 13, color: R.color.thirdTextColor),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(top: 12, bottom: 12, end: 8),
              child: CommonAvatar(
                path: myItem.icon,
                size: 52,
                shape: BoxShape.circle,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: Util.width - 250),
                    child: Text(
                      myItem.name ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: R.color.mainTextColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  if (!NobilityUtil.titleIsInvalid(myItem.titleNew))
                    UserNobilityWidget(
                      titleNew: myItem.titleNew,
                    ),
                  if (myItem.vipLevel > 0) UserVipWidget(vip: myItem.vipLevel),
                ]),
                buildScoreText(myItem),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopThree(List<ClubAnchorRankItem> items) {
    int length = items.length;

    return Container(
      height: 259,
      alignment: AlignmentDirectional.bottomCenter,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
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

  Column _buildTopThreeItem(ClubAnchorRankItem data, int rank) {
    List<Color> borderColor = topThreeBorderColor(rank);
    double avatarSize = rank == 1 ? 72 : 64;
    double cardWidth = (rank == 1 ? 132 : 106) * Util.ratio;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: rank == 1 ? 115 : 102,
          height: rank == 1 ? 117 : 104,
          child: GestureDetector(
            onTap: () {
              _onTapUser(data.uid);
            },
            child: Container(
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
                        _onTapUser(data.uid);
                      },
                    ),
                  ),
                  uid: 0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _buildOverLordCard(cardWidth, rank, data),
      ],
    );
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

  Widget _buildTopEmptyItem(int rank) {
    double cardWidth = 106 * Util.ratio;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 102,
          height: 104,
        ),
        const SizedBox(
          height: 10,
        ),
        _buildEmptyOverLordCard(cardWidth, rank),
      ],
    );
  }

  Widget _buildEmptyOverLordCard(double cardWidth, int rank) {
    final imagePath = R.imagePath(
        R.color.statusBarTheme == Brightness.light
            ? 'rank/charm_achieve_rank_header_$rank.webp'
            : 'rank/charm_achieve_rank_header_dark_$rank.webp',
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
        PositionedDirectional(
            bottom: 0,
            child: R.img('rank/charm_achieve_rank_$rank.webp',
                width: 24, height: 32, package: ComponentManager.MANAGER_RANK)),
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

  Widget _buildOverLordCard(
      double cardWidth, int rank, ClubAnchorRankItem data) {
    final imagePath = R.imagePath(
        R.color.statusBarTheme == Brightness.light
            ? 'rank/charm_achieve_rank_header_$rank.webp'
            : 'rank/charm_achieve_rank_header_dark_$rank.webp',
        package: ComponentManager.MANAGER_RANK);

    final BorderRadius radius = BorderRadiusDirectional.only(
            topStart: Radius.circular(rank < 3 ? 8 : 0),
            topEnd: Radius.circular(rank == 2 ? 0 : 8))
        .resolve(Directionality.of(context));

    final double cardHeight = (rank == 1 ? 125.0 : 115.0);

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
            child: Text(data.name ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
        PositionedDirectional(
          top: 36,
          child: Row(
            children: [
              if (!NobilityUtil.titleIsInvalid(data.titleNew))
                UserNobilityWidget(
                  titleNew: data.titleNew,
                  height: 22,
                ),
              const SizedBox(
                width: 2,
              ),
              if (data.vipLevel > 0) UserVipWidget(vip: data.vipLevel),
            ],
          ),
        ),
        PositionedDirectional(
          top: 60,
          child: buildScoreText(data, textColor: Colors.white.withOpacity(0.8)),
        ),
        PositionedDirectional(
            bottom: 0,
            child: R.img('rank/charm_achieve_rank_$rank.webp',
                width: rank == 1 ? 25 : 24,
                height: rank == 1 ? 34 : 32,
                package: ComponentManager.MANAGER_RANK)),
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

  Widget _buildBody() {
    double expandedHeight = 0;
    if (_source.isNotEmpty) {
      expandedHeight = 259;
    }

    return Column(
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
                  backgroundColor: Colors.transparent,
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
        if (_source.me != null) _buildMyRank(_source.me!),
      ],
    );
  }

  void _onTapUser(int uid) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, uid,
        refer: const PageRefer('club_anchor_rank'));
  }
}
