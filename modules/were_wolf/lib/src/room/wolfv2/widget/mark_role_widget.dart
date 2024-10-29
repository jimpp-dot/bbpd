import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/mark_role_item_widget.dart';

class MarkRoleWidget extends StatefulWidget {
  final int? uid;
  final WolfRole? markdedRole;
  final WolfModel wolfModel;

  const MarkRoleWidget(
      {super.key, this.uid, this.markdedRole, required this.wolfModel});

  @override
  _MarkRoleWidgetState createState() => _MarkRoleWidgetState();
}

class _MarkRoleWidgetState extends State<MarkRoleWidget> {
  WolfRole? _markedRole;

  @override
  void initState() {
    super.initState();
    _markedRole = widget.markdedRole;
  }

  Widget _buildItem(WolfRole role) {
    Widget itemWidget;
    bool isSelected = false;
    if (_markedRole == role) {
      itemWidget = Stack(
        children: <Widget>[
          MarkRoleItemWidget(
            wolfRole: role,
            size: 30,
          ),
          R.img('wolfv2/user_icon/ic_mark_role_selected.webp',
              package: ComponentManager.MANAGER_WERE_WOLF,
              width: 30,
              height: 30),
        ],
      );
      isSelected = true;
    } else {
      itemWidget = MarkRoleItemWidget(
        wolfRole: role,
        size: 30,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(6),
      child: GestureDetector(
        onTap: () {
          if (isSelected) {
            _markedRole = null;
            widget.wolfModel.clearRoleMark(uid: widget.uid);
          } else {
            _markedRole = role;
            widget.wolfModel.setRoleMark(widget.uid, role);
          }
          setState(() {});
        },
        child: itemWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          K.room_wolf_mark_role,
          style:
              R.textStyle.caption.copyWith(fontSize: 13, color: Colors.white),
        ),
        const SizedBox(
          width: 6,
        ),
        ...WolfRole.values
            .where((_) => _ != WolfRole.None)
            .map((_) => _buildItem(_)),
      ],
    );
  }
}
