import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class PlayingLiveItemWidget extends StatefulWidget {
  final RoomItem item;
  final RoomFrom? roomFrom;
  final String? refer;

  const PlayingLiveItemWidget(
      {super.key, required this.item, this.roomFrom, this.refer});

  @override
  _PlayingLiveItemWidgetState createState() => _PlayingLiveItemWidgetState();
}

class _PlayingLiveItemWidgetState extends State<PlayingLiveItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapItem(widget.item),
      child: Container(
        margin:
            const EdgeInsetsDirectional.only(bottom: 10, start: 20, end: 20),
        padding: const EdgeInsetsDirectional.only(
            top: 16, bottom: 16, start: 16, end: 16),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            getHomeBoxShadow(),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                _buildType(),
                const Spacer(),
                _buildHot(),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                _buildRoomAvatar(),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    widget.item.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: R.color.mainTextColor,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildType() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 1),
          child: CachedNetworkImage(
            imageUrl: Util.parseIcon(widget.item.typeName.tagIcon),
            width: 14,
            height: 14,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          widget.item.typeName.show,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Util.parseColor(widget.item.typeName.tagColor),
              height: 1.2),
        ),
      ],
    );
  }

  Widget _buildRoomAvatar() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: R.color.secondBgColor, width: 0.5),
        borderRadius: BorderRadius.circular(36.5),
      ),
      child: CommonAvatar(
        path: widget.item.icon,
        sex: widget.item.sex,
        size: 55,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildHot() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        R.img('ic_hot.svg',
            width: 12, height: 12, package: ComponentManager.MANAGER_BASE_CORE),
        const SizedBox(height: 2),
        NumText(
          '${widget.item.hotNum}',
          style: TextStyle(
            color: R.color.thirdTextColor,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  void _onTapItem(RoomItem room) {
    Tracker.instance.track(TrackEvent.discover_click, properties: {
      'click_room': room.typeName.label,
    });

    int rid = room.rid;
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, rid,
        from: widget.roomFrom, refer: widget.refer);
  }
}
