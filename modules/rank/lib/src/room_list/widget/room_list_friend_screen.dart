import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/k.dart';
import 'package:rank/rank.dart';
import 'package:rank/src/room_list/model/repository/room_list_friend_respository.dart';

class RoomListFriendScreen extends StatefulWidget {
  final String? type;
  final String? tabName;
  final Color? tipTextColor;

  const RoomListFriendScreen(
      {this.type, super.key, this.tabName, this.tipTextColor});

  @override
  _RoomListPageState createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListFriendScreen>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late RoomListFriendRepository _roomListFriendRepository;

  String? _errorMessage;

  final ScrollController _scrollController = ScrollController();

  late int _lastReloadTime;
  final _maxReloadDurationInMilliSecs = 15 * 1000;

  @override
  void initState() {
    super.initState();

    _lastReloadTime = nowMilliSecs();

    _roomListFriendRepository = RoomListFriendRepository();
  }

  @override
  bool get wantKeepAlive => true;

  Widget _itemBuilder(
      BuildContext context, GamesRoomFriendListItem item, int index) {
    return RoomListFriendItem(
      item: item,
      roomFrom: RoomFrom('roomList-${widget.tabName}'),
      refer: 'roomList-${widget.tabName}',
      onItemClick: () {
        _onItemClick(item, index);
      },
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (Constant.isDevMode)
      Log.d('_indicatorBuilder status=${status.toString()}');
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(
        hasMore: true,
        textColor: widget.tipTextColor,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return SizedBox(
        height: 50.0,
        width: Util.width,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
          fontColor: widget.tipTextColor,
          error: _errorMessage,
          onTap: () {
            _roomListFriendRepository.refresh(true);
          },
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: K.rank_error_data,
        loadMore: _roomListFriendRepository.loadMore,
        textColor: widget.tipTextColor,
      );
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ErrorData(
              fontColor: widget.tipTextColor,
              error: K.rank_recommend_friend_no_room,
              onTap: () {
                _roomListFriendRepository.refresh();
              },
              bottom: 36.0,
            ),
            InkWell(
              onTap: () {
                IMomentManager momentManager = ComponentManager.instance
                    .getManager(ComponentManager.MANAGER_MOMENT);
                momentManager.openMomentFollowRecommendScreen(
                  context,
                  isNewUser: false,
                  refer: RoomFrom.room_tab_friend.name,
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: 150.0,
                height: 44.0,
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: BorderRadius.circular(
                    22.0,
                  ),
                ),
                child: Text(
                  K.rank_recommend_friend,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
    return LoadingFooter(
      hasMore: true,
      textColor: widget.tipTextColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _roomListFriendRepository.refresh();
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          const SliverToBoxAdapter(),
          LoadingMoreSliverList(
            SliverListConfig<GamesRoomFriendListItem>(
              itemBuilder: _itemBuilder,
              sourceList: _roomListFriendRepository,
              indicatorBuilder: _indicatorBuilder,
              extendedListDelegate:
                  ExtendedListDelegate(viewportBuilder: _handleExposureReport),
              //isLastOne: false
            ),
          ),
        ],
      ),
    );
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
//    Log.d('livelist-$type._handleExposureReport first: $firstIndex, last: $lastIndex');
    if (_roomListFriendRepository.isLoading &&
        _roomListFriendRepository.isEmpty) return;

    int maxNum = _roomListFriendRepository.length;

    for (int i = firstIndex; i < lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;
      GamesRoomFriendListItem item = _roomListFriendRepository.elementAt(i);
      // Log.d("_handleExposureReport exposure=${item.exposure}");
      if (!_roomListFriendRepository.getExposureIndex(i)) {
        //未曝光过
        _roomListFriendRepository.setExposureIndex(i, true);

        // 首页列表项曝光
        Tracker.instance.track(TrackEvent.flow_exposure, properties: {
          'tab': widget.tabName ?? '',
          'rid': item.rid,
          'position': i,
          'type_label': item.typeName.label,
        });
      }
    }
  }

  void _handleClickItemReport(GamesRoomFriendListItem item, int position) {
    Tracker.instance.track(TrackEvent.flow_click, properties: {
      'tab': widget.tabName ?? '',
      'rid': item.rid,
      'position': position,
      'type_label': item.typeName.label,
    });
  }

  @override
  void reload({bool force = true, animated = true}) {
    int now = nowMilliSecs();
    // Log.d("RoomListFriendScreen now=$now _lastReloadTime=$_lastReloadTime diff=${now - _lastReloadTime} _maxReloadDurationInMilliSecs=$_maxReloadDurationInMilliSecs force=$force");
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
      scrollToTop(animated: animated);
      _roomListFriendRepository.refresh();
    }
  }

  @override
  void scrollToTop({bool animated = true}) {
    if (_scrollController.hasClients) {
      if (animated) {
        _scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      } else {
        _scrollController.jumpTo(0.0);
      }
    }
  }

  void _onItemClick(GamesRoomFriendListItem item, int position) {
    _handleClickItemReport(item, position);
  }
}

/////
class RoomListFriendItem extends StatelessWidget {
  final GamesRoomFriendListItem item;
  final RoomFrom? roomFrom;
  final String? refer;
  final VoidCallback? onItemClick;

  const RoomListFriendItem(
      {super.key,
      required this.item,
      this.roomFrom,
      this.refer,
      this.onItemClick});

  void _onTapItem(GamesRoomFriendListItem room, BuildContext context) {
    int rid = room.rid;
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, rid,
        from: roomFrom, refer: refer);

    if (onItemClick != null) {
      onItemClick!();
    }
  }

  Widget _buildRoomAvatar() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 15.5, end: 12, top: 13.5),
      width: 73,
      height: 73,
      decoration: BoxDecoration(
        border: Border.all(color: R.color.secondBgColor, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(36.5)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CommonAvatar(
            path: item.userIcon,
            size: 72,
            shape: BoxShape.circle,
          ),
          if (item.userDesc.isNotEmpty)
            PositionedDirectional(
              bottom: -2.0,
              child: Container(
                alignment: Alignment.center,
                width: 73.0,
                height: 14.0,
                // color: Colors.red,
                child: Container(
                  height: 14.0,
                  constraints: const BoxConstraints(
                    maxWidth: 65.0,
                  ),
                  padding: const EdgeInsetsDirectional.only(
                    start: 8.0,
                    end: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: R.color.mainBrandColor,
                    borderRadius: BorderRadius.circular(
                      7.0,
                    ),
                  ),
                  child: Text(
                    item.userDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDescInfo() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 7),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: Util.width - 40 - 16 - 73 - 12 - 24 - 66,
        ),
        child: Text(
          item.roomDesc,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: R.color.secondTextColor,
            height: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    String roomTagIcon = item.roomIcon;
    if (roomTagIcon.isNotEmpty) {
      if (!roomTagIcon.startsWith(RegExp(r'http(s?):\/\/'))) {
        roomTagIcon = System.imageDomain + roomTagIcon;
      }
    }
    // Log.d("_buildInfo roomTagIcon=$roomTagIcon item.typeName.color=${item.typeName.color}");
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 19,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (roomTagIcon.isNotEmpty)
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 1),
                child: CachedNetworkImage(
                  imageUrl: roomTagIcon,
                  width: 14,
                  height: 14,
                ),
              ),
            if (roomTagIcon.isNotEmpty)
              const SizedBox(
                width: 2,
              ),
            Text(
              item.typeName.show,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Util.parseColor(item.typeName.color),
                height: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: Util.width - 40 - 16 - 73 - 66 - 12 - 24,
          ),
          child: Text(
            item.userName,
            style: TextStyle(
              fontSize: 16,
              color: R.color.mainTextColor,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildDescInfo(),
      ],
    );
  }

  Widget _buildHot() {
    return SizedBox(
      width: 66,
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 35,
          ),
          R.img(BaseAssets.ic_people_in_room_svg,
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_BASE_CORE,
              color: R.color.mainTextColor),
          const SizedBox(
            height: 4,
          ),
          NumText(
            '${item.onlineNum}',
            style: TextStyle(
              color: R.color.mainTextColor.withOpacity(0.2),
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double sideMargin = 20.0; // 0xFF2E2E30
    Color bgColor = R.color.secondBgColor;

    return GestureDetector(
      onTap: () {
        _onTapItem(item, context);
      },
      child: Container(
        height: 100,
        width: Util.width - 40,
        margin: EdgeInsetsDirectional.only(
            top: 5, bottom: 5, start: sideMargin, end: sideMargin),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRoomAvatar(),
            Expanded(
              child: _buildInfo(context),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 10),
              width: 0.5,
              height: 80,
              color: R.color.mainTextColor.withOpacity(0.1),
            ),
            _buildHot(),
          ],
        ),
      ),
    );
  }
}
