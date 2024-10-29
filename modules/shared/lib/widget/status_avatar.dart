import 'package:flutter/material.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/gradient_circular_progress_indicator.dart';

import '../k.dart';

/// 支持用户状态，支持在房，在线，普通状态头像。
class StatusAvatar extends StatelessWidget {
  final int? rid;

  final int? uid;

  final String? roomIcon;

  /// 房间名称例如：你画我猜
  final String? roomName;

  /// 用户头像
  final String? userAvatar;

  /// 渐变色
  final List<Color>? colors;

  final bool online;

  final double gradientBorderWidth;

  final double avatarRadius;

  final double radius;

  final double fontSize;

  final Color? fillColor;

  final double bottom;

  final double end;

  final GestureTapCallback? onTap;

  final String? refer;

  final Color roomTagBorderColor;

  final String? frame;

  const StatusAvatar({
    super.key,
    this.rid,
    this.uid,
    this.roomIcon,
    this.roomName,
    this.userAvatar,
    this.colors = _partyColors,
    this.online = false,
    this.gradientBorderWidth = 1.5,
    this.avatarRadius = 25.0,
    this.radius = 28.0,
    this.fontSize = 8.0,
    this.bottom = -2,
    this.end = 4,
    this.fillColor,
    this.onTap,
    this.refer,
    this.roomTagBorderColor = Colors.white,
    this.frame = '',
  });

  static const List<Color> _partyColors = [Color(0xFFFE62A5), Color(0xFFFFC96A)];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (_showInRoom()) {
      widgets = _buildInRoom();
    } else if (_showOnline()) {
      widgets = _buildOnline();
    } else {
      widgets = [_commonAvatar(false)];
    }

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else if (rid != null && rid! > 0) {
          IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(context, rid!, from: RoomFrom.message_nearby, refer: refer ?? "", uid: uid);
          PulseLog.instance.event('click_event', properties: {
            'click_tag': '${refer}_user_icon_room',
          });
        } else {
          IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, uid ?? 0, refer: PageRefer(refer ?? ""));
          PulseLog.instance.event('click_event', properties: {
            'click_tag': '${refer}_user_icon',
          });
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: widgets,
      ),
    );
  }

  List<Widget> _buildInRoom() {
    List<Color> gColors = !Util.isCollectionEmpty(colors) ? colors! : _partyColors;

    return [
      if (frame == null || frame!.isEmpty)
        Container(
          color: fillColor,
          child: GradientCircularProgressIndicator(
            colors: gColors,
            radius: radius,
            stokeWidth: gradientBorderWidth,
            value: 1,
          ),
        ),
      _commonAvatar(true),
      PositionedDirectional(bottom: -2, child: _normalRoomNameContainer())
    ];
  }

  Widget _normalRoomNameContainer() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4, top: 2, bottom: 2),
      decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(color: roomTagBorderColor, width: 0),
          ),
          gradient: LinearGradient(colors: !Util.isCollectionEmpty(colors) ? colors! : _partyColors)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (Util.isStringEmpty(roomIcon))
            R.img('ic_inroom_chat.svg', width: 10, height: 10, package: ComponentManager.MANAGER_BASE_CORE)
          else
            CachedNetworkImage(imageUrl: Util.getRemoteImgUrl(roomIcon), width: 10, height: 10),
          Text(
            roomName ?? K.chat,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          )
        ],
      ),
    );
  }

  Widget _commonAvatar(bool inRoom) {
    return SizedBox(
      width: inRoom ? avatarRadius * 2 : radius * 2,
      height: inRoom ? avatarRadius * 2 : radius * 2,
      child: CommonAvatarWithFrame(
        childWidget: CommonAvatar(
          path: userAvatar,
          size: inRoom ? avatarRadius * 2 : radius * 2,
          shape: BoxShape.circle,
        ),
        overflow: -3.0,
        framePath: frame,
      ),
    );
  }

  List<Widget> _buildOnline() {
    return [
      _commonAvatar(false),
      PositionedDirectional(
        end: end,
        bottom: bottom,
        child: OnlineDot(
          borderColor: roomTagBorderColor,
        ),
      ),
    ];
  }

  bool _showInRoom() {
    return !Util.isStringEmpty(roomName) && rid != null && rid! > 0;
  }

  bool _showOnline() {
    return online == true && !_showInRoom();
  }
}
