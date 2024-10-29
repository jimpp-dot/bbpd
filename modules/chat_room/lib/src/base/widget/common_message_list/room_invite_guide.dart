import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';

import '../../../chatRoomData.dart';
import '../../../protobuf/generated/drainage.pb.dart';
import '../../model/roomConstant.dart';

/// 大小房：房间邀请/返回大房引导
class RoomInviteGuide extends StatefulWidget {
  final ChatRoomData room;

  const RoomInviteGuide({Key? key, required this.room}) : super(key: key);

  @override
  State createState() {
    return _RoomInviteGuideState();
  }
}

class _RoomInviteGuideState extends State<RoomInviteGuide> {
  bool expand = true;

  @override
  void initState() {
    super.initState();

    widget.room.addListener(
        RoomConstant.Event_Invite_Guide_Change, _onInviteGuidChange);
  }

  @override
  void dispose() {
    widget.room.removeListener(
        RoomConstant.Event_Invite_Guide_Change, _onInviteGuidChange);
    super.dispose();
  }

  void _onInviteGuidChange(String type, dynamic data) {
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    if (!Util.validList(widget.room.roomInviteGuideData)) {
      return const SizedBox.shrink();
    } else {
      return Container(
        height: 68,
        margin: const EdgeInsetsDirectional.only(top: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20), bottomStart: Radius.circular(20)),
          gradient: const LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Color(0xFFFFF5D8),
              Color(0xFFFFF5D8),
              Color(0xFFA589FF),
              Color(0xFF7C84FF)
            ],
            stops: [0.0, 0.1, 0.5, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
              color: Colors.white.withOpacity(0.3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 10),
            _buildExpand(),
            const SizedBox(width: 10),
            _buildItem(widget.room.roomInviteGuideData[0]),
            if (widget.room.roomInviteGuideData.length > 1 && expand)
              ..._buildExpandItems(),
            const SizedBox(width: 16),
          ],
        ),
      );
    }
  }

  List<Widget> _buildExpandItems() {
    List<Widget> expandItems = [];
    for (RoomInviteGuideData item
        in widget.room.roomInviteGuideData.skip(1).toList()) {
      expandItems.add(
        const SizedBox(width: 12),
      );
      expandItems.add(_buildItem(item));
    }
    return expandItems;
  }

  Widget _buildExpand() {
    if (widget.room.roomInviteGuideData.length <= 1) {
      return const SizedBox.shrink();
    } else {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            expand = !expand;
          });
        },
        child: Container(
          width: 6,
          height: 12,
          margin: const EdgeInsetsDirectional.only(end: 6, top: 10, bottom: 10),
          child: CustomPaint(
            painter: TriangleExpandPainter(
                color: Colors.white, isLeft: expand ? false : true),
          ),
        ),
      );
    }
  }

  Widget _buildBackMasterRoom() {
    return CachedNetworkImage(
      imageUrl: 'static/room/accompany/back_master_room.webp',
      width: 54,
      height: 56,
    );
  }

  Widget _buildItem(RoomInviteGuideData item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        IRoomManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        manager.openChatRoomScreenShow(System.context, item.relateRoom.rid,
            refer: 'invite_room_guide');
      },
      child: item.isMaterRoom
          ? _buildBackMasterRoom()
          : SizedBox(
              width: 48,
              height: 52,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: CommonAvatar(
                      path: item.relateRoom.icon,
                      size: 34,
                      shape: BoxShape.circle,
                    ),
                  ),
                  PositionedDirectional(
                    top: 32,
                    child: Container(
                      width: 48,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        color: Colors.white,
                      ),
                      padding:
                          const EdgeInsetsDirectional.only(start: 1, end: 1),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        item.relateRoom.name,
                        style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF313131),
                            height: 1.1),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  if (item.relateRoom.locked)
                    PositionedDirectional(
                      end: 0,
                      bottom: 17,
                      child: R.img(
                        RoomAssets.chat_room$relate_room_lock_webp,
                        width: 18,
                        height: 20,
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}

class RoomInviteGuideData {
  final RoomDrainageLocking relateRoom;
  final bool isMaterRoom;

  const RoomInviteGuideData({
    required this.relateRoom,
    required this.isMaterRoom,
  });
}
