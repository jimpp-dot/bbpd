import 'package:shared/widget/custom_count_down_widget.dart';
import 'package:chat_room/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/rankingList/model/ranking_list_api.dart';
import 'package:rank/src/rankingList/model/ranking_list_bean.dart';
import 'package:rank/src/rankingList/model/ranking_theme.dart';
import 'package:chat_room/chat_room.dart';
import 'package:rank/src/rankingList/widget/ranking_usericon_live_widget.dart';

class RankingListNewTabPage extends StatefulWidget {
  const RankingListNewTabPage({
    super.key,
    required this.type,
    this.name,
    this.refreshCallback,
    this.rid,
    this.charmType = '',
  });

  final String? name;
  final String type;
  final int? rid;
  final String charmType;
  final Function()? refreshCallback;

  @override
  RankingListNewTabPageState createState() => RankingListNewTabPageState();
}

class RankingListNewTabPageState extends State<RankingListNewTabPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late RankingListApi _repository;

  RankingTabListResponse? get _tabListResponse => _repository.rankingRes;

  String? get _errorMsg => _tabListResponse?.msg;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _repository =
        RankingListApi(widget.rid ?? 0, widget.type, widget.charmType, () {
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
    _isLoading = true;
    await _repository.refresh();
    _isLoading = false;
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

    return showRankListByKey(liveRoomCharmKey)
        ? Column(
            children: [
              if (_tabListResponse?.overLoad != null)
                _buildRankingOverlord(_tabListResponse!.overLoad!),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(child: _buildRankingList()),
                    if (_tabListResponse?.listLength != null &&
                        _tabListResponse?.self != null)
                      _buildSelfItem(),
                  ],
                ),
              ),
            ],
          )
        : Center(
            child: Text(
              K.rank_no_more_data,
              style: TextStyle(fontSize: 13, color: Colors.grey[400]),
            ),
          );
  }

  bool get _hasListData =>
      _tabListResponse?.listLength != null && _tabListResponse!.listLength > 0;

  Widget _buildRankingList() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: LoadingMoreList(
        ListConfig<RankingTabItem>(
          itemBuilder: _itemBuilder,
          physics: const ClampingScrollPhysics(),
          sourceList: _repository,
          indicatorBuilder: _indicatorBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, RankingTabItem item, int index) {
    double topBorderRadius = index == 3 ? 12 : 0;
    double bottomBorderRadius = index == _repository.length - 1 ? 12 : 0;
    List<RankingTabItem> itemData = _tabListResponse!.dataAtIndex(index);
    if (index == 0) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: _buildRankingTopThree(itemData),
      );
    } else if (itemData.length == 1) {
      return Container(
          decoration: BoxDecoration(
              color: const Color(0xFF7032FF).withOpacity(0.5),
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(topBorderRadius),
                topEnd: Radius.circular(topBorderRadius),
                bottomStart: Radius.circular(bottomBorderRadius),
                bottomEnd: Radius.circular(bottomBorderRadius),
              )),
          child: _buildRankingItem(itemData.first));
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
      double bottomPadding = 0;
      if (_hasListData) {
        bottomPadding = _tabListResponse?.self != null
            ? selfItemHeight + 8
            : MediaQuery.of(context).padding.bottom;
      }
      return Container(
        height: bottomPadding,
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMsg, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty ||
        status == IndicatorStatus.fullScreenError) {
      if (_tabListResponse?.overLoad != null) return Container();

      return _buildEmpty();
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildEmpty() {
    return ErrorData(
      error: BaseK.K.no_data,
      onTap: () {
        _repository.refresh();
      },
    );
  }

  Widget _buildRankingTopThree(List<RankingTabItem> itemData) {
    int length = itemData.length;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        if (length >= 2)
          Container(
            alignment: AlignmentDirectional.bottomStart,
            child: _buildTopThreeItem(itemData[1], 2),
          ),
        if (length >= 3)
          Container(
            alignment: AlignmentDirectional.bottomEnd,
            child: _buildTopThreeItem(itemData[2], 3),
          ),
        if (length >= 1)
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: _buildTopThreeItem(itemData[0], 1),
          ),
      ],
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

  Column _buildTopThreeItem(RankingTabItem data, int rank) {
    List<Color> borderColor = topThreeBorderColor(rank);
    double avatarSize = rank == 1 ? 72 : 64;
    double cardWidth = (rank == 1 ? 132 : 106) * Util.ratio;

    bool hasRoom = _hasRoom(data);
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
                          path: data.roomIcon,
                          size: avatarSize,
                          shape: BoxShape.circle,
                          onTap: () {
                            int pos = widget.type == 'hour' ? data.rank : 0;
                            String page = '${widget.type}list';
                            _gotoRoomScreen(
                                context: context,
                                roomId: data.currentRid,
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

  bool _hasRoom(RankingTabItem data) => data.currentRid > 0;

  Widget _buildOverLordCard(double cardWidth, int rank, RankingTabItem data) {
    final BorderRadius radius = BorderRadiusDirectional.only(
      topStart: Radius.circular(rank < 3 ? 8 : 0),
      topEnd: Radius.circular(rank == 2 ? 0 : 8),
      bottomStart: Radius.circular(rank == 2 ? 8 : 0),
      bottomEnd: Radius.circular(rank == 3 ? 8 : 0),
    ).resolve(Directionality.of(context));
    return Stack(
      children: [
        Container(
          width: cardWidth,
          height: (rank == 1 ? 74 : 62) * Util.ratio,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFFE0B7),
                Color(0xFF622EDD),
                Color(0xFFA99CFF),
              ],
              stops: [0, 0.12, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: radius,
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 8.0,
            //     spreadRadius: 0.0,
            //     offset: const Offset(0.0, 2.0),
            //     color: RankingTheme.roomRankingTopCardColor.first,
            //   ),
            //   BoxShadow(
            //     blurRadius: 12.0,
            //     spreadRadius: 0.0,
            //     offset: const Offset(0.0, 2),
            //     color: Colors.white.withOpacity(0.24),
            //   ),
            // ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  data.roomName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              if (showRankScoreByKey(liveRoomCharmKey))
                Flexible(
                  child: Text(
                    rank > 1
                        ? K.live_rank_before_diff + data.diffBeforeValue
                        : '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.8),
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
              child: SizedBox(
                width: double.infinity,
                height: rank == 1 ? 15 : 9,
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
          height: selfItemHeight,
          padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
          decoration: const BoxDecoration(
            color: Color(0xFF683AEA),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: _buildRankingItem(_tabListResponse!.self!),
        ));
  }

  double get selfItemHeight => 76 + MediaQuery.of(context).padding.bottom;

  Widget _buildRankingItem(RankingTabItem item) {
    var hasRoom = _hasRoom(item);
    return Container(
      padding: EdgeInsetsDirectional.only(top: item.rank == 4 ? 6 : 0, end: 16),
      child: Row(
        children: [
          const SizedBox(height: 72),
          Container(
            width: 38,
            alignment: AlignmentDirectional.center,
            child: showRankByKey(liveRoomCharmKey)
                ? Text(
                    item.rank > 0
                        ? (item.rank > 99 ? '99+' : '${item.rank}')
                        : '-',
                    style: const TextStyle(
                      color: Color(0x99FFFFFF),
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
                path: item.roomIcon,
                size: 52,
                shape: BoxShape.circle,
                onTap: () {
                  int pos = widget.type == 'hour' ? item.rank : 0;
                  String page = '${widget.type}list';
                  _gotoRoomScreen(
                      context: context,
                      roomId: item.currentRid,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    item.roomName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Flexible(
                  child: Text(
                    item.mvpText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (showRankScoreByKey(liveRoomCharmKey))
            RichText(
              text: TextSpan(
                  text: K.live_rank_before_diff,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 13,
                      fontFamily: Util.fontFamily),
                  children: [
                    TextSpan(
                        text: item.diffBeforeValue,
                        style: TextStyle(
                            fontSize: 13,
                            color: const Color(0xFFFCD315),
                            fontFamily: Util.fontFamily)),
                  ]),
            ),
        ],
      ),
    );
  }

  Widget _buildRankingOverlord(RankingTabItem overLoad) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 128,
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            margin: const EdgeInsetsDirectional.only(
                top: 16, start: 16, end: 16, bottom: 16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: CachedNetworkImage(
                    imageUrl: 'static/banban/rank/rank_charm_top_card_bg.webp',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        top: 6, start: 14, bottom: 14, end: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              overLoad.overLordTitle,
                              style: const TextStyle(
                                  color: Color(0xFFC77448),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Row(
                              children: [
                                Container(
                                  width: 54,
                                  height: 54,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFFFE791),
                                          Color(0xFFDD37FF)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                    borderRadius:
                                        BorderRadius.circular((27)), // 圆角度
                                  ),
                                  child: CommonAvatar(
                                    path: overLoad.userIcon,
                                    size: 50,
                                    shape: BoxShape.circle,
                                    onTap: () {
                                      String page = 'overlord';
                                      _gotoRoomScreen(
                                          context: context,
                                          roomId: overLoad.currentRid,
                                          uid: overLoad.uid,
                                          page: page);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          overLoad.roomName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Color(0xFF683AEA),
                                            fontSize: 13,
                                            // fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Flexible(
                                        child: Text(
                                          overLoad.mvpText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Color(0x99313131),
                                            fontSize: 11,
                                            // fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  overLoad.overLordNumText,
                                  style: const TextStyle(
                                      color: Color(0xFF4D28C2),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        countDownWidget(overLoad.leftTime),
      ],
    );
  }

  Widget countDownWidget(int leftTime) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 17, bottom: 10),
      child: Row(
        children: [
          R.img(Assets.rank$count_down_icon_webp,
              width: 14, height: 14, color: Colors.white),
          const SizedBox(
            width: 3,
          ),
          CustomCountDownWidget(
            counter: leftTime,
            customChild: (int hour, int min, int second) {
              return Row(
                children: [
                  NumText(
                    hour < 10 ? '0$hour:' : '$hour:',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.2,
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  NumText(
                    min < 10 ? '0$min:' : '$min:',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.2,
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  NumText(
                    second < 10 ? '0$second' : second.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.2,
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
            countDownCallback: (int left) {
              if (left <= 0) {
                if (!_isLoading) {
                  loadData();
                }
              }
            },
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
