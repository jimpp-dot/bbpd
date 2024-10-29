import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/talent/data/talent_main_view_model.dart';
import 'package:chat_room/src/talent/data/talent_models.dart';
import 'package:chat_room/src/talent/talent_constants.dart';

/// 才艺厅中间表演者控件
class TalentPositionWidget extends StatefulWidget {
  final ChatRoomData room;

  const TalentPositionWidget({super.key, required this.room});

  @override
  _TalentPositionWidgetState createState() => _TalentPositionWidgetState();
}

class _TalentPositionWidgetState extends State<TalentPositionWidget> {
  // 点击关注，按钮会变为“已关注”；并且该按钮3秒后消失
  bool _showFollow = false;

  int? _queryFollowUid;

  Timer? _delayDismissFollowTask;

  @override
  void initState() {
    super.initState();
    RoomPosition pos0 = widget.room.positions[0];
    _updateFollowStatus(pos0.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<TalentMainViewModel, BroadcasterInfoResp?>(
      selector: (ctx, vm) {
        return vm.data;
      },
      builder: (context, data, child) {
        RoomPosition? firstPosition;
        try {
          firstPosition = widget.room.positions.first;
        } catch (e) {
          Log.d(e);
        }

        return SizedBox(
          height: 210.dp,
          child: Column(
            children: [
              /// 主麦位
              _buildMainPos(firstPosition),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.dp),
                child: _buildBottomPos(),
              ),
              SizedBox(height: 10.dp),
            ],
          ),
        );
      },
    );
  }

  /// 构建主麦位
  Widget _buildMainPos(RoomPosition? pos) {
    if (pos == null) {
      pos = RoomPosition(uid: 0);
      Log.w(tag: TAG, "_buildMainPos pos is null.");
    }
    _updateFollowStatus(pos.uid);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserIcon(
          room: widget.room,
          size: 90.dp,
          position: pos,
        ),
        Container(
          width: 150,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 5.dp, bottom: 5.dp),
                  child: Text(
                    pos.name.toCharacterBreakStr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 15.dp),
                  ),
                ),
              ),
              if ((pos.uid > 0 && pos.uid != Session.uid) && _showFollow) ...[
                SizedBox(width: 4.dp),
                _buildSubscribe(context, pos.uid),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomPos() {
    List<Widget> posWidget = <Widget>[];
    int count = widget.room.positions.length;
    if (count > 5) {
      count = 5;
    }
    for (int i = 1; i < count; i++) {
      var position = widget.room.positions[i];
      posWidget.add(_buildBottomPosItem(position));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: posWidget,
    );
  }

  Widget _buildBottomPosItem(RoomPosition position) {
    return Column(
      children: [
        UserIcon(
          room: widget.room,
          size: 44.dp,
          position: position,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.dp),
          alignment: Alignment.center,
          width: 50.dp,
          child: Text(
            position.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 10.dp),
          ),
        ),
      ],
    );
  }

  Widget _buildSubscribe(BuildContext context, int uid) {
    return GestureDetector(
      onTap: () => _handleTapSubscribe(context, uid),
      child: Container(
        height: 26.dp,
        padding: EdgeInsets.symmetric(horizontal: 8.dp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6560FF), Color(0xFFAD4BFF), Color(0xFFFFA972)],
          ),
          borderRadius: BorderRadius.circular(15.dp),
        ),
        child: Text(
          K.follow,
          style: TextStyle(color: Colors.white, fontSize: 11.dp),
        ),
      ),
    );
  }

  void _handleTapSubscribe(BuildContext context, int uid) async {
    NormalNull response = await BaseRequestManager.onFollow(uid.toString(),
        refer: 'content_follow_button');
    if (response.success) {
      _handleFollowed();
      Fluttertoast.showToast(msg: K.followed, gravity: ToastGravity.CENTER);
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  _handleFollowed() {
    _delayDismissFollowTask = Timer(const Duration(seconds: 3), () {
      _showFollow = false;
      refresh();
    });
  }

  void _updateFollowStatus(int uid) async {
    if (uid <= 0) {
      _showFollow = false;
      _queryFollowUid = null;
      return;
    }
    if (_queryFollowUid == uid) {
      return;
    }
    _showFollow = false;
    _queryFollowUid = uid;
    if (_delayDismissFollowTask != null) {
      _delayDismissFollowTask?.cancel();
      _delayDismissFollowTask = null;
    }
    int follow =
        await BaseRequestManager.queryFollowStatus(uid, toastError: false);
    _showFollow = follow == 0;
    refresh();
  }
}
