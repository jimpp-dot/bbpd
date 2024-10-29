import 'package:shared/shared.dart';
import 'package:chat_room/src/biz_plugin/accompany_tacit/tacit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/trueword/widget/true_word_sheet.dart';

///1v1陪伴房 真心话入口
///注意：现在真心话和默契问答都放在这个入口里
class RoomTrueWordWidget extends StatefulWidget {
  final ChatRoomData room;
  final GlobalKey? msgKey;

  const RoomTrueWordWidget({super.key, required this.room, this.msgKey});

  @override
  _RoomTrueWordWidgetState createState() => _RoomTrueWordWidgetState();
}

class _RoomTrueWordWidgetState extends State<RoomTrueWordWidget> {
  double _msgTop = 0;

  int get rid => widget.room.rid;

  int get targetUid {
    RoomPosition? curPosition = widget.room.positionForCurrentUser;
    if (curPosition?.uid == null) return -1;

    RoomPosition? targetPosition = widget.room.positions.firstWhereOrNull(
        (_) => _.uid > 0 && curPosition!.uid > 0 && _.uid != curPosition.uid);

    if (targetPosition?.uid != null) return targetPosition!.uid;
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    if (_msgTop <= 0) return const SizedBox();

    int targetId = targetUid;
    if (targetId <= 0) return const SizedBox();

    return PositionedDirectional(
      end: 16,
      top: _msgTop + 8,
      child: GestureDetector(
        onTap: () {
          _showDialog(targetId);
        },
        child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              R.img('ic_room_true_word.webp',
                  width: 26,
                  height: 26,
                  package: ComponentManager.MANAGER_BASE_ROOM),
              Text(
                K.room_true_word_entrance_desc,
                style: const TextStyle(color: Colors.white, fontSize: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///弹窗提示用户选择真心话还是默契问答
  _showDialog(int targetId) async {
    List<SheetItem> res = [];
    res.add(SheetItem(K.room_true_word, "true_word"));
    res.add(SheetItem(K.room_accompany_tacit, "accompany_tacit"));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.room_game_select, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    if (result.value?.key == "true_word") {
      TrueWordSheet.show(context, rid, targetId);
    } else {
      TacitDialog.show(context, targetId, widget.room);
      Tracker.instance.track(TrackEvent.questions_click_entrance, properties: {
        'questions_click_entrance_room': 1,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      try {
        RenderBox? renderBox =
            widget.msgKey?.currentContext?.findRenderObject() as RenderBox?;
        _msgTop = renderBox?.localToGlobal(Offset.zero).dy ?? 0;
        if (mounted) setState(() {});
      } on Exception {}
    });
  }

  @override
  void didUpdateWidget(RoomTrueWordWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      try {
        RenderBox? renderBox =
            widget.msgKey?.currentContext?.findRenderObject() as RenderBox?;
        _msgTop = renderBox?.localToGlobal(Offset.zero).dy ?? 0;
        if (mounted) setState(() {});
      } on Exception catch (e) {
        Log.d(e);
      }
    });
  }
}
