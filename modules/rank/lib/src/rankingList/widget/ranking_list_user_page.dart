import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/rankingList/model/ranking_list_user_api.dart';
import 'package:rank/src/rankingList/model/ranking_list_user_bean.dart';
import 'package:rank/src/rankingList/model/ranking_theme.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;

/// 用户榜
class RankingListUserPage extends StatefulWidget {
  const RankingListUserPage({
    super.key,
    this.type,
    this.name,
    this.rid,
  });

  final String? name;
  final String? type;
  final int? rid;

  @override
  RankingListTabPageState createState() => RankingListTabPageState();
}

class RankingListTabPageState extends State<RankingListUserPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late RankingListUserApi _repository;

  RankingUserListResponse? get _tabListResponse => _repository.rankingRes;

  String? get _errorMsg => _tabListResponse?.msg;

  @override
  void initState() {
    super.initState();
    _repository = RankingListUserApi(widget.type ?? '', () {
      if (mounted) setState(() {});
    });
    loadData();
  }

  @override
  void reload({bool force = true, animated = true}) {
    scrollToTop(animated: animated);
    loadData();
  }

  loadData() async {
    await _repository.refresh();
    if (mounted) setState(() {});
  }

  /// 进入个人主页
  void _gotoImageScreen(BuildContext context, int uid) {
    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, uid);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    IRankManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);

    return showRankListByKey(liveUserCharmKey)
        ? Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    if (_hasListData)
                      Positioned.fill(
                        top: 96 +
                            54 * Util.ratio +
                            14 +
                            manager
                                .getBoundingTextSize(
                                    context,
                                    _tabListResponse!.data!.list[0].userName,
                                    const TextStyle(fontSize: 16))
                                .height,
                        child: ColoredBox(
                          color: Colors.white,
                          child: Container(),
                        ),
                      ),
                    Positioned.fill(child: _buildRankingList()),
                    if (_tabListResponse?.data?.listLength != null &&
                        _tabListResponse?.data?.self != null)
                      _buildSelfItem(),
                  ],
                ),
              ),
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

  bool get _hasListData =>
      _tabListResponse?.data?.listLength != null &&
      _tabListResponse!.data!.listLength > 0;

  final _listBgColor = Colors.white;

  Widget _buildRankingList() {
    double bottomPadding = 0;
    if (_hasListData) {
      bottomPadding = _tabListResponse?.data?.self != null
          ? selfItemHeight
          : MediaQuery.of(context).padding.bottom;
    }

    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: LoadingMoreList(
        ListConfig<RankingListUserItem>(
          itemBuilder: _itemBuilder,
          physics: const ClampingScrollPhysics(),
          sourceList: _repository,
          indicatorBuilder: _indicatorBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(
      BuildContext context, RankingListUserItem item, int index) {
    List<RankingListUserItem> itemData =
        _tabListResponse!.data!.dataAtIndex(index);
    if (index == 0) {
      return _buildRankingTopThree(itemData);
    } else if (itemData.length == 1) {
      return _buildRankingItem(itemData.first);
    } else {
      return Container();
    }
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      // return LoadingFooter(hasMore: false);
      return Container(
        height: 0,
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMsg, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty ||
        status == IndicatorStatus.fullScreenError) {
      return _buildEmpty();
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildEmpty() {
    return Container(
      color: _listBgColor,
      child: ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _repository.refresh();
        },
      ),
    );
  }

  Widget _buildRankingTopThree(List<RankingListUserItem> itemData) {
    int length = itemData.length;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(
              Util.getImgUrl('room_ranking_header.png',
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ),
            fit: BoxFit.fill),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          if (length >= 2)
            Container(
              alignment: AlignmentDirectional.bottomStart,
              padding: EdgeInsetsDirectional.only(start: 16 * Util.ratio),
              child: _buildTopThreeItem(itemData[1], 2),
            ),
          if (length >= 3)
            Container(
              alignment: AlignmentDirectional.bottomEnd,
              padding: EdgeInsetsDirectional.only(end: 16 * Util.ratio),
              child: _buildTopThreeItem(itemData[2], 3),
            ),
          if (length >= 1)
            Container(
              alignment: AlignmentDirectional.bottomCenter,
              child: _buildTopThreeItem(itemData[0], 1),
            ),
        ],
      ),
    );
  }

  List<Color> topThreeBorderColor(int rank) {
    List<Color> rank1Colors = RankingTheme.roomRankingTop1BorderColor;
    List<Color> rank2Colors = RankingTheme.roomRankingTop2BorderColor;
    List<Color> rank3Colors = RankingTheme.roomRankingTop3BorderColor;
    if (rank == 1) {
      return rank1Colors;
    } else if (rank == 2) {
      return rank2Colors;
    } else if (rank == 3) {
      return rank3Colors;
    }
    return [Colors.white];
  }

  Column _buildTopThreeItem(RankingListUserItem data, int rank) {
    List<Color> borderColor = topThreeBorderColor(rank);
    double avatarSize = rank == 1 ? 72 : 64;
    double cardWidth = (rank == 1 ? 132 : 106) * Util.ratio;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: rank == 1 ? 88 : 84,
          height: rank == 1 ? 96 : 86,
          child: Stack(
            children: [
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                child: GradientBorder(
                  borderGradient: LinearGradient(colors: borderColor),
                  borderWidth: 2,
                  borderRadius: (avatarSize + 4) / 2,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      clipBehavior: Clip.none,
                      children: [
                        CommonAvatar(
                          path: data.userIcon,
                          size: avatarSize,
                          shape: BoxShape.circle,
                          onTap: () {
                            _gotoImageScreen(context, data.uid);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                child: R.img(RoomAssets.room_ranking_crownx_png(rank),
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    width: 40,
                    height: 41),
              ),
            ],
          ),
        ),
        Container(
          width: cardWidth,
          padding: const EdgeInsetsDirectional.only(
              top: 4, bottom: 10, start: 3, end: 3),
          alignment: AlignmentDirectional.center,
          child: Text(
            data.userName,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (showRankScoreByKey(liveUserCharmKey))
          _buildOverLordCard(cardWidth, rank, data),
      ],
    );
  }

  Widget _buildOverLordCard(
      double cardWidth, int rank, RankingListUserItem data) {
    final imageName = rank == 1
        ? Assets.ranking_top_three_top_webp
        : Assets.ranking_top_three_second_webp;
    final imagePath =
        R.imagePath(imageName, package: ComponentManager.MANAGER_RANK);
    final BorderRadius radius = BorderRadiusDirectional.only(
            topStart: Radius.circular(rank < 3 ? 8 : 0),
            topEnd: Radius.circular(rank == 2 ? 0 : 8))
        .resolve(Directionality.of(context));
    return Stack(
      children: [
        Container(
          width: cardWidth,
          height: (rank == 1 ? 54 : 42) * Util.ratio,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: RankingTheme.roomRankingTopCardColor,
              begin: const FractionalOffset(0.52, 0.86),
              end: const FractionalOffset(0.52, -0.38),
            ),
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                spreadRadius: 0.0,
                offset: const Offset(0.0, 2.0),
                color: RankingTheme.roomRankingTopCardColor.first,
              ),
              BoxShadow(
                blurRadius: 12.0,
                spreadRadius: 0.0,
                offset: const Offset(0.0, 2),
                color: Colors.white.withOpacity(0.24),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  data.contributeValueText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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

  Widget _buildSelfItem() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: _listBgColor,
          child: Container(
            height: selfItemHeight,
            padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0.0, -4.0),
                    color: RankingTheme.thirdBgColor),
              ],
            ),
            child: _buildRankingItem(
                _tabListResponse!.data!.self!, Colors.transparent),
          ),
        ));
  }

  double get selfItemHeight => 76 + MediaQuery.of(context).padding.bottom;

  Widget _buildRankingItem(RankingListUserItem item,
      [Color color = Colors.white]) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: item.rank == 4 ? 6 : 0, end: 16),
      color: color,
      child: Row(
        children: [
          const SizedBox(height: 72),
          Container(
            width: 38,
            alignment: AlignmentDirectional.center,
            child: showRankByKey(liveUserCharmKey)
                ? Text(
                    item.rank > 0
                        ? (item.rank > 99 ? '99+' : '${item.rank}')
                        : '-',
                    style: TextStyle(
                      color: RankingTheme.secondTextColor,
                      fontSize: 13,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            clipBehavior: Clip.none,
            children: [
              CommonAvatar(
                path: item.userIcon,
                size: 52,
                shape: BoxShape.circle,
                onTap: () {
                  _gotoImageScreen(context, item.uid);
                },
              ),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              item.userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: RankingTheme.mainTextColor,
                fontSize: 16,
              ),
            ),
          ),
          if (showRankScoreByKey(liveUserCharmKey))
            RichText(
              text: TextSpan(
                  text: '${item.contributeValue} ',
                  style: TextStyle(
                      color: R.color.thirdBrightColor,
                      fontSize: 13,
                      fontFamily: Util.fontFamily),
                  children: [
                    TextSpan(
                        text: K.rank_achieve_score,
                        style: TextStyle(
                            fontSize: 13,
                            color: RankingTheme.thirdTextColor,
                            fontFamily: Util.fontFamily)),
                  ]),
            ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void scrollToTop({bool animated = true}) {}
}
