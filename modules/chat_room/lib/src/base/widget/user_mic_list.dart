import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/user_list_cycle.dart';
import 'package:flutter/material.dart';
import '../../cplove/love/render_cp_love_process.dart';
import '../../roomNavUtil.dart';

/// 麦位
class UserMicList extends StatefulWidget {
  final ChatRoomData room;
  final UserIconStyle iconStyle;

  const UserMicList({
    Key? key,
    required this.room,
    this.iconStyle = UserIconStyle.Normal,
  }) : super(key: key);

  @override
  _UserMicListState createState() => _UserMicListState();
}

class _UserMicListState extends State<UserMicList> {
  bool cycleMode = false;
  int currSingerId = 0;
  int currMusicId = 0;
  final GlobalKey _key = GlobalKey<UserListCycleState>();
  static const String _tag = "_UserMicListState";

  @override
  void initState() {
    super.initState();
    currSingerId = widget.room.musicOrderSinger ?? 0;
    currMusicId = widget.room.musicOrderId ?? 0;
    Log.d(
        tag: _tag,
        "init state,currSingerId:$currSingerId,currMusicId:$currMusicId");
    cycleMode = widget.room.isBusinessMusic && currSingerId > 0;
    widget.room.addListener(
        RoomConstant.Event_Juke_Music_Change, _onReceiveSingerChange);
  }

  ///点唱厅演唱歌手状态变化
  _onReceiveSingerChange(String type, dynamic data) {
    if (data is! Map) return;
    String state = Util.parseStr(data["state"]) ?? "";
    Log.d(tag: _tag, "_onReceiveSingerChange:$data ,currMode:$cycleMode");
    if (state == "stop") {
      currSingerId = 0;
      currMusicId = 0;
      widget.room.musicOrderSinger = currSingerId;
      widget.room.musicOrderId = currMusicId;
      if (cycleMode == true) {
        cycleMode = false;
        refresh();
      }
    } else if (state == "start") {
      currSingerId = Util.parseInt(data["singer"] ?? 0);
      currMusicId = Util.parseInt(data["id"] ?? 0);
      widget.room.musicOrderSinger = currSingerId;
      widget.room.musicOrderId = currMusicId;
      if (cycleMode == false) {
        cycleMode = true;
        refresh();
      }
      if (_key.currentState != null &&
          _key.currentState is UserListCycleState) {
        (_key.currentState as UserListCycleState)
            .refreshSinger(currSingerId, currMusicId);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];
    if (cycleMode) {
      res.add(const SizedBox(height: 20)); //点唱厅，演唱过程中没有大头麦
    } else {
      res.add(
        Stack(
          children: [
            RoomCreatorWidget(
              room: widget.room,
              bigHeadKey: widget.room.bigHeadKey,
              onOrderWeekTap: _onOrderWeekTap,
            ),
            // if (widget.room.showVipSeat)
            //   PositionedDirectional(
            //     end: 15,
            //     top: 0,
            //     bottom: 0,
            //     child: SpecialSeatWidget(widget.room),
            //   ),
          ],
        ),
      );
    }
    if (widget.room.config?.types == RoomTypes.CpLove) {
      res.add(RenderCpLoveProcess(room: widget.room));
    }
    res.add(_renderUserList());
    return Column(children: res);
  }

  Widget _renderUserList() {
    return cycleMode
        ? UserListCycle(
            key: _key,
            room: widget.room,
            singerId: currSingerId,
            musicId: currMusicId,
            iconStyle: UserIconStyle.Small)
        : UserListNormal(room: widget.room);
  }

  _onOrderWeekTap() {
    RoomNavUtil.openRoomAdminScreen(context,
        rid: widget.room.rid,
        purview: widget.room.purview,
        types: widget.room.config?.types,
        fullScreenDialog: true,
        uid: widget.room.createor?.uid ?? 0);
  }

  @override
  void dispose() {
    super.dispose();
    widget.room.removeListener(
        RoomConstant.Event_Juke_Music_Change, _onReceiveSingerChange);
  }
}
