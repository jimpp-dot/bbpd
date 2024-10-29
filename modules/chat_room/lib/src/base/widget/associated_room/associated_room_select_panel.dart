import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:flutter/material.dart';

/// 选择关联房间面板
class AssociatedRoomSelectPanel extends StatefulWidget {
  final List<RoomChildrenRoomListItem> list;

  const AssociatedRoomSelectPanel({super.key, required this.list});

  static Future<int?> show(
      BuildContext context, List<RoomChildrenRoomListItem> list) async {
    return displayModalBottomSheet(
      context: context,
      builder: (_) => AssociatedRoomSelectPanel(list: list),
    );
  }

  @override
  State<AssociatedRoomSelectPanel> createState() =>
      _AssociatedRoomSelectPanelState();
}

class _AssociatedRoomSelectPanelState extends State<AssociatedRoomSelectPanel> {
  /// 当前选中推送的id
  int _selectedId = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: 393 * Util.width / 375,
      padding: EdgeInsetsDirectional.only(
          start: 16, top: 20, end: 16, bottom: Util.iphoneXBottom + 26),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(RoomAssets
              .chat_room$associated_ic_associated_room_select_panel_bg_webp),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Text(
            K.associated_room_push_room_title,
            style: const TextStyle(
                color: Color(0xFFFCE78D),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Expanded(child: _buildList()),
          const SizedBox(height: 10),
          _buildSendBtn(),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemBuilder: (_, index) => _buildItem(widget.list[index]),
      itemCount: widget.list.length,
      itemExtent: 80,
    );
  }

  Widget _buildItem(RoomChildrenRoomListItem itemData) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (_selectedId == itemData.id) {
          // 之前是选中状态,需要取消选中
          _selectedId = 0;
        } else {
          _selectedId = itemData.id;
        }
        refresh();
      },
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              child: R.img(Util.squareResize(itemData.icon, 100),
                  width: 44, height: 44),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemData.name,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    itemData.desc,
                    style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            R.img(
              _selectedId != itemData.id
                  ? RoomAssets
                      .chat_room$associated_ic_associated_room_checkbox_normal_webp
                  : RoomAssets
                      .chat_room$associated_ic_associated_room_checkbox_selected_webp,
              width: 22,
              height: 22,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSendBtn() {
    bool enable = _selectedId > 0;
    return GestureDetector(
      onTap: enable ? () => Navigator.of(context).pop(_selectedId) : null,
      child: Container(
        width: 230,
        height: 48,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
            colors: enable
                ? [
                    const Color(0xFFFFC4CF),
                    const Color(0xFFFF6BB3),
                    const Color(0xFF7D2EE6)
                  ]
                : [const Color(0xFF928B9C), const Color(0xFFA8A6AB)],
          ),
        ),
        child: Text(
          K.room_send_message,
          style: TextStyle(
              color: enable ? Colors.white : Colors.white54,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
