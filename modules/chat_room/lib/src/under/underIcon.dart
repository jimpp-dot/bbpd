import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/base/widget/user_icon_tap_handler.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'model/underData.dart';

class UnderIconTapHandler extends UserIconTapHandler {
  @override
  onIconTap() {
    Log.d(
        'DEBUG: In under game, clicked user icon with room data: $room, position data: $position');

    if (_isGameStarted()) {
      //游戏过程中，分词、准备、描述、投票阶段

      if (position!.uid > 0 || position!.underData!.gameUnderOrigin > 0) {
        //点击麦上用户

        if (room!.config?.underData!.gameUnderState == GameUnderState.Vote &&
            room!.isMic &&
            room!.positionForCurrentUser?.underData!.gameUnderEnableToVote ==
                true) {
          //投票阶段在麦上的有投票权的用户点击可投票的用户进行投票
          Log.d('DEBUG: Vote the position: $position');
          super.handleIconTap(position!, 'underVote');
        } else if (position!.uid <= 0 &&
            position!.underData!.gameUnderOrigin == Session.uid) {
          //离线用户点击自己头像
          super.onIconTap();
        } else if (room?.config?.underData?.isStrict == false) {
          //非严格模式，显示操作菜单
          super.onIconTap();
        } else {
          //点击有用户的麦位，显示用户资料
          RoomNavUtil.goToImageScreenDialog(context!, position, room!);
        }
      } else {
        //点击空麦位
        if (room!.isMic) {
          Fluttertoast.showToast(
              msg: K.room_in_mic_self, gravity: ToastGravity.CENTER);
        } else {
          Fluttertoast.showToast(
              msg: K.room_cant_join_mic_in_playing,
              gravity: ToastGravity.CENTER);
        }
      }
    } else {
      super.onIconTap();
    }
  }

  bool _isRoomAdmin() {
    return room!.purview == Purview.Createor ||
        room!.purview == Purview.Admin ||
        room!.purview == Purview.SuperAdmin;
  }

  bool _isGameAdmin() {
    bool? isAdmin = room?.positions.any((roomPosition) {
      return (roomPosition.uid == Session.uid ||
              roomPosition.underData?.gameUnderOrigin == Session.uid) &&
          roomPosition.underData!.isAdmin;
    });

    return isAdmin == true;
  }

  bool _isGameStarted() {
    return room!.config?.underData?.gameUnderState != GameUnderState.Wait &&
        room!.config?.underData?.gameUnderState != GameUnderState.End;
  }

  addMicManageSheet(List<SheetItem> res) {
    if (room?.config?.underData?.isStrict == true) return res;

    if (_isGameAdmin() && !_isRoomAdmin()) {
      if (position!.forbidden) {
        res.add(SheetItem(K.room_open_mic, "mic-unforbidden"));
      } else {
        res.add(SheetItem(K.room_close_mic, "mic-forbidden"));
      }
    }

    return res;
  }

  addSetManagerSheet(List<SheetItem> res) {
    Log.d(
        'DEBUG: _isGameAdmin: ${_isGameAdmin()}, _isRoomAdmin: ${_isRoomAdmin()}, this.isAdmin:${position!.underData?.isAdmin}');
    if (!room!.config!.underData!.isStrict &&
        (_isGameAdmin() || _isRoomAdmin()) &&
        !position!.underData!.isAdmin) {
      res.add(SheetItem(K.room_setup_game_admin, 'set-game-admin'));
    }
    return res;
  }

  @override
  List<SheetItem> buildSelfSheet(bool isDefend, bool isPrivate) {
    List<SheetItem> res = [];
    addSetManagerSheet(res);

    if (!_isGameStarted())
      res.addAll(super.buildSelfSheet(isDefend, isPrivate));
    return res;
  }

  @override
  List<SheetItem> buildInMicSheet(
      Purview? purview, bool isPrivate, bool enabledPackageClear) {
    List<SheetItem> res = [];
    addSetManagerSheet(res);
    addMicManageSheet(res);

    if (purview == Purview.Normal && res.isNotEmpty) {
      res.add(SheetItem(K.room_look_info, "profile"));

      res.add(SheetItem(K.room_tab_item_package, "gift"));
      res.add(SheetItem(K.follow, "follow"));
      if (!(purview == Purview.Createor && !isPrivate)) {
        //非个人房且是房主,不能邀约
        res.add(SheetItem(K.room_invite, "order"));
      }
    } else {
      res.addAll(
          super.buildInMicSheet(purview, isPrivate, enabledPackageClear));
    }
    return res;
  }
}
