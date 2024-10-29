import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/room_role_widget.dart';
import 'package:flutter/material.dart';

/// 4麦商业房
///
class FourMicMainPage extends StatefulWidget {
  final ChatRoomData room;

  const FourMicMainPage(this.room, {Key? key}) : super(key: key);

  @override
  State<FourMicMainPage> createState() => _FourMicMainPageState();
}

class _FourMicMainPageState extends State<FourMicMainPage>
    with
        RoomTemplateMixin<FourMicMainPage>,
        RoomSettingMixin<FourMicMainPage>,
        RoomFloatingBannerMixin<FourMicMainPage> {
  @override
  Widget build(BuildContext context) {
    final room = widget.room;
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        renderBg(context, room),
        Positioned.fill(
          bottom: Util.iphoneXBottom,
          child: _buildColumn(room),
        ),
        PositionedDirectional(
          end: 0,
          bottom: preMadeRecruitBottom,
          child: buildFloatingBanner(room),
        ),
        ...renderExtra(context, widget.room),
      ],
    );
  }

  Widget _buildColumn(ChatRoomData room) {
    return Column(
      children: [
        RoomHeaderNormal(
          room: room,
          onSettingClick: () => onSettingClick(room),
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0, top: 2),
            child: renderWeekStar(room),
          ),
        ),
        FourMicUserList(room),
        renderMessageList(room),
        renderController(room),
      ],
    );
  }
}

class FourMicUserList extends StatelessWidget {
  final ChatRoomData room;

  const FourMicUserList(this.room, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8, top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              /// 房主位
              Expanded(
                child: _MicWidget(
                  room,
                  room.isFivePosition
                      ? RoomPosition.fromCreator(room.createor!)
                      : room.positions[0],
                  size: IconStyles[UserIconStyle.Big]!.width,
                  isCreator: true,
                ),
              ),

              /// 老板位
              Expanded(
                child: _MicWidget(
                  room,
                  room.positions.last,
                  size: IconStyles[UserIconStyle.Big]!.width,
                  isBoos: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          _buildRow(),
        ],
      ),
    );
  }

  Widget _buildRow() {
    int skip = room.isFivePosition ? 0 : 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: room.positions.skip(skip).take(4).map((RoomPosition item) {
        return Expanded(
          child: _MicWidget(
            room,
            item,
            size: IconStyles[UserIconStyle.Normal]!.width,
            isBoos: false,
          ),
        );
      }).toList(),
    );
  }
}

class _MicWidget extends StatefulWidget {
  final ChatRoomData room;
  final RoomPosition position;
  final double size;
  final bool isCreator;
  final bool isBoos;

  const _MicWidget(this.room, this.position,
      {Key? key, this.size = 60, this.isCreator = false, this.isBoos = false})
      : super(key: key);

  @override
  State<_MicWidget> createState() => _MicWidgetState();
}

class _MicWidgetState extends State<_MicWidget> {
  @override
  Widget build(BuildContext context) {
    String name;
    RoomUserRole? userRole;
    bool isBoss = false;
    if (widget.isCreator) {
      String title = K.room_reception;
      if (widget.room.config!.reception && widget.position.uid > 0) {
        userRole = RoomUserRole.Reception;
      }

      if (widget.room.isFivePosition) {
        title = K.room_owner;
        if (widget.position.uid > 0) {
          userRole = RoomUserRole.Owner;
        }
      }
      if (widget.position.uid > 0) {
        name = widget.position.name;
      } else {
        name = widget.room.config!.reception ? title : K.room_empty_mic_prefix;
      }
    } else {
      if (widget.room.config!.reception && widget.position.position == 0) {
        //接待
        if (widget.position.uid == 0) {
          name = K.room_reception;
        } else {
          name = widget.position.name;
          userRole = RoomUserRole.Reception;
        }
      } else if (ChatRoomUtil.isBossChair(widget.position)) {
        isBoss = true;
        if (widget.position.uid == 0) {
          name = K.room_boss;
        } else {
          name = widget.position.name;
          userRole = RoomUserRole.Boss;
        }
      } else {
        name = widget.position.name;
        if (widget.position.uid <= 0) {
          name = widget.isBoos ? K.room_empty_mic_prefix : K.room_reception;
        }
      }
    }

    if (widget.position.uid <= 0 &&
        widget.room.config?.mode != RoomMode.Lock &&
        widget.position.lock == true) {
      name = K.room_mic_locked;
    }

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Column(
          children: <Widget>[
            UserIcon(
              room: widget.room,
              position: widget.position,
              size: widget.size,
              showPackage: widget.isCreator ? false : true,
            ),
            const SizedBox(height: 5),
            Container(
              height: 40,
              alignment: Alignment.topCenter,
              child: Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    if (userRole != null)
                      WidgetSpan(
                        child: RoomRoleWidget(
                          role: userRole,
                        ),
                      ),
                    WidgetSpan(
                      child: _buildName(name, widget.position, isBoss),
                    ),
                  ],
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if ((widget.room.uid ?? 0) > 0 &&
            widget.position.uid == widget.room.uid &&
            !widget.position.isMystery)
          PositionedDirectional(
            top: -24,
            child: UserTip(
              timerCompleteCallback: () {
                if (!mounted) return;
                if (widget.room.config == null) return;
                setState(() {
                  widget.room.uid = 0;
                });
              },
            ),
          ),
      ],
    );
  }

  Widget _buildName(String name, RoomPosition item, bool isBoss) {
    if (widget.isCreator) {
      return RoomCounter(
        name: name,
        uid: widget.position.uid,
        isCplove: false,
        counter: widget.room.config!.counter,
      );
    }

    Color textColor = Colors.white;

    if (item.uid == 0 || isBoss) {
      if (item.uid == 0) {
        textColor = Colors.white.withOpacity(0.4);
      }

      if (isBoss) {
        textColor = const Color(0xFFFFE735);
      }

      return Text(
        name,
        style: TextStyle(height: 1.2, fontSize: 11.0, color: textColor),
      );
    }

    return Text(
      item.name,
      style: const TextStyle(color: Colors.white, height: 1.2, fontSize: 11.0),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }
}
