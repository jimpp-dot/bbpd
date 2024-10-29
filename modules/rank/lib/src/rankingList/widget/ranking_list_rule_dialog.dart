import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/k.dart';
import 'package:rank/src/rankingList/model/ranking_theme.dart';

class RankingListRuleDialog extends StatelessWidget {
  final List<String>? subTitles;
  final String? title;

  const RankingListRuleDialog({super.key, this.title, this.subTitles});

  Color get mainTextColor => RankingTheme.mainTextColor;

  @override
  Widget build(BuildContext context) {
    List<Widget> colChildren = [_buildHeader(context)];
    if (subTitles != null && subTitles!.isNotEmpty) {
      colChildren.add(Divider(
        height: 1,
        color: mainTextColor.withOpacity(0.1),
        indent: 14,
        endIndent: 14,
      ));
      List<Widget> contentList = subTitles!
          .asMap()
          .map((i, e) => MapEntry(i, _buildContentRow(context, e, i)))
          .values
          .toList();
      colChildren.addAll(contentList);
      colChildren.add(const SizedBox(
        height: 20,
      ));
    }
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          _onDismiss(context);
        },
        child: Center(
          child: Container(
            width: 312 * Util.ratio,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: colChildren,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContentRow(BuildContext context, String content, int index) {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 17, start: 14, end: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 18,
            height: 18,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: RankingTheme.secondBgColor,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Text(
              (index + 1).toString(),
              style: TextStyle(color: mainTextColor, fontSize: 13),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              content,
              style: TextStyle(color: mainTextColor, fontSize: 14),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          height: 52,
          child: Text(
            // title ?? K.room_rank_rule,
            K.room_rank_rule,
            style: TextStyle(
                color: mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              _onDismiss(context);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 14),
              alignment: AlignmentDirectional.centerStart,
              child: R.img(
                BaseAssets.close_icon_svg,
                width: 18,
                color: mainTextColor,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _onDismiss(BuildContext context) {
    Navigator.of(context).pop(false);
  }
}
