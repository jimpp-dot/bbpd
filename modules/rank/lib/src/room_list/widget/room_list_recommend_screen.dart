import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/k.dart';
import 'package:rank/rank.dart';
import 'package:rank/src/room_list/model/repository/room_list_recommend_respository.dart';

class RoomListRecommendScreen extends StatefulWidget {
  final String? type;
  final String? tabName;

  const RoomListRecommendScreen({this.type, super.key, this.tabName});

  @override
  _RoomListRecommendScreenState createState() =>
      _RoomListRecommendScreenState();
}

class _RoomListRecommendScreenState extends State<RoomListRecommendScreen>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late RoomListRecommendRepository _roomListRecommendRepository;

  String? _errorMessage;

  final ScrollController _scrollController = ScrollController();

  late int _lastReloadTime;
  final _maxReloadDurationInMilliSecs = 15 * 1000;

  @override
  void initState() {
    super.initState();

    _lastReloadTime = nowMilliSecs();

    _roomListRecommendRepository =
        RoomListRecommendRepository('${widget.type}');
  }

  @override
  bool get wantKeepAlive => true;

  Widget _itemBuilder(
      BuildContext context, GamesRoomRecommendListItem item, int index) {
    return RoomListRecommendItem(
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
      return const LoadingFooter(
        hasMore: true,
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
          error: _errorMessage,
          onTap: () {
            _roomListRecommendRepository.refresh(true);
          },
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: K.rank_error_data,
        loadMore: _roomListRecommendRepository.loadMore,
      );
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        child: ErrorData(
          error: K.rank_no_data,
          onTap: () {
            _roomListRecommendRepository.refresh(true);
          },
        ),
      );
    }
    return const LoadingFooter(
      hasMore: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _roomListRecommendRepository.refresh();
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          const SliverToBoxAdapter(),
          LoadingMoreSliverList(
            SliverListConfig<GamesRoomRecommendListItem>(
              itemBuilder: _itemBuilder,
              sourceList: _roomListRecommendRepository,
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
    if (_roomListRecommendRepository.isLoading &&
        _roomListRecommendRepository.isEmpty) return;

    int maxNum = _roomListRecommendRepository.length;

    for (int i = firstIndex; i < lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;
      GamesRoomRecommendListItem item =
          _roomListRecommendRepository.elementAt(i);
      // Log.d("_handleExposureReport exposure=${item.exposure}");
      if (!_roomListRecommendRepository.getExposureIndex(i)) {
        //未曝光过
        _roomListRecommendRepository.setExposureIndex(i, true);

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

  void _handleClickItemReport(GamesRoomRecommendListItem item, int position) {
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
    // Log.d("RoomListRecommendScreen now=$now _lastReloadTime=$_lastReloadTime diff=${now - _lastReloadTime} _maxReloadDurationInMilliSecs=$_maxReloadDurationInMilliSecs force=$force");
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
      scrollToTop(animated: animated);
      _roomListRecommendRepository.refresh();
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

  void _onItemClick(GamesRoomRecommendListItem item, int position) {
    _handleClickItemReport(item, position);
  }
}

/////
class RoomListRecommendItem extends StatelessWidget {
  final GamesRoomRecommendListItem item;
  final RoomFrom? roomFrom;
  final String? refer;
  final VoidCallback? onItemClick;

  const RoomListRecommendItem(
      {super.key,
      required this.item,
      this.roomFrom,
      this.refer,
      this.onItemClick});

  void _onTapItem(GamesRoomRecommendListItem room, BuildContext context) {
    int rid = room.rid;
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, rid,
        from: roomFrom, refer: refer);

    onItemClick?.call();
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
            path: item.icon,
            size: 72,
            shape: BoxShape.circle,
          ),
        ],
      ),
    );
  }

  Widget _buildAvatars() {
    List<Widget> widgets = [];

    // 根据剩余空间展示麦上头像个数
    double maxLength = Util.width - 40 - 16 - 73 - 66 - 12 - 24;
    double totalWidth = 0;
    List<String> showIcons = [];
    for (int index = 0; index < item.micIcons.length; index++) {
      int addWidth = (index == 0 ? 21 : 16);
      if (totalWidth + addWidth > maxLength) {
        break;
      }

      totalWidth += addWidth;
      showIcons.add(item.micIcons[index]);
    }

    for (int index = showIcons.length - 1; index >= 0; index--) {
      widgets.add(
        PositionedDirectional(
          start: 16.0 * index,
          child: _buildAvatar(showIcons[index], size: 21.0),
        ),
      );
    }
    return SizedBox(
      width: totalWidth,
      height: 21,
      child: Stack(
        children: widgets,
      ),
    );
  }

  Widget _buildAvatar(String url, {double size = 21.0}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.5)),
        border: Border.all(color: R.color.mainBgColor, width: 1.5),
      ),
      child: CommonAvatar(
        path: url,
        suffix: '!head100',
        size: 18,
        shape: BoxShape.circle,
        resizeCacheWidth: true,
      ),
    );
  }

  ///1.优先显示好友在线
  ///2.优先显示麦上用户
  ///3.优先显示描述
  Widget _buildSubInfo() {
    if (item.rcmdDesc.uid > 0) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 100.0),
              padding: const EdgeInsetsDirectional.only(
                start: 6.0,
                end: 6.0,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xffAF6BFF), Color(0xff5CB0FF)],
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(width: 1, color: const Color(0xffFFFFFF)),
              ),
              child: Text(
                item.rcmdDesc.desc,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 9.0,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: 7.0,
            ),
            Container(
              width: 17.0,
              height: 17.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.5)),
                border: Border.all(color: R.color.mainBgColor, width: 1.0),
              ),
              child: CommonAvatar(
                path: item.rcmdDesc.icon,
                suffix: '!head100',
                size: 15.0,
                shape: BoxShape.circle,
                resizeCacheWidth: true,
              ),
            ),
            Container(
              width: 3.0,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: Util.width - 184 - 76 - 24,
              ),
              child: Text(
                item.rcmdDesc.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: R.color.secondTextColor,
                  height: 1.0,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (item.micIcons.isNotEmpty) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAvatars(),
          ],
        ),
      );
    } else {
      String prefix = '';
      if (item.prefix.isNotEmpty) {
        prefix = '[${item.prefix}]';
      }
      return Padding(
        padding: const EdgeInsetsDirectional.only(top: 7),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: Util.width - 40 - 16 - 73 - 12 - 24 - 66,
          ),
          child: Text(
            '$prefix${item.userName}',
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
  }

  Widget _buildInfo(BuildContext context) {
    String roomTagIcon = item.typeName.icon;
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
            item.name,
            style: TextStyle(
              fontSize: 16,
              color: R.color.mainTextColor,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildSubInfo(),
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
