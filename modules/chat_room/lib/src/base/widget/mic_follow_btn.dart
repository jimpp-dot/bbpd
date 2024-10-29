import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

/// 麦位关注按钮
///
class MicFollowBtn extends StatefulWidget {
  final ChatRoomData room;
  final WidgetBuilder? builder;
  final RoomPosition user;

  const MicFollowBtn(this.room, {super.key, required this.user, this.builder});

  @override
  State<MicFollowBtn> createState() => _MicFollowBtnState();
}

class _MicFollowBtnState extends State<MicFollowBtn> {
  /// 根据房间类型是否展示关注
  int _lastQueryFollowUid = 0;

  /// 上一次查询关注状态的uid，防止同一个uid上下麦频繁查询关注状态
  bool _isFollowed = true;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.UserFollow, _onUserFollow);
    _init(isFirst: true);
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.UserFollow, _onUserFollow);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant MicFollowBtn oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init({bool isFirst = false}) async {
    _loadFollowRelation(isFirst);
  }

  bool _neeShowFollow() {
    /// 靓号房人多不展示关注按钮，避免切换玩法时，大批量用户同时请求接口
    if (widget.room.isBaba) return false;

    return widget.room.isDating ||
        widget.room.isMicLink ||
        widget.room.config?.types == RoomTypes.RadioDefend ||
        widget.room.config?.types == RoomTypes.Live ||
        widget.room.config?.types == RoomTypes.Joy ||
        widget.room.config?.factoryType == RoomFactoryType.BusinessMusic ||
        widget.room.config?.factoryType == RoomFactoryType.Normal;
  }

  _onUserFollow(String type, dynamic value) {
    /// 关注状态改变刷新UI
    if (value is Map &&
        value.containsKey('follow') &&
        value.containsKey('uid')) {
      bool follow = value['follow'];
      String uid = value['uid'];

      RoomPosition user = widget.user;
      if (user.uid <= 0) {
        return;
      }
      int toUid = user.uid;

      if (Util.parseInt(uid) == toUid) {
        setState(() {
          _isFollowed = follow;
          if (toUid == widget.room.createor?.uid) {
            widget.room.isFollowCreator = follow;
          }
        });
      }
    }
  }

  _loadFollowRelation(bool isFirst) async {
    /// 靓号房人多不展示关注按钮，避免切换玩法时，大批量用户同时请求接口
    if (widget.room.isBaba) {
      return;
    }

    if (isFirst == false) {
      /// 防止所有用户集中请求
      int delay = Random.secure().nextInt(2000);
      await Future.delayed(Duration(milliseconds: delay));
    }

    if (!mounted) {
      return;
    }

    RoomPosition user = widget.user;
    if (_neeShowFollow() &&
        user.uid > 0 &&
        _lastQueryFollowUid != user.uid &&
        user.uid != Session.uid) {
      _lastQueryFollowUid = user.uid;
      Map<int, int> res =
          (await BaseRequestManager.batchQueryFollowStatus([user.uid]));
      if (res.isNotEmpty) {
        _isFollowed = (res[user.uid] ?? 0) > 0;
        refresh();
      }
    }
  }

  bool _onFollowing = false;

  _onFollow() async {
    if (_onFollowing == true) {
      return;
    }
    _onFollowing = true;

    RoomPosition user = widget.user;
    if (user.uid > 0 && user.uid != Session.uid) {
      NormalNull response = await BaseRequestManager.onFollow(
        '${user.uid}',
        rid: widget.room.realRid,
        refer: 'waiter_follow_button',
        roomType: widget.room.config?.type ?? '',
        typeLabel: widget.room.config?.typeName ?? '',
        roomFactoryType: widget.room.config?.originalRFT ?? '',
      );

      if (response.success) {
        _isFollowed = true;

        if (user.uid == widget.room.createor?.uid) {
          widget.room.isFollowCreator = true;
        }

        refresh();
        Fluttertoast.showToast(msg: K.followed, gravity: ToastGravity.CENTER);
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
      }
    }
    _onFollowing = false;
  }

  @override
  Widget build(BuildContext context) {
    RoomPosition user = widget.user;
    bool showFollowButton = _neeShowFollow() &&
        user.uid > 0 &&
        user.uid != Session.uid &&
        !_isFollowed;

    if (!showFollowButton) return const SizedBox.shrink();

    Widget? child;

    if (widget.builder != null) {
      child = widget.builder!(context);
    }

    return GestureDetector(
      onTap: _onFollow,
      behavior: HitTestBehavior.opaque,
      child: child ??
          Container(
            height: widget.room.isDating ? 18 : 15,
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: followBtnGradient,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: widget.room.isDating ? 8 : 4),
                Text(
                  K.follow,
                  style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(width: widget.room.isDating ? 8 : 4),
              ],
            ),
          ),
    );
  }
}
