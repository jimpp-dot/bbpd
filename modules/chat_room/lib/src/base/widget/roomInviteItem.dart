import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/model/friend_bean.dart';

typedef onItemClick = Function(FriendItem item, bool selected);

class RoomInviteItem extends StatefulWidget {
  final bool selected;
  final FriendItem data;
  final onItemClick onRoomItemClick;

  const RoomInviteItem(
      {super.key,
      required this.selected,
      required this.data,
      required this.onRoomItemClick});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<RoomInviteItem> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
    eventCenter.addListener('Contact.select.clear', _onClear);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener('Contact.select.clear', _onClear);
  }

  @override
  Widget build(BuildContext context) {
    List<String> icons = [];
    if (widget.data.members != null && widget.data.members!.isNotEmpty) {
      for (var member in widget.data.members!) {
        icons.add(member['icon']);
      }
    } else if (widget.data.memberIcons != null) {
      icons = widget.data.memberIcons!;
    }

    String selectedIconPath = 'ic_select_blue.svg';
    String selectedIconPackage = ComponentManager.MANAGER_BASE_ROOM;

    return InkWell(
      onTap: () {
        setState(() {
          _selected = !_selected;
          widget.onRoomItemClick(widget.data, _selected);
        });
      },
      child: SizedBox(
        height: 76,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _selected
                ? R.img(
                    selectedIconPath,
                    package: selectedIconPackage,
                    width: 20,
                    height: 20,
                  )
                : R.img('ic_unselect.svg',
                    package: ComponentManager.MANAGER_BASE_ROOM,
                    width: 20,
                    height: 20,
                    color: R.color.thirdTextColor),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 12),
              child: icons.isNotEmpty
                  ? GroupIconCircle(
                      icons: icons,
                    )
                  : CommonAvatar(
                      path: widget.data.icon,
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
                    child: Text(
                      widget.data.markName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: R.color.mainTextColor, fontSize: 17),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      R.img('id_icon.svg',
                          package: ComponentManager.MANAGER_BASE_ROOM,
                          height: 16,
                          width: 16,
                          color: R.color.mainTextColor.withOpacity(0.4)),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 2),
                        child: Text(
                          '${widget.data.uid}',
                          style: R.textStyle.caption,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onClear(String type, dynamic data) {
    int? selectedUid = data;
    if (selectedUid == null) return;
    if (widget.data.uid != selectedUid) {
      setState(() {
        _selected = false;
      });
    }
  }
}
