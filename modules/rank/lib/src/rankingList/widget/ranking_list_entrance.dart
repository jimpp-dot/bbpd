import 'dart:convert';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rank/k.dart';
import 'package:rank/src/rankingList/model/ranking_list_bean.dart';
import 'package:rank/src/rankingList/model/ranking_theme.dart';
import 'package:chat_room/chat_room.dart';

/// 排行榜入口
class RankingListEntrance extends StatefulWidget {
  final Function(int index)? onTapEntrance;
  final RoomCharmIndexBean? data;
  final int rid;

  const RankingListEntrance({
    super.key,
    this.onTapEntrance,
    this.data,
    required this.rid,
  });

  @override
  RankingListEntranceState createState() => RankingListEntranceState(data);
}

class RankingListEntranceState extends State<RankingListEntrance>
    with SingleTickerProviderStateMixin {
  RankingListEntranceState(this.entrance);

  RoomCharmIndexBean? entrance;

  final SwiperController _controller = SwiperController();

  int _index = 0;

  List<Widget>? _items = [];
  bool _isExpand = false;
  List<RankingTabItem>? _expandTopList;
  int? _timerKey;

  RoomCharmIndexBean? get data {
    return entrance;
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  _onExpand() {
    Tracker.instance.track(TrackEvent.click_list,
        properties: {'rid': widget.rid, 'click_type': 'fzd'});
    setState(() {
      _isExpand = !_isExpand;
      if (_isExpand) {
        _expandTopList = List.from(data?.topList ?? []);
      } else {
        _expandTopList = null;
      }
    });
  }

  /// 进入个人主页
  void _gotoImageScreen(BuildContext context, int uid) {
    RoomUserProfile.openImageFloatScreenDisplayModalBottomSheet(
        context, uid, ChatRoomData.getInstance(), 0);
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

    if (roomId == widget.rid) {
      _gotoImageScreen(context, uid);
      return;
    }

    IRoomManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    bool? canEnter = await manager.checkToEnterRoom(context, rid: roomId ?? 0);
    if (canEnter == true) {
      // manager.openChatRoomScreenShow(context, roomId, uid: uid);
      eventCenter
          .emit(EventConstant.roomChangeRid, {'rid': roomId, 'uid': uid});
    } else {
      _gotoImageScreen(context, uid);
    }
  }

  loadData([RoomCharmIndexBean? updateEntrance]) {
    if (updateEntrance != null) entrance = updateEntrance;

    if (data?.topList != null && data!.topList.isNotEmpty) {
      _items = null;
      if (_expandTopList != null) {
        _expandTopList = List.from(data!.topList);
      }
      _refresh();
    } else {
      if (data?.gapList == null) return;

      List<Widget> items =
          data!.gapList.map((e) => _buildItem(e.des, e.showIcon)).toList();
      if (_items == null || _items!.length != items.length) {
        _index = 0;
      }
      _items = items;
      _refresh();

      if (_timerKey != null) {
        JsTimer.clearTimeout(_timerKey!);
      }
      _startAnimate();
    }
  }

  _startAnimate() {
    final Duration duration = Duration(seconds: data!.gapList[_index].time);
    _timerKey = JsTimer.setTimeout(() {
      _index += 1;
      if (_index >= _items!.length) {
        _index = _index % _items!.length;
      }
      _controller.next(animation: true);
      _startAnimate();
    }, duration.inMilliseconds);
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) return Container();

    return Container(
      margin: EdgeInsetsDirectional.only(
        start: 16,
        top: MediaQuery.of(context).padding.top + 46,
      ),
      child: _items != null && _items!.isNotEmpty && !_isExpand
          ? buildCurrentRank()
          : buildLastHourRank(),
    );
  }

  Widget buildLastHourRank() {
    return SizedBox(
      width: 148,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 20,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsetsDirectional.only(start: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadiusDirectional.only(
                topStart: const Radius.circular(10),
                topEnd: const Radius.circular(10),
                bottomStart:
                    _isExpand ? Radius.zero : const Radius.circular(10),
                bottomEnd: _isExpand ? Radius.zero : const Radius.circular(10),
              ),
            ),
            child: GestureDetector(
              onTap: _onExpand,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 3),
                  R.img(
                    RoomAssets.ic_dayrank_webp,
                    height: 16,
                    width: 16,
                    fit: BoxFit.contain,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    K.room_last_hour_rank,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                  const SizedBox(width: 1),
                  R.img(
                    _isExpand
                        ? BaseAssets.ic_expand_up_svg
                        : BaseAssets.ic_expand_down_svg,
                    height: 16,
                    width: 16,
                    color: Colors.white,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  ),
                ],
              ),
            ),
          ),
          if (_isExpand) buildLastTopRank(),
        ],
      ),
    );
  }

  Widget buildLastTopRank() {
    int itemCount = _expandTopList?.length ?? 0;
    double height = itemCount > 6 ? 338.0 : itemCount * 52.0;
    return Container(
      height: height,
      width: 148,
      decoration: BoxDecoration(
        color: RankingTheme.mainTextColor.withOpacity(0.9),
        borderRadius: const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(9), bottomEnd: Radius.circular(9)),
      ),
      child: ListView.builder(
        itemCount: itemCount,
        padding: const EdgeInsets.only(bottom: 4),
        // physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          bool isLast = (index + 1) == itemCount;
          Widget item = buildLastTopItem(_expandTopList![index]);
          return SizedBox(
            width: double.infinity,
            child: Stack(children: [
              item,
              if (!isLast)
                Positioned.fill(
                  child: Container(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Divider(
                        color: Colors.white.withOpacity(0.1),
                        height: 1,
                      )),
                ),
            ]),
          );
        },
      ),
    );
  }

  Widget buildLastTopItem(RankingTabItem item) {
    return InkWell(
      onTap: () {
        _gotoRoomScreen(
            context: context, roomId: item.currentRid, uid: item.uid, page: '');
      },
      child: Row(
        children: [
          const SizedBox(height: 52, width: 6),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 25,
                height: 15,
                alignment: AlignmentDirectional.center,
                child: item.rank > 3
                    ? Text(
                        item.rank.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.white),
                      )
                    : R.img(RoomAssets.room_last_hour_rankx_png(item.rank),
                        width: 18,
                        height: 14,
                        package: ComponentManager.MANAGER_BASE_ROOM),
              ),
              Container(
                height: 13,
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    item.rankImg ?? Container(),
                    Text(
                      item.rankChangeText,
                      style: item.rankChangeStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 3),
          Container(
            padding: const EdgeInsets.all(1),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CommonAvatar(
              path: item.roomIcon,
              size: 30,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    item.roomName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    item.charmValueText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
    );
  }

  Widget buildCurrentRank() {
    return Container(
      alignment: AlignmentDirectional.topStart,
      height: 20,
      width: 150,
      child: Swiper(
        itemCount: _items?.length ?? 0,
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        onTap: widget.onTapEntrance,
        itemBuilder: (BuildContext context, int index) {
          return _items![_index];
        },
      ),
    );
  }

  Widget _buildItem(String title, bool showIcon) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        height: 20,
        padding: const EdgeInsetsDirectional.only(
            start: 8, bottom: 2, end: 8, top: 2),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          key: ValueKey(jsonEncode(title)),
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showIcon) ...[
              R.img(
                RoomAssets.ic_dayrank_webp,
                height: 16,
                width: 16,
                fit: BoxFit.contain,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
              const SizedBox(
                width: 3,
              ),
            ],
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
