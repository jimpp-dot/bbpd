import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/model/title_role_bean.dart';
import 'package:personaldata/src/widget/title_role_description_widget.dart';

/// 称号显示widget
class TitleRoleWidget extends StatelessWidget {
  final List<TitleRoleItemBean>? items;

  const TitleRoleWidget({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items == null || items!.isEmpty) {
      return Container();
    }

    double runSpacingW = 8.0;
    double spacingW = 6.0;
    int maxRow = 5;
    double rowItemHeight = 24.0;
    return Container(
      constraints: BoxConstraints(
        maxHeight: rowItemHeight * maxRow + runSpacingW * (maxRow - 1),
      ),
      margin: const EdgeInsetsDirectional.only(
        top: 12.0,
        bottom: 12.0,
      ),
      child: Wrap(
        runSpacing: runSpacingW,
        spacing: spacingW,
        alignment: WrapAlignment.start,
        children: items!.map((TitleRoleItemBean titleRoleItemBean) {
          return SizedBox(
            height: rowItemHeight,
            child: InkWell(
              onTap: () async {
                TitleRoleDescriptionWidget.openTitleRoleDescriptionDialog(
                    context);
              },
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: "${titleRoleItemBean.icon}",
                  fit: BoxFit.fitHeight,
                  fadeOutDuration: const Duration(microseconds: 0),
                  fadeInDuration: const Duration(microseconds: 0),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
