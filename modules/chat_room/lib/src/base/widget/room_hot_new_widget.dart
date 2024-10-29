import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../chat_room.dart';
import '../../roomNavUtil.dart';
import '../admin/room_tab_item.dart';

class RoomHotNewWidget extends StatefulWidget {
  final ChatRoomData room;
  final bool hiddenIcon;

  const RoomHotNewWidget(this.room, {Key? key, this.hiddenIcon = false}) : super(key: key);

  @override
  _RoomHotNewWidgetState createState() => _RoomHotNewWidgetState();
}

class _RoomHotNewWidgetState extends State<RoomHotNewWidget> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(RoomConstant.Event_Online, _onOnlineChanged);
  }

  @override
  void dispose() {
    eventCenter.removeListener(RoomConstant.Event_Online, _onOnlineChanged);
    super.dispose();
  }

  void _onOnlineChanged(String type, dynamic data) {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoomNavUtil.openRoomAdminScreen(
          context,
          rid: widget.room.rid,
          purview: widget.room.purview,
          types: widget.room.config?.types,
          fullScreenDialog: true,
          uid: widget.room.createor?.uid ?? 0,
          defaultTab: widget.hiddenIcon ? RoomTabItem.online : RoomTabItem.week, //header有火苗的默认进贡献榜 没有的默认进在线表
        );
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: ThemeColors.gradient,
        ),
        height: 24,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(RoomAssets.chat_room$room_hot_svg, width: 12, height: 15),
            const SizedBox(width: 6),
            NumText(
              '${widget.room.roomHot}',
              style: const TextStyle(fontSize: 10.0, color: Colors.white, textBaseline: TextBaseline.ideographic),
            )
          ],
        ),
      ),
    );
  }
}
