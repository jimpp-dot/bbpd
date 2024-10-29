import 'dart:async';

import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:flutter/material.dart';

/// 跳转关联房间弹框
class AssociatedRoomDialog extends StatefulWidget {
  final RoomChildrenRoomListItem data;

  const AssociatedRoomDialog({super.key, required this.data});

  static Future<void> show(
      BuildContext context, RoomChildrenRoomListItem data) async {
    showDialog(
      context: context,
      builder: (context) => AssociatedRoomDialog(data: data),
    );
  }

  @override
  State<AssociatedRoomDialog> createState() => _AssociatedRoomDialogState();
}

class _AssociatedRoomDialogState extends State<AssociatedRoomDialog> {
  late final Timer _timer;

  final ValueNotifier<int> _notifier = ValueNotifier(30);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) => _onTick());
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _onTick() {
    _notifier.value--;
    if (_notifier.value < 0) {
      Navigator.of(context).pop();
    }
  }

  @override
  void didUpdateWidget(covariant AssociatedRoomDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data.rid != widget.data.rid) {
      _notifier.value = 30;
      refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 280,
        height: 326,
        padding: const EdgeInsetsDirectional.all(24),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(RoomAssets
                .chat_room$associated_ic_associated_room_dialog_bg_webp),
            fit: BoxFit.fill,
          ),
        ),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Text(
          K.associated_room_dialog_title,
          style: const TextStyle(
              color: Color(0xFFFCE78D),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        _buildAvatar(),
        const SizedBox(height: 12),
        Text(
          K.associated_room_dialog_msg([widget.data.name]),
          style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          widget.data.desc,
          style: const TextStyle(
              color: Colors.white54, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        _buildPositiveBtn(),
        const SizedBox(height: 12),
        _buildNegativeBtn(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFCE78D)),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: R.img(Util.squareResize(widget.data.icon, 150),
            width: 58, height: 58),
      ),
    );
  }

  Widget _buildPositiveBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        IRoomManager? roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager?.openChatRoomScreenShow(context, widget.data.rid,
            mainRid: widget.data.parentRid);
        Tracker.instance.track(
          TrackEvent.click_pop_room,
          properties: {
            'big_room': widget.data.parentRid,
            'small_room': widget.data.rid
          },
        );
      },
      child: Container(
        width: 230,
        height: 48,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(colors: [
            Color(0xFFFFC4CF),
            Color(0xFFFF6BB3),
            Color(0xFF7D2EE6)
          ]),
        ),
        child: Text(
          K.associated_room_dialog_positive_btn,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildNegativeBtn() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: 230,
        height: 48,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: Border.all(color: Colors.white30),
        ),
        child: ValueListenableBuilder<int>(
          valueListenable: _notifier,
          builder: (_, time, child) => Text(
            K.associated_room_dialog_negative_btn([time.padLeft2]),
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
