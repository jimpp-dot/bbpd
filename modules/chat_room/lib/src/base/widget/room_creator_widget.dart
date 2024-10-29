import 'dart:math';

import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/punish/model/punish_beans.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:chat_room/src/base/widget/room_cover_panel.dart';
import 'package:chat_room/src/base/widget/user_icon_plugin.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'room_role_widget.dart';

class RoomCreatorWidget extends StatefulWidget {
  final ChatRoomData room;
  final VoidCallback? onOrderWeekTap;
  final GlobalKey? bigHeadKey;
  final String? liveMicFrame;

  const RoomCreatorWidget({Key? key, required this.room, this.onOrderWeekTap, this.bigHeadKey, this.liveMicFrame}) : super(key: key);

  @override
  RoomCreatorState createState() => RoomCreatorState();
}

class RoomCreatorState extends State<RoomCreatorWidget> {
  bool showFollowStyle = false;

  /// 根据房间类型是否展示关注
  int lastQueryFollowUid = 0;

  /// 上一次查询关注状态的uid，防止同一个uid上下麦频繁查询关注状态
  bool isFollow = true;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.UserFollow, _onUserFollow);
    init(isFirst: true);
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.UserFollow, _onUserFollow);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant RoomCreatorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    init();
  }

  init({bool isFirst = false}) async {
    showFollowStyle = neeShowFollow();
    _loadFollowRelation(isFirst);
  }

  bool neeShowFollow() {
    /// 靓号房人多不展示关注按钮，避免切换玩法时，大批量用户同时请求接口
    return !widget.room.isBaba &&
        (widget.room.isDating ||
            widget.room.config?.types == RoomTypes.RadioDefend ||
            widget.room.config?.types == RoomTypes.Live ||
            widget.room.config?.types == RoomTypes.Joy ||
            widget.room.config?.factoryType == RoomFactoryType.BusinessMusic ||
            widget.room.config?.factoryType == RoomFactoryType.Normal);
  }

  _onUserFollow(String type, dynamic value) {
    /// 关注状态改变刷新UI
    if (value is Map && value.containsKey('follow') && value.containsKey('uid')) {
      bool follow = value['follow'];
      String uid = value['uid'];

      RoomPosition user = _getUser();
      if (user.uid <= 0) {
        return;
      }
      int toUid = user.uid;

      if (Util.parseInt(uid) == toUid) {
        setState(() {
          isFollow = follow;
          if (toUid == widget.room.createor?.uid) {
            widget.room.isFollowCreator = follow;
          }
        });
      }
    }
  }

  _loadFollowRelation(bool isFirst) async {
    if (widget.room.isBaba) {
      /// 靓号房人多不展示关注按钮，避免切换玩法时，大批量用户同时请求接口
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

    RoomPosition user = _getUser();
    if (showFollowStyle && user.uid > 0 && lastQueryFollowUid != user.uid && user.uid != Session.uid) {
      lastQueryFollowUid = user.uid;
      Map<int, int> res = (await BaseRequestManager.batchQueryFollowStatus([user.uid]));
      if (res.isNotEmpty) {
        isFollow = (res[user.uid] ?? 0) > 0;
        refresh();
      }
    }
  }

  bool onFollowing = false;

  _onFollow() async {
    if (onFollowing == true) {
      return;
    }
    onFollowing = true;
    RoomPosition user = _getUser();
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
        isFollow = true;

        if (user.uid == widget.room.createor?.uid) {
          widget.room.isFollowCreator = true;
        }

        refresh();
        Fluttertoast.showToast(msg: K.followed, gravity: ToastGravity.CENTER);
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
        }
      }
    }
    onFollowing = false;
  }

  RoomPosition _getUser() {
    return widget.room.isEightPosition
        ? RoomPosition.fromCreator(widget.room.createor!)
        : Util.isCollectionEmpty(widget.room.positions)
            ? RoomPosition(uid: 0)
            : widget.room.positions[0];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.room.isSenderRoom || widget.room.config?.types == RoomTypes.CpLove) {
      return _buildStyleSpecial(_getUser());
    }

    return _buildNormalStyle(_getUser());
  }

  /// cpLove or 点单厅样式
  Widget _buildStyleSpecial(RoomPosition user) {
    String name = '';
    String prefix;
    RoomUserRole? userRole;
    if (user.uid > 0) {
      name = user.name;
      if (widget.room.config?.reception ?? false) {
        userRole = RoomUserRole.Reception;
      }
    } else {
      prefix = (widget.room.config?.reception ?? false) ? K.room_reception : K.room_empty_mic_prefix;
      name = prefix;
    }

    if (user.uid <= 0 && widget.room.config?.mode != RoomMode.Lock && user.lock == true) {
      name = K.room_mic_locked;
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16.0, end: 16.0, bottom: 16.0, top: 20),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: IconSize.middle,
            height: IconSize.middle,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                UserIcon(
                  key: widget.bigHeadKey,
                  room: widget.room,
                  position: user,
                  size: IconSize.middle,
                ),
                PositionedDirectional(
                  bottom: IconSize.middle,
                  child: _buildPositionTips(user),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: SizedBox(
              height: IconSize.middle,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (userRole != null) RoomRoleWidget(role: userRole),
                      Container(
                        constraints: BoxConstraints(maxWidth: Util.width - IconSize.middle - 16 - 14 - 12 - 90),
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            // 扩列（CpLove）颜色暂不改，因为普通麦位下有男神/女神文案及麦位
                            color: widget.room.config?.types == RoomTypes.CpLove || user.uid > 0
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 不显示派单信息
                  // if (widget.room.isSenderRoom)
                  //   _OrderInfo(
                  //     widget.room,
                  //     onOrderWeekTap: widget.onOrderWeekTap,
                  //   ),
                ],
              ),
            ),
          ),
          _WaitIconUp(widget.room),
        ],
      ),
    );
  }

  Widget _buildNormalStyle(RoomPosition user) {
    String name = '';
    RoomUserRole? userRole;
    List<UserPunish>? userPunish;
    bool showFollowButton = showFollowStyle && user.uid > 0 && user.uid != Session.uid && !isFollow;
    if (widget.room.config?.types == RoomTypes.Live) {
      if (user.uid > 0) {
        name = user.name;
        userRole = RoomUserRole.Anchor;
      } else {
        name = K.room_live_prefix;
      }
      userPunish = widget.room.config?.liveDataV3?.pkConfigV3?.pkPunish?.getUserIconPunish(user.uid);
    } else {
      String title = K.room_reception;
      if ((widget.room.config?.reception ?? false) && user.uid > 0) {
        userRole = RoomUserRole.Reception;
      }
      if (widget.room.isEightPosition) {
        title = K.room_owner;
        if (user.uid > 0) {
          userRole = RoomUserRole.Owner;
        }
      } else if (widget.room.config?.types == RoomTypes.RadioDefend) {
        title = K.room_live_prefix;
        if ((widget.room.config?.reception ?? false) && user.uid > 0) {
          userRole = RoomUserRole.Anchor;
        }
      }
      String prefix;
      if (user.uid > 0) {
        name = user.name;
      } else {
        prefix = (widget.room.config?.reception ?? false) ? title : K.room_empty_mic_prefix;
        name = prefix;
      }
    }

    if (user.uid <= 0 && widget.room.config?.mode != RoomMode.Lock && user.lock == true) {
      name = K.room_mic_locked;
    }

    double bottom = 9.0;
    if (widget.room.config?.types == RoomTypes.RadioDefend) {
      bottom = 3.0;
    } else if (widget.room.config?.types == RoomTypes.Live) {
      bottom = 6;
    }
    String godTagIcon = GodTagUtil.getGodTagByUid(user.uid);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              ///八麦房显示房间封面，不显示身份信息
              UserIcon(
                key: widget.bigHeadKey,
                room: widget.room,
                position: user,
                size: IconSize.big,
                plugins: [PunishPlugin(userPunish)],
                role: widget.room.isEightPosition ? null : (userRole != null ? RoomRoleWidget.getRoleName(userRole) : ''),
                liveMicFrame: widget.liveMicFrame,
                iconPath: (widget.room.isEightPosition && widget.room.config?.icon != null && widget.room.config!.icon.isNotEmpty)
                    ? widget.room.config!.icon
                    : null,
              ),

              if (widget.room.isEightPosition)
                IgnorePointer(
                  ignoring: user.uid == Session.uid,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      RoomCoverPanel.show(context, widget.room);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(IconSize.big / 2),
                        color: Colors.transparent,
                      ),
                      width: IconSize.big,
                      height: IconSize.big,
                    ),
                  ),
                ),
              PositionedDirectional(
                bottom: IconSize.big,
                child: _buildPositionTips(user),
              ),
              if (!widget.room.isBusinessHeart)
                PackageAtMic(
                  endNum: -15,
                  position: user.uid > 0 ? user : RoomPosition.fromCreator(widget.room.createor!),
                  room: widget.room,
                ),
            ],
          ),
          const SizedBox(height: 5),
          (widget.room.isEightPosition && (widget.room.config?.subtitle ?? '').isNotEmpty)
              ? Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.dp, end: 32.dp),
                  child: Text(
                    widget.room.config?.subtitle ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!Util.isStringEmpty(godTagIcon))
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 3),
                        child: CachedNetworkImage(
                          imageUrl: Util.getRemoteImgUrl(godTagIcon),
                          height: 12,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    LimitedBox(
                      maxWidth: 120,
                      child: RoomCounter(
                        name: name == '主播' ? '' : name,
                        uid: user.uid,
                        counter: widget.room.config?.counter,
                      ),
                    ),
                    if (showFollowButton)
                      GestureDetector(
                        onTap: _onFollow,
                        child: Container(
                          width: 44,
                          height: 22,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: const Color(0xFF9EFF4E)),
                            borderRadius: BorderRadius.circular(29 / 2),
                          ),
                          alignment: AlignmentDirectional.center,
                          margin: const EdgeInsetsDirectional.only(start: 4),
                          child: Text(
                            K.follow,
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
          SizedBox(height: bottom),
          // 直播房房主可以看到开播时长
          if (widget.room.config?.types == RoomTypes.Live && widget.room.config?.uid == Session.uid) _LiveDuration(widget.room),
          if (widget.room.config?.types == RoomTypes.Live) const SizedBox(height: 3),
          const SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _buildPositionTips(RoomPosition user) {
    if (widget.room.uid != null && widget.room.uid! > 0 && widget.room.uid == user.uid && !user.isMystery) {
      return UserTip(
        height: 20,
        timerCompleteCallback: () {
          if (!mounted) return;
          if (widget.room.config == null) return;
          setState(() {
            widget.room.uid = 0;
          });
        },
      );
    }

    return const SizedBox.shrink();
  }
}

///_renderWaitIcon内容不需要点击的部分
///CpLove 类型的房型需要
class _WaitIconUp extends StatelessWidget {
  final ChatRoomData room;

  const _WaitIconUp(this.room);

  @override
  Widget build(BuildContext context) {
    if (room.config?.types == RoomTypes.CpLove) {
      return RoomCounter(
        name: '',
        isCplove: (room.config?.types == RoomTypes.CpLove),
        counter: room.config?.counter ?? 0,
      );
    }

    return const SizedBox.shrink();
  }
}

/// 直播房房主可以看到开播时长
class _LiveDuration extends StatelessWidget {
  final ChatRoomData room;

  const _LiveDuration(this.room);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 54,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 4,
            height: 4,
            margin: const EdgeInsetsDirectional.only(end: 4),
            decoration: BoxDecoration(color: R.color.fiveBrightColor, shape: BoxShape.circle),
          ),
          ValueListenableBuilder<int>(
            valueListenable: room.liveDurationNotifier,
            builder: (context, value, child) {
              return Text(
                _getLiveDuration(value),
                style: const TextStyle(fontSize: 9, color: Color(0xFFFEFEFE)),
              );
            },
          )
        ],
      ),
    );
  }

  String _getLiveDuration(int second) {
    int h = second ~/ 3600;
    int m = second % 3600;
    m = m ~/ 60;
    int s = second % 60;
    return '${h > 9 ? h.toString() : '0$h'}:${m > 9 ? m.toString() : '0$m'}:${s > 9 ? s.toString() : '0$s'}';
  }
}

/// 点单厅信息
class _OrderInfo extends StatelessWidget {
  final VoidCallback? onOrderWeekTap;

  final ChatRoomData room;

  const _OrderInfo(this.room, {this.onOrderWeekTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: room.purview != Purview.Normal ? onOrderWeekTap : null,
          child: Container(
            alignment: Alignment.center,
            height: 18.0,
            padding: const EdgeInsets.symmetric(horizontal: 9),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.4), width: 0.0),
              borderRadius: const BorderRadius.all(Radius.circular(9.0)),
            ),
            margin: const EdgeInsetsDirectional.only(end: 6.0),
            child: Text(
              K.room_alrady_order_few(["${room.config?.oNum}"]),
              style: const TextStyle(fontSize: 10.0, color: Colors.white),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 18.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.4), width: 0.0),
            borderRadius: BorderRadius.circular(9),
          ),
          padding: const EdgeInsetsDirectional.only(start: 6.0, end: 6.0),
          child: Text(
            "${K.room_avg_use_time}${_getOrderDuration()}",
            style: const TextStyle(fontSize: 10.0, color: Colors.white),
          ),
        )
      ],
    );
  }

  String _getOrderDuration() {
    int duration = room.config?.oDuration ?? 0;
    int num = room.config?.oNum ?? 0;
    if (num == 0) return "00:00";
    int sec = duration ~/ num;
    int m = sec ~/ 60;
    int s = sec % 60;
    return "${_withZero(m)}:${_withZero(s)}";
  }

  String _withZero(int value) {
    if (value < 10) {
      return "0$value";
    } else {
      return value.toString();
    }
  }
}
