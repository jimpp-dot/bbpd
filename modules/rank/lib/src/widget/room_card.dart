import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'room_item_widget_avatars.dart';

class RoomCard extends StatefulWidget {
  final RoomListItem item;
  final RoomFrom? roomFrom;
  final String? refer;
  final VoidCallback? onItemClick;

  const RoomCard(
      {super.key,
      required this.item,
      this.roomFrom,
      this.refer,
      this.onItemClick});

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  late double _width;
  late double _height;

  @override
  void initState() {
    super.initState();
    _width = (Util.width - 16.0 * 2 - 9.0) / 2;
    _height = 12.0 + 64.0 + 8 + 18 + 21 + 12 + 20 + 16;
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
          color: R.color.mainBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          // boxShadow: [
          //   _getBoxShadow(),
          // ],
        ),
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonAvatar(
                    path: widget.item.icon, size: 64, shape: BoxShape.circle),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: R.color.unionRankText2.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(9))),
                  child: Center(
                    child: Text(
                      '🔥 ${widget.item.hot}',
                      style: TextStyle(
                          color: R.color.unionRankText2,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
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
                      color: R.color.mainBrandColor),
                ),
                const SizedBox(width: 4),
                Expanded(
                    child: Text(
                  _getTypeName(),
                  style: TextStyle(
                      fontSize: 12,
                      color: R.color.mainBrandColor,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            ),
            const SizedBox(height: 1),
            Text(
              widget.item.name,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            RoomItemWidgetAvatars(micIcons: widget.item.micIcons, maxCount: 6),
          ],
        ),
      ),
    );
  }

  String _getTypeName() {
    return widget.item.typeName.show;
  }

  void _onTapItem() {
    int rid = widget.item.rid;
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, rid,
        from: widget.roomFrom, refer: widget.refer);

    if (widget.onItemClick != null) {
      widget.onItemClick!();
    }
  }
}
