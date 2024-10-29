import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/widget/custom_count_down_widget.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/rankingList/model/ranking_list_api.dart';
import 'package:rank/src/rankingList/model/ranking_list_bean.dart';
import 'package:rank/src/rankingList/model/ranking_theme.dart';
import 'package:chat_room/chat_room.dart';

import 'ranking_usericon_live_widget.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;

class RankingListTabPage extends StatefulWidget {
  const RankingListTabPage({
    super.key,
    this.type,
    this.name,
    this.refreshCallback,
    this.rid,
    this.charmType,
  });

  final String? name;
  final String? type;
  final int? rid;
  final String? charmType;
  final Function()? refreshCallback;

  @override
  RankingListTabPageState createState() => RankingListTabPageState();
}

class RankingListTabPageState extends State<RankingListTabPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late RankingListApi _repository;

  RankingTabListResponse? get _tabListResponse => _repository.rankingRes;

  String? get _errorMsg => _tabListResponse?.msg;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _repository = RankingListApi(
        widget.rid ?? 0, widget.type ?? '', widget.charmType ?? '', () {
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
      required String page,
      bool onlyEnterRoom = false}) async {
    Tracker.instance.track(TrackEvent.click_list_tx, properties: {
      'rid': roomId,
      'target_uid': uid,
      'position': position,
      'page': page
    });

    bool inRoom = widget.rid != null && widget.rid! > 0;

    if (roomId != null && roomId > 0 && roomId == widget.rid) {
      if (!onlyEnterRoom) {
        _gotoImageScreen(context, uid, inRoom);
      }
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
        return;
      }
    }
    if (!onlyEnterRoom) {
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
                    if (_hasListData)
                      Positioned.fill(
                        top: 218,
                        child:
                            ColoredBox(color: Colors.white, child: Container()),
                      ),
                    Positioned.fill(child: _buildRankingList()),
                    if (_tabListResponse?.listLength != null &&
                        _tabListResponse?.self != null)
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
      _tabListResponse?.listLength != null && _tabListResponse!.listLength > 0;

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
    List<RankingTabItem> itemData = _tabListResponse!.dataAtIndex(index);
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
      if (_tabListResponse?.overLoad != null) return Container();

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

  Widget _buildRankingTopThree(List<RankingTabItem> itemData) {
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
            child:
                _buildRankingItem(_tabListResponse!.self!, Colors.transparent),
          ),
        ));
  }

  double get selfItemHeight => 76 + MediaQuery.of(context).padding.bottom;

  Widget _buildRankingItem(RankingTabItem item, [Color color = Colors.white]) {
    var hasRoom = _hasRoom(item);
    return Container(
      padding: EdgeInsetsDirectional.only(top: item.rank == 4 ? 6 : 0, end: 16),
      color: color,
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
                    style: TextStyle(
                      color: RankingTheme.mainTextColor,
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
                      color: RankingTheme.thirdTextColor,
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
                      color: R.color.thirdTextColor,
                      fontSize: 13,
                      fontFamily: Util.fontFamily),
                  children: [
                    TextSpan(
                        text: item.diffBeforeValue,
                        style: TextStyle(
                            fontSize: 13,
                            color: RankingTheme.thirdBrightColor,
                            fontFamily: Util.fontFamily)),
                  ]),
            ),
        ],
      ),
    );
  }

  Widget _buildRankingOverlord(RankingTabItem overLoad) {
    // List<Color> borderColor = RankingTheme.roomRankingOverLordBorderColor;
    List<Color> borderColor = [Color(0xFF543A64), Color(0xFF604774)];
    final imagePath = R.imagePath(Assets.ranking_overlord_decro_png,
        package: ComponentManager.MANAGER_RANK);

    return GestureDetector(
      onTap: () async {
        ResTopRoomJump resTopRoomJump =
            await BaseRequestManager.checkRoomCanActivity(overLoad.rid);
        if (mounted && resTopRoomJump.success) {
          if (resTopRoomJump.data.inRoom) {
            String page = 'overlord';
            _gotoRoomScreen(
                context: context,
                roomId: resTopRoomJump.data.jumpId,
                uid: overLoad.uid,
                page: page,
                onlyEnterRoom: true);
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 117,
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              margin: const EdgeInsetsDirectional.only(
                  top: 16, start: 16, end: 16, bottom: 5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: borderColor,
                    begin: const FractionalOffset(0.5, 0),
                    end: const FractionalOffset(0.5, 1.0),
                    stops: const [0.0, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(16)),
              ),
              child: GradientBorder(
                borderGradient: LinearGradient(colors: borderColor),
                borderWidth: 1,
                borderRadius: 12,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Container(
                          width: 192,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.only(
                          top: 12, start: 14, bottom: 16, end: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  overLoad.overLordTitle,
                                  style: const TextStyle(
                                      color: Color(0xFFEA62FF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(0.5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white.withOpacity(0.3),
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular((18.5)), // 圆角度
                                    ),
                                    child: CommonAvatar(
                                      path: overLoad.userIcon,
                                      size: 36,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            overLoad.roomName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.white,
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
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.4),
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
                                        color: Color(0xffEA62FF),
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
                  ],
                ),
              ),
            ),
          ),
          countDownWidget(overLoad.leftTime),
        ],
      ),
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
