import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/src/model/tag_bean.dart';
import 'package:moment/src/widget/tag_item.dart';

///
class MomentCaseTagsWidget extends StatelessWidget {
  final List<CaseTag>? tags;
  final bool canTap;
  final int parentTagId;
  final double? paddingBottom;
  final PageType? type;

  const MomentCaseTagsWidget({
    super.key,
    this.tags,
    this.canTap = true,
    this.parentTagId = 0,
    this.paddingBottom,
    this.type = PageType.Tag,
  });

  @override
  Widget build(BuildContext context) {
    if (tags == null || tags!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom ?? 10.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: tags!.map((item) {
          return MomentTagItem(
            height: 24,
            tag: item.tag ?? '',
            background: R.color.secondBgColor,
            icon: 'ic_tag_blue.svg',
            iconColor: R.color.mainBrandColor,
            deleteIconColor: R.color.thirdTextColor,
            textStyleParam: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 13,
                fontFamily: Util.fontFamily),
            onTap: () => _gotoTagList(context, item),
          );
        }).toList(),
      ),
    );
  }

  _gotoTagList(BuildContext context, CaseTag tag) {
    if (canTap) {
      if (parentTagId == tag.id) {
        return;
      }
      IMomentManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
      manager.openTagListScreenScreen(context,
          tagId: tag.id, title: tag.tag ?? '', pageType: type, icon: tag.icon);
    }
  }
}
