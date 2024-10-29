import 'package:chat_room/assets.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/src/rankingList/model/ranking_star_api.dart';
import 'package:rank/src/rankingList/model/ranking_star_bean.dart';
import 'package:rank/src/rankingList/model/ranking_theme.dart';
import 'package:chat_room/chat_room.dart';

import 'ranking_usericon_live_widget.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;

/// 星光榜单
class RankingStarTabPage extends StatefulWidget {
  const RankingStarTabPage(
      {super.key, this.type, this.name, this.refreshCallback, this.rid});

  final String? name;
  final String? type;
  final int? rid;
  final Function()? refreshCallback;

  @override
  RankingStarTabPageState createState() => RankingStarTabPageState();
}

class RankingStarTabPageState extends State<RankingStarTabPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late RankingStarApi _repository;

  RankingStarTabListResponse? get _tabListResponse => _repository.rankingRes;

  String? get _errorMsg => _tabListResponse?.msg;

  @override
  void initState() {
    super.initState();
    _repository = RankingStarApi(widget.rid ?? 0, widget.type ?? '', () {
      _refresh();
    });
    loadData();
  }

  @override
  void reload({bool force = true, animated = true}) {
    if (!mounted) {
      return;
    }
    scrollToTop(animated: animated);
    loadData();
  }

  loadData() async {
    await _repository.refresh();
    _refresh();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  /// 进入个人主页
  void _gotoImageScreen(BuildContext context, int uid, bool inRoom) {
    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    if (inRoom) {
      RoomUserProfile.openImageFloatScreenDisplayModalBottomSheet(
          context, uid, ChatRoomData.getInstance(), 0);
    } else {
      personalDataManager.openImageScreen(context, uid);
    }
  }

  /// 进入房间
  void _gotoRoomScreen(
      {required BuildContext context,
      int? roomId,
      required int uid,
      int position = 0,
      required String page}) async {
    Tracker.instance.track(TrackEvent.click_list_tx, properties: {
      'rid': roomId,
      'target_uid': uid,
      'position': position,
      'page': page
    });

    bool inRoom = widget.rid != null && widget.rid! > 0;

    if (roomId != null && roomId > 0 && roomId == widget.rid) {
      _gotoImageScreen(context, uid, inRoom);
      return;
    }

    bool canEnterRoom = false;
    if (roomId != null && roomId > 0) {
      IRoomManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      canEnterRoom = await manager.checkToEnterRoom(context, rid: roomId);
      if (canEnterRoom) {
        if (inRoom) {
          Navigator.pop(context);
          eventCenter
              .emit(EventConstant.roomChangeRid, {'rid': roomId, 'uid': uid});
        } else {
          manager.openChatRoomScreenShow(context, roomId, uid: uid);
        }
      }
    }
    if (!canEnterRoom) {
      if (inRoom) {
        Navigator.pop(context);
      }
      _gotoImageScreen(context, uid, inRoom);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Positioned.fill(child: _buildRankingList()),
        if (_tabListResponse?.listLength != null &&
            _tabListResponse?.self != null)
          _buildSelfItem(),
      ],
    );
  }

  final _listBgColor = Colors.white;

  Widget _buildRankingList() {
    double bottomPadding = 0;
    if (_hasListData) {
      bottomPadding = _tabListResponse?.self != null
          ? selfItemHeight
          : MediaQuery.of(context).padding.bottom;
    }
    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: LoadingMoreList(
        ListConfig<RankingStarTabItem>(
          itemBuilder: _itemBuilder,
          physics: const ClampingScrollPhysics(),
          sourceList: _repository,
          indicatorBuilder: _indicatorBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(
      BuildContext context, RankingStarTabItem item, int index) {
    List<RankingStarTabItem> itemData = _tabListResponse!.dataAtIndex(index);
    if (index == 0) {
      return _buildRankingTopThree(itemData);
    } else if (itemData.length == 1) {
      return _buildRankingItem(itemData.first);
    } else {
      return Container(color: _listBgColor);
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
      return const SizedBox.shrink();
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

  Widget _buildRankingTopThree(List<RankingStarTabItem> itemData) {
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

  Column _buildTopThreeItem(RankingStarTabItem data, int rank) {
    List<Color> borderColor = topThreeBorderColor(rank);
    double avatarSize = rank == 1 ? 72 : 64;
    double cardWidth = (rank == 1 ? 132 : 106) * Util.ratio;

    bool hasRoom = data.rid > 0;
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
                            int pos = data.rank;
                            String page = '${widget.type}list';
                            _gotoRoomScreen(
                                context: context,
                                roomId: data.rid,
                                uid: data.uid,
                                position: pos,
                                page: page);
                          },
                        ),
                        if (hasRoom)
                          RankingUserIconLive(
                            color: const Color(0xFFFF5F7D),
                            size: avatarSize + 3,
                            showCircle: false,
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
        _buildOverLordCard(cardWidth, rank, data),
      ],
    );
  }

  Widget _buildOverLordCard(
      double cardWidth, int rank, RankingStarTabItem data) {
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
          height: (rank == 1 ? 74 : 62) * Util.ratio,
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
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.starValue,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 13, color: Colors.white, height: 1.1),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  K.rank_talent_star_value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                ),
              ],
            ),
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

  bool get _hasListData =>
      _tabListResponse?.listLength != null && _tabListResponse!.listLength > 0;

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
            child: _buildSelfRankItem(_tabListResponse!.self!),
          ),
        ));
  }

  double get selfItemHeight => 76 + MediaQuery.of(context).padding.bottom;

  Widget _buildRankingItem(RankingStarTabItem item) {
    var hasRoom = item.rid > 0;

    return Container(
      height: 72,
      color: Colors.white,
      padding: const EdgeInsetsDirectional.only(end: 16),
      child: Row(
        children: [
          Container(
            width: 38,
            alignment: AlignmentDirectional.center,
            child: Text(
              '${item.rank}',
              style: TextStyle(
                color: RankingTheme.secondTextColor,
                fontSize: 13,
              ),
            ),
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
                  int pos = item.rank;
                  String page = '${widget.type}list';
                  _gotoRoomScreen(
                      context: context,
                      roomId: item.rid,
                      uid: item.uid,
                      position: pos,
                      page: page);
                },
              ),
              Visibility(
                visible: hasRoom,
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                maintainInteractivity: false,
                child: const RankingUserIconLive(
                  size: 55,
                  color: Color(0xFFFF5F7D),
                ),
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
          Container(
            width: 95,
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              item.starValueText,
              style: TextStyle(
                  color: RankingTheme.thirdBrightColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelfRankItem(RankingStarTabItem item) {
    /// 是否上榜状态
    bool onRank = item.rank > 0;
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 0, end: 16),
      child: Row(
        children: [
          const SizedBox(height: 72),
          Container(
            width: 38,
            alignment: AlignmentDirectional.center,
            child: Text(
              '${onRank ? item.rank : '-'}',
              style: TextStyle(
                color: RankingTheme.secondTextColor,
                fontSize: 13,
              ),
            ),
          ),
          CommonAvatar(
            path: item.userIcon,
            size: 52,
            shape: BoxShape.circle,
            onTap: () {
              int pos = item.rank;
              String page = '${widget.type}list';
              _gotoRoomScreen(
                  context: context,
                  roomId: item.rid,
                  uid: item.uid,
                  position: pos,
                  page: page);
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: RankingTheme.mainTextColor,
                    fontSize: 16,
                  ),
                ),
                if (onRank == false) ...[
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    K.rank_talent_no_rank,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: RankingTheme.thirdTextColor,
                      fontSize: 13,
                    ),
                  ),
                ]
              ],
            ),
          ),
          if (onRank == false)
            Container(
              width: 95,
              alignment: AlignmentDirectional.centerEnd,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    K.rank_talent_diff,
                    style: TextStyle(
                        color: RankingTheme.thirdTextColor,
                        fontSize: 11,
                        height: 1.1,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 6.dp),
                  NumText(
                    '${item.diffNum}',
                    style: TextStyle(
                      color: RankingTheme.thirdTextColor,
                      fontSize: 11,
                      height: 1.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
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
