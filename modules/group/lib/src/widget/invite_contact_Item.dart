import 'package:group/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/model/friend_bean.dart';

typedef OnItemClick = Function(int uid);

class InviteContactItem extends StatefulWidget {
  final bool? selected;
  final bool preSelected;
  final FriendItem? data;
  final OnItemClick? onItemClick;

  const InviteContactItem(
      {Key? key,
      this.selected,
      this.preSelected = false,
      this.data,
      this.onItemClick})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<InviteContactItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String?> icons = [];
    if (widget.data!.members != null && widget.data!.members!.isNotEmpty) {
      for (var member in widget.data!.members!) {
        icons.add(member['icon']);
      }
    } else if (widget.data!.memberIcons != null) {
      icons = widget.data!.memberIcons!;
    }

    Widget childWidget;
    if (widget.preSelected) {
      childWidget = Text(
        K.group_already_member,
        style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
      );
    } else if (widget.selected!) {
      childWidget = const CheckBoxChecked(width: 20, height: 20);
    } else {
      childWidget = CheckBoxUnchecked(
          width: 20, height: 20, color: R.color.thirdTextColor);
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (widget.preSelected) return;
        widget.onItemClick!(widget.data?.uid ?? 0);
      },
      child: SizedBox(
        height: 76,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 12),
              child: icons.isNotEmpty
                  ? GroupIconCircle(
                      icons: icons as List<String>,
                    )
                  : CommonAvatar(
                      path: widget.data!.icon,
                      size: 52,
                      shape: BoxShape.circle,
                    ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 6),
                    child: _buildItemTitle(widget.data?.markName ?? '',
                        widget.data?.titleNew ?? 0),
                  ),
                  IDWidget(
                    uid: widget.data!.uid,
                    fontSize: 13,
                    fontColor: R.color.secondTextColor,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            childWidget,
          ],
        ),
      ),
    );
  }

  Widget _buildItemTitle(String name, int titleNew) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: R.color.mainTextColor,
          fontSize: 17,
          fontFamily: Util.fontFamily),
    );
  }
}
