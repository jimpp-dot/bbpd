import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat/src/quick_reply/quick_reply_group_page.dart';
import 'package:flutter/material.dart';

typedef OnGroupSelected = Function(int index);

class QuickReplyGroupSelector extends StatelessWidget {
  final OnGroupSelected onGroupSelected;
  final int selectedIndex;
  final List<String> tags;

  const QuickReplyGroupSelector(
      {Key? key,
      required this.onGroupSelected,
      required this.tags,
      this.selectedIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsetsDirectional.only(start: 12, top: 8, bottom: 8),
      child: ListView.builder(
        itemBuilder: _buildItem,
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    bool isAdd = tags[index] == '-1';

    bool selected = selectedIndex == index;

    if (isAdd) {
      selected = false;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isAdd) {
          QuickReplyGroupPage.launch(context);
        } else if (!selected) {
          onGroupSelected(index);
        }
      },
      child: Container(
        height: 32,
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        margin: const EdgeInsetsDirectional.only(end: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: R.colors.secondBgColor),
        child: Center(
          child: isAdd
              ? R.img(BaseAssets.shared$icon_add_svg,
                  color: R.colors.mainTextColor,
                  width: 13,
                  height: 13,
                  package: ComponentManager.MANAGER_BASE_CORE)
              : Text(
                  tags[index],
                  style: TextStyle(
                      color: selected
                          ? R.colors.mainBrandColor
                          : R.colors.secondTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }
}
