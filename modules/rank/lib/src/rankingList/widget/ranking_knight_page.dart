import 'dart:ffi';
import 'package:chat_room/assets.dart';
import 'package:fixnum/fixnum.dart';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/rankingList/model/ranking_knight_api.dart';
import 'package:rank/src/rankingList/model/ranking_theme.dart';
import 'package:chat_room/chat_room.dart';

import 'ranking_usericon_live_widget.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;

class RankingKnightPage extends StatefulWidget {
  const RankingKnightPage({
    super.key,
    this.type,
    this.name,
    this.rid,
  });

  final String? name;
  final String? type;
  final int? rid;

  @override
  RankingKnightPageState createState() => RankingKnightPageState();
}

class RankingKnightPageState extends State<RankingKnightPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late RankingKnightApi _repository;

  ResKnightGroupRankList? get _tabListResponse => _repository.rankingRes;

  String? get _errorMsg => _tabListResponse?.msg;

  @override
  void initState() {
    super.initState();

    _repository = RankingKnightApi(() {
      if (mounted) setState(() {});
    });
    loadData();
  }

  loadData() async {
    await _repository.refresh();
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
      int uid = 0,
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
    if (_tabListResponse == null) return const SizedBox.shrink();

    IRankManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);

    return showRankListByKey(liveKnightKey)
        ? Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    if (_hasListData)
                      Positioned.fill(
                        top: 96 +
                            74 * Util.ratio +
                            14 +
                            manager
                                .getBoundingTextSize(
                                    context,
                                    _tabListResponse!.list[0].name,
                                    const TextStyle(fontSize: 16))
                                .height,
                        child:
                            ColoredBox(color: Colors.white, child: Container()),
                      ),
                    Positioned.fill(child: _buildRankingList()),
                    if (_tabListResponse!.hasMy()) _buildSelfItem(),
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

  bool get _hasListData => _tabListResponse?.list.isNotEmpty ?? false;

  final _listBgColor = Colors.white;

  Widget _buildRankingList() {
    double bottomPadding = 0;
    if (_hasListData) {
      bottomPadding = _tabListResponse!.hasMy()
          ? selfItemHeight
          : MediaQuery.of(context).padding.bottom;
    }

    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: LoadingMoreList(
        ListConfig<KnightGroupRankItem>(
          itemBuilder: _itemBuilder,
          physics: const ClampingScrollPhysics(),
          sourceList: _repository,
          indicatorBuilder: _indicatorBuilder,
        ),
      ),
    );
  }

  List<KnightGroupRankItem> dataAtIndex(
      List<KnightGroupRankItem> list, int index) {
    if (list.isEmpty) return [];
    if (index == 0) {
      if (list.length > 2) {
        return list.sublist(0, 3);
      } else {
        return list;
      }
    } else if (index == 1 || index == 2) {
      return [];
    } else {
      return [list[index]];
    }
  }

  Widget _itemBuilder(
      BuildContext context, KnightGroupRankItem item, int index) {
    List<KnightGroupRankItem> itemData =
        dataAtIndex(_tabListResponse!.list, index);

    if (index == 0) {
      return _buildRankingTopThree(itemData);
    } else if (itemData.length == 1) {
      return Transform(
        child: _buildRankingItem(itemData.first),
        transform: Matrix4.translationValues(0, -12, 0.0),
      );
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

  Widget _buildRankingTopThree(List<KnightGroupRankItem> itemData) {
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

  Column _buildTopThreeItem(KnightGroupRankItem data, int rank) {
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
                          path: data.icon,
                          size: avatarSize,
                          shape: BoxShape.circle,
                          onTap: () {
                            int pos =
                                widget.type == 'hour' ? data.sortIndex : 0;
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
            data.name,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildOverLordCard(cardWidth, rank, data),
      ],
    );
  }

  bool _hasRoom(KnightGroupRankItem data) => data.currentRid > 0;

  Widget _buildOverLordCard(
      double cardWidth, int rank, KnightGroupRankItem data) {
    final imageName = rank == 1
        ? Assets.ranking_top_three_second_webp
        : Assets.ranking_top_three_top_webp;
    final imagePath =
        R.imagePath(imageName, package: ComponentManager.MANAGER_RANK);
    final BorderRadius radius = BorderRadiusDirectional.only(
            topStart: Radius.circular(rank < 3 ? 8 : 0),
            topEnd: Radius.circular(rank == 2 ? 0 : 8))
        .resolve(Directionality.of(context));
    AlignmentGeometry begin = Alignment.topCenter;
    AlignmentGeometry end = Alignment.bottomCenter;
    if (rank == 1) {
      begin = Alignment.topCenter;
      end = Alignment.bottomCenter;
    } else {
      begin = Alignment.topCenter;
      end = Alignment.bottomCenter;
    }

    return Stack(
      children: [
        Container(
          width: cardWidth,
          height: (rank == 1 ? 74 : 62) * Util.ratio,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: rank == 1
                  ? RankingTheme.roomRankingTopCardColor
                  : RankingTheme.roomRankingTopCardColor2,
              begin: begin,
              end: end,
            ),
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                spreadRadius: 0.0,
                offset: const Offset(0.0, 2.0),
                color: rank == 1
                    ? RankingTheme.roomRankingTopCardColor.first
                    : RankingTheme.roomRankingTopCardColor2.first,
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
              if (showRankScoreByKey(liveKnightKey)) ...[
                Flexible(
                  child: Text(
                    '${K.rank_knight_num}: ${_valueString(value: data.sortScore)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
              ],
              Flexible(
                child: Text(
                  _valueString(value: data.memberNum) +
                      K.rank_knight_person_num,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Positioned.fill(
        //   child: ClipRRect(
        //     borderRadius: radius,
        //     child: Align(
        //       alignment: AlignmentDirectional.topStart,
        //       child: Container(
        //         width: double.infinity,
        //         height: rank == 1 ? 15 : 9,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: AssetImage(imagePath),
        //             fit: BoxFit.fill,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildSelfItem() {
    return Transform(
      transform: Matrix4.translationValues(0, 0, 0.0),
      child: Align(
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
                  _buildRankingItem(_tabListResponse!.my, Colors.transparent),
            ),
          )),
    );
  }

  double get selfItemHeight => 76 + MediaQuery.of(context).padding.bottom;

  Widget _buildRankingItem(KnightGroupRankItem item,
      [Color color = Colors.white]) {
    var hasRoom = _hasRoom(item);
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(16.0),
          topEnd: Radius.circular(16.0),
        ),
      ),
      padding:
          EdgeInsetsDirectional.only(top: item.sortIndex == 4 ? 6 : 0, end: 16),
      child: Row(
        children: [
          const SizedBox(height: 72),
          Container(
            width: 38,
            alignment: AlignmentDirectional.center,
            child: showRankByKey(liveKnightKey)
                ? Text(
                    item.sortIndex > 0
                        ? (item.sortIndex > 99 ? '99+' : '${item.sortIndex}')
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
                path: item.icon,
                size: 52,
                shape: BoxShape.circle,
                onTap: () {
                  int pos = widget.type == 'hour' ? item.sortIndex : 0;
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
                    item.name,
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
                    K.rank_knight_person_item_num(
                        [(_valueString(value: item.memberNum))]),
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
          if (showRankScoreByKey(liveKnightKey))
            RichText(
              text: TextSpan(
                  text: '${K.rank_knight_num}: ',
                  style: TextStyle(
                      color: const Color(0xFF999999),
                      fontSize: 13,
                      fontFamily: Util.fontFamily),
                  children: [
                    TextSpan(
                        text: '${_valueString(value: item.sortScore)} ',
                        style: TextStyle(
                            fontSize: 13,
                            color: const Color(0xFFD35AF9),
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

String _valueString({@required dynamic value, int fractionDigits = 1}) {
  if (value == null) return '0';

  if (value is int || value is Int32 || value is Uint32) {
    if (value < 1000) {
      return value.toString();
    } else if (value < 1000 * 1000) {
      return '${(value / 1000).toStringAsFixed(fractionDigits)}K';
    } else if (value < 1000 * 1000 * 1000) {
      return '${(value / 1000000).toStringAsFixed(fractionDigits)}M';
    } else {
      return '${(value / 1000000000).toStringAsFixed(fractionDigits)}B';
    }
  } else if (value is Int64 || value is Uint64) {
    int mod = 0;
    String modStr = '';

    if (value < 1000) {
      return value.toString();
    } else if (value < 1000 * 1000) {
      mod = (value % 1000).toInt();
      modStr =
          (mod / 1000).toStringAsFixed(fractionDigits).toString().substring(1);

      return '${value ~/ 1000}${modStr}K';
    } else if (value < 1000 * 1000 * 1000) {
      mod = (value % 1000000).toInt();
      modStr = (mod / 1000000)
          .toStringAsFixed(fractionDigits)
          .toString()
          .substring(1);

      return '${value ~/ 1000000}${modStr}M';
    } else {
      mod = (value % 1000000000).toInt();
      modStr = (mod / 1000000000)
          .toStringAsFixed(fractionDigits)
          .toString()
          .substring(1);

      return '${value ~/ 1000000000}B';
    }
  }

  return '0';
}
