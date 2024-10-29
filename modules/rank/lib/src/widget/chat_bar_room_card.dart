/*
 *
 *  Created by yao.qi on 2022/6/14 下午5:39
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/6/14 下午5:39
 *
 */
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';

import 'room_item_widget_avatars.dart';

enum RoomCardType {
  Recommend, // 首页推荐
  FriendsPlaying, // 好友在玩
  RecentlyJoined // 最近加入
}

class ChatBarRoomCard extends StatefulWidget {
  final RoomListItem? item;
  final RoomCardType? roomCardType;
  final RoomFrom? roomFrom;
  final String? refer;
  final VoidCallback? onItemClick;

  const ChatBarRoomCard(
      {super.key,
      this.item,
      this.roomCardType,
      this.roomFrom,
      this.refer,
      this.onItemClick});

  @override
  State<ChatBarRoomCard> createState() => _ChatBarRoomCardState();
}

class _ChatBarRoomCardState extends State<ChatBarRoomCard> {
  late double _width;
  late double _height;
  List<String> micIcons = [];

  @override
  void initState() {
    super.initState();
    _width = (Util.width - 16.0 * 2 - 9.0) / 2;
    _height = 12.0 + 64.0 + 8 + 18 + 21 + 12 + 20 + 12;
    // micIcons = widget.item?.micIcons ?? [];
    // if (micIcons == null || micIcons.isEmpty) {
    //   _height -= 32;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapItem,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: const Color(0xFF343135),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            _getBoxShadow(),
          ],
        ),
        // padding: EdgeInsetsDirectional.only(start: 12, end: 12, top: 12),
        child: Stack(
          children: [
            PositionedDirectional(
              top: 12,
              bottom: 0,
              start: 12,
              end: 12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonAvatar(
                          path: widget.item?.icon,
                          size: 64,
                          shape: BoxShape.circle),
                      const Spacer(),
                      // Container(
                      //   padding: EdgeInsets.all(4),
                      //   decoration: BoxDecoration(color: R.color.unionRankText2.withOpacity(0.1), borderRadius: BorderRadius.all(Radius.circular(9))),
                      //   child: Center(
                      //     child: Text(
                      //       '🔥 ${Utility.getRoundOnline(widget.item.onlineNum, widget.item.real, widget.item.types).toString()}',
                      //       style: TextStyle(color: R.color.unionRankText2, fontSize: 12, fontWeight: FontWeight.w500),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      RepaintBoundary(
                        child: R.img(Assets.ic_room_live_webp,
                            package: ComponentManager.MANAGER_RANK,
                            width: 10,
                            height: 10,
                            color: Colors.white.withOpacity(0.4)),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                          child: Text(
                        '${_getTypeName()} ‧ ${K.rank_in_room_num([
                              '${widget.item?.onlineNum ?? 0}'
                            ])}',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.4),
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Text(
                    widget.item?.name ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (micIcons.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    RoomItemWidgetAvatars(
                        micIcons: widget.item?.micIcons ?? [], maxCount: 6),
                  ]
                ],
              ),
            ),
            // PositionedDirectional(
            //   top: 8,
            //   end: 8,
            //   child: Text(
            //     widget.chatBarListItem != null ? widget.chatBarListItem?.status : '',
            //     style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 11),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  String _getTypeName() {
    return widget.item?.typeName.show ?? '';
  }

  BoxShadow _getBoxShadow() {
    return BoxShadow(
      blurRadius: 20.0,
      spreadRadius: 6.0,
      offset: const Offset(0.0, 0.0),
      color: Colors.black.withOpacity(0.05),
    );
  }

  void _onTapItem() async {
    int rid = widget.item?.rid ?? 0;
    int uid = widget.item?.uid ?? 0;
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    if (widget.roomCardType == RoomCardType.RecentlyJoined) {
      if (Session.uid == uid) {
        roomManager.openInitOperateDisplay(context, refer: 'recently_joined');
      } else {
        roomManager.openChatRoomScreenShow(context, rid,
            refer: 'recently_joined');
      }
    } else {
      roomManager.openChatRoomScreenShow(context, rid,
          from: widget.roomFrom, refer: widget.refer);
    }
    if (widget.onItemClick != null) {
      widget.onItemClick!();
    }
  }
}
