import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:chat_room/src/base/widget/room_role_widget.dart';
import 'package:chat_room/src/biz_plugin/special_seat/special_seat.dart';
import 'package:chat_room/src/cplove/repo/cplove_repo.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../../k.dart';
import '../../roomNavUtil.dart';
import 'cp_heart_progress_bar.dart';
import 'cp_heart_rule_dialog.dart';

class CpHeartRoomWidget extends StatefulWidget {
  final ChatRoomData room;

  const CpHeartRoomWidget({Key? key, required this.room}) : super(key: key);

  @override
  _CpHeartRoomWidgetState createState() => _CpHeartRoomWidgetState();
}

class _CpHeartRoomWidgetState extends State<CpHeartRoomWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(),
        const SizedBox(height: 4),
        CpHeartProgressBar(cpLoveState: widget.room.config?.cpState),
        const SizedBox(height: 8),
        UserListNormal(
          room: widget.room,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 14, end: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildCreator(),
          Expanded(
            child: Center(
              child: InkWell(
                child: R.img(
                  'cplove/cp_heart_big_heart.webp',
                  width: 148.dp,
                  height: 84.dp,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
                onTap: () {
                  CpHeartRuleDialog.showCpHeartRuleDialog(context);
                },
              ),
            ),
          ),
          SizedBox(
            width: 64,
            height: 64,
            child: (widget.room.showVipSeat)
                ? SpecialSeatWidget(widget.room)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildCreator() {
    RoomPosition user = widget.room.positions[0];
    String? name;
    RoomUserRole userRole = RoomUserRole.Reception;

    if (user.uid > 0) {
      name = user.name;
    }
    return _buildUserWidget(user, userRole, name);
  }

  Widget _buildNamingUser() {
    UserBean? user = widget.room.config?.cpNamingUser;
    String? name;
    RoomUserRole userRole = RoomUserRole.Naming;
    if (user != null && user.uid > 0) {
      name = user.name;
    } else {
      user = null;
    }
    return _buildUserWidget(null, userRole, name,
        iconSize: IconSize.wolf, user: user);
  }

  Widget _buildUserWidget(
      RoomPosition? roomPos, RoomUserRole userRole, String? name,
      {double iconSize = IconSize.middle, UserBean? user}) {
    Widget userIcon = Container();

    if (roomPos != null) {
      userIcon = UserIcon(
        room: widget.room,
        position: roomPos,
        size: iconSize,
      );
    } else if (user != null) {
      userIcon = InkWell(
        onTap: () => _namingUserClick(user),
        child: Stack(
          children: [
            CommonAvatar(
              path: user.icon,
              shape: BoxShape.circle,
              size: iconSize,
            ),
            _namingFrame(iconSize),
          ],
        ),
      );
    } else {
      userIcon = InkWell(
          onTap: () => _namingUserClick(null),
          child: Stack(
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.12),
                  border: Border.all(
                      width: 1, color: Colors.white.withOpacity(0.06)),
                ),
                alignment: AlignmentDirectional.center,
                child: R.img(RoomAssets.chat_room$wait_svg,
                    width: 24,
                    height: 24,
                    package: ComponentManager.MANAGER_BASE_ROOM),
              ),
              _namingFrame(iconSize),
            ],
          ));
    }

    return SizedBox(
      width: 92,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          userIcon,
          const SizedBox(height: 8),
          _renderNameWithTag(name, userRole, roomPos?.uid ?? 0),
        ],
      ),
    );
  }

  Widget _renderNameWithTag(String? name, RoomUserRole? userRole, int uid) {
    String godTagIcon = GodTagUtil.getGodTagByUid(uid);
    List<Widget> list = [];
    // 标签
    if (!Util.isStringEmpty(godTagIcon)) {
      list.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 3),
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(godTagIcon),
            height: 12,
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    }
    // 角色
    if (userRole != null) {
      list.add(
        RoomRoleWidget(role: userRole),
      );
    }
    Widget nameWidget = Text(
      name ?? '',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 11.0,
      ),
    );
    if (list.isEmpty) {
      return nameWidget;
    } else {
      list.add(Flexible(child: nameWidget));
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: list,
    );
  }

  void _namingUserClick(UserBean? user) async {
    Purview purview = widget.room.purview;

    bool admin = purview == Purview.Createor || purview == Purview.SuperAdmin;
    if (admin) {
      List<SheetItem> res = [];
      if (user != null) {
        res.add(SheetItem(K.room_set_naming_user, "set-naming-user"));
        res.add(SheetItem(K.room_remove_naming_user, "cancel-naming-user"));
        res.add(SheetItem(K.room_look_info, "view-naming-user"));
      } else {
        res.add(SheetItem(K.room_set_naming_user, "set-naming-user"));
      }
      SheetCallback? result = await displayModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return RadioBottomSheet(data: res);
          });
      if (result == null || result.reason == SheetCloseReason.Active) {
        return;
      }

      String? key = result.value?.key;
      if (key == 'set-naming-user') {
        RoomNavUtil.openRoomAdminScreen(context,
            rid: widget.room.rid,
            purview: purview,
            types: widget.room.config?.types,
            uid: widget.room.createor?.uid ?? 0);
      } else if (key == 'cancel-naming-user') {
        NormalNull normalNull = await CpLoveRepo.setNamingUser(
            widget.room.rid, user?.uid ?? 0, false);
        if (normalNull.success) {
          Fluttertoast.showToast(
              msg: K.room_operate_success, gravity: ToastGravity.CENTER);
        } else {
          Fluttertoast.showToast(
              msg: normalNull.msg, gravity: ToastGravity.CENTER);
        }
      } else if (key == 'view-naming-user') {
        _showUserProfile(user?.uid ?? 0);
      }
    } else {
      if (user != null) {
        _showUserProfile(user.uid);
      }
    }
  }

  void _showUserProfile(int uid) {
    RoomNavUtil.goToImageScreenDialog(context, null, widget.room, userId: uid);
  }

  Widget _namingFrame(double size) {
    String frameImage =
        'https://fheebiy-wh.oss-cn-hangzhou.aliyuncs.com/room_naming_header.png';
    double headSize = size * 1.1;
    return PositionedDirectional(
      top: -0.05 * size,
      start: -0.05 * size,
      child: SizedBox(
        width: headSize,
        height: headSize,
        child: IgnorePointer(
          child: CachedNetworkImage(
            imageUrl:
                Util.getRemoteImgUrl('static/cp_new/room_naming_header.png'),
            width: headSize,
            height: headSize,
            key: ObjectKey('user-icon-frame-$frameImage'),
            errorWidget: Container(),
          ),
        ),
      ),
    );
  }
}
