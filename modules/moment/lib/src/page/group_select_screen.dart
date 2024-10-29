import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';
import 'package:moment/a.dart';
import 'package:moment/k.dart';

List<GroupItem> groupItems = [
  GroupItem(id: '0', title: A.group_level[0], tips: A.group_level_tips[0]),
  GroupItem(id: '1', title: A.group_level[1], tips: A.group_level_tips[1]),
  GroupItem(id: '2', title: A.group_level[2], tips: A.group_level_tips[2]),
];

/// 分组选择
class GroupSelectScreen extends StatefulWidget {
  final GroupItem? selectItem;

  const GroupSelectScreen({super.key, this.selectItem});

  static Future openGroupSelectScreen(BuildContext context,
      {Key? key, GroupItem? select}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return GroupSelectScreen(
            key: key,
            selectItem: select,
          );
        },
        settings: const RouteSettings(name: '/moment_group_select'),
      ),
    );
  }

  static Future<GroupItem?> showGroupSelectMenu(
      BuildContext context, double top,
      {GroupItem? select}) {
    return showMenu(
      context: context,
      elevation: 4,
      color: R.colors.mainBgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      position: RelativeRect.fromLTRB(20, top, 16, 0),
      items: <PopupMenuEntry<GroupItem>>[
        PopupMenuItem<GroupItem>(
          value: groupItems[0],
          child: SizedBox(
            width: 136,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  width: 12,
                ),
                Text(
                  groupItems[0].title ?? '',
                  style: TextStyle(fontSize: 15, color: R.colors.mainTextColor),
                ),
                Expanded(
                  child: Container(),
                ),
                R.img(
                  "icon_select.svg",
                  width: 24,
                  height: 24,
                  color: select?.id == groupItems[0].id
                      ? R.colors.mainBrandColor
                      : Colors.transparent,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem<GroupItem>(
          value: groupItems[1],
          child: SizedBox(
            width: 136,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  width: 12,
                ),
                Text(
                  groupItems[1].title ?? '',
                  style: TextStyle(fontSize: 15, color: R.colors.mainTextColor),
                ),
                Expanded(
                  child: Container(),
                ),
                R.img(
                  "icon_select.svg",
                  width: 24,
                  height: 24,
                  color: select?.id == groupItems[1].id
                      ? R.colors.mainBrandColor
                      : Colors.transparent,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem<GroupItem>(
          value: groupItems[2],
          child: SizedBox(
            width: 136,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  width: 12,
                ),
                Text(
                  groupItems[2].title ?? '',
                  style: TextStyle(fontSize: 15, color: R.colors.mainTextColor),
                ),
                Expanded(
                  child: Container(),
                ),
                R.img(
                  "icon_select.svg",
                  width: 24,
                  height: 24,
                  color: select?.id == groupItems[2].id
                      ? R.colors.mainBrandColor
                      : Colors.transparent,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  _GroupSelectScreenState createState() => _GroupSelectScreenState();
}

class _GroupSelectScreenState extends State<GroupSelectScreen> {
  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.selectItem != null) {
      _selectIndex =
          groupItems.indexWhere((item) => item.id == widget.selectItem!.id);
      _selectIndex = _selectIndex == -1 ? 0 : _selectIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.moment_group,
        actionTitle: K.group_finish,
        onPressed: () => _onGroupSelect(groupItems[_selectIndex]),
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: groupItems.length,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    GroupItem item = groupItems[index];
    return InkWell(
      onTap: () => _onItemTaped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: <Widget>[
            R.img(
              "icon_select.svg",
              width: 24,
              height: 24,
              color: _selectIndex == index
                  ? R.colors.mainBrandColor
                  : Colors.transparent,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.title ?? '',
                  style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    item.tips ?? '',
                    style:
                        TextStyle(color: R.colors.thirdTextColor, fontSize: 13),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _onGroupSelect(GroupItem item) {
    Navigator.of(context).pop(item);
  }

  _onItemTaped(int index) {
    if (_selectIndex == index) {
      return;
    }
    setState(() {
      _selectIndex = index;
    });
  }
}
