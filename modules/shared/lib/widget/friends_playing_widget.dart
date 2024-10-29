import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:shared/model/friends_playing.dart';
import 'package:flutter/material.dart';

class FriendsPlayingHeader extends StatefulWidget {
  const FriendsPlayingHeader({super.key});

  @override
  FriendsPlayingHeaderState createState() => FriendsPlayingHeaderState();
}

class FriendsPlayingHeaderState extends State<FriendsPlayingHeader> {
  FriendsPlayingRsp? _firstPageRsp;
  late GlobalKey<PageLoadingListState> _refreshKey;
  late ScrollController _scrollController;
  bool _canPushList = true;

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<PageLoadingListState>();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  _onScroll() {
    if (_scrollController.offset >
            _scrollController.position.maxScrollExtent + 50 &&
        _canPushList &&
        ((_firstPageRsp?.total ?? 0) >= 20)) {
      _canPushList = false;
      IMessageManager messageManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_MESSAGE);
      messageManager
          .openFriendsPlayingPage(context)
          .then((value) => _canPushList = true);
      Tracker.instance
          .track(TrackEvent.index_friends_playing_click, properties: {
        'number': _firstPageRsp?.total ?? 0,
      });
    }
  }

  void refresh() {
    _refreshKey.currentState?.refresh();
  }

  Widget _buildTitle(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        IMessageManager messageManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_MESSAGE);
        messageManager.openFriendsPlayingPage(context);

        Tracker.instance
            .track(TrackEvent.index_friends_playing_click, properties: {
          'number': _firstPageRsp?.total ?? 0,
        });
      },
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          R.img('home/ic_rcmd_friends_playing.webp',
              width: 96,
              height: 24,
              package: ComponentManager.MANAGER_BASE_CORE),
          const Spacer(),
          Text(
            '${_firstPageRsp?.total ?? 0}${K.base_pepole_unit}',
            style: TextStyle(fontSize: 13, color: R.color.thirdTextColor),
          ),
          R.img('icon_next_fq.svg',
              color: R.color.mainTextColor.withOpacity(0.2),
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_BASE_CORE),
          const SizedBox(
            width: 6,
          ),
        ],
      ),
    );
  }

  Widget _buildUsers() {
    return SizedBox(
      height: 106,
      child: PageLoadingList<FriendsPlayingItem>(
        key: _refreshKey,
        scrollDirection: Axis.horizontal,
        loadData: (page) => FriendsPlayingRepo.getFriendsPlayingList(page),
        onFirstPageData: (rsp) {
          if (rsp.success) {
            setState(() {
              _firstPageRsp = rsp as FriendsPlayingRsp;
            });
          }
        },
        itemBuilder: (context, item, index) => FriendsPlayingHeaderItemWidget(
          item: item,
          index: index,
        ),
        indicatorBuilder: (context, status) {
          return const SizedBox();
        },
        scrollController: _scrollController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool hasData = (_firstPageRsp?.data?.isNotEmpty ?? false);
    return Container(
      width: hasData ? null : 0,
      height: hasData ? 168 : 0,
      margin: !hasData
          ? null
          : const EdgeInsetsDirectional.only(
              top: 8, bottom: 5, start: 20, end: 20),
      padding: !hasData
          ? null
          : const EdgeInsetsDirectional.only(top: 12, bottom: 14),
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 2,
              color: Color(0x0A000000))
        ],
        image: DecorationImage(
            image: AssetImage(R.imagePath('home/bg_rcmd_friends_playing.webp',
                package: ComponentManager.MANAGER_BASE_CORE)),
            fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          const SizedBox(
            height: 12,
          ),
          _buildUsers(),
        ],
      ),
    );
  }
}

class FriendsPlayingHeaderItemWidget extends StatelessWidget {
  final FriendsPlayingItem item;
  final int index;

  const FriendsPlayingHeaderItemWidget(
      {super.key, required this.item, required this.index});

  Widget _buildIcon() {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CommonAvatar(
            path: item.icon,
            shape: BoxShape.circle,
            size: 60,
          ),
          if ((item.rid ?? 0) > 0)
            R.img('home/bg_friend_in_room.webp',
                width: 60,
                height: 60,
                package: ComponentManager.MANAGER_BASE_CORE),
          if ((item.rid ?? 0) > 0)
            R.img('home/ic_friends_playing_in_room.webp',
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_BASE_CORE),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String tagStr = K.online;
    if (item.roomTag != null && item.roomTag!.isNotEmpty) {
      tagStr = item.roomTag!;
    } else if (item.mark != null && item.mark!.isNotEmpty) {
      tagStr = item.mark!;
    }
    return GestureDetector(
      onTap: () {
        if ((item.rid ?? 0) > 0) {
          int rid = item.rid!;
          int uid = item.uid ?? 0;
          IRoomManager roomManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(context, rid,
              uid: uid, refer: 'FriendsPlayingHeader');
        } else {
          IChatManager chatManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_CHAT);
          chatManager.openUserChatScreen(
            context,
            type: 'private',
            targetId: item.uid ?? 0,
            title: item.name,
          );
        }
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: index == 0 ? 3 : 0),
        child: SizedBox(
          width: 78,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIcon(),
              const SizedBox(
                height: 2,
              ),
              Container(
                  height: 26,
                  width: 70,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    item.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 14, color: R.color.mainTextColor),
                  )),
              Container(
                alignment: AlignmentDirectional.center,
                height: 16,
                width: 49,
                decoration: ((item.rid ?? 0) > 0)
                    ? ShapeDecoration(
                        shape: const StadiumBorder(),
                        gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors,
                        ))
                    : ShapeDecoration(
                        color: R.color.secondBgColor,
                        shape: const StadiumBorder(),
                      ),
                child: Text(
                  tagStr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 11,
                      color: (item.rid ?? 0) > 0
                          ? Colors.white
                          : R.color.secondTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
