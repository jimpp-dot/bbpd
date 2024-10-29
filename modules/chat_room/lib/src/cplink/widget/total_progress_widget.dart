import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/auction/auction_util.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';

/// 关系进度条
class TotalProgressWidget extends StatelessWidget {
  final Relationship relationship;
  final List<RelationshipLevelInfo> levels;

  const TotalProgressWidget(
      {Key? key, required this.relationship, required this.levels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentValue = relationship.defendValue;

    return LayoutBuilder(builder: (context, constraints) {
      List<Widget> nodeWidgets = [];
      int activeIndex = 0;
      for (int i = 0, l = levels.length; i < l; i++) {
        String asset = RoomAssets.chat_room$cplink_progress_grey_webp;
        RelationshipLevelInfo item = levels[i];
        int value = item.score;
        if (currentValue < value) {
          asset = RoomAssets.chat_room$cplink_progress_grey_webp;
        } else {
          asset = RoomAssets.chat_room$cplink_progress_light_webp;
          activeIndex = i;
        }

        nodeWidgets.add(
          Expanded(
            // flex: (i == 0 || i == levels.length - 1) ? 1 : 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img(asset, width: 33, height: 33, fit: BoxFit.contain),
                Text(
                  Util.numberToSizeString(value, fix: 1),
                  style: const TextStyle(
                      color: Color(0xB3FEFEFE), fontSize: 10, height: 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: GradientText(
                    '${item.title}${relationship.name}',
                    gradient: LinearGradient(
                      colors: AuctionUtil.getRelationTextGradientColors(i),
                    ),
                    style: const TextStyle(fontSize: 10, height: 1),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      final double offset = 36.dp;
      double barTotalWidth = constraints.maxWidth - offset * 2;
      double nodeWidth = barTotalWidth / (levels.length - 1); // 单节宽度
      double activeWidth = activeIndex < (levels.length - 1)
          ? nodeWidth *
              (activeIndex +
                  (currentValue - levels[activeIndex].score) /
                      (levels[activeIndex + 1].score -
                          levels[activeIndex].score))
          : barTotalWidth;

      return Stack(
        children: [
          Container(
            height: 12,
            margin:
                EdgeInsetsDirectional.only(top: 10, start: offset, end: offset),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              gradient: const LinearGradient(
                colors: [
                  Color(0x1F008CFB),
                  Color(0x2600F9FA),
                ],
              ),
            ),
          ),
          Container(
            height: 12,
            width: activeWidth,
            margin:
                EdgeInsetsDirectional.only(top: 10, start: offset, end: offset),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF00DBDE),
                  Color(0xFFFC00FF),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: nodeWidgets,
          ),
        ],
      );
    });
  }
}
